import MMIO
import MMIOExtensions

/// DMA with separate read and write masters
public struct DMA {

    public static var `default`: Self { .init(unsafeAddress: 0x50000000) }

    /// DMA Channel 0 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    public var CH0_READ_ADDR: Register<CH0_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0000), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0000))
          #endif
        }
    }
    public struct CH0_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH0_READ_ADDR_Descriptor

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

                    public  typealias Value = CH0_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 0 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    public var CH0_WRITE_ADDR: Register<CH0_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0004), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0004))
          #endif
        }
    }
    public struct CH0_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH0_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH0_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 0 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    public var CH0_TRANS_COUNT: Register<CH0_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0008), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0008))
          #endif
        }
    }
    public struct CH0_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH0_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH0_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 0 Control and Status
    public var CH0_CTRL_TRIG: Register<CH0_CTRL_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x000c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x000c))
          #endif
        }
    }
    public struct CH0_CTRL_TRIG_Descriptor {
        @available(*, unavailable)
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        public var AHB_ERROR: AHB_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        public var READ_ERROR: READ_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        public var WRITE_ERROR: WRITE_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        public var BUSY: BUSY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        public var SNIFF_EN: SNIFF_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        public var BSWAP: BSWAP_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        public var IRQ_QUIET: IRQ_QUIET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        public var TREQ_SEL: TREQ_SEL_Field {
            get {
                fatalError()
            }
        }

        public enum TREQ_SEL_Values: UInt, BitFieldProjectable {
            /// Select Timer 0 as TREQ
            case TREQ_SEL_TIMER0 = 59
            /// Select Timer 1 as TREQ
            case TREQ_SEL_TIMER1 = 60
            /// Select Timer 2 as TREQ (Optional)
            case TREQ_SEL_TIMER2 = 61
            /// Select Timer 3 as TREQ (Optional)
            case TREQ_SEL_TIMER3 = 62
            /// Permanent request, for unpaced transfers.
            case TREQ_SEL_PERMANENT = 63

            public static var bitWidth: Int { 6 }
        }
        @available(*, unavailable)

        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        public var CHAIN_TO: CHAIN_TO_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        public var RING_SEL: RING_SEL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        public var RING_SIZE: RING_SIZE_Field {
            get {
                fatalError()
            }
        }

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }
        @available(*, unavailable)

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        public var INCR_WRITE: INCR_WRITE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        public var INCR_READ: INCR_READ_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        public var DATA_SIZE: DATA_SIZE_Field {
            get {
                fatalError()
            }
        }

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        public var HIGH_PRIORITY: HIGH_PRIORITY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        public var EN: EN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum AHB_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum READ_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum WRITE_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum BUSY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum SNIFF_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum BSWAP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum IRQ_QUIET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum TREQ_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 21
        }

        public enum CHAIN_TO_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 15
        }

        public enum RING_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum RING_SIZE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 10
        }

        public enum INCR_WRITE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum INCR_READ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum DATA_SIZE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 4
        }

        public enum HIGH_PRIORITY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH0_CTRL_TRIG_Descriptor

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
                public var AHB_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                    AHB_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    AHB_ERROR_Field.insert(newValue, into: &self.storage)
                }
                }
              public var READ_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                  READ_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  READ_ERROR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var WRITE_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                  WRITE_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  WRITE_ERROR_Field.insert(newValue, into: &self.storage)
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
              public var SNIFF_EN: UInt32 {
                @inlinable @inline(__always) get {
                  SNIFF_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SNIFF_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BSWAP: UInt32 {
                @inlinable @inline(__always) get {
                  BSWAP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BSWAP_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IRQ_QUIET: UInt32 {
                @inlinable @inline(__always) get {
                  IRQ_QUIET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IRQ_QUIET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TREQ_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  TREQ_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TREQ_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CHAIN_TO: UInt32 {
                @inlinable @inline(__always) get {
                  CHAIN_TO_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CHAIN_TO_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RING_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  RING_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RING_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RING_SIZE: UInt32 {
                @inlinable @inline(__always) get {
                  RING_SIZE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RING_SIZE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INCR_WRITE: UInt32 {
                @inlinable @inline(__always) get {
                  INCR_WRITE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INCR_WRITE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INCR_READ: UInt32 {
                @inlinable @inline(__always) get {
                  INCR_READ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INCR_READ_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DATA_SIZE: UInt32 {
                @inlinable @inline(__always) get {
                  DATA_SIZE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DATA_SIZE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var HIGH_PRIORITY: UInt32 {
                @inlinable @inline(__always) get {
                  HIGH_PRIORITY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HIGH_PRIORITY_Field.insert(newValue, into: &self.storage)
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

                    public  typealias Value = CH0_CTRL_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var AHB_ERROR: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(AHB_ERROR_Field.self, Bool.self)
                    return Bool(storage: self.raw.AHB_ERROR)
                }
                }
              public var READ_ERROR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.READ_ERROR)
                }
              }
              public var WRITE_ERROR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.WRITE_ERROR)
                }
              }
              public var BUSY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUSY_Field.self, Bool.self)
                  return Bool(storage: self.raw.BUSY)
                }
              }
              public var SNIFF_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SNIFF_EN)
                }
              }
              public var BSWAP: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  return Bool(storage: self.raw.BSWAP)
                }
              }
              public var IRQ_QUIET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  return Bool(storage: self.raw.IRQ_QUIET)
                }
              }
              public var TREQ_SEL: TREQ_SEL_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  return TREQ_SEL_Values(storage: self.raw.TREQ_SEL)
                }
              }
              public var CHAIN_TO: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.CHAIN_TO)
                }
              }
              public var RING_SEL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  return Bool(storage: self.raw.RING_SEL)
                }
              }
              public var RING_SIZE: RING_SIZE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  return RING_SIZE_Values(storage: self.raw.RING_SIZE)
                }
              }
              public var INCR_WRITE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_WRITE)
                }
              }
              public var INCR_READ: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_READ)
                }
              }
              public var DATA_SIZE: DATA_SIZE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  return DATA_SIZE_Values(storage: self.raw.DATA_SIZE)
                }
              }
              public var HIGH_PRIORITY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  return Bool(storage: self.raw.HIGH_PRIORITY)
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

                    public  typealias Value = CH0_CTRL_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var READ_ERROR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                    return Bool(storage: self.raw.READ_ERROR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                    self.raw.READ_ERROR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var WRITE_ERROR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.WRITE_ERROR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  self.raw.WRITE_ERROR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SNIFF_EN: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SNIFF_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  self.raw.SNIFF_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BSWAP: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  return Bool(storage: self.raw.BSWAP)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  self.raw.BSWAP = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IRQ_QUIET: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  return Bool(storage: self.raw.IRQ_QUIET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  self.raw.IRQ_QUIET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TREQ_SEL: TREQ_SEL_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  return TREQ_SEL_Values(storage: self.raw.TREQ_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  self.raw.TREQ_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CHAIN_TO: BitField4 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.CHAIN_TO)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  self.raw.CHAIN_TO = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RING_SEL: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  return Bool(storage: self.raw.RING_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  self.raw.RING_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RING_SIZE: RING_SIZE_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  return RING_SIZE_Values(storage: self.raw.RING_SIZE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  self.raw.RING_SIZE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INCR_WRITE: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_WRITE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  self.raw.INCR_WRITE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INCR_READ: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_READ)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  self.raw.INCR_READ = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DATA_SIZE: DATA_SIZE_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  return DATA_SIZE_Values(storage: self.raw.DATA_SIZE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  self.raw.DATA_SIZE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var HIGH_PRIORITY: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  return Bool(storage: self.raw.HIGH_PRIORITY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  self.raw.HIGH_PRIORITY = newValue.storage(Self.Value.Raw.Storage.self)
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

    /// Alias for channel 0 CTRL register
    public var CH0_AL1_CTRL: Register<CH0_AL1_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0010), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0010))
          #endif
        }
    }
    public struct CH0_AL1_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH0_AL1_CTRL_Descriptor

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

                    public  typealias Value = CH0_AL1_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 0 READ_ADDR register
    public var CH0_AL1_READ_ADDR: Register<CH0_AL1_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0014), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0014))
          #endif
        }
    }
    public struct CH0_AL1_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH0_AL1_READ_ADDR_Descriptor

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

                    public  typealias Value = CH0_AL1_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 0 WRITE_ADDR register
    public var CH0_AL1_WRITE_ADDR: Register<CH0_AL1_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0018), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0018))
          #endif
        }
    }
    public struct CH0_AL1_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH0_AL1_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH0_AL1_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 0 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH0_AL1_TRANS_COUNT_TRIG: Register<CH0_AL1_TRANS_COUNT_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x001c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x001c))
          #endif
        }
    }
    public struct CH0_AL1_TRANS_COUNT_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH0_AL1_TRANS_COUNT_TRIG_Descriptor

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

                    public  typealias Value = CH0_AL1_TRANS_COUNT_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 0 CTRL register
    public var CH0_AL2_CTRL: Register<CH0_AL2_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0020), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0020))
          #endif
        }
    }
    public struct CH0_AL2_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH0_AL2_CTRL_Descriptor

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

                    public  typealias Value = CH0_AL2_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 0 TRANS_COUNT register
    public var CH0_AL2_TRANS_COUNT: Register<CH0_AL2_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0024), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0024))
          #endif
        }
    }
    public struct CH0_AL2_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH0_AL2_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH0_AL2_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 0 READ_ADDR register
    public var CH0_AL2_READ_ADDR: Register<CH0_AL2_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0028), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0028))
          #endif
        }
    }
    public struct CH0_AL2_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH0_AL2_READ_ADDR_Descriptor

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

                    public  typealias Value = CH0_AL2_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 0 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH0_AL2_WRITE_ADDR_TRIG: Register<CH0_AL2_WRITE_ADDR_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x002c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x002c))
          #endif
        }
    }
    public struct CH0_AL2_WRITE_ADDR_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH0_AL2_WRITE_ADDR_TRIG_Descriptor

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

                    public  typealias Value = CH0_AL2_WRITE_ADDR_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 0 CTRL register
    public var CH0_AL3_CTRL: Register<CH0_AL3_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0030), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0030))
          #endif
        }
    }
    public struct CH0_AL3_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH0_AL3_CTRL_Descriptor

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

                    public  typealias Value = CH0_AL3_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 0 WRITE_ADDR register
    public var CH0_AL3_WRITE_ADDR: Register<CH0_AL3_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0034), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0034))
          #endif
        }
    }
    public struct CH0_AL3_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH0_AL3_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH0_AL3_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 0 TRANS_COUNT register
    public var CH0_AL3_TRANS_COUNT: Register<CH0_AL3_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0038), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0038))
          #endif
        }
    }
    public struct CH0_AL3_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH0_AL3_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH0_AL3_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 0 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH0_AL3_READ_ADDR_TRIG: Register<CH0_AL3_READ_ADDR_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x003c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x003c))
          #endif
        }
    }
    public struct CH0_AL3_READ_ADDR_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH0_AL3_READ_ADDR_TRIG_Descriptor

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

                    public  typealias Value = CH0_AL3_READ_ADDR_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 1 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    public var CH1_READ_ADDR: Register<CH1_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0040), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0040))
          #endif
        }
    }
    public struct CH1_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH1_READ_ADDR_Descriptor

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

                    public  typealias Value = CH1_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 1 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    public var CH1_WRITE_ADDR: Register<CH1_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0044), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0044))
          #endif
        }
    }
    public struct CH1_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH1_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH1_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 1 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    public var CH1_TRANS_COUNT: Register<CH1_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0048), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0048))
          #endif
        }
    }
    public struct CH1_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH1_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH1_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 1 Control and Status
    public var CH1_CTRL_TRIG: Register<CH1_CTRL_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x004c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x004c))
          #endif
        }
    }
    public struct CH1_CTRL_TRIG_Descriptor {
        @available(*, unavailable)
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        public var AHB_ERROR: AHB_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        public var READ_ERROR: READ_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        public var WRITE_ERROR: WRITE_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        public var BUSY: BUSY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        public var SNIFF_EN: SNIFF_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        public var BSWAP: BSWAP_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        public var IRQ_QUIET: IRQ_QUIET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        public var TREQ_SEL: TREQ_SEL_Field {
            get {
                fatalError()
            }
        }

        public enum TREQ_SEL_Values: UInt, BitFieldProjectable {
            /// Select Timer 0 as TREQ
            case TREQ_SEL_TIMER0 = 59
            /// Select Timer 1 as TREQ
            case TREQ_SEL_TIMER1 = 60
            /// Select Timer 2 as TREQ (Optional)
            case TREQ_SEL_TIMER2 = 61
            /// Select Timer 3 as TREQ (Optional)
            case TREQ_SEL_TIMER3 = 62
            /// Permanent request, for unpaced transfers.
            case TREQ_SEL_PERMANENT = 63

            public static var bitWidth: Int { 6 }
        }
        @available(*, unavailable)

        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        public var CHAIN_TO: CHAIN_TO_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        public var RING_SEL: RING_SEL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        public var RING_SIZE: RING_SIZE_Field {
            get {
                fatalError()
            }
        }

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }
        @available(*, unavailable)

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        public var INCR_WRITE: INCR_WRITE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        public var INCR_READ: INCR_READ_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        public var DATA_SIZE: DATA_SIZE_Field {
            get {
                fatalError()
            }
        }

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        public var HIGH_PRIORITY: HIGH_PRIORITY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        public var EN: EN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum AHB_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum READ_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum WRITE_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum BUSY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum SNIFF_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum BSWAP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum IRQ_QUIET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum TREQ_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 21
        }

        public enum CHAIN_TO_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 15
        }

        public enum RING_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum RING_SIZE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 10
        }

        public enum INCR_WRITE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum INCR_READ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum DATA_SIZE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 4
        }

        public enum HIGH_PRIORITY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH1_CTRL_TRIG_Descriptor

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
                public var AHB_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                    AHB_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    AHB_ERROR_Field.insert(newValue, into: &self.storage)
                }
                }
              public var READ_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                  READ_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  READ_ERROR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var WRITE_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                  WRITE_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  WRITE_ERROR_Field.insert(newValue, into: &self.storage)
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
              public var SNIFF_EN: UInt32 {
                @inlinable @inline(__always) get {
                  SNIFF_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SNIFF_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BSWAP: UInt32 {
                @inlinable @inline(__always) get {
                  BSWAP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BSWAP_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IRQ_QUIET: UInt32 {
                @inlinable @inline(__always) get {
                  IRQ_QUIET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IRQ_QUIET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TREQ_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  TREQ_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TREQ_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CHAIN_TO: UInt32 {
                @inlinable @inline(__always) get {
                  CHAIN_TO_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CHAIN_TO_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RING_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  RING_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RING_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RING_SIZE: UInt32 {
                @inlinable @inline(__always) get {
                  RING_SIZE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RING_SIZE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INCR_WRITE: UInt32 {
                @inlinable @inline(__always) get {
                  INCR_WRITE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INCR_WRITE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INCR_READ: UInt32 {
                @inlinable @inline(__always) get {
                  INCR_READ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INCR_READ_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DATA_SIZE: UInt32 {
                @inlinable @inline(__always) get {
                  DATA_SIZE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DATA_SIZE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var HIGH_PRIORITY: UInt32 {
                @inlinable @inline(__always) get {
                  HIGH_PRIORITY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HIGH_PRIORITY_Field.insert(newValue, into: &self.storage)
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

                    public  typealias Value = CH1_CTRL_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var AHB_ERROR: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(AHB_ERROR_Field.self, Bool.self)
                    return Bool(storage: self.raw.AHB_ERROR)
                }
                }
              public var READ_ERROR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.READ_ERROR)
                }
              }
              public var WRITE_ERROR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.WRITE_ERROR)
                }
              }
              public var BUSY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUSY_Field.self, Bool.self)
                  return Bool(storage: self.raw.BUSY)
                }
              }
              public var SNIFF_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SNIFF_EN)
                }
              }
              public var BSWAP: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  return Bool(storage: self.raw.BSWAP)
                }
              }
              public var IRQ_QUIET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  return Bool(storage: self.raw.IRQ_QUIET)
                }
              }
              public var TREQ_SEL: TREQ_SEL_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  return TREQ_SEL_Values(storage: self.raw.TREQ_SEL)
                }
              }
              public var CHAIN_TO: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.CHAIN_TO)
                }
              }
              public var RING_SEL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  return Bool(storage: self.raw.RING_SEL)
                }
              }
              public var RING_SIZE: RING_SIZE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  return RING_SIZE_Values(storage: self.raw.RING_SIZE)
                }
              }
              public var INCR_WRITE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_WRITE)
                }
              }
              public var INCR_READ: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_READ)
                }
              }
              public var DATA_SIZE: DATA_SIZE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  return DATA_SIZE_Values(storage: self.raw.DATA_SIZE)
                }
              }
              public var HIGH_PRIORITY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  return Bool(storage: self.raw.HIGH_PRIORITY)
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

                    public  typealias Value = CH1_CTRL_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var READ_ERROR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                    return Bool(storage: self.raw.READ_ERROR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                    self.raw.READ_ERROR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var WRITE_ERROR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.WRITE_ERROR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  self.raw.WRITE_ERROR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SNIFF_EN: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SNIFF_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  self.raw.SNIFF_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BSWAP: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  return Bool(storage: self.raw.BSWAP)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  self.raw.BSWAP = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IRQ_QUIET: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  return Bool(storage: self.raw.IRQ_QUIET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  self.raw.IRQ_QUIET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TREQ_SEL: TREQ_SEL_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  return TREQ_SEL_Values(storage: self.raw.TREQ_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  self.raw.TREQ_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CHAIN_TO: BitField4 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.CHAIN_TO)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  self.raw.CHAIN_TO = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RING_SEL: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  return Bool(storage: self.raw.RING_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  self.raw.RING_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RING_SIZE: RING_SIZE_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  return RING_SIZE_Values(storage: self.raw.RING_SIZE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  self.raw.RING_SIZE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INCR_WRITE: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_WRITE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  self.raw.INCR_WRITE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INCR_READ: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_READ)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  self.raw.INCR_READ = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DATA_SIZE: DATA_SIZE_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  return DATA_SIZE_Values(storage: self.raw.DATA_SIZE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  self.raw.DATA_SIZE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var HIGH_PRIORITY: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  return Bool(storage: self.raw.HIGH_PRIORITY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  self.raw.HIGH_PRIORITY = newValue.storage(Self.Value.Raw.Storage.self)
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

    /// Alias for channel 1 CTRL register
    public var CH1_AL1_CTRL: Register<CH1_AL1_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0050), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0050))
          #endif
        }
    }
    public struct CH1_AL1_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH1_AL1_CTRL_Descriptor

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

                    public  typealias Value = CH1_AL1_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 1 READ_ADDR register
    public var CH1_AL1_READ_ADDR: Register<CH1_AL1_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0054), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0054))
          #endif
        }
    }
    public struct CH1_AL1_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH1_AL1_READ_ADDR_Descriptor

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

                    public  typealias Value = CH1_AL1_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 1 WRITE_ADDR register
    public var CH1_AL1_WRITE_ADDR: Register<CH1_AL1_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0058), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0058))
          #endif
        }
    }
    public struct CH1_AL1_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH1_AL1_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH1_AL1_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 1 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH1_AL1_TRANS_COUNT_TRIG: Register<CH1_AL1_TRANS_COUNT_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x005c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x005c))
          #endif
        }
    }
    public struct CH1_AL1_TRANS_COUNT_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH1_AL1_TRANS_COUNT_TRIG_Descriptor

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

                    public  typealias Value = CH1_AL1_TRANS_COUNT_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 1 CTRL register
    public var CH1_AL2_CTRL: Register<CH1_AL2_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0060), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0060))
          #endif
        }
    }
    public struct CH1_AL2_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH1_AL2_CTRL_Descriptor

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

                    public  typealias Value = CH1_AL2_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 1 TRANS_COUNT register
    public var CH1_AL2_TRANS_COUNT: Register<CH1_AL2_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0064), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0064))
          #endif
        }
    }
    public struct CH1_AL2_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH1_AL2_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH1_AL2_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 1 READ_ADDR register
    public var CH1_AL2_READ_ADDR: Register<CH1_AL2_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0068), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0068))
          #endif
        }
    }
    public struct CH1_AL2_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH1_AL2_READ_ADDR_Descriptor

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

                    public  typealias Value = CH1_AL2_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 1 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH1_AL2_WRITE_ADDR_TRIG: Register<CH1_AL2_WRITE_ADDR_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x006c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x006c))
          #endif
        }
    }
    public struct CH1_AL2_WRITE_ADDR_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH1_AL2_WRITE_ADDR_TRIG_Descriptor

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

                    public  typealias Value = CH1_AL2_WRITE_ADDR_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 1 CTRL register
    public var CH1_AL3_CTRL: Register<CH1_AL3_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0070), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0070))
          #endif
        }
    }
    public struct CH1_AL3_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH1_AL3_CTRL_Descriptor

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

                    public  typealias Value = CH1_AL3_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 1 WRITE_ADDR register
    public var CH1_AL3_WRITE_ADDR: Register<CH1_AL3_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0074), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0074))
          #endif
        }
    }
    public struct CH1_AL3_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH1_AL3_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH1_AL3_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 1 TRANS_COUNT register
    public var CH1_AL3_TRANS_COUNT: Register<CH1_AL3_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0078), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0078))
          #endif
        }
    }
    public struct CH1_AL3_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH1_AL3_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH1_AL3_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 1 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH1_AL3_READ_ADDR_TRIG: Register<CH1_AL3_READ_ADDR_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x007c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x007c))
          #endif
        }
    }
    public struct CH1_AL3_READ_ADDR_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH1_AL3_READ_ADDR_TRIG_Descriptor

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

                    public  typealias Value = CH1_AL3_READ_ADDR_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 2 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    public var CH2_READ_ADDR: Register<CH2_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0080), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0080))
          #endif
        }
    }
    public struct CH2_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH2_READ_ADDR_Descriptor

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

                    public  typealias Value = CH2_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 2 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    public var CH2_WRITE_ADDR: Register<CH2_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0084), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0084))
          #endif
        }
    }
    public struct CH2_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH2_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH2_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 2 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    public var CH2_TRANS_COUNT: Register<CH2_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0088), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0088))
          #endif
        }
    }
    public struct CH2_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH2_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH2_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 2 Control and Status
    public var CH2_CTRL_TRIG: Register<CH2_CTRL_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x008c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x008c))
          #endif
        }
    }
    public struct CH2_CTRL_TRIG_Descriptor {
        @available(*, unavailable)
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        public var AHB_ERROR: AHB_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        public var READ_ERROR: READ_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        public var WRITE_ERROR: WRITE_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        public var BUSY: BUSY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        public var SNIFF_EN: SNIFF_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        public var BSWAP: BSWAP_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        public var IRQ_QUIET: IRQ_QUIET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        public var TREQ_SEL: TREQ_SEL_Field {
            get {
                fatalError()
            }
        }

        public enum TREQ_SEL_Values: UInt, BitFieldProjectable {
            /// Select Timer 0 as TREQ
            case TREQ_SEL_TIMER0 = 59
            /// Select Timer 1 as TREQ
            case TREQ_SEL_TIMER1 = 60
            /// Select Timer 2 as TREQ (Optional)
            case TREQ_SEL_TIMER2 = 61
            /// Select Timer 3 as TREQ (Optional)
            case TREQ_SEL_TIMER3 = 62
            /// Permanent request, for unpaced transfers.
            case TREQ_SEL_PERMANENT = 63

            public static var bitWidth: Int { 6 }
        }
        @available(*, unavailable)

        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        public var CHAIN_TO: CHAIN_TO_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        public var RING_SEL: RING_SEL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        public var RING_SIZE: RING_SIZE_Field {
            get {
                fatalError()
            }
        }

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }
        @available(*, unavailable)

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        public var INCR_WRITE: INCR_WRITE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        public var INCR_READ: INCR_READ_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        public var DATA_SIZE: DATA_SIZE_Field {
            get {
                fatalError()
            }
        }

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        public var HIGH_PRIORITY: HIGH_PRIORITY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        public var EN: EN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum AHB_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum READ_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum WRITE_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum BUSY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum SNIFF_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum BSWAP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum IRQ_QUIET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum TREQ_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 21
        }

        public enum CHAIN_TO_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 15
        }

        public enum RING_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum RING_SIZE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 10
        }

        public enum INCR_WRITE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum INCR_READ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum DATA_SIZE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 4
        }

        public enum HIGH_PRIORITY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH2_CTRL_TRIG_Descriptor

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
                public var AHB_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                    AHB_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    AHB_ERROR_Field.insert(newValue, into: &self.storage)
                }
                }
              public var READ_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                  READ_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  READ_ERROR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var WRITE_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                  WRITE_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  WRITE_ERROR_Field.insert(newValue, into: &self.storage)
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
              public var SNIFF_EN: UInt32 {
                @inlinable @inline(__always) get {
                  SNIFF_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SNIFF_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BSWAP: UInt32 {
                @inlinable @inline(__always) get {
                  BSWAP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BSWAP_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IRQ_QUIET: UInt32 {
                @inlinable @inline(__always) get {
                  IRQ_QUIET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IRQ_QUIET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TREQ_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  TREQ_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TREQ_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CHAIN_TO: UInt32 {
                @inlinable @inline(__always) get {
                  CHAIN_TO_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CHAIN_TO_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RING_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  RING_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RING_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RING_SIZE: UInt32 {
                @inlinable @inline(__always) get {
                  RING_SIZE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RING_SIZE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INCR_WRITE: UInt32 {
                @inlinable @inline(__always) get {
                  INCR_WRITE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INCR_WRITE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INCR_READ: UInt32 {
                @inlinable @inline(__always) get {
                  INCR_READ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INCR_READ_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DATA_SIZE: UInt32 {
                @inlinable @inline(__always) get {
                  DATA_SIZE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DATA_SIZE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var HIGH_PRIORITY: UInt32 {
                @inlinable @inline(__always) get {
                  HIGH_PRIORITY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HIGH_PRIORITY_Field.insert(newValue, into: &self.storage)
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

                    public  typealias Value = CH2_CTRL_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var AHB_ERROR: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(AHB_ERROR_Field.self, Bool.self)
                    return Bool(storage: self.raw.AHB_ERROR)
                }
                }
              public var READ_ERROR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.READ_ERROR)
                }
              }
              public var WRITE_ERROR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.WRITE_ERROR)
                }
              }
              public var BUSY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUSY_Field.self, Bool.self)
                  return Bool(storage: self.raw.BUSY)
                }
              }
              public var SNIFF_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SNIFF_EN)
                }
              }
              public var BSWAP: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  return Bool(storage: self.raw.BSWAP)
                }
              }
              public var IRQ_QUIET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  return Bool(storage: self.raw.IRQ_QUIET)
                }
              }
              public var TREQ_SEL: TREQ_SEL_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  return TREQ_SEL_Values(storage: self.raw.TREQ_SEL)
                }
              }
              public var CHAIN_TO: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.CHAIN_TO)
                }
              }
              public var RING_SEL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  return Bool(storage: self.raw.RING_SEL)
                }
              }
              public var RING_SIZE: RING_SIZE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  return RING_SIZE_Values(storage: self.raw.RING_SIZE)
                }
              }
              public var INCR_WRITE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_WRITE)
                }
              }
              public var INCR_READ: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_READ)
                }
              }
              public var DATA_SIZE: DATA_SIZE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  return DATA_SIZE_Values(storage: self.raw.DATA_SIZE)
                }
              }
              public var HIGH_PRIORITY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  return Bool(storage: self.raw.HIGH_PRIORITY)
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

                    public  typealias Value = CH2_CTRL_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var READ_ERROR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                    return Bool(storage: self.raw.READ_ERROR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                    self.raw.READ_ERROR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var WRITE_ERROR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.WRITE_ERROR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  self.raw.WRITE_ERROR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SNIFF_EN: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SNIFF_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  self.raw.SNIFF_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BSWAP: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  return Bool(storage: self.raw.BSWAP)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  self.raw.BSWAP = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IRQ_QUIET: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  return Bool(storage: self.raw.IRQ_QUIET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  self.raw.IRQ_QUIET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TREQ_SEL: TREQ_SEL_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  return TREQ_SEL_Values(storage: self.raw.TREQ_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  self.raw.TREQ_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CHAIN_TO: BitField4 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.CHAIN_TO)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  self.raw.CHAIN_TO = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RING_SEL: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  return Bool(storage: self.raw.RING_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  self.raw.RING_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RING_SIZE: RING_SIZE_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  return RING_SIZE_Values(storage: self.raw.RING_SIZE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  self.raw.RING_SIZE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INCR_WRITE: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_WRITE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  self.raw.INCR_WRITE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INCR_READ: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_READ)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  self.raw.INCR_READ = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DATA_SIZE: DATA_SIZE_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  return DATA_SIZE_Values(storage: self.raw.DATA_SIZE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  self.raw.DATA_SIZE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var HIGH_PRIORITY: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  return Bool(storage: self.raw.HIGH_PRIORITY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  self.raw.HIGH_PRIORITY = newValue.storage(Self.Value.Raw.Storage.self)
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

    /// Alias for channel 2 CTRL register
    public var CH2_AL1_CTRL: Register<CH2_AL1_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0090), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0090))
          #endif
        }
    }
    public struct CH2_AL1_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH2_AL1_CTRL_Descriptor

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

                    public  typealias Value = CH2_AL1_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 2 READ_ADDR register
    public var CH2_AL1_READ_ADDR: Register<CH2_AL1_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0094), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0094))
          #endif
        }
    }
    public struct CH2_AL1_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH2_AL1_READ_ADDR_Descriptor

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

                    public  typealias Value = CH2_AL1_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 2 WRITE_ADDR register
    public var CH2_AL1_WRITE_ADDR: Register<CH2_AL1_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0098), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0098))
          #endif
        }
    }
    public struct CH2_AL1_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH2_AL1_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH2_AL1_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 2 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH2_AL1_TRANS_COUNT_TRIG: Register<CH2_AL1_TRANS_COUNT_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x009c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x009c))
          #endif
        }
    }
    public struct CH2_AL1_TRANS_COUNT_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH2_AL1_TRANS_COUNT_TRIG_Descriptor

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

                    public  typealias Value = CH2_AL1_TRANS_COUNT_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 2 CTRL register
    public var CH2_AL2_CTRL: Register<CH2_AL2_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00a0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00a0))
          #endif
        }
    }
    public struct CH2_AL2_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH2_AL2_CTRL_Descriptor

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

                    public  typealias Value = CH2_AL2_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 2 TRANS_COUNT register
    public var CH2_AL2_TRANS_COUNT: Register<CH2_AL2_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00a4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00a4))
          #endif
        }
    }
    public struct CH2_AL2_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH2_AL2_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH2_AL2_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 2 READ_ADDR register
    public var CH2_AL2_READ_ADDR: Register<CH2_AL2_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00a8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00a8))
          #endif
        }
    }
    public struct CH2_AL2_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH2_AL2_READ_ADDR_Descriptor

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

                    public  typealias Value = CH2_AL2_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 2 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH2_AL2_WRITE_ADDR_TRIG: Register<CH2_AL2_WRITE_ADDR_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00ac), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00ac))
          #endif
        }
    }
    public struct CH2_AL2_WRITE_ADDR_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH2_AL2_WRITE_ADDR_TRIG_Descriptor

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

                    public  typealias Value = CH2_AL2_WRITE_ADDR_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 2 CTRL register
    public var CH2_AL3_CTRL: Register<CH2_AL3_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00b0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00b0))
          #endif
        }
    }
    public struct CH2_AL3_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH2_AL3_CTRL_Descriptor

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

                    public  typealias Value = CH2_AL3_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 2 WRITE_ADDR register
    public var CH2_AL3_WRITE_ADDR: Register<CH2_AL3_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00b4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00b4))
          #endif
        }
    }
    public struct CH2_AL3_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH2_AL3_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH2_AL3_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 2 TRANS_COUNT register
    public var CH2_AL3_TRANS_COUNT: Register<CH2_AL3_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00b8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00b8))
          #endif
        }
    }
    public struct CH2_AL3_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH2_AL3_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH2_AL3_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 2 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH2_AL3_READ_ADDR_TRIG: Register<CH2_AL3_READ_ADDR_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00bc), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00bc))
          #endif
        }
    }
    public struct CH2_AL3_READ_ADDR_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH2_AL3_READ_ADDR_TRIG_Descriptor

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

                    public  typealias Value = CH2_AL3_READ_ADDR_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 3 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    public var CH3_READ_ADDR: Register<CH3_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00c0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00c0))
          #endif
        }
    }
    public struct CH3_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH3_READ_ADDR_Descriptor

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

                    public  typealias Value = CH3_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 3 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    public var CH3_WRITE_ADDR: Register<CH3_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00c4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00c4))
          #endif
        }
    }
    public struct CH3_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH3_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH3_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 3 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    public var CH3_TRANS_COUNT: Register<CH3_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00c8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00c8))
          #endif
        }
    }
    public struct CH3_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH3_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH3_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 3 Control and Status
    public var CH3_CTRL_TRIG: Register<CH3_CTRL_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00cc), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00cc))
          #endif
        }
    }
    public struct CH3_CTRL_TRIG_Descriptor {
        @available(*, unavailable)
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        public var AHB_ERROR: AHB_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        public var READ_ERROR: READ_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        public var WRITE_ERROR: WRITE_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        public var BUSY: BUSY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        public var SNIFF_EN: SNIFF_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        public var BSWAP: BSWAP_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        public var IRQ_QUIET: IRQ_QUIET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        public var TREQ_SEL: TREQ_SEL_Field {
            get {
                fatalError()
            }
        }

        public enum TREQ_SEL_Values: UInt, BitFieldProjectable {
            /// Select Timer 0 as TREQ
            case TREQ_SEL_TIMER0 = 59
            /// Select Timer 1 as TREQ
            case TREQ_SEL_TIMER1 = 60
            /// Select Timer 2 as TREQ (Optional)
            case TREQ_SEL_TIMER2 = 61
            /// Select Timer 3 as TREQ (Optional)
            case TREQ_SEL_TIMER3 = 62
            /// Permanent request, for unpaced transfers.
            case TREQ_SEL_PERMANENT = 63

            public static var bitWidth: Int { 6 }
        }
        @available(*, unavailable)

        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        public var CHAIN_TO: CHAIN_TO_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        public var RING_SEL: RING_SEL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        public var RING_SIZE: RING_SIZE_Field {
            get {
                fatalError()
            }
        }

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }
        @available(*, unavailable)

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        public var INCR_WRITE: INCR_WRITE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        public var INCR_READ: INCR_READ_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        public var DATA_SIZE: DATA_SIZE_Field {
            get {
                fatalError()
            }
        }

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        public var HIGH_PRIORITY: HIGH_PRIORITY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        public var EN: EN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum AHB_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum READ_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum WRITE_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum BUSY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum SNIFF_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum BSWAP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum IRQ_QUIET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum TREQ_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 21
        }

        public enum CHAIN_TO_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 15
        }

        public enum RING_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum RING_SIZE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 10
        }

        public enum INCR_WRITE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum INCR_READ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum DATA_SIZE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 4
        }

        public enum HIGH_PRIORITY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH3_CTRL_TRIG_Descriptor

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
                public var AHB_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                    AHB_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    AHB_ERROR_Field.insert(newValue, into: &self.storage)
                }
                }
              public var READ_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                  READ_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  READ_ERROR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var WRITE_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                  WRITE_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  WRITE_ERROR_Field.insert(newValue, into: &self.storage)
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
              public var SNIFF_EN: UInt32 {
                @inlinable @inline(__always) get {
                  SNIFF_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SNIFF_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BSWAP: UInt32 {
                @inlinable @inline(__always) get {
                  BSWAP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BSWAP_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IRQ_QUIET: UInt32 {
                @inlinable @inline(__always) get {
                  IRQ_QUIET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IRQ_QUIET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TREQ_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  TREQ_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TREQ_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CHAIN_TO: UInt32 {
                @inlinable @inline(__always) get {
                  CHAIN_TO_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CHAIN_TO_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RING_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  RING_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RING_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RING_SIZE: UInt32 {
                @inlinable @inline(__always) get {
                  RING_SIZE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RING_SIZE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INCR_WRITE: UInt32 {
                @inlinable @inline(__always) get {
                  INCR_WRITE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INCR_WRITE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INCR_READ: UInt32 {
                @inlinable @inline(__always) get {
                  INCR_READ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INCR_READ_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DATA_SIZE: UInt32 {
                @inlinable @inline(__always) get {
                  DATA_SIZE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DATA_SIZE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var HIGH_PRIORITY: UInt32 {
                @inlinable @inline(__always) get {
                  HIGH_PRIORITY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HIGH_PRIORITY_Field.insert(newValue, into: &self.storage)
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

                    public  typealias Value = CH3_CTRL_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var AHB_ERROR: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(AHB_ERROR_Field.self, Bool.self)
                    return Bool(storage: self.raw.AHB_ERROR)
                }
                }
              public var READ_ERROR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.READ_ERROR)
                }
              }
              public var WRITE_ERROR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.WRITE_ERROR)
                }
              }
              public var BUSY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUSY_Field.self, Bool.self)
                  return Bool(storage: self.raw.BUSY)
                }
              }
              public var SNIFF_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SNIFF_EN)
                }
              }
              public var BSWAP: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  return Bool(storage: self.raw.BSWAP)
                }
              }
              public var IRQ_QUIET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  return Bool(storage: self.raw.IRQ_QUIET)
                }
              }
              public var TREQ_SEL: TREQ_SEL_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  return TREQ_SEL_Values(storage: self.raw.TREQ_SEL)
                }
              }
              public var CHAIN_TO: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.CHAIN_TO)
                }
              }
              public var RING_SEL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  return Bool(storage: self.raw.RING_SEL)
                }
              }
              public var RING_SIZE: RING_SIZE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  return RING_SIZE_Values(storage: self.raw.RING_SIZE)
                }
              }
              public var INCR_WRITE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_WRITE)
                }
              }
              public var INCR_READ: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_READ)
                }
              }
              public var DATA_SIZE: DATA_SIZE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  return DATA_SIZE_Values(storage: self.raw.DATA_SIZE)
                }
              }
              public var HIGH_PRIORITY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  return Bool(storage: self.raw.HIGH_PRIORITY)
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

                    public  typealias Value = CH3_CTRL_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var READ_ERROR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                    return Bool(storage: self.raw.READ_ERROR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                    self.raw.READ_ERROR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var WRITE_ERROR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.WRITE_ERROR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  self.raw.WRITE_ERROR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SNIFF_EN: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SNIFF_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  self.raw.SNIFF_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BSWAP: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  return Bool(storage: self.raw.BSWAP)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  self.raw.BSWAP = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IRQ_QUIET: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  return Bool(storage: self.raw.IRQ_QUIET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  self.raw.IRQ_QUIET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TREQ_SEL: TREQ_SEL_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  return TREQ_SEL_Values(storage: self.raw.TREQ_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  self.raw.TREQ_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CHAIN_TO: BitField4 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.CHAIN_TO)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  self.raw.CHAIN_TO = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RING_SEL: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  return Bool(storage: self.raw.RING_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  self.raw.RING_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RING_SIZE: RING_SIZE_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  return RING_SIZE_Values(storage: self.raw.RING_SIZE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  self.raw.RING_SIZE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INCR_WRITE: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_WRITE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  self.raw.INCR_WRITE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INCR_READ: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_READ)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  self.raw.INCR_READ = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DATA_SIZE: DATA_SIZE_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  return DATA_SIZE_Values(storage: self.raw.DATA_SIZE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  self.raw.DATA_SIZE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var HIGH_PRIORITY: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  return Bool(storage: self.raw.HIGH_PRIORITY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  self.raw.HIGH_PRIORITY = newValue.storage(Self.Value.Raw.Storage.self)
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

    /// Alias for channel 3 CTRL register
    public var CH3_AL1_CTRL: Register<CH3_AL1_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00d0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00d0))
          #endif
        }
    }
    public struct CH3_AL1_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH3_AL1_CTRL_Descriptor

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

                    public  typealias Value = CH3_AL1_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 3 READ_ADDR register
    public var CH3_AL1_READ_ADDR: Register<CH3_AL1_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00d4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00d4))
          #endif
        }
    }
    public struct CH3_AL1_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH3_AL1_READ_ADDR_Descriptor

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

                    public  typealias Value = CH3_AL1_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 3 WRITE_ADDR register
    public var CH3_AL1_WRITE_ADDR: Register<CH3_AL1_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00d8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00d8))
          #endif
        }
    }
    public struct CH3_AL1_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH3_AL1_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH3_AL1_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 3 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH3_AL1_TRANS_COUNT_TRIG: Register<CH3_AL1_TRANS_COUNT_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00dc), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00dc))
          #endif
        }
    }
    public struct CH3_AL1_TRANS_COUNT_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH3_AL1_TRANS_COUNT_TRIG_Descriptor

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

                    public  typealias Value = CH3_AL1_TRANS_COUNT_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 3 CTRL register
    public var CH3_AL2_CTRL: Register<CH3_AL2_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00e0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00e0))
          #endif
        }
    }
    public struct CH3_AL2_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH3_AL2_CTRL_Descriptor

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

                    public  typealias Value = CH3_AL2_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 3 TRANS_COUNT register
    public var CH3_AL2_TRANS_COUNT: Register<CH3_AL2_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00e4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00e4))
          #endif
        }
    }
    public struct CH3_AL2_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH3_AL2_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH3_AL2_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 3 READ_ADDR register
    public var CH3_AL2_READ_ADDR: Register<CH3_AL2_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00e8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00e8))
          #endif
        }
    }
    public struct CH3_AL2_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH3_AL2_READ_ADDR_Descriptor

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

                    public  typealias Value = CH3_AL2_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 3 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH3_AL2_WRITE_ADDR_TRIG: Register<CH3_AL2_WRITE_ADDR_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00ec), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00ec))
          #endif
        }
    }
    public struct CH3_AL2_WRITE_ADDR_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH3_AL2_WRITE_ADDR_TRIG_Descriptor

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

                    public  typealias Value = CH3_AL2_WRITE_ADDR_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 3 CTRL register
    public var CH3_AL3_CTRL: Register<CH3_AL3_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00f0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00f0))
          #endif
        }
    }
    public struct CH3_AL3_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH3_AL3_CTRL_Descriptor

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

                    public  typealias Value = CH3_AL3_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 3 WRITE_ADDR register
    public var CH3_AL3_WRITE_ADDR: Register<CH3_AL3_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00f4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00f4))
          #endif
        }
    }
    public struct CH3_AL3_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH3_AL3_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH3_AL3_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 3 TRANS_COUNT register
    public var CH3_AL3_TRANS_COUNT: Register<CH3_AL3_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00f8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00f8))
          #endif
        }
    }
    public struct CH3_AL3_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH3_AL3_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH3_AL3_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 3 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH3_AL3_READ_ADDR_TRIG: Register<CH3_AL3_READ_ADDR_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00fc), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00fc))
          #endif
        }
    }
    public struct CH3_AL3_READ_ADDR_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH3_AL3_READ_ADDR_TRIG_Descriptor

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

                    public  typealias Value = CH3_AL3_READ_ADDR_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 4 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    public var CH4_READ_ADDR: Register<CH4_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0100), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0100))
          #endif
        }
    }
    public struct CH4_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH4_READ_ADDR_Descriptor

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

                    public  typealias Value = CH4_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 4 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    public var CH4_WRITE_ADDR: Register<CH4_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0104), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0104))
          #endif
        }
    }
    public struct CH4_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH4_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH4_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 4 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    public var CH4_TRANS_COUNT: Register<CH4_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0108), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0108))
          #endif
        }
    }
    public struct CH4_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH4_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH4_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 4 Control and Status
    public var CH4_CTRL_TRIG: Register<CH4_CTRL_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x010c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x010c))
          #endif
        }
    }
    public struct CH4_CTRL_TRIG_Descriptor {
        @available(*, unavailable)
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        public var AHB_ERROR: AHB_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        public var READ_ERROR: READ_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        public var WRITE_ERROR: WRITE_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        public var BUSY: BUSY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        public var SNIFF_EN: SNIFF_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        public var BSWAP: BSWAP_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        public var IRQ_QUIET: IRQ_QUIET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        public var TREQ_SEL: TREQ_SEL_Field {
            get {
                fatalError()
            }
        }

        public enum TREQ_SEL_Values: UInt, BitFieldProjectable {
            /// Select Timer 0 as TREQ
            case TREQ_SEL_TIMER0 = 59
            /// Select Timer 1 as TREQ
            case TREQ_SEL_TIMER1 = 60
            /// Select Timer 2 as TREQ (Optional)
            case TREQ_SEL_TIMER2 = 61
            /// Select Timer 3 as TREQ (Optional)
            case TREQ_SEL_TIMER3 = 62
            /// Permanent request, for unpaced transfers.
            case TREQ_SEL_PERMANENT = 63

            public static var bitWidth: Int { 6 }
        }
        @available(*, unavailable)

        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        public var CHAIN_TO: CHAIN_TO_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        public var RING_SEL: RING_SEL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        public var RING_SIZE: RING_SIZE_Field {
            get {
                fatalError()
            }
        }

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }
        @available(*, unavailable)

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        public var INCR_WRITE: INCR_WRITE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        public var INCR_READ: INCR_READ_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        public var DATA_SIZE: DATA_SIZE_Field {
            get {
                fatalError()
            }
        }

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        public var HIGH_PRIORITY: HIGH_PRIORITY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        public var EN: EN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum AHB_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum READ_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum WRITE_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum BUSY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum SNIFF_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum BSWAP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum IRQ_QUIET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum TREQ_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 21
        }

        public enum CHAIN_TO_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 15
        }

        public enum RING_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum RING_SIZE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 10
        }

        public enum INCR_WRITE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum INCR_READ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum DATA_SIZE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 4
        }

        public enum HIGH_PRIORITY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH4_CTRL_TRIG_Descriptor

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
                public var AHB_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                    AHB_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    AHB_ERROR_Field.insert(newValue, into: &self.storage)
                }
                }
              public var READ_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                  READ_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  READ_ERROR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var WRITE_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                  WRITE_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  WRITE_ERROR_Field.insert(newValue, into: &self.storage)
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
              public var SNIFF_EN: UInt32 {
                @inlinable @inline(__always) get {
                  SNIFF_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SNIFF_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BSWAP: UInt32 {
                @inlinable @inline(__always) get {
                  BSWAP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BSWAP_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IRQ_QUIET: UInt32 {
                @inlinable @inline(__always) get {
                  IRQ_QUIET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IRQ_QUIET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TREQ_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  TREQ_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TREQ_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CHAIN_TO: UInt32 {
                @inlinable @inline(__always) get {
                  CHAIN_TO_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CHAIN_TO_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RING_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  RING_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RING_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RING_SIZE: UInt32 {
                @inlinable @inline(__always) get {
                  RING_SIZE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RING_SIZE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INCR_WRITE: UInt32 {
                @inlinable @inline(__always) get {
                  INCR_WRITE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INCR_WRITE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INCR_READ: UInt32 {
                @inlinable @inline(__always) get {
                  INCR_READ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INCR_READ_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DATA_SIZE: UInt32 {
                @inlinable @inline(__always) get {
                  DATA_SIZE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DATA_SIZE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var HIGH_PRIORITY: UInt32 {
                @inlinable @inline(__always) get {
                  HIGH_PRIORITY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HIGH_PRIORITY_Field.insert(newValue, into: &self.storage)
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

                    public  typealias Value = CH4_CTRL_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var AHB_ERROR: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(AHB_ERROR_Field.self, Bool.self)
                    return Bool(storage: self.raw.AHB_ERROR)
                }
                }
              public var READ_ERROR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.READ_ERROR)
                }
              }
              public var WRITE_ERROR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.WRITE_ERROR)
                }
              }
              public var BUSY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUSY_Field.self, Bool.self)
                  return Bool(storage: self.raw.BUSY)
                }
              }
              public var SNIFF_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SNIFF_EN)
                }
              }
              public var BSWAP: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  return Bool(storage: self.raw.BSWAP)
                }
              }
              public var IRQ_QUIET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  return Bool(storage: self.raw.IRQ_QUIET)
                }
              }
              public var TREQ_SEL: TREQ_SEL_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  return TREQ_SEL_Values(storage: self.raw.TREQ_SEL)
                }
              }
              public var CHAIN_TO: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.CHAIN_TO)
                }
              }
              public var RING_SEL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  return Bool(storage: self.raw.RING_SEL)
                }
              }
              public var RING_SIZE: RING_SIZE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  return RING_SIZE_Values(storage: self.raw.RING_SIZE)
                }
              }
              public var INCR_WRITE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_WRITE)
                }
              }
              public var INCR_READ: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_READ)
                }
              }
              public var DATA_SIZE: DATA_SIZE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  return DATA_SIZE_Values(storage: self.raw.DATA_SIZE)
                }
              }
              public var HIGH_PRIORITY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  return Bool(storage: self.raw.HIGH_PRIORITY)
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

                    public  typealias Value = CH4_CTRL_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var READ_ERROR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                    return Bool(storage: self.raw.READ_ERROR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                    self.raw.READ_ERROR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var WRITE_ERROR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.WRITE_ERROR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  self.raw.WRITE_ERROR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SNIFF_EN: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SNIFF_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  self.raw.SNIFF_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BSWAP: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  return Bool(storage: self.raw.BSWAP)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  self.raw.BSWAP = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IRQ_QUIET: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  return Bool(storage: self.raw.IRQ_QUIET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  self.raw.IRQ_QUIET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TREQ_SEL: TREQ_SEL_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  return TREQ_SEL_Values(storage: self.raw.TREQ_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  self.raw.TREQ_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CHAIN_TO: BitField4 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.CHAIN_TO)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  self.raw.CHAIN_TO = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RING_SEL: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  return Bool(storage: self.raw.RING_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  self.raw.RING_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RING_SIZE: RING_SIZE_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  return RING_SIZE_Values(storage: self.raw.RING_SIZE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  self.raw.RING_SIZE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INCR_WRITE: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_WRITE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  self.raw.INCR_WRITE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INCR_READ: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_READ)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  self.raw.INCR_READ = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DATA_SIZE: DATA_SIZE_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  return DATA_SIZE_Values(storage: self.raw.DATA_SIZE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  self.raw.DATA_SIZE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var HIGH_PRIORITY: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  return Bool(storage: self.raw.HIGH_PRIORITY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  self.raw.HIGH_PRIORITY = newValue.storage(Self.Value.Raw.Storage.self)
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

    /// Alias for channel 4 CTRL register
    public var CH4_AL1_CTRL: Register<CH4_AL1_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0110), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0110))
          #endif
        }
    }
    public struct CH4_AL1_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH4_AL1_CTRL_Descriptor

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

                    public  typealias Value = CH4_AL1_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 4 READ_ADDR register
    public var CH4_AL1_READ_ADDR: Register<CH4_AL1_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0114), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0114))
          #endif
        }
    }
    public struct CH4_AL1_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH4_AL1_READ_ADDR_Descriptor

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

                    public  typealias Value = CH4_AL1_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 4 WRITE_ADDR register
    public var CH4_AL1_WRITE_ADDR: Register<CH4_AL1_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0118), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0118))
          #endif
        }
    }
    public struct CH4_AL1_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH4_AL1_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH4_AL1_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 4 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH4_AL1_TRANS_COUNT_TRIG: Register<CH4_AL1_TRANS_COUNT_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x011c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x011c))
          #endif
        }
    }
    public struct CH4_AL1_TRANS_COUNT_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH4_AL1_TRANS_COUNT_TRIG_Descriptor

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

                    public  typealias Value = CH4_AL1_TRANS_COUNT_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 4 CTRL register
    public var CH4_AL2_CTRL: Register<CH4_AL2_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0120), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0120))
          #endif
        }
    }
    public struct CH4_AL2_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH4_AL2_CTRL_Descriptor

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

                    public  typealias Value = CH4_AL2_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 4 TRANS_COUNT register
    public var CH4_AL2_TRANS_COUNT: Register<CH4_AL2_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0124), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0124))
          #endif
        }
    }
    public struct CH4_AL2_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH4_AL2_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH4_AL2_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 4 READ_ADDR register
    public var CH4_AL2_READ_ADDR: Register<CH4_AL2_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0128), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0128))
          #endif
        }
    }
    public struct CH4_AL2_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH4_AL2_READ_ADDR_Descriptor

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

                    public  typealias Value = CH4_AL2_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 4 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH4_AL2_WRITE_ADDR_TRIG: Register<CH4_AL2_WRITE_ADDR_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x012c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x012c))
          #endif
        }
    }
    public struct CH4_AL2_WRITE_ADDR_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH4_AL2_WRITE_ADDR_TRIG_Descriptor

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

                    public  typealias Value = CH4_AL2_WRITE_ADDR_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 4 CTRL register
    public var CH4_AL3_CTRL: Register<CH4_AL3_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0130), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0130))
          #endif
        }
    }
    public struct CH4_AL3_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH4_AL3_CTRL_Descriptor

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

                    public  typealias Value = CH4_AL3_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 4 WRITE_ADDR register
    public var CH4_AL3_WRITE_ADDR: Register<CH4_AL3_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0134), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0134))
          #endif
        }
    }
    public struct CH4_AL3_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH4_AL3_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH4_AL3_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 4 TRANS_COUNT register
    public var CH4_AL3_TRANS_COUNT: Register<CH4_AL3_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0138), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0138))
          #endif
        }
    }
    public struct CH4_AL3_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH4_AL3_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH4_AL3_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 4 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH4_AL3_READ_ADDR_TRIG: Register<CH4_AL3_READ_ADDR_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x013c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x013c))
          #endif
        }
    }
    public struct CH4_AL3_READ_ADDR_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH4_AL3_READ_ADDR_TRIG_Descriptor

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

                    public  typealias Value = CH4_AL3_READ_ADDR_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 5 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    public var CH5_READ_ADDR: Register<CH5_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0140), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0140))
          #endif
        }
    }
    public struct CH5_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH5_READ_ADDR_Descriptor

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

                    public  typealias Value = CH5_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 5 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    public var CH5_WRITE_ADDR: Register<CH5_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0144), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0144))
          #endif
        }
    }
    public struct CH5_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH5_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH5_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 5 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    public var CH5_TRANS_COUNT: Register<CH5_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0148), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0148))
          #endif
        }
    }
    public struct CH5_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH5_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH5_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 5 Control and Status
    public var CH5_CTRL_TRIG: Register<CH5_CTRL_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x014c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x014c))
          #endif
        }
    }
    public struct CH5_CTRL_TRIG_Descriptor {
        @available(*, unavailable)
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        public var AHB_ERROR: AHB_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        public var READ_ERROR: READ_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        public var WRITE_ERROR: WRITE_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        public var BUSY: BUSY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        public var SNIFF_EN: SNIFF_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        public var BSWAP: BSWAP_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        public var IRQ_QUIET: IRQ_QUIET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        public var TREQ_SEL: TREQ_SEL_Field {
            get {
                fatalError()
            }
        }

        public enum TREQ_SEL_Values: UInt, BitFieldProjectable {
            /// Select Timer 0 as TREQ
            case TREQ_SEL_TIMER0 = 59
            /// Select Timer 1 as TREQ
            case TREQ_SEL_TIMER1 = 60
            /// Select Timer 2 as TREQ (Optional)
            case TREQ_SEL_TIMER2 = 61
            /// Select Timer 3 as TREQ (Optional)
            case TREQ_SEL_TIMER3 = 62
            /// Permanent request, for unpaced transfers.
            case TREQ_SEL_PERMANENT = 63

            public static var bitWidth: Int { 6 }
        }
        @available(*, unavailable)

        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        public var CHAIN_TO: CHAIN_TO_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        public var RING_SEL: RING_SEL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        public var RING_SIZE: RING_SIZE_Field {
            get {
                fatalError()
            }
        }

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }
        @available(*, unavailable)

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        public var INCR_WRITE: INCR_WRITE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        public var INCR_READ: INCR_READ_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        public var DATA_SIZE: DATA_SIZE_Field {
            get {
                fatalError()
            }
        }

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        public var HIGH_PRIORITY: HIGH_PRIORITY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        public var EN: EN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum AHB_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum READ_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum WRITE_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum BUSY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum SNIFF_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum BSWAP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum IRQ_QUIET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum TREQ_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 21
        }

        public enum CHAIN_TO_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 15
        }

        public enum RING_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum RING_SIZE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 10
        }

        public enum INCR_WRITE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum INCR_READ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum DATA_SIZE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 4
        }

        public enum HIGH_PRIORITY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH5_CTRL_TRIG_Descriptor

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
                public var AHB_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                    AHB_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    AHB_ERROR_Field.insert(newValue, into: &self.storage)
                }
                }
              public var READ_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                  READ_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  READ_ERROR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var WRITE_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                  WRITE_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  WRITE_ERROR_Field.insert(newValue, into: &self.storage)
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
              public var SNIFF_EN: UInt32 {
                @inlinable @inline(__always) get {
                  SNIFF_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SNIFF_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BSWAP: UInt32 {
                @inlinable @inline(__always) get {
                  BSWAP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BSWAP_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IRQ_QUIET: UInt32 {
                @inlinable @inline(__always) get {
                  IRQ_QUIET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IRQ_QUIET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TREQ_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  TREQ_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TREQ_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CHAIN_TO: UInt32 {
                @inlinable @inline(__always) get {
                  CHAIN_TO_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CHAIN_TO_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RING_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  RING_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RING_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RING_SIZE: UInt32 {
                @inlinable @inline(__always) get {
                  RING_SIZE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RING_SIZE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INCR_WRITE: UInt32 {
                @inlinable @inline(__always) get {
                  INCR_WRITE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INCR_WRITE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INCR_READ: UInt32 {
                @inlinable @inline(__always) get {
                  INCR_READ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INCR_READ_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DATA_SIZE: UInt32 {
                @inlinable @inline(__always) get {
                  DATA_SIZE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DATA_SIZE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var HIGH_PRIORITY: UInt32 {
                @inlinable @inline(__always) get {
                  HIGH_PRIORITY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HIGH_PRIORITY_Field.insert(newValue, into: &self.storage)
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

                    public  typealias Value = CH5_CTRL_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var AHB_ERROR: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(AHB_ERROR_Field.self, Bool.self)
                    return Bool(storage: self.raw.AHB_ERROR)
                }
                }
              public var READ_ERROR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.READ_ERROR)
                }
              }
              public var WRITE_ERROR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.WRITE_ERROR)
                }
              }
              public var BUSY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUSY_Field.self, Bool.self)
                  return Bool(storage: self.raw.BUSY)
                }
              }
              public var SNIFF_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SNIFF_EN)
                }
              }
              public var BSWAP: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  return Bool(storage: self.raw.BSWAP)
                }
              }
              public var IRQ_QUIET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  return Bool(storage: self.raw.IRQ_QUIET)
                }
              }
              public var TREQ_SEL: TREQ_SEL_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  return TREQ_SEL_Values(storage: self.raw.TREQ_SEL)
                }
              }
              public var CHAIN_TO: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.CHAIN_TO)
                }
              }
              public var RING_SEL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  return Bool(storage: self.raw.RING_SEL)
                }
              }
              public var RING_SIZE: RING_SIZE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  return RING_SIZE_Values(storage: self.raw.RING_SIZE)
                }
              }
              public var INCR_WRITE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_WRITE)
                }
              }
              public var INCR_READ: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_READ)
                }
              }
              public var DATA_SIZE: DATA_SIZE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  return DATA_SIZE_Values(storage: self.raw.DATA_SIZE)
                }
              }
              public var HIGH_PRIORITY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  return Bool(storage: self.raw.HIGH_PRIORITY)
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

                    public  typealias Value = CH5_CTRL_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var READ_ERROR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                    return Bool(storage: self.raw.READ_ERROR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                    self.raw.READ_ERROR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var WRITE_ERROR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.WRITE_ERROR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  self.raw.WRITE_ERROR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SNIFF_EN: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SNIFF_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  self.raw.SNIFF_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BSWAP: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  return Bool(storage: self.raw.BSWAP)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  self.raw.BSWAP = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IRQ_QUIET: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  return Bool(storage: self.raw.IRQ_QUIET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  self.raw.IRQ_QUIET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TREQ_SEL: TREQ_SEL_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  return TREQ_SEL_Values(storage: self.raw.TREQ_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  self.raw.TREQ_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CHAIN_TO: BitField4 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.CHAIN_TO)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  self.raw.CHAIN_TO = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RING_SEL: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  return Bool(storage: self.raw.RING_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  self.raw.RING_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RING_SIZE: RING_SIZE_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  return RING_SIZE_Values(storage: self.raw.RING_SIZE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  self.raw.RING_SIZE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INCR_WRITE: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_WRITE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  self.raw.INCR_WRITE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INCR_READ: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_READ)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  self.raw.INCR_READ = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DATA_SIZE: DATA_SIZE_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  return DATA_SIZE_Values(storage: self.raw.DATA_SIZE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  self.raw.DATA_SIZE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var HIGH_PRIORITY: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  return Bool(storage: self.raw.HIGH_PRIORITY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  self.raw.HIGH_PRIORITY = newValue.storage(Self.Value.Raw.Storage.self)
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

    /// Alias for channel 5 CTRL register
    public var CH5_AL1_CTRL: Register<CH5_AL1_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0150), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0150))
          #endif
        }
    }
    public struct CH5_AL1_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH5_AL1_CTRL_Descriptor

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

                    public  typealias Value = CH5_AL1_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 5 READ_ADDR register
    public var CH5_AL1_READ_ADDR: Register<CH5_AL1_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0154), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0154))
          #endif
        }
    }
    public struct CH5_AL1_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH5_AL1_READ_ADDR_Descriptor

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

                    public  typealias Value = CH5_AL1_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 5 WRITE_ADDR register
    public var CH5_AL1_WRITE_ADDR: Register<CH5_AL1_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0158), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0158))
          #endif
        }
    }
    public struct CH5_AL1_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH5_AL1_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH5_AL1_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 5 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH5_AL1_TRANS_COUNT_TRIG: Register<CH5_AL1_TRANS_COUNT_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x015c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x015c))
          #endif
        }
    }
    public struct CH5_AL1_TRANS_COUNT_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH5_AL1_TRANS_COUNT_TRIG_Descriptor

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

                    public  typealias Value = CH5_AL1_TRANS_COUNT_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 5 CTRL register
    public var CH5_AL2_CTRL: Register<CH5_AL2_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0160), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0160))
          #endif
        }
    }
    public struct CH5_AL2_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH5_AL2_CTRL_Descriptor

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

                    public  typealias Value = CH5_AL2_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 5 TRANS_COUNT register
    public var CH5_AL2_TRANS_COUNT: Register<CH5_AL2_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0164), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0164))
          #endif
        }
    }
    public struct CH5_AL2_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH5_AL2_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH5_AL2_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 5 READ_ADDR register
    public var CH5_AL2_READ_ADDR: Register<CH5_AL2_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0168), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0168))
          #endif
        }
    }
    public struct CH5_AL2_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH5_AL2_READ_ADDR_Descriptor

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

                    public  typealias Value = CH5_AL2_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 5 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH5_AL2_WRITE_ADDR_TRIG: Register<CH5_AL2_WRITE_ADDR_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x016c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x016c))
          #endif
        }
    }
    public struct CH5_AL2_WRITE_ADDR_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH5_AL2_WRITE_ADDR_TRIG_Descriptor

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

                    public  typealias Value = CH5_AL2_WRITE_ADDR_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 5 CTRL register
    public var CH5_AL3_CTRL: Register<CH5_AL3_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0170), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0170))
          #endif
        }
    }
    public struct CH5_AL3_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH5_AL3_CTRL_Descriptor

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

                    public  typealias Value = CH5_AL3_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 5 WRITE_ADDR register
    public var CH5_AL3_WRITE_ADDR: Register<CH5_AL3_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0174), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0174))
          #endif
        }
    }
    public struct CH5_AL3_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH5_AL3_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH5_AL3_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 5 TRANS_COUNT register
    public var CH5_AL3_TRANS_COUNT: Register<CH5_AL3_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0178), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0178))
          #endif
        }
    }
    public struct CH5_AL3_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH5_AL3_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH5_AL3_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 5 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH5_AL3_READ_ADDR_TRIG: Register<CH5_AL3_READ_ADDR_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x017c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x017c))
          #endif
        }
    }
    public struct CH5_AL3_READ_ADDR_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH5_AL3_READ_ADDR_TRIG_Descriptor

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

                    public  typealias Value = CH5_AL3_READ_ADDR_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 6 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    public var CH6_READ_ADDR: Register<CH6_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0180), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0180))
          #endif
        }
    }
    public struct CH6_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH6_READ_ADDR_Descriptor

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

                    public  typealias Value = CH6_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 6 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    public var CH6_WRITE_ADDR: Register<CH6_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0184), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0184))
          #endif
        }
    }
    public struct CH6_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH6_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH6_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 6 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    public var CH6_TRANS_COUNT: Register<CH6_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0188), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0188))
          #endif
        }
    }
    public struct CH6_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH6_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH6_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 6 Control and Status
    public var CH6_CTRL_TRIG: Register<CH6_CTRL_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x018c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x018c))
          #endif
        }
    }
    public struct CH6_CTRL_TRIG_Descriptor {
        @available(*, unavailable)
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        public var AHB_ERROR: AHB_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        public var READ_ERROR: READ_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        public var WRITE_ERROR: WRITE_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        public var BUSY: BUSY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        public var SNIFF_EN: SNIFF_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        public var BSWAP: BSWAP_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        public var IRQ_QUIET: IRQ_QUIET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        public var TREQ_SEL: TREQ_SEL_Field {
            get {
                fatalError()
            }
        }

        public enum TREQ_SEL_Values: UInt, BitFieldProjectable {
            /// Select Timer 0 as TREQ
            case TREQ_SEL_TIMER0 = 59
            /// Select Timer 1 as TREQ
            case TREQ_SEL_TIMER1 = 60
            /// Select Timer 2 as TREQ (Optional)
            case TREQ_SEL_TIMER2 = 61
            /// Select Timer 3 as TREQ (Optional)
            case TREQ_SEL_TIMER3 = 62
            /// Permanent request, for unpaced transfers.
            case TREQ_SEL_PERMANENT = 63

            public static var bitWidth: Int { 6 }
        }
        @available(*, unavailable)

        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        public var CHAIN_TO: CHAIN_TO_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        public var RING_SEL: RING_SEL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        public var RING_SIZE: RING_SIZE_Field {
            get {
                fatalError()
            }
        }

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }
        @available(*, unavailable)

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        public var INCR_WRITE: INCR_WRITE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        public var INCR_READ: INCR_READ_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        public var DATA_SIZE: DATA_SIZE_Field {
            get {
                fatalError()
            }
        }

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        public var HIGH_PRIORITY: HIGH_PRIORITY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        public var EN: EN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum AHB_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum READ_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum WRITE_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum BUSY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum SNIFF_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum BSWAP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum IRQ_QUIET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum TREQ_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 21
        }

        public enum CHAIN_TO_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 15
        }

        public enum RING_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum RING_SIZE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 10
        }

        public enum INCR_WRITE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum INCR_READ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum DATA_SIZE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 4
        }

        public enum HIGH_PRIORITY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH6_CTRL_TRIG_Descriptor

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
                public var AHB_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                    AHB_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    AHB_ERROR_Field.insert(newValue, into: &self.storage)
                }
                }
              public var READ_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                  READ_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  READ_ERROR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var WRITE_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                  WRITE_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  WRITE_ERROR_Field.insert(newValue, into: &self.storage)
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
              public var SNIFF_EN: UInt32 {
                @inlinable @inline(__always) get {
                  SNIFF_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SNIFF_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BSWAP: UInt32 {
                @inlinable @inline(__always) get {
                  BSWAP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BSWAP_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IRQ_QUIET: UInt32 {
                @inlinable @inline(__always) get {
                  IRQ_QUIET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IRQ_QUIET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TREQ_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  TREQ_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TREQ_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CHAIN_TO: UInt32 {
                @inlinable @inline(__always) get {
                  CHAIN_TO_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CHAIN_TO_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RING_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  RING_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RING_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RING_SIZE: UInt32 {
                @inlinable @inline(__always) get {
                  RING_SIZE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RING_SIZE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INCR_WRITE: UInt32 {
                @inlinable @inline(__always) get {
                  INCR_WRITE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INCR_WRITE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INCR_READ: UInt32 {
                @inlinable @inline(__always) get {
                  INCR_READ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INCR_READ_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DATA_SIZE: UInt32 {
                @inlinable @inline(__always) get {
                  DATA_SIZE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DATA_SIZE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var HIGH_PRIORITY: UInt32 {
                @inlinable @inline(__always) get {
                  HIGH_PRIORITY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HIGH_PRIORITY_Field.insert(newValue, into: &self.storage)
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

                    public  typealias Value = CH6_CTRL_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var AHB_ERROR: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(AHB_ERROR_Field.self, Bool.self)
                    return Bool(storage: self.raw.AHB_ERROR)
                }
                }
              public var READ_ERROR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.READ_ERROR)
                }
              }
              public var WRITE_ERROR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.WRITE_ERROR)
                }
              }
              public var BUSY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUSY_Field.self, Bool.self)
                  return Bool(storage: self.raw.BUSY)
                }
              }
              public var SNIFF_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SNIFF_EN)
                }
              }
              public var BSWAP: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  return Bool(storage: self.raw.BSWAP)
                }
              }
              public var IRQ_QUIET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  return Bool(storage: self.raw.IRQ_QUIET)
                }
              }
              public var TREQ_SEL: TREQ_SEL_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  return TREQ_SEL_Values(storage: self.raw.TREQ_SEL)
                }
              }
              public var CHAIN_TO: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.CHAIN_TO)
                }
              }
              public var RING_SEL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  return Bool(storage: self.raw.RING_SEL)
                }
              }
              public var RING_SIZE: RING_SIZE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  return RING_SIZE_Values(storage: self.raw.RING_SIZE)
                }
              }
              public var INCR_WRITE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_WRITE)
                }
              }
              public var INCR_READ: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_READ)
                }
              }
              public var DATA_SIZE: DATA_SIZE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  return DATA_SIZE_Values(storage: self.raw.DATA_SIZE)
                }
              }
              public var HIGH_PRIORITY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  return Bool(storage: self.raw.HIGH_PRIORITY)
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

                    public  typealias Value = CH6_CTRL_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var READ_ERROR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                    return Bool(storage: self.raw.READ_ERROR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                    self.raw.READ_ERROR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var WRITE_ERROR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.WRITE_ERROR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  self.raw.WRITE_ERROR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SNIFF_EN: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SNIFF_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  self.raw.SNIFF_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BSWAP: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  return Bool(storage: self.raw.BSWAP)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  self.raw.BSWAP = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IRQ_QUIET: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  return Bool(storage: self.raw.IRQ_QUIET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  self.raw.IRQ_QUIET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TREQ_SEL: TREQ_SEL_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  return TREQ_SEL_Values(storage: self.raw.TREQ_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  self.raw.TREQ_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CHAIN_TO: BitField4 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.CHAIN_TO)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  self.raw.CHAIN_TO = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RING_SEL: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  return Bool(storage: self.raw.RING_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  self.raw.RING_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RING_SIZE: RING_SIZE_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  return RING_SIZE_Values(storage: self.raw.RING_SIZE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  self.raw.RING_SIZE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INCR_WRITE: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_WRITE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  self.raw.INCR_WRITE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INCR_READ: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_READ)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  self.raw.INCR_READ = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DATA_SIZE: DATA_SIZE_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  return DATA_SIZE_Values(storage: self.raw.DATA_SIZE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  self.raw.DATA_SIZE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var HIGH_PRIORITY: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  return Bool(storage: self.raw.HIGH_PRIORITY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  self.raw.HIGH_PRIORITY = newValue.storage(Self.Value.Raw.Storage.self)
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

    /// Alias for channel 6 CTRL register
    public var CH6_AL1_CTRL: Register<CH6_AL1_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0190), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0190))
          #endif
        }
    }
    public struct CH6_AL1_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH6_AL1_CTRL_Descriptor

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

                    public  typealias Value = CH6_AL1_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 6 READ_ADDR register
    public var CH6_AL1_READ_ADDR: Register<CH6_AL1_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0194), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0194))
          #endif
        }
    }
    public struct CH6_AL1_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH6_AL1_READ_ADDR_Descriptor

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

                    public  typealias Value = CH6_AL1_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 6 WRITE_ADDR register
    public var CH6_AL1_WRITE_ADDR: Register<CH6_AL1_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0198), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0198))
          #endif
        }
    }
    public struct CH6_AL1_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH6_AL1_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH6_AL1_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 6 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH6_AL1_TRANS_COUNT_TRIG: Register<CH6_AL1_TRANS_COUNT_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x019c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x019c))
          #endif
        }
    }
    public struct CH6_AL1_TRANS_COUNT_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH6_AL1_TRANS_COUNT_TRIG_Descriptor

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

                    public  typealias Value = CH6_AL1_TRANS_COUNT_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 6 CTRL register
    public var CH6_AL2_CTRL: Register<CH6_AL2_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x01a0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x01a0))
          #endif
        }
    }
    public struct CH6_AL2_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH6_AL2_CTRL_Descriptor

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

                    public  typealias Value = CH6_AL2_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 6 TRANS_COUNT register
    public var CH6_AL2_TRANS_COUNT: Register<CH6_AL2_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x01a4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x01a4))
          #endif
        }
    }
    public struct CH6_AL2_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH6_AL2_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH6_AL2_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 6 READ_ADDR register
    public var CH6_AL2_READ_ADDR: Register<CH6_AL2_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x01a8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x01a8))
          #endif
        }
    }
    public struct CH6_AL2_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH6_AL2_READ_ADDR_Descriptor

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

                    public  typealias Value = CH6_AL2_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 6 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH6_AL2_WRITE_ADDR_TRIG: Register<CH6_AL2_WRITE_ADDR_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x01ac), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x01ac))
          #endif
        }
    }
    public struct CH6_AL2_WRITE_ADDR_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH6_AL2_WRITE_ADDR_TRIG_Descriptor

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

                    public  typealias Value = CH6_AL2_WRITE_ADDR_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 6 CTRL register
    public var CH6_AL3_CTRL: Register<CH6_AL3_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x01b0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x01b0))
          #endif
        }
    }
    public struct CH6_AL3_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH6_AL3_CTRL_Descriptor

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

                    public  typealias Value = CH6_AL3_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 6 WRITE_ADDR register
    public var CH6_AL3_WRITE_ADDR: Register<CH6_AL3_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x01b4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x01b4))
          #endif
        }
    }
    public struct CH6_AL3_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH6_AL3_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH6_AL3_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 6 TRANS_COUNT register
    public var CH6_AL3_TRANS_COUNT: Register<CH6_AL3_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x01b8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x01b8))
          #endif
        }
    }
    public struct CH6_AL3_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH6_AL3_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH6_AL3_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 6 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH6_AL3_READ_ADDR_TRIG: Register<CH6_AL3_READ_ADDR_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x01bc), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x01bc))
          #endif
        }
    }
    public struct CH6_AL3_READ_ADDR_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH6_AL3_READ_ADDR_TRIG_Descriptor

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

                    public  typealias Value = CH6_AL3_READ_ADDR_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 7 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    public var CH7_READ_ADDR: Register<CH7_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x01c0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x01c0))
          #endif
        }
    }
    public struct CH7_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH7_READ_ADDR_Descriptor

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

                    public  typealias Value = CH7_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 7 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    public var CH7_WRITE_ADDR: Register<CH7_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x01c4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x01c4))
          #endif
        }
    }
    public struct CH7_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH7_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH7_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 7 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    public var CH7_TRANS_COUNT: Register<CH7_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x01c8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x01c8))
          #endif
        }
    }
    public struct CH7_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH7_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH7_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 7 Control and Status
    public var CH7_CTRL_TRIG: Register<CH7_CTRL_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x01cc), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x01cc))
          #endif
        }
    }
    public struct CH7_CTRL_TRIG_Descriptor {
        @available(*, unavailable)
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        public var AHB_ERROR: AHB_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        public var READ_ERROR: READ_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        public var WRITE_ERROR: WRITE_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        public var BUSY: BUSY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        public var SNIFF_EN: SNIFF_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        public var BSWAP: BSWAP_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        public var IRQ_QUIET: IRQ_QUIET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        public var TREQ_SEL: TREQ_SEL_Field {
            get {
                fatalError()
            }
        }

        public enum TREQ_SEL_Values: UInt, BitFieldProjectable {
            /// Select Timer 0 as TREQ
            case TREQ_SEL_TIMER0 = 59
            /// Select Timer 1 as TREQ
            case TREQ_SEL_TIMER1 = 60
            /// Select Timer 2 as TREQ (Optional)
            case TREQ_SEL_TIMER2 = 61
            /// Select Timer 3 as TREQ (Optional)
            case TREQ_SEL_TIMER3 = 62
            /// Permanent request, for unpaced transfers.
            case TREQ_SEL_PERMANENT = 63

            public static var bitWidth: Int { 6 }
        }
        @available(*, unavailable)

        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        public var CHAIN_TO: CHAIN_TO_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        public var RING_SEL: RING_SEL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        public var RING_SIZE: RING_SIZE_Field {
            get {
                fatalError()
            }
        }

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }
        @available(*, unavailable)

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        public var INCR_WRITE: INCR_WRITE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        public var INCR_READ: INCR_READ_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        public var DATA_SIZE: DATA_SIZE_Field {
            get {
                fatalError()
            }
        }

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        public var HIGH_PRIORITY: HIGH_PRIORITY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        public var EN: EN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum AHB_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum READ_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum WRITE_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum BUSY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum SNIFF_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum BSWAP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum IRQ_QUIET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum TREQ_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 21
        }

        public enum CHAIN_TO_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 15
        }

        public enum RING_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum RING_SIZE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 10
        }

        public enum INCR_WRITE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum INCR_READ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum DATA_SIZE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 4
        }

        public enum HIGH_PRIORITY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH7_CTRL_TRIG_Descriptor

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
                public var AHB_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                    AHB_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    AHB_ERROR_Field.insert(newValue, into: &self.storage)
                }
                }
              public var READ_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                  READ_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  READ_ERROR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var WRITE_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                  WRITE_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  WRITE_ERROR_Field.insert(newValue, into: &self.storage)
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
              public var SNIFF_EN: UInt32 {
                @inlinable @inline(__always) get {
                  SNIFF_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SNIFF_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BSWAP: UInt32 {
                @inlinable @inline(__always) get {
                  BSWAP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BSWAP_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IRQ_QUIET: UInt32 {
                @inlinable @inline(__always) get {
                  IRQ_QUIET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IRQ_QUIET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TREQ_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  TREQ_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TREQ_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CHAIN_TO: UInt32 {
                @inlinable @inline(__always) get {
                  CHAIN_TO_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CHAIN_TO_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RING_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  RING_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RING_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RING_SIZE: UInt32 {
                @inlinable @inline(__always) get {
                  RING_SIZE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RING_SIZE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INCR_WRITE: UInt32 {
                @inlinable @inline(__always) get {
                  INCR_WRITE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INCR_WRITE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INCR_READ: UInt32 {
                @inlinable @inline(__always) get {
                  INCR_READ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INCR_READ_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DATA_SIZE: UInt32 {
                @inlinable @inline(__always) get {
                  DATA_SIZE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DATA_SIZE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var HIGH_PRIORITY: UInt32 {
                @inlinable @inline(__always) get {
                  HIGH_PRIORITY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HIGH_PRIORITY_Field.insert(newValue, into: &self.storage)
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

                    public  typealias Value = CH7_CTRL_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var AHB_ERROR: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(AHB_ERROR_Field.self, Bool.self)
                    return Bool(storage: self.raw.AHB_ERROR)
                }
                }
              public var READ_ERROR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.READ_ERROR)
                }
              }
              public var WRITE_ERROR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.WRITE_ERROR)
                }
              }
              public var BUSY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUSY_Field.self, Bool.self)
                  return Bool(storage: self.raw.BUSY)
                }
              }
              public var SNIFF_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SNIFF_EN)
                }
              }
              public var BSWAP: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  return Bool(storage: self.raw.BSWAP)
                }
              }
              public var IRQ_QUIET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  return Bool(storage: self.raw.IRQ_QUIET)
                }
              }
              public var TREQ_SEL: TREQ_SEL_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  return TREQ_SEL_Values(storage: self.raw.TREQ_SEL)
                }
              }
              public var CHAIN_TO: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.CHAIN_TO)
                }
              }
              public var RING_SEL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  return Bool(storage: self.raw.RING_SEL)
                }
              }
              public var RING_SIZE: RING_SIZE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  return RING_SIZE_Values(storage: self.raw.RING_SIZE)
                }
              }
              public var INCR_WRITE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_WRITE)
                }
              }
              public var INCR_READ: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_READ)
                }
              }
              public var DATA_SIZE: DATA_SIZE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  return DATA_SIZE_Values(storage: self.raw.DATA_SIZE)
                }
              }
              public var HIGH_PRIORITY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  return Bool(storage: self.raw.HIGH_PRIORITY)
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

                    public  typealias Value = CH7_CTRL_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var READ_ERROR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                    return Bool(storage: self.raw.READ_ERROR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                    self.raw.READ_ERROR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var WRITE_ERROR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.WRITE_ERROR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  self.raw.WRITE_ERROR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SNIFF_EN: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SNIFF_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  self.raw.SNIFF_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BSWAP: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  return Bool(storage: self.raw.BSWAP)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  self.raw.BSWAP = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IRQ_QUIET: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  return Bool(storage: self.raw.IRQ_QUIET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  self.raw.IRQ_QUIET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TREQ_SEL: TREQ_SEL_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  return TREQ_SEL_Values(storage: self.raw.TREQ_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  self.raw.TREQ_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CHAIN_TO: BitField4 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.CHAIN_TO)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  self.raw.CHAIN_TO = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RING_SEL: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  return Bool(storage: self.raw.RING_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  self.raw.RING_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RING_SIZE: RING_SIZE_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  return RING_SIZE_Values(storage: self.raw.RING_SIZE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  self.raw.RING_SIZE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INCR_WRITE: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_WRITE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  self.raw.INCR_WRITE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INCR_READ: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_READ)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  self.raw.INCR_READ = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DATA_SIZE: DATA_SIZE_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  return DATA_SIZE_Values(storage: self.raw.DATA_SIZE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  self.raw.DATA_SIZE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var HIGH_PRIORITY: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  return Bool(storage: self.raw.HIGH_PRIORITY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  self.raw.HIGH_PRIORITY = newValue.storage(Self.Value.Raw.Storage.self)
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

    /// Alias for channel 7 CTRL register
    public var CH7_AL1_CTRL: Register<CH7_AL1_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x01d0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x01d0))
          #endif
        }
    }
    public struct CH7_AL1_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH7_AL1_CTRL_Descriptor

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

                    public  typealias Value = CH7_AL1_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 7 READ_ADDR register
    public var CH7_AL1_READ_ADDR: Register<CH7_AL1_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x01d4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x01d4))
          #endif
        }
    }
    public struct CH7_AL1_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH7_AL1_READ_ADDR_Descriptor

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

                    public  typealias Value = CH7_AL1_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 7 WRITE_ADDR register
    public var CH7_AL1_WRITE_ADDR: Register<CH7_AL1_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x01d8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x01d8))
          #endif
        }
    }
    public struct CH7_AL1_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH7_AL1_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH7_AL1_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 7 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH7_AL1_TRANS_COUNT_TRIG: Register<CH7_AL1_TRANS_COUNT_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x01dc), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x01dc))
          #endif
        }
    }
    public struct CH7_AL1_TRANS_COUNT_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH7_AL1_TRANS_COUNT_TRIG_Descriptor

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

                    public  typealias Value = CH7_AL1_TRANS_COUNT_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 7 CTRL register
    public var CH7_AL2_CTRL: Register<CH7_AL2_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x01e0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x01e0))
          #endif
        }
    }
    public struct CH7_AL2_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH7_AL2_CTRL_Descriptor

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

                    public  typealias Value = CH7_AL2_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 7 TRANS_COUNT register
    public var CH7_AL2_TRANS_COUNT: Register<CH7_AL2_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x01e4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x01e4))
          #endif
        }
    }
    public struct CH7_AL2_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH7_AL2_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH7_AL2_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 7 READ_ADDR register
    public var CH7_AL2_READ_ADDR: Register<CH7_AL2_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x01e8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x01e8))
          #endif
        }
    }
    public struct CH7_AL2_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH7_AL2_READ_ADDR_Descriptor

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

                    public  typealias Value = CH7_AL2_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 7 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH7_AL2_WRITE_ADDR_TRIG: Register<CH7_AL2_WRITE_ADDR_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x01ec), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x01ec))
          #endif
        }
    }
    public struct CH7_AL2_WRITE_ADDR_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH7_AL2_WRITE_ADDR_TRIG_Descriptor

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

                    public  typealias Value = CH7_AL2_WRITE_ADDR_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 7 CTRL register
    public var CH7_AL3_CTRL: Register<CH7_AL3_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x01f0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x01f0))
          #endif
        }
    }
    public struct CH7_AL3_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH7_AL3_CTRL_Descriptor

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

                    public  typealias Value = CH7_AL3_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 7 WRITE_ADDR register
    public var CH7_AL3_WRITE_ADDR: Register<CH7_AL3_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x01f4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x01f4))
          #endif
        }
    }
    public struct CH7_AL3_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH7_AL3_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH7_AL3_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 7 TRANS_COUNT register
    public var CH7_AL3_TRANS_COUNT: Register<CH7_AL3_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x01f8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x01f8))
          #endif
        }
    }
    public struct CH7_AL3_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH7_AL3_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH7_AL3_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 7 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH7_AL3_READ_ADDR_TRIG: Register<CH7_AL3_READ_ADDR_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x01fc), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x01fc))
          #endif
        }
    }
    public struct CH7_AL3_READ_ADDR_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH7_AL3_READ_ADDR_TRIG_Descriptor

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

                    public  typealias Value = CH7_AL3_READ_ADDR_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 8 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    public var CH8_READ_ADDR: Register<CH8_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0200), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0200))
          #endif
        }
    }
    public struct CH8_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH8_READ_ADDR_Descriptor

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

                    public  typealias Value = CH8_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 8 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    public var CH8_WRITE_ADDR: Register<CH8_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0204), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0204))
          #endif
        }
    }
    public struct CH8_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH8_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH8_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 8 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    public var CH8_TRANS_COUNT: Register<CH8_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0208), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0208))
          #endif
        }
    }
    public struct CH8_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH8_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH8_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 8 Control and Status
    public var CH8_CTRL_TRIG: Register<CH8_CTRL_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x020c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x020c))
          #endif
        }
    }
    public struct CH8_CTRL_TRIG_Descriptor {
        @available(*, unavailable)
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        public var AHB_ERROR: AHB_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        public var READ_ERROR: READ_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        public var WRITE_ERROR: WRITE_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        public var BUSY: BUSY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        public var SNIFF_EN: SNIFF_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        public var BSWAP: BSWAP_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        public var IRQ_QUIET: IRQ_QUIET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        public var TREQ_SEL: TREQ_SEL_Field {
            get {
                fatalError()
            }
        }

        public enum TREQ_SEL_Values: UInt, BitFieldProjectable {
            /// Select Timer 0 as TREQ
            case TREQ_SEL_TIMER0 = 59
            /// Select Timer 1 as TREQ
            case TREQ_SEL_TIMER1 = 60
            /// Select Timer 2 as TREQ (Optional)
            case TREQ_SEL_TIMER2 = 61
            /// Select Timer 3 as TREQ (Optional)
            case TREQ_SEL_TIMER3 = 62
            /// Permanent request, for unpaced transfers.
            case TREQ_SEL_PERMANENT = 63

            public static var bitWidth: Int { 6 }
        }
        @available(*, unavailable)

        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        public var CHAIN_TO: CHAIN_TO_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        public var RING_SEL: RING_SEL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        public var RING_SIZE: RING_SIZE_Field {
            get {
                fatalError()
            }
        }

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }
        @available(*, unavailable)

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        public var INCR_WRITE: INCR_WRITE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        public var INCR_READ: INCR_READ_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        public var DATA_SIZE: DATA_SIZE_Field {
            get {
                fatalError()
            }
        }

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        public var HIGH_PRIORITY: HIGH_PRIORITY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        public var EN: EN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum AHB_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum READ_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum WRITE_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum BUSY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum SNIFF_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum BSWAP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum IRQ_QUIET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum TREQ_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 21
        }

        public enum CHAIN_TO_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 15
        }

        public enum RING_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum RING_SIZE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 10
        }

        public enum INCR_WRITE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum INCR_READ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum DATA_SIZE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 4
        }

        public enum HIGH_PRIORITY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH8_CTRL_TRIG_Descriptor

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
                public var AHB_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                    AHB_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    AHB_ERROR_Field.insert(newValue, into: &self.storage)
                }
                }
              public var READ_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                  READ_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  READ_ERROR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var WRITE_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                  WRITE_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  WRITE_ERROR_Field.insert(newValue, into: &self.storage)
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
              public var SNIFF_EN: UInt32 {
                @inlinable @inline(__always) get {
                  SNIFF_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SNIFF_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BSWAP: UInt32 {
                @inlinable @inline(__always) get {
                  BSWAP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BSWAP_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IRQ_QUIET: UInt32 {
                @inlinable @inline(__always) get {
                  IRQ_QUIET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IRQ_QUIET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TREQ_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  TREQ_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TREQ_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CHAIN_TO: UInt32 {
                @inlinable @inline(__always) get {
                  CHAIN_TO_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CHAIN_TO_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RING_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  RING_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RING_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RING_SIZE: UInt32 {
                @inlinable @inline(__always) get {
                  RING_SIZE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RING_SIZE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INCR_WRITE: UInt32 {
                @inlinable @inline(__always) get {
                  INCR_WRITE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INCR_WRITE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INCR_READ: UInt32 {
                @inlinable @inline(__always) get {
                  INCR_READ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INCR_READ_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DATA_SIZE: UInt32 {
                @inlinable @inline(__always) get {
                  DATA_SIZE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DATA_SIZE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var HIGH_PRIORITY: UInt32 {
                @inlinable @inline(__always) get {
                  HIGH_PRIORITY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HIGH_PRIORITY_Field.insert(newValue, into: &self.storage)
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

                    public  typealias Value = CH8_CTRL_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var AHB_ERROR: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(AHB_ERROR_Field.self, Bool.self)
                    return Bool(storage: self.raw.AHB_ERROR)
                }
                }
              public var READ_ERROR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.READ_ERROR)
                }
              }
              public var WRITE_ERROR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.WRITE_ERROR)
                }
              }
              public var BUSY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUSY_Field.self, Bool.self)
                  return Bool(storage: self.raw.BUSY)
                }
              }
              public var SNIFF_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SNIFF_EN)
                }
              }
              public var BSWAP: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  return Bool(storage: self.raw.BSWAP)
                }
              }
              public var IRQ_QUIET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  return Bool(storage: self.raw.IRQ_QUIET)
                }
              }
              public var TREQ_SEL: TREQ_SEL_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  return TREQ_SEL_Values(storage: self.raw.TREQ_SEL)
                }
              }
              public var CHAIN_TO: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.CHAIN_TO)
                }
              }
              public var RING_SEL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  return Bool(storage: self.raw.RING_SEL)
                }
              }
              public var RING_SIZE: RING_SIZE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  return RING_SIZE_Values(storage: self.raw.RING_SIZE)
                }
              }
              public var INCR_WRITE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_WRITE)
                }
              }
              public var INCR_READ: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_READ)
                }
              }
              public var DATA_SIZE: DATA_SIZE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  return DATA_SIZE_Values(storage: self.raw.DATA_SIZE)
                }
              }
              public var HIGH_PRIORITY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  return Bool(storage: self.raw.HIGH_PRIORITY)
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

                    public  typealias Value = CH8_CTRL_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var READ_ERROR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                    return Bool(storage: self.raw.READ_ERROR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                    self.raw.READ_ERROR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var WRITE_ERROR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.WRITE_ERROR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  self.raw.WRITE_ERROR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SNIFF_EN: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SNIFF_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  self.raw.SNIFF_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BSWAP: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  return Bool(storage: self.raw.BSWAP)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  self.raw.BSWAP = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IRQ_QUIET: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  return Bool(storage: self.raw.IRQ_QUIET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  self.raw.IRQ_QUIET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TREQ_SEL: TREQ_SEL_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  return TREQ_SEL_Values(storage: self.raw.TREQ_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  self.raw.TREQ_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CHAIN_TO: BitField4 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.CHAIN_TO)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  self.raw.CHAIN_TO = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RING_SEL: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  return Bool(storage: self.raw.RING_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  self.raw.RING_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RING_SIZE: RING_SIZE_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  return RING_SIZE_Values(storage: self.raw.RING_SIZE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  self.raw.RING_SIZE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INCR_WRITE: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_WRITE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  self.raw.INCR_WRITE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INCR_READ: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_READ)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  self.raw.INCR_READ = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DATA_SIZE: DATA_SIZE_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  return DATA_SIZE_Values(storage: self.raw.DATA_SIZE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  self.raw.DATA_SIZE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var HIGH_PRIORITY: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  return Bool(storage: self.raw.HIGH_PRIORITY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  self.raw.HIGH_PRIORITY = newValue.storage(Self.Value.Raw.Storage.self)
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

    /// Alias for channel 8 CTRL register
    public var CH8_AL1_CTRL: Register<CH8_AL1_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0210), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0210))
          #endif
        }
    }
    public struct CH8_AL1_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH8_AL1_CTRL_Descriptor

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

                    public  typealias Value = CH8_AL1_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 8 READ_ADDR register
    public var CH8_AL1_READ_ADDR: Register<CH8_AL1_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0214), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0214))
          #endif
        }
    }
    public struct CH8_AL1_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH8_AL1_READ_ADDR_Descriptor

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

                    public  typealias Value = CH8_AL1_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 8 WRITE_ADDR register
    public var CH8_AL1_WRITE_ADDR: Register<CH8_AL1_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0218), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0218))
          #endif
        }
    }
    public struct CH8_AL1_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH8_AL1_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH8_AL1_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 8 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH8_AL1_TRANS_COUNT_TRIG: Register<CH8_AL1_TRANS_COUNT_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x021c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x021c))
          #endif
        }
    }
    public struct CH8_AL1_TRANS_COUNT_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH8_AL1_TRANS_COUNT_TRIG_Descriptor

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

                    public  typealias Value = CH8_AL1_TRANS_COUNT_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 8 CTRL register
    public var CH8_AL2_CTRL: Register<CH8_AL2_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0220), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0220))
          #endif
        }
    }
    public struct CH8_AL2_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH8_AL2_CTRL_Descriptor

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

                    public  typealias Value = CH8_AL2_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 8 TRANS_COUNT register
    public var CH8_AL2_TRANS_COUNT: Register<CH8_AL2_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0224), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0224))
          #endif
        }
    }
    public struct CH8_AL2_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH8_AL2_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH8_AL2_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 8 READ_ADDR register
    public var CH8_AL2_READ_ADDR: Register<CH8_AL2_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0228), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0228))
          #endif
        }
    }
    public struct CH8_AL2_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH8_AL2_READ_ADDR_Descriptor

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

                    public  typealias Value = CH8_AL2_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 8 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH8_AL2_WRITE_ADDR_TRIG: Register<CH8_AL2_WRITE_ADDR_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x022c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x022c))
          #endif
        }
    }
    public struct CH8_AL2_WRITE_ADDR_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH8_AL2_WRITE_ADDR_TRIG_Descriptor

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

                    public  typealias Value = CH8_AL2_WRITE_ADDR_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 8 CTRL register
    public var CH8_AL3_CTRL: Register<CH8_AL3_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0230), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0230))
          #endif
        }
    }
    public struct CH8_AL3_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH8_AL3_CTRL_Descriptor

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

                    public  typealias Value = CH8_AL3_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 8 WRITE_ADDR register
    public var CH8_AL3_WRITE_ADDR: Register<CH8_AL3_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0234), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0234))
          #endif
        }
    }
    public struct CH8_AL3_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH8_AL3_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH8_AL3_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 8 TRANS_COUNT register
    public var CH8_AL3_TRANS_COUNT: Register<CH8_AL3_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0238), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0238))
          #endif
        }
    }
    public struct CH8_AL3_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH8_AL3_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH8_AL3_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 8 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH8_AL3_READ_ADDR_TRIG: Register<CH8_AL3_READ_ADDR_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x023c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x023c))
          #endif
        }
    }
    public struct CH8_AL3_READ_ADDR_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH8_AL3_READ_ADDR_TRIG_Descriptor

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

                    public  typealias Value = CH8_AL3_READ_ADDR_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 9 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    public var CH9_READ_ADDR: Register<CH9_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0240), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0240))
          #endif
        }
    }
    public struct CH9_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH9_READ_ADDR_Descriptor

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

                    public  typealias Value = CH9_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 9 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    public var CH9_WRITE_ADDR: Register<CH9_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0244), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0244))
          #endif
        }
    }
    public struct CH9_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH9_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH9_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 9 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    public var CH9_TRANS_COUNT: Register<CH9_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0248), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0248))
          #endif
        }
    }
    public struct CH9_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH9_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH9_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 9 Control and Status
    public var CH9_CTRL_TRIG: Register<CH9_CTRL_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x024c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x024c))
          #endif
        }
    }
    public struct CH9_CTRL_TRIG_Descriptor {
        @available(*, unavailable)
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        public var AHB_ERROR: AHB_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        public var READ_ERROR: READ_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        public var WRITE_ERROR: WRITE_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        public var BUSY: BUSY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        public var SNIFF_EN: SNIFF_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        public var BSWAP: BSWAP_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        public var IRQ_QUIET: IRQ_QUIET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        public var TREQ_SEL: TREQ_SEL_Field {
            get {
                fatalError()
            }
        }

        public enum TREQ_SEL_Values: UInt, BitFieldProjectable {
            /// Select Timer 0 as TREQ
            case TREQ_SEL_TIMER0 = 59
            /// Select Timer 1 as TREQ
            case TREQ_SEL_TIMER1 = 60
            /// Select Timer 2 as TREQ (Optional)
            case TREQ_SEL_TIMER2 = 61
            /// Select Timer 3 as TREQ (Optional)
            case TREQ_SEL_TIMER3 = 62
            /// Permanent request, for unpaced transfers.
            case TREQ_SEL_PERMANENT = 63

            public static var bitWidth: Int { 6 }
        }
        @available(*, unavailable)

        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        public var CHAIN_TO: CHAIN_TO_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        public var RING_SEL: RING_SEL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        public var RING_SIZE: RING_SIZE_Field {
            get {
                fatalError()
            }
        }

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }
        @available(*, unavailable)

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        public var INCR_WRITE: INCR_WRITE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        public var INCR_READ: INCR_READ_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        public var DATA_SIZE: DATA_SIZE_Field {
            get {
                fatalError()
            }
        }

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        public var HIGH_PRIORITY: HIGH_PRIORITY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        public var EN: EN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum AHB_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum READ_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum WRITE_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum BUSY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum SNIFF_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum BSWAP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum IRQ_QUIET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum TREQ_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 21
        }

        public enum CHAIN_TO_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 15
        }

        public enum RING_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum RING_SIZE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 10
        }

        public enum INCR_WRITE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum INCR_READ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum DATA_SIZE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 4
        }

        public enum HIGH_PRIORITY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH9_CTRL_TRIG_Descriptor

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
                public var AHB_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                    AHB_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    AHB_ERROR_Field.insert(newValue, into: &self.storage)
                }
                }
              public var READ_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                  READ_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  READ_ERROR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var WRITE_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                  WRITE_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  WRITE_ERROR_Field.insert(newValue, into: &self.storage)
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
              public var SNIFF_EN: UInt32 {
                @inlinable @inline(__always) get {
                  SNIFF_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SNIFF_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BSWAP: UInt32 {
                @inlinable @inline(__always) get {
                  BSWAP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BSWAP_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IRQ_QUIET: UInt32 {
                @inlinable @inline(__always) get {
                  IRQ_QUIET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IRQ_QUIET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TREQ_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  TREQ_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TREQ_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CHAIN_TO: UInt32 {
                @inlinable @inline(__always) get {
                  CHAIN_TO_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CHAIN_TO_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RING_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  RING_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RING_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RING_SIZE: UInt32 {
                @inlinable @inline(__always) get {
                  RING_SIZE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RING_SIZE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INCR_WRITE: UInt32 {
                @inlinable @inline(__always) get {
                  INCR_WRITE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INCR_WRITE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INCR_READ: UInt32 {
                @inlinable @inline(__always) get {
                  INCR_READ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INCR_READ_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DATA_SIZE: UInt32 {
                @inlinable @inline(__always) get {
                  DATA_SIZE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DATA_SIZE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var HIGH_PRIORITY: UInt32 {
                @inlinable @inline(__always) get {
                  HIGH_PRIORITY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HIGH_PRIORITY_Field.insert(newValue, into: &self.storage)
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

                    public  typealias Value = CH9_CTRL_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var AHB_ERROR: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(AHB_ERROR_Field.self, Bool.self)
                    return Bool(storage: self.raw.AHB_ERROR)
                }
                }
              public var READ_ERROR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.READ_ERROR)
                }
              }
              public var WRITE_ERROR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.WRITE_ERROR)
                }
              }
              public var BUSY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUSY_Field.self, Bool.self)
                  return Bool(storage: self.raw.BUSY)
                }
              }
              public var SNIFF_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SNIFF_EN)
                }
              }
              public var BSWAP: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  return Bool(storage: self.raw.BSWAP)
                }
              }
              public var IRQ_QUIET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  return Bool(storage: self.raw.IRQ_QUIET)
                }
              }
              public var TREQ_SEL: TREQ_SEL_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  return TREQ_SEL_Values(storage: self.raw.TREQ_SEL)
                }
              }
              public var CHAIN_TO: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.CHAIN_TO)
                }
              }
              public var RING_SEL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  return Bool(storage: self.raw.RING_SEL)
                }
              }
              public var RING_SIZE: RING_SIZE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  return RING_SIZE_Values(storage: self.raw.RING_SIZE)
                }
              }
              public var INCR_WRITE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_WRITE)
                }
              }
              public var INCR_READ: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_READ)
                }
              }
              public var DATA_SIZE: DATA_SIZE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  return DATA_SIZE_Values(storage: self.raw.DATA_SIZE)
                }
              }
              public var HIGH_PRIORITY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  return Bool(storage: self.raw.HIGH_PRIORITY)
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

                    public  typealias Value = CH9_CTRL_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var READ_ERROR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                    return Bool(storage: self.raw.READ_ERROR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                    self.raw.READ_ERROR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var WRITE_ERROR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.WRITE_ERROR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  self.raw.WRITE_ERROR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SNIFF_EN: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SNIFF_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  self.raw.SNIFF_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BSWAP: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  return Bool(storage: self.raw.BSWAP)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  self.raw.BSWAP = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IRQ_QUIET: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  return Bool(storage: self.raw.IRQ_QUIET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  self.raw.IRQ_QUIET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TREQ_SEL: TREQ_SEL_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  return TREQ_SEL_Values(storage: self.raw.TREQ_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  self.raw.TREQ_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CHAIN_TO: BitField4 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.CHAIN_TO)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  self.raw.CHAIN_TO = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RING_SEL: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  return Bool(storage: self.raw.RING_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  self.raw.RING_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RING_SIZE: RING_SIZE_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  return RING_SIZE_Values(storage: self.raw.RING_SIZE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  self.raw.RING_SIZE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INCR_WRITE: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_WRITE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  self.raw.INCR_WRITE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INCR_READ: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_READ)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  self.raw.INCR_READ = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DATA_SIZE: DATA_SIZE_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  return DATA_SIZE_Values(storage: self.raw.DATA_SIZE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  self.raw.DATA_SIZE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var HIGH_PRIORITY: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  return Bool(storage: self.raw.HIGH_PRIORITY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  self.raw.HIGH_PRIORITY = newValue.storage(Self.Value.Raw.Storage.self)
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

    /// Alias for channel 9 CTRL register
    public var CH9_AL1_CTRL: Register<CH9_AL1_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0250), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0250))
          #endif
        }
    }
    public struct CH9_AL1_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH9_AL1_CTRL_Descriptor

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

                    public  typealias Value = CH9_AL1_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 9 READ_ADDR register
    public var CH9_AL1_READ_ADDR: Register<CH9_AL1_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0254), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0254))
          #endif
        }
    }
    public struct CH9_AL1_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH9_AL1_READ_ADDR_Descriptor

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

                    public  typealias Value = CH9_AL1_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 9 WRITE_ADDR register
    public var CH9_AL1_WRITE_ADDR: Register<CH9_AL1_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0258), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0258))
          #endif
        }
    }
    public struct CH9_AL1_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH9_AL1_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH9_AL1_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 9 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH9_AL1_TRANS_COUNT_TRIG: Register<CH9_AL1_TRANS_COUNT_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x025c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x025c))
          #endif
        }
    }
    public struct CH9_AL1_TRANS_COUNT_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH9_AL1_TRANS_COUNT_TRIG_Descriptor

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

                    public  typealias Value = CH9_AL1_TRANS_COUNT_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 9 CTRL register
    public var CH9_AL2_CTRL: Register<CH9_AL2_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0260), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0260))
          #endif
        }
    }
    public struct CH9_AL2_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH9_AL2_CTRL_Descriptor

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

                    public  typealias Value = CH9_AL2_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 9 TRANS_COUNT register
    public var CH9_AL2_TRANS_COUNT: Register<CH9_AL2_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0264), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0264))
          #endif
        }
    }
    public struct CH9_AL2_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH9_AL2_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH9_AL2_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 9 READ_ADDR register
    public var CH9_AL2_READ_ADDR: Register<CH9_AL2_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0268), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0268))
          #endif
        }
    }
    public struct CH9_AL2_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH9_AL2_READ_ADDR_Descriptor

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

                    public  typealias Value = CH9_AL2_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 9 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH9_AL2_WRITE_ADDR_TRIG: Register<CH9_AL2_WRITE_ADDR_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x026c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x026c))
          #endif
        }
    }
    public struct CH9_AL2_WRITE_ADDR_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH9_AL2_WRITE_ADDR_TRIG_Descriptor

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

                    public  typealias Value = CH9_AL2_WRITE_ADDR_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 9 CTRL register
    public var CH9_AL3_CTRL: Register<CH9_AL3_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0270), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0270))
          #endif
        }
    }
    public struct CH9_AL3_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH9_AL3_CTRL_Descriptor

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

                    public  typealias Value = CH9_AL3_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 9 WRITE_ADDR register
    public var CH9_AL3_WRITE_ADDR: Register<CH9_AL3_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0274), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0274))
          #endif
        }
    }
    public struct CH9_AL3_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH9_AL3_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH9_AL3_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 9 TRANS_COUNT register
    public var CH9_AL3_TRANS_COUNT: Register<CH9_AL3_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0278), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0278))
          #endif
        }
    }
    public struct CH9_AL3_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH9_AL3_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH9_AL3_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 9 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH9_AL3_READ_ADDR_TRIG: Register<CH9_AL3_READ_ADDR_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x027c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x027c))
          #endif
        }
    }
    public struct CH9_AL3_READ_ADDR_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH9_AL3_READ_ADDR_TRIG_Descriptor

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

                    public  typealias Value = CH9_AL3_READ_ADDR_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 10 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    public var CH10_READ_ADDR: Register<CH10_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0280), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0280))
          #endif
        }
    }
    public struct CH10_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH10_READ_ADDR_Descriptor

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

                    public  typealias Value = CH10_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 10 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    public var CH10_WRITE_ADDR: Register<CH10_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0284), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0284))
          #endif
        }
    }
    public struct CH10_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH10_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH10_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 10 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    public var CH10_TRANS_COUNT: Register<CH10_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0288), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0288))
          #endif
        }
    }
    public struct CH10_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH10_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH10_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 10 Control and Status
    public var CH10_CTRL_TRIG: Register<CH10_CTRL_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x028c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x028c))
          #endif
        }
    }
    public struct CH10_CTRL_TRIG_Descriptor {
        @available(*, unavailable)
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        public var AHB_ERROR: AHB_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        public var READ_ERROR: READ_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        public var WRITE_ERROR: WRITE_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        public var BUSY: BUSY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        public var SNIFF_EN: SNIFF_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        public var BSWAP: BSWAP_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        public var IRQ_QUIET: IRQ_QUIET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        public var TREQ_SEL: TREQ_SEL_Field {
            get {
                fatalError()
            }
        }

        public enum TREQ_SEL_Values: UInt, BitFieldProjectable {
            /// Select Timer 0 as TREQ
            case TREQ_SEL_TIMER0 = 59
            /// Select Timer 1 as TREQ
            case TREQ_SEL_TIMER1 = 60
            /// Select Timer 2 as TREQ (Optional)
            case TREQ_SEL_TIMER2 = 61
            /// Select Timer 3 as TREQ (Optional)
            case TREQ_SEL_TIMER3 = 62
            /// Permanent request, for unpaced transfers.
            case TREQ_SEL_PERMANENT = 63

            public static var bitWidth: Int { 6 }
        }
        @available(*, unavailable)

        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        public var CHAIN_TO: CHAIN_TO_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        public var RING_SEL: RING_SEL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        public var RING_SIZE: RING_SIZE_Field {
            get {
                fatalError()
            }
        }

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }
        @available(*, unavailable)

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        public var INCR_WRITE: INCR_WRITE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        public var INCR_READ: INCR_READ_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        public var DATA_SIZE: DATA_SIZE_Field {
            get {
                fatalError()
            }
        }

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        public var HIGH_PRIORITY: HIGH_PRIORITY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        public var EN: EN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum AHB_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum READ_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum WRITE_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum BUSY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum SNIFF_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum BSWAP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum IRQ_QUIET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum TREQ_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 21
        }

        public enum CHAIN_TO_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 15
        }

        public enum RING_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum RING_SIZE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 10
        }

        public enum INCR_WRITE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum INCR_READ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum DATA_SIZE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 4
        }

        public enum HIGH_PRIORITY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH10_CTRL_TRIG_Descriptor

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
                public var AHB_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                    AHB_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    AHB_ERROR_Field.insert(newValue, into: &self.storage)
                }
                }
              public var READ_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                  READ_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  READ_ERROR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var WRITE_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                  WRITE_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  WRITE_ERROR_Field.insert(newValue, into: &self.storage)
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
              public var SNIFF_EN: UInt32 {
                @inlinable @inline(__always) get {
                  SNIFF_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SNIFF_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BSWAP: UInt32 {
                @inlinable @inline(__always) get {
                  BSWAP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BSWAP_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IRQ_QUIET: UInt32 {
                @inlinable @inline(__always) get {
                  IRQ_QUIET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IRQ_QUIET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TREQ_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  TREQ_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TREQ_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CHAIN_TO: UInt32 {
                @inlinable @inline(__always) get {
                  CHAIN_TO_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CHAIN_TO_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RING_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  RING_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RING_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RING_SIZE: UInt32 {
                @inlinable @inline(__always) get {
                  RING_SIZE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RING_SIZE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INCR_WRITE: UInt32 {
                @inlinable @inline(__always) get {
                  INCR_WRITE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INCR_WRITE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INCR_READ: UInt32 {
                @inlinable @inline(__always) get {
                  INCR_READ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INCR_READ_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DATA_SIZE: UInt32 {
                @inlinable @inline(__always) get {
                  DATA_SIZE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DATA_SIZE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var HIGH_PRIORITY: UInt32 {
                @inlinable @inline(__always) get {
                  HIGH_PRIORITY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HIGH_PRIORITY_Field.insert(newValue, into: &self.storage)
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

                    public  typealias Value = CH10_CTRL_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var AHB_ERROR: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(AHB_ERROR_Field.self, Bool.self)
                    return Bool(storage: self.raw.AHB_ERROR)
                }
                }
              public var READ_ERROR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.READ_ERROR)
                }
              }
              public var WRITE_ERROR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.WRITE_ERROR)
                }
              }
              public var BUSY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUSY_Field.self, Bool.self)
                  return Bool(storage: self.raw.BUSY)
                }
              }
              public var SNIFF_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SNIFF_EN)
                }
              }
              public var BSWAP: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  return Bool(storage: self.raw.BSWAP)
                }
              }
              public var IRQ_QUIET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  return Bool(storage: self.raw.IRQ_QUIET)
                }
              }
              public var TREQ_SEL: TREQ_SEL_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  return TREQ_SEL_Values(storage: self.raw.TREQ_SEL)
                }
              }
              public var CHAIN_TO: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.CHAIN_TO)
                }
              }
              public var RING_SEL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  return Bool(storage: self.raw.RING_SEL)
                }
              }
              public var RING_SIZE: RING_SIZE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  return RING_SIZE_Values(storage: self.raw.RING_SIZE)
                }
              }
              public var INCR_WRITE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_WRITE)
                }
              }
              public var INCR_READ: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_READ)
                }
              }
              public var DATA_SIZE: DATA_SIZE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  return DATA_SIZE_Values(storage: self.raw.DATA_SIZE)
                }
              }
              public var HIGH_PRIORITY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  return Bool(storage: self.raw.HIGH_PRIORITY)
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

                    public  typealias Value = CH10_CTRL_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var READ_ERROR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                    return Bool(storage: self.raw.READ_ERROR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                    self.raw.READ_ERROR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var WRITE_ERROR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.WRITE_ERROR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  self.raw.WRITE_ERROR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SNIFF_EN: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SNIFF_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  self.raw.SNIFF_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BSWAP: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  return Bool(storage: self.raw.BSWAP)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  self.raw.BSWAP = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IRQ_QUIET: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  return Bool(storage: self.raw.IRQ_QUIET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  self.raw.IRQ_QUIET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TREQ_SEL: TREQ_SEL_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  return TREQ_SEL_Values(storage: self.raw.TREQ_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  self.raw.TREQ_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CHAIN_TO: BitField4 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.CHAIN_TO)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  self.raw.CHAIN_TO = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RING_SEL: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  return Bool(storage: self.raw.RING_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  self.raw.RING_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RING_SIZE: RING_SIZE_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  return RING_SIZE_Values(storage: self.raw.RING_SIZE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  self.raw.RING_SIZE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INCR_WRITE: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_WRITE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  self.raw.INCR_WRITE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INCR_READ: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_READ)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  self.raw.INCR_READ = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DATA_SIZE: DATA_SIZE_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  return DATA_SIZE_Values(storage: self.raw.DATA_SIZE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  self.raw.DATA_SIZE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var HIGH_PRIORITY: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  return Bool(storage: self.raw.HIGH_PRIORITY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  self.raw.HIGH_PRIORITY = newValue.storage(Self.Value.Raw.Storage.self)
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

    /// Alias for channel 10 CTRL register
    public var CH10_AL1_CTRL: Register<CH10_AL1_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0290), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0290))
          #endif
        }
    }
    public struct CH10_AL1_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH10_AL1_CTRL_Descriptor

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

                    public  typealias Value = CH10_AL1_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 10 READ_ADDR register
    public var CH10_AL1_READ_ADDR: Register<CH10_AL1_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0294), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0294))
          #endif
        }
    }
    public struct CH10_AL1_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH10_AL1_READ_ADDR_Descriptor

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

                    public  typealias Value = CH10_AL1_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 10 WRITE_ADDR register
    public var CH10_AL1_WRITE_ADDR: Register<CH10_AL1_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0298), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0298))
          #endif
        }
    }
    public struct CH10_AL1_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH10_AL1_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH10_AL1_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 10 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH10_AL1_TRANS_COUNT_TRIG: Register<CH10_AL1_TRANS_COUNT_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x029c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x029c))
          #endif
        }
    }
    public struct CH10_AL1_TRANS_COUNT_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH10_AL1_TRANS_COUNT_TRIG_Descriptor

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

                    public  typealias Value = CH10_AL1_TRANS_COUNT_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 10 CTRL register
    public var CH10_AL2_CTRL: Register<CH10_AL2_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x02a0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x02a0))
          #endif
        }
    }
    public struct CH10_AL2_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH10_AL2_CTRL_Descriptor

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

                    public  typealias Value = CH10_AL2_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 10 TRANS_COUNT register
    public var CH10_AL2_TRANS_COUNT: Register<CH10_AL2_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x02a4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x02a4))
          #endif
        }
    }
    public struct CH10_AL2_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH10_AL2_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH10_AL2_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 10 READ_ADDR register
    public var CH10_AL2_READ_ADDR: Register<CH10_AL2_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x02a8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x02a8))
          #endif
        }
    }
    public struct CH10_AL2_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH10_AL2_READ_ADDR_Descriptor

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

                    public  typealias Value = CH10_AL2_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 10 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH10_AL2_WRITE_ADDR_TRIG: Register<CH10_AL2_WRITE_ADDR_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x02ac), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x02ac))
          #endif
        }
    }
    public struct CH10_AL2_WRITE_ADDR_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH10_AL2_WRITE_ADDR_TRIG_Descriptor

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

                    public  typealias Value = CH10_AL2_WRITE_ADDR_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 10 CTRL register
    public var CH10_AL3_CTRL: Register<CH10_AL3_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x02b0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x02b0))
          #endif
        }
    }
    public struct CH10_AL3_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH10_AL3_CTRL_Descriptor

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

                    public  typealias Value = CH10_AL3_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 10 WRITE_ADDR register
    public var CH10_AL3_WRITE_ADDR: Register<CH10_AL3_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x02b4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x02b4))
          #endif
        }
    }
    public struct CH10_AL3_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH10_AL3_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH10_AL3_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 10 TRANS_COUNT register
    public var CH10_AL3_TRANS_COUNT: Register<CH10_AL3_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x02b8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x02b8))
          #endif
        }
    }
    public struct CH10_AL3_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH10_AL3_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH10_AL3_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 10 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH10_AL3_READ_ADDR_TRIG: Register<CH10_AL3_READ_ADDR_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x02bc), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x02bc))
          #endif
        }
    }
    public struct CH10_AL3_READ_ADDR_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH10_AL3_READ_ADDR_TRIG_Descriptor

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

                    public  typealias Value = CH10_AL3_READ_ADDR_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 11 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    public var CH11_READ_ADDR: Register<CH11_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x02c0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x02c0))
          #endif
        }
    }
    public struct CH11_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH11_READ_ADDR_Descriptor

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

                    public  typealias Value = CH11_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 11 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    public var CH11_WRITE_ADDR: Register<CH11_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x02c4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x02c4))
          #endif
        }
    }
    public struct CH11_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH11_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH11_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 11 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    public var CH11_TRANS_COUNT: Register<CH11_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x02c8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x02c8))
          #endif
        }
    }
    public struct CH11_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH11_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH11_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// DMA Channel 11 Control and Status
    public var CH11_CTRL_TRIG: Register<CH11_CTRL_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x02cc), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x02cc))
          #endif
        }
    }
    public struct CH11_CTRL_TRIG_Descriptor {
        @available(*, unavailable)
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        public var AHB_ERROR: AHB_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        public var READ_ERROR: READ_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        public var WRITE_ERROR: WRITE_ERROR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        public var BUSY: BUSY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        public var SNIFF_EN: SNIFF_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        public var BSWAP: BSWAP_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        public var IRQ_QUIET: IRQ_QUIET_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        public var TREQ_SEL: TREQ_SEL_Field {
            get {
                fatalError()
            }
        }

        public enum TREQ_SEL_Values: UInt, BitFieldProjectable {
            /// Select Timer 0 as TREQ
            case TREQ_SEL_TIMER0 = 59
            /// Select Timer 1 as TREQ
            case TREQ_SEL_TIMER1 = 60
            /// Select Timer 2 as TREQ (Optional)
            case TREQ_SEL_TIMER2 = 61
            /// Select Timer 3 as TREQ (Optional)
            case TREQ_SEL_TIMER3 = 62
            /// Permanent request, for unpaced transfers.
            case TREQ_SEL_PERMANENT = 63

            public static var bitWidth: Int { 6 }
        }
        @available(*, unavailable)

        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        public var CHAIN_TO: CHAIN_TO_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        public var RING_SEL: RING_SEL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        public var RING_SIZE: RING_SIZE_Field {
            get {
                fatalError()
            }
        }

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }
        @available(*, unavailable)

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        public var INCR_WRITE: INCR_WRITE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        public var INCR_READ: INCR_READ_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        public var DATA_SIZE: DATA_SIZE_Field {
            get {
                fatalError()
            }
        }

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        public var HIGH_PRIORITY: HIGH_PRIORITY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        public var EN: EN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum AHB_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum READ_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum WRITE_ERROR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum BUSY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum SNIFF_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum BSWAP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum IRQ_QUIET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum TREQ_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 21
        }

        public enum CHAIN_TO_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 15
        }

        public enum RING_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum RING_SIZE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 10
        }

        public enum INCR_WRITE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum INCR_READ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum DATA_SIZE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 4
        }

        public enum HIGH_PRIORITY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH11_CTRL_TRIG_Descriptor

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
                public var AHB_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                    AHB_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    AHB_ERROR_Field.insert(newValue, into: &self.storage)
                }
                }
              public var READ_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                  READ_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  READ_ERROR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var WRITE_ERROR: UInt32 {
                @inlinable @inline(__always) get {
                  WRITE_ERROR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  WRITE_ERROR_Field.insert(newValue, into: &self.storage)
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
              public var SNIFF_EN: UInt32 {
                @inlinable @inline(__always) get {
                  SNIFF_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SNIFF_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BSWAP: UInt32 {
                @inlinable @inline(__always) get {
                  BSWAP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BSWAP_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IRQ_QUIET: UInt32 {
                @inlinable @inline(__always) get {
                  IRQ_QUIET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IRQ_QUIET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TREQ_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  TREQ_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TREQ_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CHAIN_TO: UInt32 {
                @inlinable @inline(__always) get {
                  CHAIN_TO_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CHAIN_TO_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RING_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  RING_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RING_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RING_SIZE: UInt32 {
                @inlinable @inline(__always) get {
                  RING_SIZE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RING_SIZE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INCR_WRITE: UInt32 {
                @inlinable @inline(__always) get {
                  INCR_WRITE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INCR_WRITE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INCR_READ: UInt32 {
                @inlinable @inline(__always) get {
                  INCR_READ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INCR_READ_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DATA_SIZE: UInt32 {
                @inlinable @inline(__always) get {
                  DATA_SIZE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DATA_SIZE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var HIGH_PRIORITY: UInt32 {
                @inlinable @inline(__always) get {
                  HIGH_PRIORITY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HIGH_PRIORITY_Field.insert(newValue, into: &self.storage)
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

                    public  typealias Value = CH11_CTRL_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var AHB_ERROR: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(AHB_ERROR_Field.self, Bool.self)
                    return Bool(storage: self.raw.AHB_ERROR)
                }
                }
              public var READ_ERROR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.READ_ERROR)
                }
              }
              public var WRITE_ERROR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.WRITE_ERROR)
                }
              }
              public var BUSY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BUSY_Field.self, Bool.self)
                  return Bool(storage: self.raw.BUSY)
                }
              }
              public var SNIFF_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SNIFF_EN)
                }
              }
              public var BSWAP: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  return Bool(storage: self.raw.BSWAP)
                }
              }
              public var IRQ_QUIET: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  return Bool(storage: self.raw.IRQ_QUIET)
                }
              }
              public var TREQ_SEL: TREQ_SEL_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  return TREQ_SEL_Values(storage: self.raw.TREQ_SEL)
                }
              }
              public var CHAIN_TO: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.CHAIN_TO)
                }
              }
              public var RING_SEL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  return Bool(storage: self.raw.RING_SEL)
                }
              }
              public var RING_SIZE: RING_SIZE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  return RING_SIZE_Values(storage: self.raw.RING_SIZE)
                }
              }
              public var INCR_WRITE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_WRITE)
                }
              }
              public var INCR_READ: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_READ)
                }
              }
              public var DATA_SIZE: DATA_SIZE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  return DATA_SIZE_Values(storage: self.raw.DATA_SIZE)
                }
              }
              public var HIGH_PRIORITY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  return Bool(storage: self.raw.HIGH_PRIORITY)
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

                    public  typealias Value = CH11_CTRL_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var READ_ERROR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                    return Bool(storage: self.raw.READ_ERROR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(READ_ERROR_Field.self, Bool.self)
                    self.raw.READ_ERROR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var WRITE_ERROR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  return Bool(storage: self.raw.WRITE_ERROR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(WRITE_ERROR_Field.self, Bool.self)
                  self.raw.WRITE_ERROR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SNIFF_EN: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SNIFF_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SNIFF_EN_Field.self, Bool.self)
                  self.raw.SNIFF_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BSWAP: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  return Bool(storage: self.raw.BSWAP)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  self.raw.BSWAP = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IRQ_QUIET: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  return Bool(storage: self.raw.IRQ_QUIET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IRQ_QUIET_Field.self, Bool.self)
                  self.raw.IRQ_QUIET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var TREQ_SEL: TREQ_SEL_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  return TREQ_SEL_Values(storage: self.raw.TREQ_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TREQ_SEL_Field.self, TREQ_SEL_Values.self)
                  self.raw.TREQ_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CHAIN_TO: BitField4 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.CHAIN_TO)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CHAIN_TO_Field.self, BitField4.self)
                  self.raw.CHAIN_TO = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RING_SEL: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  return Bool(storage: self.raw.RING_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RING_SEL_Field.self, Bool.self)
                  self.raw.RING_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RING_SIZE: RING_SIZE_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  return RING_SIZE_Values(storage: self.raw.RING_SIZE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RING_SIZE_Field.self, RING_SIZE_Values.self)
                  self.raw.RING_SIZE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INCR_WRITE: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_WRITE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INCR_WRITE_Field.self, Bool.self)
                  self.raw.INCR_WRITE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INCR_READ: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  return Bool(storage: self.raw.INCR_READ)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INCR_READ_Field.self, Bool.self)
                  self.raw.INCR_READ = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DATA_SIZE: DATA_SIZE_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  return DATA_SIZE_Values(storage: self.raw.DATA_SIZE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DATA_SIZE_Field.self, DATA_SIZE_Values.self)
                  self.raw.DATA_SIZE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var HIGH_PRIORITY: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  return Bool(storage: self.raw.HIGH_PRIORITY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(HIGH_PRIORITY_Field.self, Bool.self)
                  self.raw.HIGH_PRIORITY = newValue.storage(Self.Value.Raw.Storage.self)
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

    /// Alias for channel 11 CTRL register
    public var CH11_AL1_CTRL: Register<CH11_AL1_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x02d0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x02d0))
          #endif
        }
    }
    public struct CH11_AL1_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH11_AL1_CTRL_Descriptor

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

                    public  typealias Value = CH11_AL1_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 11 READ_ADDR register
    public var CH11_AL1_READ_ADDR: Register<CH11_AL1_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x02d4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x02d4))
          #endif
        }
    }
    public struct CH11_AL1_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH11_AL1_READ_ADDR_Descriptor

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

                    public  typealias Value = CH11_AL1_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 11 WRITE_ADDR register
    public var CH11_AL1_WRITE_ADDR: Register<CH11_AL1_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x02d8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x02d8))
          #endif
        }
    }
    public struct CH11_AL1_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH11_AL1_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH11_AL1_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 11 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH11_AL1_TRANS_COUNT_TRIG: Register<CH11_AL1_TRANS_COUNT_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x02dc), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x02dc))
          #endif
        }
    }
    public struct CH11_AL1_TRANS_COUNT_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH11_AL1_TRANS_COUNT_TRIG_Descriptor

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

                    public  typealias Value = CH11_AL1_TRANS_COUNT_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 11 CTRL register
    public var CH11_AL2_CTRL: Register<CH11_AL2_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x02e0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x02e0))
          #endif
        }
    }
    public struct CH11_AL2_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH11_AL2_CTRL_Descriptor

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

                    public  typealias Value = CH11_AL2_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 11 TRANS_COUNT register
    public var CH11_AL2_TRANS_COUNT: Register<CH11_AL2_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x02e4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x02e4))
          #endif
        }
    }
    public struct CH11_AL2_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH11_AL2_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH11_AL2_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 11 READ_ADDR register
    public var CH11_AL2_READ_ADDR: Register<CH11_AL2_READ_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x02e8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x02e8))
          #endif
        }
    }
    public struct CH11_AL2_READ_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH11_AL2_READ_ADDR_Descriptor

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

                    public  typealias Value = CH11_AL2_READ_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 11 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH11_AL2_WRITE_ADDR_TRIG: Register<CH11_AL2_WRITE_ADDR_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x02ec), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x02ec))
          #endif
        }
    }
    public struct CH11_AL2_WRITE_ADDR_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH11_AL2_WRITE_ADDR_TRIG_Descriptor

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

                    public  typealias Value = CH11_AL2_WRITE_ADDR_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 11 CTRL register
    public var CH11_AL3_CTRL: Register<CH11_AL3_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x02f0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x02f0))
          #endif
        }
    }
    public struct CH11_AL3_CTRL_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH11_AL3_CTRL_Descriptor

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

                    public  typealias Value = CH11_AL3_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 11 WRITE_ADDR register
    public var CH11_AL3_WRITE_ADDR: Register<CH11_AL3_WRITE_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x02f4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x02f4))
          #endif
        }
    }
    public struct CH11_AL3_WRITE_ADDR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH11_AL3_WRITE_ADDR_Descriptor

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

                    public  typealias Value = CH11_AL3_WRITE_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 11 TRANS_COUNT register
    public var CH11_AL3_TRANS_COUNT: Register<CH11_AL3_TRANS_COUNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x02f8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x02f8))
          #endif
        }
    }
    public struct CH11_AL3_TRANS_COUNT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH11_AL3_TRANS_COUNT_Descriptor

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

                    public  typealias Value = CH11_AL3_TRANS_COUNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Alias for channel 11 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    public var CH11_AL3_READ_ADDR_TRIG: Register<CH11_AL3_READ_ADDR_TRIG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x02fc), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x02fc))
          #endif
        }
    }
    public struct CH11_AL3_READ_ADDR_TRIG_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH11_AL3_READ_ADDR_TRIG_Descriptor

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

                    public  typealias Value = CH11_AL3_READ_ADDR_TRIG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Interrupt Status (raw)
    public var INTR: Register<INTR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0400), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0400))
          #endif
        }
    }
    public struct INTR_Descriptor {
        @available(*, unavailable)
        /// Raw interrupt status for DMA Channels 0..15. Bit n corresponds to channel n. Ignores any masking or forcing. Channel interrupts can be cleared by writing a bit mask to INTR, INTS0 or INTS1.
        /// Channel interrupts can be routed to either of two system-level IRQs based on INTE0 and INTE1.
        /// This can be used vector different channel interrupts to different ISRs: this might be done to allow NVIC IRQ preemption for more time-critical channels, or to spread IRQ load across different cores.
        /// It is also valid to ignore this behaviour and just use INTE0/INTS0/IRQ 0.
        public var INTR: INTR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INTR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
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
                public var INTR: UInt32 {
                @inlinable @inline(__always) get {
                    INTR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INTR_Field.insert(newValue, into: &self.storage)
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
                public var INTR: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INTR_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INTR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INTR_Field.self, BitField16.self)
                    self.raw.INTR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Interrupt Enables for IRQ 0
    public var INTE0: Register<INTE0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0404), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0404))
          #endif
        }
    }
    public struct INTE0_Descriptor {
        @available(*, unavailable)
        /// Set bit n to pass interrupts from channel n to DMA IRQ 0.
        public var INTE0: INTE0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INTE0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTE0_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INTE0: UInt32 {
                @inlinable @inline(__always) get {
                    INTE0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INTE0_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = INTE0_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INTE0: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INTE0_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INTE0)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INTE0_Field.self, BitField16.self)
                    self.raw.INTE0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Force Interrupts
    public var INTF0: Register<INTF0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0408), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0408))
          #endif
        }
    }
    public struct INTF0_Descriptor {
        @available(*, unavailable)
        /// Write 1s to force the corresponding bits in INTE0. The interrupt remains asserted until INTF0 is cleared.
        public var INTF0: INTF0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INTF0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTF0_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INTF0: UInt32 {
                @inlinable @inline(__always) get {
                    INTF0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INTF0_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = INTF0_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INTF0: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INTF0_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INTF0)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INTF0_Field.self, BitField16.self)
                    self.raw.INTF0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Interrupt Status for IRQ 0
    public var INTS0: Register<INTS0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x040c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x040c))
          #endif
        }
    }
    public struct INTS0_Descriptor {
        @available(*, unavailable)
        /// Indicates active channel interrupt requests which are currently causing IRQ 0 to be asserted.
        /// Channel interrupts can be cleared by writing a bit mask here.
        public var INTS0: INTS0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INTS0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTS0_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INTS0: UInt32 {
                @inlinable @inline(__always) get {
                    INTS0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INTS0_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = INTS0_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INTS0: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INTS0_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INTS0)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INTS0_Field.self, BitField16.self)
                    self.raw.INTS0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Interrupt Enables for IRQ 1
    public var INTE1: Register<INTE1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0414), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0414))
          #endif
        }
    }
    public struct INTE1_Descriptor {
        @available(*, unavailable)
        /// Set bit n to pass interrupts from channel n to DMA IRQ 1.
        public var INTE1: INTE1_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INTE1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTE1_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INTE1: UInt32 {
                @inlinable @inline(__always) get {
                    INTE1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INTE1_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = INTE1_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INTE1: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INTE1_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INTE1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INTE1_Field.self, BitField16.self)
                    self.raw.INTE1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Force Interrupts for IRQ 1
    public var INTF1: Register<INTF1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0418), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0418))
          #endif
        }
    }
    public struct INTF1_Descriptor {
        @available(*, unavailable)
        /// Write 1s to force the corresponding bits in INTE0. The interrupt remains asserted until INTF0 is cleared.
        public var INTF1: INTF1_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INTF1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTF1_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INTF1: UInt32 {
                @inlinable @inline(__always) get {
                    INTF1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INTF1_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = INTF1_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INTF1: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INTF1_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INTF1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INTF1_Field.self, BitField16.self)
                    self.raw.INTF1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Interrupt Status (masked) for IRQ 1
    public var INTS1: Register<INTS1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x041c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x041c))
          #endif
        }
    }
    public struct INTS1_Descriptor {
        @available(*, unavailable)
        /// Indicates active channel interrupt requests which are currently causing IRQ 1 to be asserted.
        /// Channel interrupts can be cleared by writing a bit mask here.
        public var INTS1: INTS1_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INTS1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INTS1_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var INTS1: UInt32 {
                @inlinable @inline(__always) get {
                    INTS1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INTS1_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = INTS1_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var INTS1: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INTS1_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INTS1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INTS1_Field.self, BitField16.self)
                    self.raw.INTS1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Pacing (X/Y) Fractional Timer
    /// The pacing timer produces TREQ assertions at a rate set by ((X/Y) * sys_clk). This equation is evaluated every sys_clk cycles and therefore can only generate TREQs at a rate of 1 per sys_clk (i.e. permanent TREQ) or less.
    public var TIMER0: Register<TIMER0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0420), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0420))
          #endif
        }
    }
    public struct TIMER0_Descriptor {
        @available(*, unavailable)
        /// Pacing Timer Dividend. Specifies the X value for the (X/Y) fractional timer.
        public var X: X_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Pacing Timer Divisor. Specifies the Y value for the (X/Y) fractional timer.
        public var Y: Y_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum X_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 32
        }

        public enum Y_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = TIMER0_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var X: UInt32 {
                @inlinable @inline(__always) get {
                    X_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    X_Field.insert(newValue, into: &self.storage)
                }
                }
              public var Y: UInt32 {
                @inlinable @inline(__always) get {
                  Y_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  Y_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = TIMER0_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var X: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(X_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.X)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(X_Field.self, BitField16.self)
                    self.raw.X = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var Y: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(Y_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.Y)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(Y_Field.self, BitField16.self)
                  self.raw.Y = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Pacing (X/Y) Fractional Timer
    /// The pacing timer produces TREQ assertions at a rate set by ((X/Y) * sys_clk). This equation is evaluated every sys_clk cycles and therefore can only generate TREQs at a rate of 1 per sys_clk (i.e. permanent TREQ) or less.
    public var TIMER1: Register<TIMER1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0424), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0424))
          #endif
        }
    }
    public struct TIMER1_Descriptor {
        @available(*, unavailable)
        /// Pacing Timer Dividend. Specifies the X value for the (X/Y) fractional timer.
        public var X: X_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Pacing Timer Divisor. Specifies the Y value for the (X/Y) fractional timer.
        public var Y: Y_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum X_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 32
        }

        public enum Y_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = TIMER1_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var X: UInt32 {
                @inlinable @inline(__always) get {
                    X_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    X_Field.insert(newValue, into: &self.storage)
                }
                }
              public var Y: UInt32 {
                @inlinable @inline(__always) get {
                  Y_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  Y_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = TIMER1_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var X: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(X_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.X)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(X_Field.self, BitField16.self)
                    self.raw.X = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var Y: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(Y_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.Y)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(Y_Field.self, BitField16.self)
                  self.raw.Y = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Pacing (X/Y) Fractional Timer
    /// The pacing timer produces TREQ assertions at a rate set by ((X/Y) * sys_clk). This equation is evaluated every sys_clk cycles and therefore can only generate TREQs at a rate of 1 per sys_clk (i.e. permanent TREQ) or less.
    public var TIMER2: Register<TIMER2_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0428), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0428))
          #endif
        }
    }
    public struct TIMER2_Descriptor {
        @available(*, unavailable)
        /// Pacing Timer Dividend. Specifies the X value for the (X/Y) fractional timer.
        public var X: X_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Pacing Timer Divisor. Specifies the Y value for the (X/Y) fractional timer.
        public var Y: Y_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum X_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 32
        }

        public enum Y_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = TIMER2_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var X: UInt32 {
                @inlinable @inline(__always) get {
                    X_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    X_Field.insert(newValue, into: &self.storage)
                }
                }
              public var Y: UInt32 {
                @inlinable @inline(__always) get {
                  Y_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  Y_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = TIMER2_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var X: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(X_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.X)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(X_Field.self, BitField16.self)
                    self.raw.X = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var Y: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(Y_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.Y)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(Y_Field.self, BitField16.self)
                  self.raw.Y = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Pacing (X/Y) Fractional Timer
    /// The pacing timer produces TREQ assertions at a rate set by ((X/Y) * sys_clk). This equation is evaluated every sys_clk cycles and therefore can only generate TREQs at a rate of 1 per sys_clk (i.e. permanent TREQ) or less.
    public var TIMER3: Register<TIMER3_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x042c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x042c))
          #endif
        }
    }
    public struct TIMER3_Descriptor {
        @available(*, unavailable)
        /// Pacing Timer Dividend. Specifies the X value for the (X/Y) fractional timer.
        public var X: X_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Pacing Timer Divisor. Specifies the Y value for the (X/Y) fractional timer.
        public var Y: Y_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum X_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 32
        }

        public enum Y_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = TIMER3_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var X: UInt32 {
                @inlinable @inline(__always) get {
                    X_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    X_Field.insert(newValue, into: &self.storage)
                }
                }
              public var Y: UInt32 {
                @inlinable @inline(__always) get {
                  Y_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  Y_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = TIMER3_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var X: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(X_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.X)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(X_Field.self, BitField16.self)
                    self.raw.X = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var Y: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(Y_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.Y)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(Y_Field.self, BitField16.self)
                  self.raw.Y = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Trigger one or more channels simultaneously
    public var MULTI_CHAN_TRIGGER: Register<MULTI_CHAN_TRIGGER_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0430), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0430))
          #endif
        }
    }
    public struct MULTI_CHAN_TRIGGER_Descriptor {
        @available(*, unavailable)
        /// Each bit in this register corresponds to a DMA channel. Writing a 1 to the relevant bit is the same as writing to that channel's trigger register; the channel will start if it is currently enabled and not already busy.
        public var MULTI_CHAN_TRIGGER: MULTI_CHAN_TRIGGER_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum MULTI_CHAN_TRIGGER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = MULTI_CHAN_TRIGGER_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var MULTI_CHAN_TRIGGER: UInt32 {
                @inlinable @inline(__always) get {
                    MULTI_CHAN_TRIGGER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    MULTI_CHAN_TRIGGER_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = MULTI_CHAN_TRIGGER_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var MULTI_CHAN_TRIGGER: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(MULTI_CHAN_TRIGGER_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.MULTI_CHAN_TRIGGER)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(MULTI_CHAN_TRIGGER_Field.self, BitField16.self)
                    self.raw.MULTI_CHAN_TRIGGER = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Sniffer Control
    public var SNIFF_CTRL: Register<SNIFF_CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0434), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0434))
          #endif
        }
    }
    public struct SNIFF_CTRL_Descriptor {
        @available(*, unavailable)
        /// If set, the result appears inverted (bitwise complement) when read. This does not affect the way the checksum is calculated; the result is transformed on-the-fly between the result register and the bus.
        public var OUT_INV: OUT_INV_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If set, the result appears bit-reversed when read. This does not affect the way the checksum is calculated; the result is transformed on-the-fly between the result register and the bus.
        public var OUT_REV: OUT_REV_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Locally perform a byte reverse on the sniffed data, before feeding into checksum.
        /// Note that the sniff hardware is downstream of the DMA channel byteswap performed in the read master: if channel CTRL_BSWAP and SNIFF_CTRL_BSWAP are both enabled, their effects cancel from the sniffer's point of view.
        public var BSWAP: BSWAP_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var CALC: CALC_Field {
            get {
                fatalError()
            }
        }

        public enum CALC_Values: UInt, BitFieldProjectable {
            /// Calculate a CRC-32 (IEEE802.3 polynomial)
            case CALC_CRC32 = 0
            /// Calculate a CRC-32 (IEEE802.3 polynomial) with bit reversed data
            case CALC_CRC32R = 1
            /// Calculate a CRC-16-CCITT
            case CALC_CRC16 = 2
            /// Calculate a CRC-16-CCITT with bit reversed data
            case CALC_CRC16R = 3
            /// XOR reduction over all data. == 1 if the total 1 population count is odd.
            case CALC_EVEN = 14
            /// Calculate a simple 32-bit checksum (addition with a 32 bit accumulator)
            case CALC_SUM = 15

            public static var bitWidth: Int { 4 }
        }
        @available(*, unavailable)

        /// DMA channel for Sniffer to observe
        public var DMACH: DMACH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enable sniffer
        public var EN: EN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum OUT_INV_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum OUT_REV_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum BSWAP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum CALC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 9
        }

        public enum DMACH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 5
        }

        public enum EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SNIFF_CTRL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var OUT_INV: UInt32 {
                @inlinable @inline(__always) get {
                    OUT_INV_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    OUT_INV_Field.insert(newValue, into: &self.storage)
                }
                }
              public var OUT_REV: UInt32 {
                @inlinable @inline(__always) get {
                  OUT_REV_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUT_REV_Field.insert(newValue, into: &self.storage)
                }
              }
              public var BSWAP: UInt32 {
                @inlinable @inline(__always) get {
                  BSWAP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  BSWAP_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CALC: UInt32 {
                @inlinable @inline(__always) get {
                  CALC_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CALC_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DMACH: UInt32 {
                @inlinable @inline(__always) get {
                  DMACH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DMACH_Field.insert(newValue, into: &self.storage)
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

                    public  typealias Value = SNIFF_CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var OUT_INV: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(OUT_INV_Field.self, Bool.self)
                    return Bool(storage: self.raw.OUT_INV)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(OUT_INV_Field.self, Bool.self)
                    self.raw.OUT_INV = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var OUT_REV: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUT_REV_Field.self, Bool.self)
                  return Bool(storage: self.raw.OUT_REV)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OUT_REV_Field.self, Bool.self)
                  self.raw.OUT_REV = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var BSWAP: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  return Bool(storage: self.raw.BSWAP)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(BSWAP_Field.self, Bool.self)
                  self.raw.BSWAP = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CALC: CALC_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CALC_Field.self, CALC_Values.self)
                  return CALC_Values(storage: self.raw.CALC)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CALC_Field.self, CALC_Values.self)
                  self.raw.CALC = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DMACH: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DMACH_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.DMACH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DMACH_Field.self, BitField4.self)
                  self.raw.DMACH = newValue.storage(Self.Value.Raw.Storage.self)
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

    /// Data accumulator for sniff hardware
    /// Write an initial seed value here before starting a DMA transfer on the channel indicated by SNIFF_CTRL_DMACH. The hardware will update this register each time it observes a read from the indicated channel. Once the channel completes, the final result can be read from this register.
    public var SNIFF_DATA: Register<SNIFF_DATA_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0438), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0438))
          #endif
        }
    }
    public struct SNIFF_DATA_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SNIFF_DATA_Descriptor

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

                    public  typealias Value = SNIFF_DATA_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Debug RAF, WAF, TDF levels
    public var FIFO_LEVELS: Register<FIFO_LEVELS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0440), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0440))
          #endif
        }
    }
    public struct FIFO_LEVELS_Descriptor {
        @available(*, unavailable)
        /// Current Read-Address-FIFO fill level
        public var RAF_LVL: RAF_LVL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Current Write-Address-FIFO fill level
        public var WAF_LVL: WAF_LVL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Current Transfer-Data-FIFO fill level
        public var TDF_LVL: TDF_LVL_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum RAF_LVL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 24
        }

        public enum WAF_LVL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 16
        }

        public enum TDF_LVL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = FIFO_LEVELS_Descriptor

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
                public var RAF_LVL: UInt32 {
                @inlinable @inline(__always) get {
                    RAF_LVL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    RAF_LVL_Field.insert(newValue, into: &self.storage)
                }
                }
              public var WAF_LVL: UInt32 {
                @inlinable @inline(__always) get {
                  WAF_LVL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  WAF_LVL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TDF_LVL: UInt32 {
                @inlinable @inline(__always) get {
                  TDF_LVL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TDF_LVL_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = FIFO_LEVELS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var RAF_LVL: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(RAF_LVL_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.RAF_LVL)
                }
                }
              public var WAF_LVL: BitField8 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WAF_LVL_Field.self, BitField8.self)
                  return BitField8(storage: self.raw.WAF_LVL)
                }
              }
              public var TDF_LVL: BitField8 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TDF_LVL_Field.self, BitField8.self)
                  return BitField8(storage: self.raw.TDF_LVL)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = FIFO_LEVELS_Descriptor
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

    /// Abort an in-progress transfer sequence on one or more channels
    public var CHAN_ABORT: Register<CHAN_ABORT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0444), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0444))
          #endif
        }
    }
    public struct CHAN_ABORT_Descriptor {
        @available(*, unavailable)
        /// Each bit corresponds to a channel. Writing a 1 aborts whatever transfer sequence is in progress on that channel. The bit will remain high until any in-flight transfers have been flushed through the address and data FIFOs.
        /// After writing, this register must be polled until it returns all-zero. Until this point, it is unsafe to restart the channel.
        public var CHAN_ABORT: CHAN_ABORT_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CHAN_ABORT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CHAN_ABORT_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CHAN_ABORT: UInt32 {
                @inlinable @inline(__always) get {
                    CHAN_ABORT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CHAN_ABORT_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CHAN_ABORT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CHAN_ABORT: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CHAN_ABORT_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.CHAN_ABORT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CHAN_ABORT_Field.self, BitField16.self)
                    self.raw.CHAN_ABORT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// The number of channels this DMA instance is equipped with. This DMA supports up to 16 hardware channels, but can be configured with as few as one, to minimise silicon area.
    public var N_CHANNELS: Register<N_CHANNELS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0448), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0448))
          #endif
        }
    }
    public struct N_CHANNELS_Descriptor {
        @available(*, unavailable)
        public var N_CHANNELS: N_CHANNELS_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum N_CHANNELS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 5
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = N_CHANNELS_Descriptor

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
                public var N_CHANNELS: UInt32 {
                @inlinable @inline(__always) get {
                    N_CHANNELS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    N_CHANNELS_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = N_CHANNELS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var N_CHANNELS: BitField5 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(N_CHANNELS_Field.self, BitField5.self)
                    return BitField5(storage: self.raw.N_CHANNELS)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = N_CHANNELS_Descriptor
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

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    public var CH0_DBG_CTDREQ: Register<CH0_DBG_CTDREQ_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0800), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0800))
          #endif
        }
    }
    public struct CH0_DBG_CTDREQ_Descriptor {
        @available(*, unavailable)
        public var CH0_DBG_CTDREQ: CH0_DBG_CTDREQ_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH0_DBG_CTDREQ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 6
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH0_DBG_CTDREQ_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CH0_DBG_CTDREQ: UInt32 {
                @inlinable @inline(__always) get {
                    CH0_DBG_CTDREQ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH0_DBG_CTDREQ_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH0_DBG_CTDREQ_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CH0_DBG_CTDREQ: BitField6 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH0_DBG_CTDREQ_Field.self, BitField6.self)
                    return BitField6(storage: self.raw.CH0_DBG_CTDREQ)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH0_DBG_CTDREQ_Field.self, BitField6.self)
                    self.raw.CH0_DBG_CTDREQ = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    public var CH0_DBG_TCR: Register<CH0_DBG_TCR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0804), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0804))
          #endif
        }
    }
    public struct CH0_DBG_TCR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH0_DBG_TCR_Descriptor

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

                    public  typealias Value = CH0_DBG_TCR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    public var CH1_DBG_CTDREQ: Register<CH1_DBG_CTDREQ_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0840), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0840))
          #endif
        }
    }
    public struct CH1_DBG_CTDREQ_Descriptor {
        @available(*, unavailable)
        public var CH1_DBG_CTDREQ: CH1_DBG_CTDREQ_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH1_DBG_CTDREQ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 6
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH1_DBG_CTDREQ_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CH1_DBG_CTDREQ: UInt32 {
                @inlinable @inline(__always) get {
                    CH1_DBG_CTDREQ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH1_DBG_CTDREQ_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH1_DBG_CTDREQ_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CH1_DBG_CTDREQ: BitField6 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH1_DBG_CTDREQ_Field.self, BitField6.self)
                    return BitField6(storage: self.raw.CH1_DBG_CTDREQ)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH1_DBG_CTDREQ_Field.self, BitField6.self)
                    self.raw.CH1_DBG_CTDREQ = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    public var CH1_DBG_TCR: Register<CH1_DBG_TCR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0844), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0844))
          #endif
        }
    }
    public struct CH1_DBG_TCR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH1_DBG_TCR_Descriptor

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

                    public  typealias Value = CH1_DBG_TCR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    public var CH2_DBG_CTDREQ: Register<CH2_DBG_CTDREQ_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0880), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0880))
          #endif
        }
    }
    public struct CH2_DBG_CTDREQ_Descriptor {
        @available(*, unavailable)
        public var CH2_DBG_CTDREQ: CH2_DBG_CTDREQ_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH2_DBG_CTDREQ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 6
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH2_DBG_CTDREQ_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CH2_DBG_CTDREQ: UInt32 {
                @inlinable @inline(__always) get {
                    CH2_DBG_CTDREQ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH2_DBG_CTDREQ_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH2_DBG_CTDREQ_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CH2_DBG_CTDREQ: BitField6 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH2_DBG_CTDREQ_Field.self, BitField6.self)
                    return BitField6(storage: self.raw.CH2_DBG_CTDREQ)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH2_DBG_CTDREQ_Field.self, BitField6.self)
                    self.raw.CH2_DBG_CTDREQ = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    public var CH2_DBG_TCR: Register<CH2_DBG_TCR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0884), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0884))
          #endif
        }
    }
    public struct CH2_DBG_TCR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH2_DBG_TCR_Descriptor

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

                    public  typealias Value = CH2_DBG_TCR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    public var CH3_DBG_CTDREQ: Register<CH3_DBG_CTDREQ_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x08c0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x08c0))
          #endif
        }
    }
    public struct CH3_DBG_CTDREQ_Descriptor {
        @available(*, unavailable)
        public var CH3_DBG_CTDREQ: CH3_DBG_CTDREQ_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH3_DBG_CTDREQ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 6
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH3_DBG_CTDREQ_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CH3_DBG_CTDREQ: UInt32 {
                @inlinable @inline(__always) get {
                    CH3_DBG_CTDREQ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH3_DBG_CTDREQ_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH3_DBG_CTDREQ_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CH3_DBG_CTDREQ: BitField6 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH3_DBG_CTDREQ_Field.self, BitField6.self)
                    return BitField6(storage: self.raw.CH3_DBG_CTDREQ)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH3_DBG_CTDREQ_Field.self, BitField6.self)
                    self.raw.CH3_DBG_CTDREQ = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    public var CH3_DBG_TCR: Register<CH3_DBG_TCR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x08c4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x08c4))
          #endif
        }
    }
    public struct CH3_DBG_TCR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH3_DBG_TCR_Descriptor

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

                    public  typealias Value = CH3_DBG_TCR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    public var CH4_DBG_CTDREQ: Register<CH4_DBG_CTDREQ_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0900), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0900))
          #endif
        }
    }
    public struct CH4_DBG_CTDREQ_Descriptor {
        @available(*, unavailable)
        public var CH4_DBG_CTDREQ: CH4_DBG_CTDREQ_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH4_DBG_CTDREQ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 6
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH4_DBG_CTDREQ_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CH4_DBG_CTDREQ: UInt32 {
                @inlinable @inline(__always) get {
                    CH4_DBG_CTDREQ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH4_DBG_CTDREQ_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH4_DBG_CTDREQ_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CH4_DBG_CTDREQ: BitField6 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH4_DBG_CTDREQ_Field.self, BitField6.self)
                    return BitField6(storage: self.raw.CH4_DBG_CTDREQ)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH4_DBG_CTDREQ_Field.self, BitField6.self)
                    self.raw.CH4_DBG_CTDREQ = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    public var CH4_DBG_TCR: Register<CH4_DBG_TCR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0904), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0904))
          #endif
        }
    }
    public struct CH4_DBG_TCR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH4_DBG_TCR_Descriptor

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

                    public  typealias Value = CH4_DBG_TCR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    public var CH5_DBG_CTDREQ: Register<CH5_DBG_CTDREQ_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0940), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0940))
          #endif
        }
    }
    public struct CH5_DBG_CTDREQ_Descriptor {
        @available(*, unavailable)
        public var CH5_DBG_CTDREQ: CH5_DBG_CTDREQ_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH5_DBG_CTDREQ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 6
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH5_DBG_CTDREQ_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CH5_DBG_CTDREQ: UInt32 {
                @inlinable @inline(__always) get {
                    CH5_DBG_CTDREQ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH5_DBG_CTDREQ_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH5_DBG_CTDREQ_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CH5_DBG_CTDREQ: BitField6 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH5_DBG_CTDREQ_Field.self, BitField6.self)
                    return BitField6(storage: self.raw.CH5_DBG_CTDREQ)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH5_DBG_CTDREQ_Field.self, BitField6.self)
                    self.raw.CH5_DBG_CTDREQ = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    public var CH5_DBG_TCR: Register<CH5_DBG_TCR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0944), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0944))
          #endif
        }
    }
    public struct CH5_DBG_TCR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH5_DBG_TCR_Descriptor

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

                    public  typealias Value = CH5_DBG_TCR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    public var CH6_DBG_CTDREQ: Register<CH6_DBG_CTDREQ_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0980), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0980))
          #endif
        }
    }
    public struct CH6_DBG_CTDREQ_Descriptor {
        @available(*, unavailable)
        public var CH6_DBG_CTDREQ: CH6_DBG_CTDREQ_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH6_DBG_CTDREQ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 6
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH6_DBG_CTDREQ_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CH6_DBG_CTDREQ: UInt32 {
                @inlinable @inline(__always) get {
                    CH6_DBG_CTDREQ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH6_DBG_CTDREQ_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH6_DBG_CTDREQ_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CH6_DBG_CTDREQ: BitField6 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH6_DBG_CTDREQ_Field.self, BitField6.self)
                    return BitField6(storage: self.raw.CH6_DBG_CTDREQ)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH6_DBG_CTDREQ_Field.self, BitField6.self)
                    self.raw.CH6_DBG_CTDREQ = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    public var CH6_DBG_TCR: Register<CH6_DBG_TCR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0984), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0984))
          #endif
        }
    }
    public struct CH6_DBG_TCR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH6_DBG_TCR_Descriptor

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

                    public  typealias Value = CH6_DBG_TCR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    public var CH7_DBG_CTDREQ: Register<CH7_DBG_CTDREQ_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x09c0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x09c0))
          #endif
        }
    }
    public struct CH7_DBG_CTDREQ_Descriptor {
        @available(*, unavailable)
        public var CH7_DBG_CTDREQ: CH7_DBG_CTDREQ_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH7_DBG_CTDREQ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 6
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH7_DBG_CTDREQ_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CH7_DBG_CTDREQ: UInt32 {
                @inlinable @inline(__always) get {
                    CH7_DBG_CTDREQ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH7_DBG_CTDREQ_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH7_DBG_CTDREQ_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CH7_DBG_CTDREQ: BitField6 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH7_DBG_CTDREQ_Field.self, BitField6.self)
                    return BitField6(storage: self.raw.CH7_DBG_CTDREQ)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH7_DBG_CTDREQ_Field.self, BitField6.self)
                    self.raw.CH7_DBG_CTDREQ = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    public var CH7_DBG_TCR: Register<CH7_DBG_TCR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x09c4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x09c4))
          #endif
        }
    }
    public struct CH7_DBG_TCR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH7_DBG_TCR_Descriptor

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

                    public  typealias Value = CH7_DBG_TCR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    public var CH8_DBG_CTDREQ: Register<CH8_DBG_CTDREQ_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0a00), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0a00))
          #endif
        }
    }
    public struct CH8_DBG_CTDREQ_Descriptor {
        @available(*, unavailable)
        public var CH8_DBG_CTDREQ: CH8_DBG_CTDREQ_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH8_DBG_CTDREQ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 6
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH8_DBG_CTDREQ_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CH8_DBG_CTDREQ: UInt32 {
                @inlinable @inline(__always) get {
                    CH8_DBG_CTDREQ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH8_DBG_CTDREQ_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH8_DBG_CTDREQ_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CH8_DBG_CTDREQ: BitField6 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH8_DBG_CTDREQ_Field.self, BitField6.self)
                    return BitField6(storage: self.raw.CH8_DBG_CTDREQ)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH8_DBG_CTDREQ_Field.self, BitField6.self)
                    self.raw.CH8_DBG_CTDREQ = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    public var CH8_DBG_TCR: Register<CH8_DBG_TCR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0a04), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0a04))
          #endif
        }
    }
    public struct CH8_DBG_TCR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH8_DBG_TCR_Descriptor

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

                    public  typealias Value = CH8_DBG_TCR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    public var CH9_DBG_CTDREQ: Register<CH9_DBG_CTDREQ_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0a40), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0a40))
          #endif
        }
    }
    public struct CH9_DBG_CTDREQ_Descriptor {
        @available(*, unavailable)
        public var CH9_DBG_CTDREQ: CH9_DBG_CTDREQ_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH9_DBG_CTDREQ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 6
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH9_DBG_CTDREQ_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CH9_DBG_CTDREQ: UInt32 {
                @inlinable @inline(__always) get {
                    CH9_DBG_CTDREQ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH9_DBG_CTDREQ_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH9_DBG_CTDREQ_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CH9_DBG_CTDREQ: BitField6 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH9_DBG_CTDREQ_Field.self, BitField6.self)
                    return BitField6(storage: self.raw.CH9_DBG_CTDREQ)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH9_DBG_CTDREQ_Field.self, BitField6.self)
                    self.raw.CH9_DBG_CTDREQ = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    public var CH9_DBG_TCR: Register<CH9_DBG_TCR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0a44), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0a44))
          #endif
        }
    }
    public struct CH9_DBG_TCR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH9_DBG_TCR_Descriptor

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

                    public  typealias Value = CH9_DBG_TCR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    public var CH10_DBG_CTDREQ: Register<CH10_DBG_CTDREQ_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0a80), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0a80))
          #endif
        }
    }
    public struct CH10_DBG_CTDREQ_Descriptor {
        @available(*, unavailable)
        public var CH10_DBG_CTDREQ: CH10_DBG_CTDREQ_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH10_DBG_CTDREQ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 6
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH10_DBG_CTDREQ_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CH10_DBG_CTDREQ: UInt32 {
                @inlinable @inline(__always) get {
                    CH10_DBG_CTDREQ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH10_DBG_CTDREQ_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH10_DBG_CTDREQ_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CH10_DBG_CTDREQ: BitField6 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH10_DBG_CTDREQ_Field.self, BitField6.self)
                    return BitField6(storage: self.raw.CH10_DBG_CTDREQ)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH10_DBG_CTDREQ_Field.self, BitField6.self)
                    self.raw.CH10_DBG_CTDREQ = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    public var CH10_DBG_TCR: Register<CH10_DBG_TCR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0a84), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0a84))
          #endif
        }
    }
    public struct CH10_DBG_TCR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH10_DBG_TCR_Descriptor

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

                    public  typealias Value = CH10_DBG_TCR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    public var CH11_DBG_CTDREQ: Register<CH11_DBG_CTDREQ_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0ac0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0ac0))
          #endif
        }
    }
    public struct CH11_DBG_CTDREQ_Descriptor {
        @available(*, unavailable)
        public var CH11_DBG_CTDREQ: CH11_DBG_CTDREQ_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CH11_DBG_CTDREQ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 6
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH11_DBG_CTDREQ_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CH11_DBG_CTDREQ: UInt32 {
                @inlinable @inline(__always) get {
                    CH11_DBG_CTDREQ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CH11_DBG_CTDREQ_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CH11_DBG_CTDREQ_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CH11_DBG_CTDREQ: BitField6 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CH11_DBG_CTDREQ_Field.self, BitField6.self)
                    return BitField6(storage: self.raw.CH11_DBG_CTDREQ)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CH11_DBG_CTDREQ_Field.self, BitField6.self)
                    self.raw.CH11_DBG_CTDREQ = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    public var CH11_DBG_TCR: Register<CH11_DBG_TCR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0ac4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0ac4))
          #endif
        }
    }
    public struct CH11_DBG_TCR_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CH11_DBG_TCR_Descriptor

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

                    public  typealias Value = CH11_DBG_TCR_Descriptor
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

extension DMA.CH0_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH0_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH0_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH0_CTRL_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH0_AL1_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH0_AL1_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH0_AL1_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH0_AL1_TRANS_COUNT_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH0_AL2_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH0_AL2_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH0_AL2_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH0_AL2_WRITE_ADDR_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH0_AL3_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH0_AL3_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH0_AL3_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH0_AL3_READ_ADDR_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH1_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH1_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH1_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH1_CTRL_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH1_AL1_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH1_AL1_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH1_AL1_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH1_AL1_TRANS_COUNT_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH1_AL2_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH1_AL2_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH1_AL2_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH1_AL2_WRITE_ADDR_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH1_AL3_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH1_AL3_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH1_AL3_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH1_AL3_READ_ADDR_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH2_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH2_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH2_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH2_CTRL_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH2_AL1_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH2_AL1_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH2_AL1_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH2_AL1_TRANS_COUNT_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH2_AL2_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH2_AL2_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH2_AL2_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH2_AL2_WRITE_ADDR_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH2_AL3_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH2_AL3_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH2_AL3_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH2_AL3_READ_ADDR_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH3_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH3_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH3_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH3_CTRL_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH3_AL1_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH3_AL1_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH3_AL1_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH3_AL1_TRANS_COUNT_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH3_AL2_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH3_AL2_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH3_AL2_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH3_AL2_WRITE_ADDR_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH3_AL3_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH3_AL3_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH3_AL3_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH3_AL3_READ_ADDR_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH4_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH4_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH4_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH4_CTRL_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH4_AL1_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH4_AL1_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH4_AL1_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH4_AL1_TRANS_COUNT_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH4_AL2_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH4_AL2_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH4_AL2_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH4_AL2_WRITE_ADDR_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH4_AL3_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH4_AL3_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH4_AL3_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH4_AL3_READ_ADDR_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH5_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH5_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH5_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH5_CTRL_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH5_AL1_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH5_AL1_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH5_AL1_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH5_AL1_TRANS_COUNT_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH5_AL2_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH5_AL2_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH5_AL2_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH5_AL2_WRITE_ADDR_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH5_AL3_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH5_AL3_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH5_AL3_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH5_AL3_READ_ADDR_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH6_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH6_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH6_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH6_CTRL_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH6_AL1_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH6_AL1_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH6_AL1_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH6_AL1_TRANS_COUNT_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH6_AL2_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH6_AL2_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH6_AL2_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH6_AL2_WRITE_ADDR_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH6_AL3_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH6_AL3_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH6_AL3_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH6_AL3_READ_ADDR_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH7_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH7_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH7_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH7_CTRL_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH7_AL1_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH7_AL1_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH7_AL1_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH7_AL1_TRANS_COUNT_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH7_AL2_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH7_AL2_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH7_AL2_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH7_AL2_WRITE_ADDR_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH7_AL3_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH7_AL3_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH7_AL3_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH7_AL3_READ_ADDR_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH8_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH8_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH8_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH8_CTRL_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH8_AL1_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH8_AL1_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH8_AL1_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH8_AL1_TRANS_COUNT_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH8_AL2_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH8_AL2_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH8_AL2_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH8_AL2_WRITE_ADDR_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH8_AL3_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH8_AL3_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH8_AL3_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH8_AL3_READ_ADDR_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH9_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH9_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH9_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH9_CTRL_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH9_AL1_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH9_AL1_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH9_AL1_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH9_AL1_TRANS_COUNT_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH9_AL2_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH9_AL2_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH9_AL2_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH9_AL2_WRITE_ADDR_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH9_AL3_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH9_AL3_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH9_AL3_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH9_AL3_READ_ADDR_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH10_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH10_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH10_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH10_CTRL_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH10_AL1_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH10_AL1_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH10_AL1_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH10_AL1_TRANS_COUNT_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH10_AL2_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH10_AL2_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH10_AL2_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH10_AL2_WRITE_ADDR_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH10_AL3_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH10_AL3_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH10_AL3_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH10_AL3_READ_ADDR_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH11_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH11_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH11_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH11_CTRL_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH11_AL1_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH11_AL1_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH11_AL1_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH11_AL1_TRANS_COUNT_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH11_AL2_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH11_AL2_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH11_AL2_READ_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH11_AL2_WRITE_ADDR_TRIG_Descriptor: RegisterValue {
}

extension DMA.CH11_AL3_CTRL_Descriptor: RegisterValue {
}

extension DMA.CH11_AL3_WRITE_ADDR_Descriptor: RegisterValue {
}

extension DMA.CH11_AL3_TRANS_COUNT_Descriptor: RegisterValue {
}

extension DMA.CH11_AL3_READ_ADDR_TRIG_Descriptor: RegisterValue {
}

extension DMA.INTR_Descriptor: RegisterValue {
}

extension DMA.INTE0_Descriptor: RegisterValue {
}

extension DMA.INTF0_Descriptor: RegisterValue {
}

extension DMA.INTS0_Descriptor: RegisterValue {
}

extension DMA.INTE1_Descriptor: RegisterValue {
}

extension DMA.INTF1_Descriptor: RegisterValue {
}

extension DMA.INTS1_Descriptor: RegisterValue {
}

extension DMA.TIMER0_Descriptor: RegisterValue {
}

extension DMA.TIMER1_Descriptor: RegisterValue {
}

extension DMA.TIMER2_Descriptor: RegisterValue {
}

extension DMA.TIMER3_Descriptor: RegisterValue {
}

extension DMA.MULTI_CHAN_TRIGGER_Descriptor: RegisterValue {
}

extension DMA.SNIFF_CTRL_Descriptor: RegisterValue {
}

extension DMA.SNIFF_DATA_Descriptor: RegisterValue {
}

extension DMA.FIFO_LEVELS_Descriptor: RegisterValue {
}

extension DMA.CHAN_ABORT_Descriptor: RegisterValue {
}

extension DMA.N_CHANNELS_Descriptor: RegisterValue {
}

extension DMA.CH0_DBG_CTDREQ_Descriptor: RegisterValue {
}

extension DMA.CH0_DBG_TCR_Descriptor: RegisterValue {
}

extension DMA.CH1_DBG_CTDREQ_Descriptor: RegisterValue {
}

extension DMA.CH1_DBG_TCR_Descriptor: RegisterValue {
}

extension DMA.CH2_DBG_CTDREQ_Descriptor: RegisterValue {
}

extension DMA.CH2_DBG_TCR_Descriptor: RegisterValue {
}

extension DMA.CH3_DBG_CTDREQ_Descriptor: RegisterValue {
}

extension DMA.CH3_DBG_TCR_Descriptor: RegisterValue {
}

extension DMA.CH4_DBG_CTDREQ_Descriptor: RegisterValue {
}

extension DMA.CH4_DBG_TCR_Descriptor: RegisterValue {
}

extension DMA.CH5_DBG_CTDREQ_Descriptor: RegisterValue {
}

extension DMA.CH5_DBG_TCR_Descriptor: RegisterValue {
}

extension DMA.CH6_DBG_CTDREQ_Descriptor: RegisterValue {
}

extension DMA.CH6_DBG_TCR_Descriptor: RegisterValue {
}

extension DMA.CH7_DBG_CTDREQ_Descriptor: RegisterValue {
}

extension DMA.CH7_DBG_TCR_Descriptor: RegisterValue {
}

extension DMA.CH8_DBG_CTDREQ_Descriptor: RegisterValue {
}

extension DMA.CH8_DBG_TCR_Descriptor: RegisterValue {
}

extension DMA.CH9_DBG_CTDREQ_Descriptor: RegisterValue {
}

extension DMA.CH9_DBG_TCR_Descriptor: RegisterValue {
}

extension DMA.CH10_DBG_CTDREQ_Descriptor: RegisterValue {
}

extension DMA.CH10_DBG_TCR_Descriptor: RegisterValue {
}

extension DMA.CH11_DBG_CTDREQ_Descriptor: RegisterValue {
}

extension DMA.CH11_DBG_TCR_Descriptor: RegisterValue {
}
