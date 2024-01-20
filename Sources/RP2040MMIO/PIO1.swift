import MMIO
import MMIOExtensions

/// Programmable IO block
public struct PIO1 {

    public static var `default`: Self { .init(unsafeAddress: 0x50300000) }

    /// PIO control register
    public var CTRL: Register<CTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0000), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0000))
          #endif
        }
    }
    public struct CTRL_Descriptor {
        @available(*, unavailable)
        /// Restart a state machine's clock divider from an initial phase of 0. Clock dividers are free-running, so once started, their output (including fractional jitter) is completely determined by the integer/fractional divisor configured in SMx_CLKDIV. This means that, if multiple clock dividers with the same divisor are restarted simultaneously, by writing multiple 1 bits to this field, the execution clocks of those state machines will run in precise lockstep.
        /// Note that setting/clearing SM_ENABLE does not stop the clock divider from running, so once multiple state machines' clocks are synchronised, it is safe to disable/reenable a state machine, whilst keeping the clock dividers in sync.
        /// Note also that CLKDIV_RESTART can be written to whilst the state machine is running, and this is useful to resynchronise clock dividers after the divisors (SMx_CLKDIV) have been changed on-the-fly.
        public var CLKDIV_RESTART: CLKDIV_RESTART_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Write 1 to instantly clear internal SM state which may be otherwise difficult to access and will affect future execution.
        /// Specifically, the following are cleared: input and output shift counters; the contents of the input shift register; the delay counter; the waiting-on-IRQ state; any stalled instruction written to SMx_INSTR or run by OUT/MOV EXEC; any pin write left asserted due to OUT_STICKY.
        /// The program counter, the contents of the output shift register and the X/Y scratch registers are not affected.
        public var SM_RESTART: SM_RESTART_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Enable/disable each of the four state machines by writing 1/0 to each of these four bits. When disabled, a state machine will cease executing instructions, except those written directly to SMx_INSTR by the system. Multiple bits can be set/cleared at once to run/halt multiple state machines simultaneously.
        public var SM_ENABLE: SM_ENABLE_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CLKDIV_RESTART_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 12
        }

        public enum SM_RESTART_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 8
        }

        public enum SM_ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 4
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CTRL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var CLKDIV_RESTART: UInt32 {
                @inlinable @inline(__always) get {
                    CLKDIV_RESTART_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CLKDIV_RESTART_Field.insert(newValue, into: &self.storage)
                }
                }
              public var SM_RESTART: UInt32 {
                @inlinable @inline(__always) get {
                  SM_RESTART_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM_RESTART_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM_ENABLE: UInt32 {
                @inlinable @inline(__always) get {
                  SM_ENABLE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM_ENABLE_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var CLKDIV_RESTART: BitField4 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CLKDIV_RESTART_Field.self, BitField4.self)
                    return BitField4(storage: self.raw.CLKDIV_RESTART)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(CLKDIV_RESTART_Field.self, BitField4.self)
                    self.raw.CLKDIV_RESTART = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var SM_RESTART: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM_RESTART_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.SM_RESTART)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM_RESTART_Field.self, BitField4.self)
                  self.raw.SM_RESTART = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM_ENABLE: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM_ENABLE_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.SM_ENABLE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM_ENABLE_Field.self, BitField4.self)
                  self.raw.SM_ENABLE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// FIFO status register
    public var FSTAT: Register<FSTAT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0004), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0004))
          #endif
        }
    }
    public struct FSTAT_Descriptor {
        @available(*, unavailable)
        /// State machine TX FIFO is empty
        public var TXEMPTY: TXEMPTY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// State machine TX FIFO is full
        public var TXFULL: TXFULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// State machine RX FIFO is empty
        public var RXEMPTY: RXEMPTY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// State machine RX FIFO is full
        public var RXFULL: RXFULL_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum TXEMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 28
        }

        public enum TXFULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 20
        }

        public enum RXEMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 12
        }

        public enum RXFULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 4
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = FSTAT_Descriptor

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
                public var TXEMPTY: UInt32 {
                @inlinable @inline(__always) get {
                    TXEMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    TXEMPTY_Field.insert(newValue, into: &self.storage)
                }
                }
              public var TXFULL: UInt32 {
                @inlinable @inline(__always) get {
                  TXFULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TXFULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RXEMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  RXEMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RXEMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RXFULL: UInt32 {
                @inlinable @inline(__always) get {
                  RXFULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RXFULL_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = FSTAT_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var TXEMPTY: BitField4 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(TXEMPTY_Field.self, BitField4.self)
                    return BitField4(storage: self.raw.TXEMPTY)
                }
                }
              public var TXFULL: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TXFULL_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.TXFULL)
                }
              }
              public var RXEMPTY: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RXEMPTY_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.RXEMPTY)
                }
              }
              public var RXFULL: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RXFULL_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.RXFULL)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = FSTAT_Descriptor
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

    /// FIFO debug register
    public var FDEBUG: Register<FDEBUG_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0008), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0008))
          #endif
        }
    }
    public struct FDEBUG_Descriptor {
        @available(*, unavailable)
        /// State machine has stalled on empty TX FIFO during a blocking PULL, or an OUT with autopull enabled. Write 1 to clear.
        public var TXSTALL: TXSTALL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// TX FIFO overflow (i.e. write-on-full by the system) has occurred. Write 1 to clear. Note that write-on-full does not alter the state or contents of the FIFO in any way, but the data that the system attempted to write is dropped, so if this flag is set, your software has quite likely dropped some data on the floor.
        public var TXOVER: TXOVER_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// RX FIFO underflow (i.e. read-on-empty by the system) has occurred. Write 1 to clear. Note that read-on-empty does not perturb the state of the FIFO in any way, but the data returned by reading from an empty FIFO is undefined, so this flag generally only becomes set due to some kind of software error.
        public var RXUNDER: RXUNDER_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// State machine has stalled on full RX FIFO during a blocking PUSH, or an IN with autopush enabled. This flag is also set when a nonblocking PUSH to a full FIFO took place, in which case the state machine has dropped data. Write 1 to clear.
        public var RXSTALL: RXSTALL_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum TXSTALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 28
        }

        public enum TXOVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 20
        }

        public enum RXUNDER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 12
        }

        public enum RXSTALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 4
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = FDEBUG_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var TXSTALL: UInt32 {
                @inlinable @inline(__always) get {
                    TXSTALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    TXSTALL_Field.insert(newValue, into: &self.storage)
                }
                }
              public var TXOVER: UInt32 {
                @inlinable @inline(__always) get {
                  TXOVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TXOVER_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RXUNDER: UInt32 {
                @inlinable @inline(__always) get {
                  RXUNDER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RXUNDER_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RXSTALL: UInt32 {
                @inlinable @inline(__always) get {
                  RXSTALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RXSTALL_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = FDEBUG_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var TXSTALL: BitField4 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(TXSTALL_Field.self, BitField4.self)
                    return BitField4(storage: self.raw.TXSTALL)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(TXSTALL_Field.self, BitField4.self)
                    self.raw.TXSTALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var TXOVER: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TXOVER_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.TXOVER)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TXOVER_Field.self, BitField4.self)
                  self.raw.TXOVER = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RXUNDER: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RXUNDER_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.RXUNDER)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RXUNDER_Field.self, BitField4.self)
                  self.raw.RXUNDER = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var RXSTALL: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RXSTALL_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.RXSTALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RXSTALL_Field.self, BitField4.self)
                  self.raw.RXSTALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// FIFO levels
    public var FLEVEL: Register<FLEVEL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x000c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x000c))
          #endif
        }
    }
    public struct FLEVEL_Descriptor {
        @available(*, unavailable)
        public var RX3: RX3_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var TX3: TX3_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var RX2: RX2_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var TX2: TX2_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var RX1: RX1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var TX1: TX1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var RX0: RX0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var TX0: TX0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum RX3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 28 ..< 32
        }

        public enum TX3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 28
        }

        public enum RX2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 24
        }

        public enum TX2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 20
        }

        public enum RX1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 16
        }

        public enum TX1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 12
        }

        public enum RX0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 8
        }

        public enum TX0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 4
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = FLEVEL_Descriptor

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
                public var RX3: UInt32 {
                @inlinable @inline(__always) get {
                    RX3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    RX3_Field.insert(newValue, into: &self.storage)
                }
                }
              public var TX3: UInt32 {
                @inlinable @inline(__always) get {
                  TX3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TX3_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RX2: UInt32 {
                @inlinable @inline(__always) get {
                  RX2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RX2_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TX2: UInt32 {
                @inlinable @inline(__always) get {
                  TX2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TX2_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RX1: UInt32 {
                @inlinable @inline(__always) get {
                  RX1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RX1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TX1: UInt32 {
                @inlinable @inline(__always) get {
                  TX1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TX1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RX0: UInt32 {
                @inlinable @inline(__always) get {
                  RX0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RX0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TX0: UInt32 {
                @inlinable @inline(__always) get {
                  TX0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TX0_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = FLEVEL_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var RX3: BitField4 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(RX3_Field.self, BitField4.self)
                    return BitField4(storage: self.raw.RX3)
                }
                }
              public var TX3: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TX3_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.TX3)
                }
              }
              public var RX2: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RX2_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.RX2)
                }
              }
              public var TX2: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TX2_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.TX2)
                }
              }
              public var RX1: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RX1_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.RX1)
                }
              }
              public var TX1: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TX1_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.TX1)
                }
              }
              public var RX0: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RX0_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.RX0)
                }
              }
              public var TX0: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TX0_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.TX0)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = FLEVEL_Descriptor
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

    /// Direct write access to the TX FIFO for this state machine. Each write pushes one word to the FIFO. Attempting to write to a full FIFO has no effect on the FIFO state or contents, and sets the sticky FDEBUG_TXOVER error flag for this FIFO.
    public var TXF0: Register<TXF0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0010), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0010))
          #endif
        }
    }
    public struct TXF0_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = TXF0_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }

        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = TXF0_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Direct write access to the TX FIFO for this state machine. Each write pushes one word to the FIFO. Attempting to write to a full FIFO has no effect on the FIFO state or contents, and sets the sticky FDEBUG_TXOVER error flag for this FIFO.
    public var TXF1: Register<TXF1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0014), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0014))
          #endif
        }
    }
    public struct TXF1_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = TXF1_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }

        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = TXF1_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Direct write access to the TX FIFO for this state machine. Each write pushes one word to the FIFO. Attempting to write to a full FIFO has no effect on the FIFO state or contents, and sets the sticky FDEBUG_TXOVER error flag for this FIFO.
    public var TXF2: Register<TXF2_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0018), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0018))
          #endif
        }
    }
    public struct TXF2_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = TXF2_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }

        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = TXF2_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Direct write access to the TX FIFO for this state machine. Each write pushes one word to the FIFO. Attempting to write to a full FIFO has no effect on the FIFO state or contents, and sets the sticky FDEBUG_TXOVER error flag for this FIFO.
    public var TXF3: Register<TXF3_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x001c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x001c))
          #endif
        }
    }
    public struct TXF3_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = TXF3_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }

        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = TXF3_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Direct read access to the RX FIFO for this state machine. Each read pops one word from the FIFO. Attempting to read from an empty FIFO has no effect on the FIFO state, and sets the sticky FDEBUG_RXUNDER error flag for this FIFO. The data returned to the system on a read from an empty FIFO is undefined.
    public var RXF0: Register<RXF0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0020), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0020))
          #endif
        }
    }
    public struct RXF0_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = RXF0_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }

        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = RXF0_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Direct read access to the RX FIFO for this state machine. Each read pops one word from the FIFO. Attempting to read from an empty FIFO has no effect on the FIFO state, and sets the sticky FDEBUG_RXUNDER error flag for this FIFO. The data returned to the system on a read from an empty FIFO is undefined.
    public var RXF1: Register<RXF1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0024), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0024))
          #endif
        }
    }
    public struct RXF1_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = RXF1_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }

        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = RXF1_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Direct read access to the RX FIFO for this state machine. Each read pops one word from the FIFO. Attempting to read from an empty FIFO has no effect on the FIFO state, and sets the sticky FDEBUG_RXUNDER error flag for this FIFO. The data returned to the system on a read from an empty FIFO is undefined.
    public var RXF2: Register<RXF2_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0028), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0028))
          #endif
        }
    }
    public struct RXF2_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = RXF2_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }

        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = RXF2_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Direct read access to the RX FIFO for this state machine. Each read pops one word from the FIFO. Attempting to read from an empty FIFO has no effect on the FIFO state, and sets the sticky FDEBUG_RXUNDER error flag for this FIFO. The data returned to the system on a read from an empty FIFO is undefined.
    public var RXF3: Register<RXF3_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x002c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x002c))
          #endif
        }
    }
    public struct RXF3_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = RXF3_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }

        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = RXF3_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// State machine IRQ flags register. Write 1 to clear. There are 8 state machine IRQ flags, which can be set, cleared, and waited on by the state machines. There's no fixed association between flags and state machines -- any state machine can use any flag.
    /// Any of the 8 flags can be used for timing synchronisation between state machines, using IRQ and WAIT instructions. The lower four of these flags are also routed out to system-level interrupt requests, alongside FIFO status interrupts -- see e.g. IRQ0_INTE.
    public var IRQ: Register<IRQ_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0030), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0030))
          #endif
        }
    }
    public struct IRQ_Descriptor {
        @available(*, unavailable)
        public var IRQ: IRQ_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IRQ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IRQ_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var IRQ: UInt32 {
                @inlinable @inline(__always) get {
                    IRQ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IRQ_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = IRQ_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var IRQ: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IRQ_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.IRQ)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(IRQ_Field.self, BitField8.self)
                    self.raw.IRQ = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Writing a 1 to each of these bits will forcibly assert the corresponding IRQ. Note this is different to the INTF register: writing here affects PIO internal state. INTF just asserts the processor-facing IRQ signal for testing ISRs, and is not visible to the state machines.
    public var IRQ_FORCE: Register<IRQ_FORCE_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0034), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0034))
          #endif
        }
    }
    public struct IRQ_FORCE_Descriptor {
        @available(*, unavailable)
        public var IRQ_FORCE: IRQ_FORCE_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IRQ_FORCE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IRQ_FORCE_Descriptor

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
                public var IRQ_FORCE: UInt32 {
                @inlinable @inline(__always) get {
                    IRQ_FORCE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IRQ_FORCE_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = IRQ_FORCE_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = IRQ_FORCE_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var IRQ_FORCE: BitField8 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IRQ_FORCE_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.IRQ_FORCE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(IRQ_FORCE_Field.self, BitField8.self)
                    self.raw.IRQ_FORCE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// There is a 2-flipflop synchronizer on each GPIO input, which protects PIO logic from metastabilities. This increases input delay, and for fast synchronous IO (e.g. SPI) these synchronizers may need to be bypassed. Each bit in this register corresponds to one GPIO.
    /// 0 -> input is synchronized (default)
    /// 1 -> synchronizer is bypassed
    /// If in doubt, leave this register as all zeroes.
    public var INPUT_SYNC_BYPASS: Register<INPUT_SYNC_BYPASS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0038), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0038))
          #endif
        }
    }
    public struct INPUT_SYNC_BYPASS_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INPUT_SYNC_BYPASS_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }

        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = INPUT_SYNC_BYPASS_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read to sample the pad output values PIO is currently driving to the GPIOs. On RP2040 there are 30 GPIOs, so the two most significant bits are hardwired to 0.
    public var DBG_PADOUT: Register<DBG_PADOUT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x003c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x003c))
          #endif
        }
    }
    public struct DBG_PADOUT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = DBG_PADOUT_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }

        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = DBG_PADOUT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Read to sample the pad output enables (direction) PIO is currently driving to the GPIOs. On RP2040 there are 30 GPIOs, so the two most significant bits are hardwired to 0.
    public var DBG_PADOE: Register<DBG_PADOE_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0040), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0040))
          #endif
        }
    }
    public struct DBG_PADOE_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = DBG_PADOE_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }

        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = DBG_PADOE_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// The PIO hardware has some free parameters that may vary between chip products.
    /// These should be provided in the chip datasheet, but are also exposed here.
    public var DBG_CFGINFO: Register<DBG_CFGINFO_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0044), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0044))
          #endif
        }
    }
    public struct DBG_CFGINFO_Descriptor {
        @available(*, unavailable)
        /// The size of the instruction memory, measured in units of one instruction
        public var IMEM_SIZE: IMEM_SIZE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of state machines this PIO instance is equipped with.
        public var SM_COUNT: SM_COUNT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The depth of the state machine TX/RX FIFOs, measured in words.
        /// Joining fifos via SHIFTCTRL_FJOIN gives one FIFO with double
        /// this depth.
        public var FIFO_DEPTH: FIFO_DEPTH_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IMEM_SIZE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 22
        }

        public enum SM_COUNT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 12
        }

        public enum FIFO_DEPTH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 6
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = DBG_CFGINFO_Descriptor

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
                public var IMEM_SIZE: UInt32 {
                @inlinable @inline(__always) get {
                    IMEM_SIZE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IMEM_SIZE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var SM_COUNT: UInt32 {
                @inlinable @inline(__always) get {
                  SM_COUNT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM_COUNT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FIFO_DEPTH: UInt32 {
                @inlinable @inline(__always) get {
                  FIFO_DEPTH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FIFO_DEPTH_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = DBG_CFGINFO_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var IMEM_SIZE: BitField6 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IMEM_SIZE_Field.self, BitField6.self)
                    return BitField6(storage: self.raw.IMEM_SIZE)
                }
                }
              public var SM_COUNT: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM_COUNT_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.SM_COUNT)
                }
              }
              public var FIFO_DEPTH: BitField6 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FIFO_DEPTH_Field.self, BitField6.self)
                  return BitField6(storage: self.raw.FIFO_DEPTH)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = DBG_CFGINFO_Descriptor
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

    /// Write-only access to instruction memory location 0
    public var INSTR_MEM0: Register<INSTR_MEM0_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0048), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0048))
          #endif
        }
    }
    public struct INSTR_MEM0_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM0: INSTR_MEM0_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM0_Descriptor

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
                public var INSTR_MEM0: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM0_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM0_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM0_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM0: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM0_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM0)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM0_Field.self, BitField16.self)
                    self.raw.INSTR_MEM0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Write-only access to instruction memory location 1
    public var INSTR_MEM1: Register<INSTR_MEM1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x004c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x004c))
          #endif
        }
    }
    public struct INSTR_MEM1_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM1: INSTR_MEM1_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM1_Descriptor

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
                public var INSTR_MEM1: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM1_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM1_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM1_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM1: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM1_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM1_Field.self, BitField16.self)
                    self.raw.INSTR_MEM1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Write-only access to instruction memory location 2
    public var INSTR_MEM2: Register<INSTR_MEM2_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0050), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0050))
          #endif
        }
    }
    public struct INSTR_MEM2_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM2: INSTR_MEM2_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM2_Descriptor

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
                public var INSTR_MEM2: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM2_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM2_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM2_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM2: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM2_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM2)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM2_Field.self, BitField16.self)
                    self.raw.INSTR_MEM2 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Write-only access to instruction memory location 3
    public var INSTR_MEM3: Register<INSTR_MEM3_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0054), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0054))
          #endif
        }
    }
    public struct INSTR_MEM3_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM3: INSTR_MEM3_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM3_Descriptor

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
                public var INSTR_MEM3: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM3_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM3_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM3_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM3: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM3_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM3)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM3_Field.self, BitField16.self)
                    self.raw.INSTR_MEM3 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Write-only access to instruction memory location 4
    public var INSTR_MEM4: Register<INSTR_MEM4_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0058), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0058))
          #endif
        }
    }
    public struct INSTR_MEM4_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM4: INSTR_MEM4_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM4_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM4_Descriptor

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
                public var INSTR_MEM4: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM4_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM4_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM4_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM4_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM4: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM4_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM4)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM4_Field.self, BitField16.self)
                    self.raw.INSTR_MEM4 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Write-only access to instruction memory location 5
    public var INSTR_MEM5: Register<INSTR_MEM5_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x005c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x005c))
          #endif
        }
    }
    public struct INSTR_MEM5_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM5: INSTR_MEM5_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM5_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM5_Descriptor

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
                public var INSTR_MEM5: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM5_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM5_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM5_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM5_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM5: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM5_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM5)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM5_Field.self, BitField16.self)
                    self.raw.INSTR_MEM5 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Write-only access to instruction memory location 6
    public var INSTR_MEM6: Register<INSTR_MEM6_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0060), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0060))
          #endif
        }
    }
    public struct INSTR_MEM6_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM6: INSTR_MEM6_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM6_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM6_Descriptor

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
                public var INSTR_MEM6: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM6_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM6_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM6_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM6_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM6: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM6_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM6)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM6_Field.self, BitField16.self)
                    self.raw.INSTR_MEM6 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Write-only access to instruction memory location 7
    public var INSTR_MEM7: Register<INSTR_MEM7_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0064), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0064))
          #endif
        }
    }
    public struct INSTR_MEM7_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM7: INSTR_MEM7_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM7_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM7_Descriptor

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
                public var INSTR_MEM7: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM7_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM7_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM7_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM7_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM7: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM7_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM7)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM7_Field.self, BitField16.self)
                    self.raw.INSTR_MEM7 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Write-only access to instruction memory location 8
    public var INSTR_MEM8: Register<INSTR_MEM8_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0068), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0068))
          #endif
        }
    }
    public struct INSTR_MEM8_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM8: INSTR_MEM8_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM8_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM8_Descriptor

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
                public var INSTR_MEM8: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM8_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM8_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM8_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM8_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM8: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM8_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM8)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM8_Field.self, BitField16.self)
                    self.raw.INSTR_MEM8 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Write-only access to instruction memory location 9
    public var INSTR_MEM9: Register<INSTR_MEM9_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x006c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x006c))
          #endif
        }
    }
    public struct INSTR_MEM9_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM9: INSTR_MEM9_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM9_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM9_Descriptor

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
                public var INSTR_MEM9: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM9_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM9_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM9_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM9_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM9: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM9_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM9)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM9_Field.self, BitField16.self)
                    self.raw.INSTR_MEM9 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Write-only access to instruction memory location 10
    public var INSTR_MEM10: Register<INSTR_MEM10_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0070), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0070))
          #endif
        }
    }
    public struct INSTR_MEM10_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM10: INSTR_MEM10_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM10_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM10_Descriptor

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
                public var INSTR_MEM10: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM10_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM10_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM10_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM10_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM10: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM10_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM10)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM10_Field.self, BitField16.self)
                    self.raw.INSTR_MEM10 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Write-only access to instruction memory location 11
    public var INSTR_MEM11: Register<INSTR_MEM11_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0074), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0074))
          #endif
        }
    }
    public struct INSTR_MEM11_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM11: INSTR_MEM11_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM11_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM11_Descriptor

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
                public var INSTR_MEM11: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM11_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM11_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM11_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM11_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM11: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM11_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM11)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM11_Field.self, BitField16.self)
                    self.raw.INSTR_MEM11 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Write-only access to instruction memory location 12
    public var INSTR_MEM12: Register<INSTR_MEM12_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0078), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0078))
          #endif
        }
    }
    public struct INSTR_MEM12_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM12: INSTR_MEM12_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM12_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM12_Descriptor

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
                public var INSTR_MEM12: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM12_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM12_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM12_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM12_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM12: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM12_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM12)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM12_Field.self, BitField16.self)
                    self.raw.INSTR_MEM12 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Write-only access to instruction memory location 13
    public var INSTR_MEM13: Register<INSTR_MEM13_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x007c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x007c))
          #endif
        }
    }
    public struct INSTR_MEM13_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM13: INSTR_MEM13_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM13_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM13_Descriptor

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
                public var INSTR_MEM13: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM13_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM13_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM13_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM13_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM13: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM13_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM13)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM13_Field.self, BitField16.self)
                    self.raw.INSTR_MEM13 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Write-only access to instruction memory location 14
    public var INSTR_MEM14: Register<INSTR_MEM14_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0080), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0080))
          #endif
        }
    }
    public struct INSTR_MEM14_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM14: INSTR_MEM14_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM14_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM14_Descriptor

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
                public var INSTR_MEM14: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM14_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM14_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM14_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM14_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM14: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM14_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM14)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM14_Field.self, BitField16.self)
                    self.raw.INSTR_MEM14 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Write-only access to instruction memory location 15
    public var INSTR_MEM15: Register<INSTR_MEM15_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0084), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0084))
          #endif
        }
    }
    public struct INSTR_MEM15_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM15: INSTR_MEM15_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM15_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM15_Descriptor

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
                public var INSTR_MEM15: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM15_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM15_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM15_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM15_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM15: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM15_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM15)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM15_Field.self, BitField16.self)
                    self.raw.INSTR_MEM15 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Write-only access to instruction memory location 16
    public var INSTR_MEM16: Register<INSTR_MEM16_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0088), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0088))
          #endif
        }
    }
    public struct INSTR_MEM16_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM16: INSTR_MEM16_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM16_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM16_Descriptor

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
                public var INSTR_MEM16: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM16_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM16_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM16_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM16_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM16: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM16_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM16)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM16_Field.self, BitField16.self)
                    self.raw.INSTR_MEM16 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Write-only access to instruction memory location 17
    public var INSTR_MEM17: Register<INSTR_MEM17_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x008c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x008c))
          #endif
        }
    }
    public struct INSTR_MEM17_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM17: INSTR_MEM17_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM17_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM17_Descriptor

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
                public var INSTR_MEM17: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM17_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM17_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM17_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM17_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM17: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM17_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM17)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM17_Field.self, BitField16.self)
                    self.raw.INSTR_MEM17 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Write-only access to instruction memory location 18
    public var INSTR_MEM18: Register<INSTR_MEM18_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0090), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0090))
          #endif
        }
    }
    public struct INSTR_MEM18_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM18: INSTR_MEM18_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM18_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM18_Descriptor

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
                public var INSTR_MEM18: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM18_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM18_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM18_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM18_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM18: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM18_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM18)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM18_Field.self, BitField16.self)
                    self.raw.INSTR_MEM18 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Write-only access to instruction memory location 19
    public var INSTR_MEM19: Register<INSTR_MEM19_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0094), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0094))
          #endif
        }
    }
    public struct INSTR_MEM19_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM19: INSTR_MEM19_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM19_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM19_Descriptor

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
                public var INSTR_MEM19: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM19_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM19_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM19_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM19_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM19: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM19_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM19)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM19_Field.self, BitField16.self)
                    self.raw.INSTR_MEM19 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Write-only access to instruction memory location 20
    public var INSTR_MEM20: Register<INSTR_MEM20_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0098), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0098))
          #endif
        }
    }
    public struct INSTR_MEM20_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM20: INSTR_MEM20_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM20_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM20_Descriptor

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
                public var INSTR_MEM20: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM20_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM20_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM20_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM20_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM20: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM20_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM20)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM20_Field.self, BitField16.self)
                    self.raw.INSTR_MEM20 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Write-only access to instruction memory location 21
    public var INSTR_MEM21: Register<INSTR_MEM21_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x009c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x009c))
          #endif
        }
    }
    public struct INSTR_MEM21_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM21: INSTR_MEM21_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM21_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM21_Descriptor

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
                public var INSTR_MEM21: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM21_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM21_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM21_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM21_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM21: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM21_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM21)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM21_Field.self, BitField16.self)
                    self.raw.INSTR_MEM21 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Write-only access to instruction memory location 22
    public var INSTR_MEM22: Register<INSTR_MEM22_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00a0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00a0))
          #endif
        }
    }
    public struct INSTR_MEM22_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM22: INSTR_MEM22_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM22_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM22_Descriptor

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
                public var INSTR_MEM22: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM22_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM22_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM22_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM22_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM22: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM22_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM22)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM22_Field.self, BitField16.self)
                    self.raw.INSTR_MEM22 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Write-only access to instruction memory location 23
    public var INSTR_MEM23: Register<INSTR_MEM23_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00a4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00a4))
          #endif
        }
    }
    public struct INSTR_MEM23_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM23: INSTR_MEM23_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM23_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM23_Descriptor

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
                public var INSTR_MEM23: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM23_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM23_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM23_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM23_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM23: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM23_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM23)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM23_Field.self, BitField16.self)
                    self.raw.INSTR_MEM23 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Write-only access to instruction memory location 24
    public var INSTR_MEM24: Register<INSTR_MEM24_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00a8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00a8))
          #endif
        }
    }
    public struct INSTR_MEM24_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM24: INSTR_MEM24_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM24_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM24_Descriptor

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
                public var INSTR_MEM24: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM24_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM24_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM24_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM24_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM24: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM24_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM24)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM24_Field.self, BitField16.self)
                    self.raw.INSTR_MEM24 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Write-only access to instruction memory location 25
    public var INSTR_MEM25: Register<INSTR_MEM25_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00ac), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00ac))
          #endif
        }
    }
    public struct INSTR_MEM25_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM25: INSTR_MEM25_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM25_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM25_Descriptor

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
                public var INSTR_MEM25: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM25_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM25_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM25_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM25_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM25: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM25_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM25)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM25_Field.self, BitField16.self)
                    self.raw.INSTR_MEM25 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Write-only access to instruction memory location 26
    public var INSTR_MEM26: Register<INSTR_MEM26_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00b0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00b0))
          #endif
        }
    }
    public struct INSTR_MEM26_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM26: INSTR_MEM26_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM26_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM26_Descriptor

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
                public var INSTR_MEM26: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM26_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM26_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM26_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM26_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM26: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM26_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM26)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM26_Field.self, BitField16.self)
                    self.raw.INSTR_MEM26 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Write-only access to instruction memory location 27
    public var INSTR_MEM27: Register<INSTR_MEM27_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00b4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00b4))
          #endif
        }
    }
    public struct INSTR_MEM27_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM27: INSTR_MEM27_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM27_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM27_Descriptor

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
                public var INSTR_MEM27: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM27_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM27_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM27_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM27_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM27: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM27_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM27)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM27_Field.self, BitField16.self)
                    self.raw.INSTR_MEM27 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Write-only access to instruction memory location 28
    public var INSTR_MEM28: Register<INSTR_MEM28_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00b8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00b8))
          #endif
        }
    }
    public struct INSTR_MEM28_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM28: INSTR_MEM28_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM28_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM28_Descriptor

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
                public var INSTR_MEM28: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM28_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM28_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM28_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM28_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM28: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM28_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM28)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM28_Field.self, BitField16.self)
                    self.raw.INSTR_MEM28 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Write-only access to instruction memory location 29
    public var INSTR_MEM29: Register<INSTR_MEM29_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00bc), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00bc))
          #endif
        }
    }
    public struct INSTR_MEM29_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM29: INSTR_MEM29_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM29_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM29_Descriptor

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
                public var INSTR_MEM29: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM29_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM29_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM29_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM29_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM29: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM29_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM29)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM29_Field.self, BitField16.self)
                    self.raw.INSTR_MEM29 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Write-only access to instruction memory location 30
    public var INSTR_MEM30: Register<INSTR_MEM30_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00c0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00c0))
          #endif
        }
    }
    public struct INSTR_MEM30_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM30: INSTR_MEM30_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM30_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM30_Descriptor

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
                public var INSTR_MEM30: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM30_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM30_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM30_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM30_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM30: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM30_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM30)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM30_Field.self, BitField16.self)
                    self.raw.INSTR_MEM30 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Write-only access to instruction memory location 31
    public var INSTR_MEM31: Register<INSTR_MEM31_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00c4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00c4))
          #endif
        }
    }
    public struct INSTR_MEM31_Descriptor {
        @available(*, unavailable)
        public var INSTR_MEM31: INSTR_MEM31_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum INSTR_MEM31_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = INSTR_MEM31_Descriptor

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
                public var INSTR_MEM31: UInt32 {
                @inlinable @inline(__always) get {
                    INSTR_MEM31_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    INSTR_MEM31_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INSTR_MEM31_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }

        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = INSTR_MEM31_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var INSTR_MEM31: BitField16 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(INSTR_MEM31_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.INSTR_MEM31)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(INSTR_MEM31_Field.self, BitField16.self)
                    self.raw.INSTR_MEM31 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Clock divisor register for state machine 0
    /// Frequency = clock freq / (CLKDIV_INT + CLKDIV_FRAC / 256)
    public var SM0_CLKDIV: Register<SM0_CLKDIV_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00c8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00c8))
          #endif
        }
    }
    public struct SM0_CLKDIV_Descriptor {
        @available(*, unavailable)
        /// Effective frequency is sysclk/(int + frac/256).
        /// Value of 0 is interpreted as 65536. If INT is 0, FRAC must also be 0.
        public var INT: INT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Fractional part of clock divisor
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
          public static let bitRange = 16 ..< 32
        }

        public enum FRAC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SM0_CLKDIV_Descriptor

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

                    public  typealias Value = SM0_CLKDIV_Descriptor
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

    /// Execution/behavioural settings for state machine 0
    public var SM0_EXECCTRL: Register<SM0_EXECCTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00cc), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00cc))
          #endif
        }
    }
    public struct SM0_EXECCTRL_Descriptor {
        @available(*, unavailable)
        /// If 1, an instruction written to SMx_INSTR is stalled, and latched by the state machine. Will clear to 0 once this instruction completes.
        public var EXEC_STALLED: EXEC_STALLED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the MSB of the Delay/Side-set instruction field is used as side-set enable, rather than a side-set data bit. This allows instructions to perform side-set optionally, rather than on every instruction, but the maximum possible side-set width is reduced from 5 to 4. Note that the value of PINCTRL_SIDESET_COUNT is inclusive of this enable bit.
        public var SIDE_EN: SIDE_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, side-set data is asserted to pin directions, instead of pin values
        public var SIDE_PINDIR: SIDE_PINDIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The GPIO number to use as condition for JMP PIN. Unaffected by input mapping.
        public var JMP_PIN: JMP_PIN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Which data bit to use for inline OUT enable
        public var OUT_EN_SEL: OUT_EN_SEL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, use a bit of OUT data as an auxiliary write enable
        /// When used in conjunction with OUT_STICKY, writes with an enable of 0 will
        /// deassert the latest pin write. This can create useful masking/override behaviour
        /// due to the priority ordering of state machine pin writes (SM0 < SM1 < ...)
        public var INLINE_OUT_EN: INLINE_OUT_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Continuously assert the most recent OUT/SET to the pins
        public var OUT_STICKY: OUT_STICKY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// After reaching this address, execution is wrapped to wrap_bottom.
        /// If the instruction is a jump, and the jump condition is true, the jump takes priority.
        public var WRAP_TOP: WRAP_TOP_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// After reaching wrap_top, execution is wrapped to this address.
        public var WRAP_BOTTOM: WRAP_BOTTOM_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Comparison used for the MOV x, STATUS instruction.
        public var STATUS_SEL: STATUS_SEL_Field {
            get {
                fatalError()
            }
        }

        public enum STATUS_SEL_Values: UInt, BitFieldProjectable {
            /// All-ones if TX FIFO level < N, otherwise all-zeroes
            case STATUS_SEL_TXLEVEL = 0
            /// All-ones if RX FIFO level < N, otherwise all-zeroes
            case STATUS_SEL_RXLEVEL = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// Comparison level for the MOV x, STATUS instruction
        public var STATUS_N: STATUS_N_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum EXEC_STALLED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum SIDE_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum SIDE_PINDIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum JMP_PIN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 29
        }

        public enum OUT_EN_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 24
        }

        public enum INLINE_OUT_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum OUT_STICKY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum WRAP_TOP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 17
        }

        public enum WRAP_BOTTOM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 12
        }

        public enum STATUS_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum STATUS_N_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 4
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SM0_EXECCTRL_Descriptor

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
                public var EXEC_STALLED: UInt32 {
                @inlinable @inline(__always) get {
                    EXEC_STALLED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    EXEC_STALLED_Field.insert(newValue, into: &self.storage)
                }
                }
              public var SIDE_EN: UInt32 {
                @inlinable @inline(__always) get {
                  SIDE_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SIDE_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SIDE_PINDIR: UInt32 {
                @inlinable @inline(__always) get {
                  SIDE_PINDIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SIDE_PINDIR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var JMP_PIN: UInt32 {
                @inlinable @inline(__always) get {
                  JMP_PIN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  JMP_PIN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUT_EN_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  OUT_EN_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUT_EN_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INLINE_OUT_EN: UInt32 {
                @inlinable @inline(__always) get {
                  INLINE_OUT_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INLINE_OUT_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUT_STICKY: UInt32 {
                @inlinable @inline(__always) get {
                  OUT_STICKY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUT_STICKY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var WRAP_TOP: UInt32 {
                @inlinable @inline(__always) get {
                  WRAP_TOP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  WRAP_TOP_Field.insert(newValue, into: &self.storage)
                }
              }
              public var WRAP_BOTTOM: UInt32 {
                @inlinable @inline(__always) get {
                  WRAP_BOTTOM_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  WRAP_BOTTOM_Field.insert(newValue, into: &self.storage)
                }
              }
              public var STATUS_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  STATUS_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  STATUS_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var STATUS_N: UInt32 {
                @inlinable @inline(__always) get {
                  STATUS_N_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  STATUS_N_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = SM0_EXECCTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var EXEC_STALLED: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(EXEC_STALLED_Field.self, Bool.self)
                    return Bool(storage: self.raw.EXEC_STALLED)
                }
                }
              public var SIDE_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SIDE_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SIDE_EN)
                }
              }
              public var SIDE_PINDIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SIDE_PINDIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.SIDE_PINDIR)
                }
              }
              public var JMP_PIN: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(JMP_PIN_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.JMP_PIN)
                }
              }
              public var OUT_EN_SEL: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUT_EN_SEL_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.OUT_EN_SEL)
                }
              }
              public var INLINE_OUT_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INLINE_OUT_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.INLINE_OUT_EN)
                }
              }
              public var OUT_STICKY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUT_STICKY_Field.self, Bool.self)
                  return Bool(storage: self.raw.OUT_STICKY)
                }
              }
              public var WRAP_TOP: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRAP_TOP_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.WRAP_TOP)
                }
              }
              public var WRAP_BOTTOM: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRAP_BOTTOM_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.WRAP_BOTTOM)
                }
              }
              public var STATUS_SEL: STATUS_SEL_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(STATUS_SEL_Field.self, STATUS_SEL_Values.self)
                  return STATUS_SEL_Values(storage: self.raw.STATUS_SEL)
                }
              }
              public var STATUS_N: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(STATUS_N_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.STATUS_N)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = SM0_EXECCTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var SIDE_EN: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SIDE_EN_Field.self, Bool.self)
                    return Bool(storage: self.raw.SIDE_EN)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(SIDE_EN_Field.self, Bool.self)
                    self.raw.SIDE_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var SIDE_PINDIR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SIDE_PINDIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.SIDE_PINDIR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SIDE_PINDIR_Field.self, Bool.self)
                  self.raw.SIDE_PINDIR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var JMP_PIN: BitField5 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(JMP_PIN_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.JMP_PIN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(JMP_PIN_Field.self, BitField5.self)
                  self.raw.JMP_PIN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OUT_EN_SEL: BitField5 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUT_EN_SEL_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.OUT_EN_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OUT_EN_SEL_Field.self, BitField5.self)
                  self.raw.OUT_EN_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INLINE_OUT_EN: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INLINE_OUT_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.INLINE_OUT_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INLINE_OUT_EN_Field.self, Bool.self)
                  self.raw.INLINE_OUT_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OUT_STICKY: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUT_STICKY_Field.self, Bool.self)
                  return Bool(storage: self.raw.OUT_STICKY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OUT_STICKY_Field.self, Bool.self)
                  self.raw.OUT_STICKY = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var WRAP_TOP: BitField5 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRAP_TOP_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.WRAP_TOP)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(WRAP_TOP_Field.self, BitField5.self)
                  self.raw.WRAP_TOP = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var WRAP_BOTTOM: BitField5 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRAP_BOTTOM_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.WRAP_BOTTOM)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(WRAP_BOTTOM_Field.self, BitField5.self)
                  self.raw.WRAP_BOTTOM = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var STATUS_SEL: STATUS_SEL_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(STATUS_SEL_Field.self, STATUS_SEL_Values.self)
                  return STATUS_SEL_Values(storage: self.raw.STATUS_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(STATUS_SEL_Field.self, STATUS_SEL_Values.self)
                  self.raw.STATUS_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var STATUS_N: BitField4 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(STATUS_N_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.STATUS_N)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(STATUS_N_Field.self, BitField4.self)
                  self.raw.STATUS_N = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Control behaviour of the input/output shift registers for state machine 0
    public var SM0_SHIFTCTRL: Register<SM0_SHIFTCTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00d0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00d0))
          #endif
        }
    }
    public struct SM0_SHIFTCTRL_Descriptor {
        @available(*, unavailable)
        /// When 1, RX FIFO steals the TX FIFO's storage, and becomes twice as deep.
        /// TX FIFO is disabled as a result (always reads as both full and empty).
        /// FIFOs are flushed when this bit is changed.
        public var FJOIN_RX: FJOIN_RX_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// When 1, TX FIFO steals the RX FIFO's storage, and becomes twice as deep.
        /// RX FIFO is disabled as a result (always reads as both full and empty).
        /// FIFOs are flushed when this bit is changed.
        public var FJOIN_TX: FJOIN_TX_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Number of bits shifted out of OSR before autopull, or conditional pull (PULL IFEMPTY), will take place.
        /// Write 0 for value of 32.
        public var PULL_THRESH: PULL_THRESH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Number of bits shifted into ISR before autopush, or conditional push (PUSH IFFULL), will take place.
        /// Write 0 for value of 32.
        public var PUSH_THRESH: PUSH_THRESH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 1 = shift out of output shift register to right. 0 = to left.
        public var OUT_SHIFTDIR: OUT_SHIFTDIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 1 = shift input shift register to right (data enters from left). 0 = to left.
        public var IN_SHIFTDIR: IN_SHIFTDIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Pull automatically when the output shift register is emptied, i.e. on or following an OUT instruction which causes the output shift counter to reach or exceed PULL_THRESH.
        public var AUTOPULL: AUTOPULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Push automatically when the input shift register is filled, i.e. on an IN instruction which causes the input shift counter to reach or exceed PUSH_THRESH.
        public var AUTOPUSH: AUTOPUSH_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FJOIN_RX_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum FJOIN_TX_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PULL_THRESH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 30
        }

        public enum PUSH_THRESH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 25
        }

        public enum OUT_SHIFTDIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum IN_SHIFTDIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum AUTOPULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum AUTOPUSH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SM0_SHIFTCTRL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FJOIN_RX: UInt32 {
                @inlinable @inline(__always) get {
                    FJOIN_RX_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FJOIN_RX_Field.insert(newValue, into: &self.storage)
                }
                }
              public var FJOIN_TX: UInt32 {
                @inlinable @inline(__always) get {
                  FJOIN_TX_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FJOIN_TX_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PULL_THRESH: UInt32 {
                @inlinable @inline(__always) get {
                  PULL_THRESH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PULL_THRESH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PUSH_THRESH: UInt32 {
                @inlinable @inline(__always) get {
                  PUSH_THRESH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PUSH_THRESH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUT_SHIFTDIR: UInt32 {
                @inlinable @inline(__always) get {
                  OUT_SHIFTDIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUT_SHIFTDIR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IN_SHIFTDIR: UInt32 {
                @inlinable @inline(__always) get {
                  IN_SHIFTDIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IN_SHIFTDIR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AUTOPULL: UInt32 {
                @inlinable @inline(__always) get {
                  AUTOPULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AUTOPULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AUTOPUSH: UInt32 {
                @inlinable @inline(__always) get {
                  AUTOPUSH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AUTOPUSH_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SM0_SHIFTCTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FJOIN_RX: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FJOIN_RX_Field.self, Bool.self)
                    return Bool(storage: self.raw.FJOIN_RX)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FJOIN_RX_Field.self, Bool.self)
                    self.raw.FJOIN_RX = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var FJOIN_TX: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FJOIN_TX_Field.self, Bool.self)
                  return Bool(storage: self.raw.FJOIN_TX)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FJOIN_TX_Field.self, Bool.self)
                  self.raw.FJOIN_TX = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PULL_THRESH: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PULL_THRESH_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.PULL_THRESH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PULL_THRESH_Field.self, BitField5.self)
                  self.raw.PULL_THRESH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PUSH_THRESH: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PUSH_THRESH_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.PUSH_THRESH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PUSH_THRESH_Field.self, BitField5.self)
                  self.raw.PUSH_THRESH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OUT_SHIFTDIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUT_SHIFTDIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.OUT_SHIFTDIR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OUT_SHIFTDIR_Field.self, Bool.self)
                  self.raw.OUT_SHIFTDIR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IN_SHIFTDIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IN_SHIFTDIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.IN_SHIFTDIR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IN_SHIFTDIR_Field.self, Bool.self)
                  self.raw.IN_SHIFTDIR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AUTOPULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AUTOPULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.AUTOPULL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AUTOPULL_Field.self, Bool.self)
                  self.raw.AUTOPULL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AUTOPUSH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AUTOPUSH_Field.self, Bool.self)
                  return Bool(storage: self.raw.AUTOPUSH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AUTOPUSH_Field.self, Bool.self)
                  self.raw.AUTOPUSH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Current instruction address of state machine 0
    public var SM0_ADDR: Register<SM0_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00d4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00d4))
          #endif
        }
    }
    public struct SM0_ADDR_Descriptor {
        @available(*, unavailable)
        public var SM0_ADDR: SM0_ADDR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SM0_ADDR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 5
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SM0_ADDR_Descriptor

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
                public var SM0_ADDR: UInt32 {
                @inlinable @inline(__always) get {
                    SM0_ADDR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SM0_ADDR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = SM0_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var SM0_ADDR: BitField5 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SM0_ADDR_Field.self, BitField5.self)
                    return BitField5(storage: self.raw.SM0_ADDR)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = SM0_ADDR_Descriptor
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

    /// Read to see the instruction currently addressed by state machine 0's program counter
    /// Write to execute an instruction immediately (including jumps) and then resume execution.
    public var SM0_INSTR: Register<SM0_INSTR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00d8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00d8))
          #endif
        }
    }
    public struct SM0_INSTR_Descriptor {
        @available(*, unavailable)
        public var SM0_INSTR: SM0_INSTR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SM0_INSTR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SM0_INSTR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var SM0_INSTR: UInt32 {
                @inlinable @inline(__always) get {
                    SM0_INSTR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SM0_INSTR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SM0_INSTR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var SM0_INSTR: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SM0_INSTR_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.SM0_INSTR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(SM0_INSTR_Field.self, BitField16.self)
                    self.raw.SM0_INSTR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// State machine pin control
    public var SM0_PINCTRL: Register<SM0_PINCTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00dc), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00dc))
          #endif
        }
    }
    public struct SM0_PINCTRL_Descriptor {
        @available(*, unavailable)
        /// The number of MSBs of the Delay/Side-set instruction field which are used for side-set. Inclusive of the enable bit, if present. Minimum of 0 (all delay bits, no side-set) and maximum of 5 (all side-set, no delay).
        public var SIDESET_COUNT: SIDESET_COUNT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of pins asserted by a SET. In the range 0 to 5 inclusive.
        public var SET_COUNT: SET_COUNT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of pins asserted by an OUT PINS, OUT PINDIRS or MOV PINS instruction. In the range 0 to 32 inclusive.
        public var OUT_COUNT: OUT_COUNT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The pin which is mapped to the least-significant bit of a state machine's IN data bus. Higher-numbered pins are mapped to consecutively more-significant data bits, with a modulo of 32 applied to pin number.
        public var IN_BASE: IN_BASE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The lowest-numbered pin that will be affected by a side-set operation. The MSBs of an instruction's side-set/delay field (up to 5, determined by SIDESET_COUNT) are used for side-set data, with the remaining LSBs used for delay. The least-significant bit of the side-set portion is the bit written to this pin, with more-significant bits written to higher-numbered pins.
        public var SIDESET_BASE: SIDESET_BASE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The lowest-numbered pin that will be affected by a SET PINS or SET PINDIRS instruction. The data written to this pin is the least-significant bit of the SET data.
        public var SET_BASE: SET_BASE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The lowest-numbered pin that will be affected by an OUT PINS, OUT PINDIRS or MOV PINS instruction. The data written to this pin will always be the least-significant bit of the OUT or MOV data.
        public var OUT_BASE: OUT_BASE_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SIDESET_COUNT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 32
        }

        public enum SET_COUNT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 29
        }

        public enum OUT_COUNT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 26
        }

        public enum IN_BASE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 20
        }

        public enum SIDESET_BASE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 15
        }

        public enum SET_BASE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 10
        }

        public enum OUT_BASE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 5
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SM0_PINCTRL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var SIDESET_COUNT: UInt32 {
                @inlinable @inline(__always) get {
                    SIDESET_COUNT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SIDESET_COUNT_Field.insert(newValue, into: &self.storage)
                }
                }
              public var SET_COUNT: UInt32 {
                @inlinable @inline(__always) get {
                  SET_COUNT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SET_COUNT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUT_COUNT: UInt32 {
                @inlinable @inline(__always) get {
                  OUT_COUNT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUT_COUNT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IN_BASE: UInt32 {
                @inlinable @inline(__always) get {
                  IN_BASE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IN_BASE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SIDESET_BASE: UInt32 {
                @inlinable @inline(__always) get {
                  SIDESET_BASE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SIDESET_BASE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SET_BASE: UInt32 {
                @inlinable @inline(__always) get {
                  SET_BASE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SET_BASE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUT_BASE: UInt32 {
                @inlinable @inline(__always) get {
                  OUT_BASE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUT_BASE_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SM0_PINCTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var SIDESET_COUNT: BitField3 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SIDESET_COUNT_Field.self, BitField3.self)
                    return BitField3(storage: self.raw.SIDESET_COUNT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(SIDESET_COUNT_Field.self, BitField3.self)
                    self.raw.SIDESET_COUNT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var SET_COUNT: BitField3 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SET_COUNT_Field.self, BitField3.self)
                  return BitField3(storage: self.raw.SET_COUNT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SET_COUNT_Field.self, BitField3.self)
                  self.raw.SET_COUNT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OUT_COUNT: BitField6 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUT_COUNT_Field.self, BitField6.self)
                  return BitField6(storage: self.raw.OUT_COUNT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OUT_COUNT_Field.self, BitField6.self)
                  self.raw.OUT_COUNT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IN_BASE: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IN_BASE_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.IN_BASE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IN_BASE_Field.self, BitField5.self)
                  self.raw.IN_BASE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SIDESET_BASE: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SIDESET_BASE_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.SIDESET_BASE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SIDESET_BASE_Field.self, BitField5.self)
                  self.raw.SIDESET_BASE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SET_BASE: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SET_BASE_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.SET_BASE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SET_BASE_Field.self, BitField5.self)
                  self.raw.SET_BASE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OUT_BASE: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUT_BASE_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.OUT_BASE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OUT_BASE_Field.self, BitField5.self)
                  self.raw.OUT_BASE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Clock divisor register for state machine 1
    /// Frequency = clock freq / (CLKDIV_INT + CLKDIV_FRAC / 256)
    public var SM1_CLKDIV: Register<SM1_CLKDIV_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00e0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00e0))
          #endif
        }
    }
    public struct SM1_CLKDIV_Descriptor {
        @available(*, unavailable)
        /// Effective frequency is sysclk/(int + frac/256).
        /// Value of 0 is interpreted as 65536. If INT is 0, FRAC must also be 0.
        public var INT: INT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Fractional part of clock divisor
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
          public static let bitRange = 16 ..< 32
        }

        public enum FRAC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SM1_CLKDIV_Descriptor

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

                    public  typealias Value = SM1_CLKDIV_Descriptor
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

    /// Execution/behavioural settings for state machine 1
    public var SM1_EXECCTRL: Register<SM1_EXECCTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00e4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00e4))
          #endif
        }
    }
    public struct SM1_EXECCTRL_Descriptor {
        @available(*, unavailable)
        /// If 1, an instruction written to SMx_INSTR is stalled, and latched by the state machine. Will clear to 0 once this instruction completes.
        public var EXEC_STALLED: EXEC_STALLED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the MSB of the Delay/Side-set instruction field is used as side-set enable, rather than a side-set data bit. This allows instructions to perform side-set optionally, rather than on every instruction, but the maximum possible side-set width is reduced from 5 to 4. Note that the value of PINCTRL_SIDESET_COUNT is inclusive of this enable bit.
        public var SIDE_EN: SIDE_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, side-set data is asserted to pin directions, instead of pin values
        public var SIDE_PINDIR: SIDE_PINDIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The GPIO number to use as condition for JMP PIN. Unaffected by input mapping.
        public var JMP_PIN: JMP_PIN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Which data bit to use for inline OUT enable
        public var OUT_EN_SEL: OUT_EN_SEL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, use a bit of OUT data as an auxiliary write enable
        /// When used in conjunction with OUT_STICKY, writes with an enable of 0 will
        /// deassert the latest pin write. This can create useful masking/override behaviour
        /// due to the priority ordering of state machine pin writes (SM0 < SM1 < ...)
        public var INLINE_OUT_EN: INLINE_OUT_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Continuously assert the most recent OUT/SET to the pins
        public var OUT_STICKY: OUT_STICKY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// After reaching this address, execution is wrapped to wrap_bottom.
        /// If the instruction is a jump, and the jump condition is true, the jump takes priority.
        public var WRAP_TOP: WRAP_TOP_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// After reaching wrap_top, execution is wrapped to this address.
        public var WRAP_BOTTOM: WRAP_BOTTOM_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Comparison used for the MOV x, STATUS instruction.
        public var STATUS_SEL: STATUS_SEL_Field {
            get {
                fatalError()
            }
        }

        public enum STATUS_SEL_Values: UInt, BitFieldProjectable {
            /// All-ones if TX FIFO level < N, otherwise all-zeroes
            case STATUS_SEL_TXLEVEL = 0
            /// All-ones if RX FIFO level < N, otherwise all-zeroes
            case STATUS_SEL_RXLEVEL = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// Comparison level for the MOV x, STATUS instruction
        public var STATUS_N: STATUS_N_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum EXEC_STALLED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum SIDE_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum SIDE_PINDIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum JMP_PIN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 29
        }

        public enum OUT_EN_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 24
        }

        public enum INLINE_OUT_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum OUT_STICKY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum WRAP_TOP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 17
        }

        public enum WRAP_BOTTOM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 12
        }

        public enum STATUS_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum STATUS_N_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 4
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SM1_EXECCTRL_Descriptor

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
                public var EXEC_STALLED: UInt32 {
                @inlinable @inline(__always) get {
                    EXEC_STALLED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    EXEC_STALLED_Field.insert(newValue, into: &self.storage)
                }
                }
              public var SIDE_EN: UInt32 {
                @inlinable @inline(__always) get {
                  SIDE_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SIDE_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SIDE_PINDIR: UInt32 {
                @inlinable @inline(__always) get {
                  SIDE_PINDIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SIDE_PINDIR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var JMP_PIN: UInt32 {
                @inlinable @inline(__always) get {
                  JMP_PIN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  JMP_PIN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUT_EN_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  OUT_EN_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUT_EN_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INLINE_OUT_EN: UInt32 {
                @inlinable @inline(__always) get {
                  INLINE_OUT_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INLINE_OUT_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUT_STICKY: UInt32 {
                @inlinable @inline(__always) get {
                  OUT_STICKY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUT_STICKY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var WRAP_TOP: UInt32 {
                @inlinable @inline(__always) get {
                  WRAP_TOP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  WRAP_TOP_Field.insert(newValue, into: &self.storage)
                }
              }
              public var WRAP_BOTTOM: UInt32 {
                @inlinable @inline(__always) get {
                  WRAP_BOTTOM_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  WRAP_BOTTOM_Field.insert(newValue, into: &self.storage)
                }
              }
              public var STATUS_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  STATUS_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  STATUS_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var STATUS_N: UInt32 {
                @inlinable @inline(__always) get {
                  STATUS_N_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  STATUS_N_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = SM1_EXECCTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var EXEC_STALLED: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(EXEC_STALLED_Field.self, Bool.self)
                    return Bool(storage: self.raw.EXEC_STALLED)
                }
                }
              public var SIDE_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SIDE_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SIDE_EN)
                }
              }
              public var SIDE_PINDIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SIDE_PINDIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.SIDE_PINDIR)
                }
              }
              public var JMP_PIN: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(JMP_PIN_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.JMP_PIN)
                }
              }
              public var OUT_EN_SEL: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUT_EN_SEL_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.OUT_EN_SEL)
                }
              }
              public var INLINE_OUT_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INLINE_OUT_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.INLINE_OUT_EN)
                }
              }
              public var OUT_STICKY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUT_STICKY_Field.self, Bool.self)
                  return Bool(storage: self.raw.OUT_STICKY)
                }
              }
              public var WRAP_TOP: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRAP_TOP_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.WRAP_TOP)
                }
              }
              public var WRAP_BOTTOM: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRAP_BOTTOM_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.WRAP_BOTTOM)
                }
              }
              public var STATUS_SEL: STATUS_SEL_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(STATUS_SEL_Field.self, STATUS_SEL_Values.self)
                  return STATUS_SEL_Values(storage: self.raw.STATUS_SEL)
                }
              }
              public var STATUS_N: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(STATUS_N_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.STATUS_N)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = SM1_EXECCTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var SIDE_EN: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SIDE_EN_Field.self, Bool.self)
                    return Bool(storage: self.raw.SIDE_EN)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(SIDE_EN_Field.self, Bool.self)
                    self.raw.SIDE_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var SIDE_PINDIR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SIDE_PINDIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.SIDE_PINDIR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SIDE_PINDIR_Field.self, Bool.self)
                  self.raw.SIDE_PINDIR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var JMP_PIN: BitField5 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(JMP_PIN_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.JMP_PIN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(JMP_PIN_Field.self, BitField5.self)
                  self.raw.JMP_PIN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OUT_EN_SEL: BitField5 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUT_EN_SEL_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.OUT_EN_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OUT_EN_SEL_Field.self, BitField5.self)
                  self.raw.OUT_EN_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INLINE_OUT_EN: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INLINE_OUT_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.INLINE_OUT_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INLINE_OUT_EN_Field.self, Bool.self)
                  self.raw.INLINE_OUT_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OUT_STICKY: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUT_STICKY_Field.self, Bool.self)
                  return Bool(storage: self.raw.OUT_STICKY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OUT_STICKY_Field.self, Bool.self)
                  self.raw.OUT_STICKY = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var WRAP_TOP: BitField5 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRAP_TOP_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.WRAP_TOP)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(WRAP_TOP_Field.self, BitField5.self)
                  self.raw.WRAP_TOP = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var WRAP_BOTTOM: BitField5 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRAP_BOTTOM_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.WRAP_BOTTOM)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(WRAP_BOTTOM_Field.self, BitField5.self)
                  self.raw.WRAP_BOTTOM = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var STATUS_SEL: STATUS_SEL_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(STATUS_SEL_Field.self, STATUS_SEL_Values.self)
                  return STATUS_SEL_Values(storage: self.raw.STATUS_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(STATUS_SEL_Field.self, STATUS_SEL_Values.self)
                  self.raw.STATUS_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var STATUS_N: BitField4 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(STATUS_N_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.STATUS_N)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(STATUS_N_Field.self, BitField4.self)
                  self.raw.STATUS_N = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Control behaviour of the input/output shift registers for state machine 1
    public var SM1_SHIFTCTRL: Register<SM1_SHIFTCTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00e8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00e8))
          #endif
        }
    }
    public struct SM1_SHIFTCTRL_Descriptor {
        @available(*, unavailable)
        /// When 1, RX FIFO steals the TX FIFO's storage, and becomes twice as deep.
        /// TX FIFO is disabled as a result (always reads as both full and empty).
        /// FIFOs are flushed when this bit is changed.
        public var FJOIN_RX: FJOIN_RX_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// When 1, TX FIFO steals the RX FIFO's storage, and becomes twice as deep.
        /// RX FIFO is disabled as a result (always reads as both full and empty).
        /// FIFOs are flushed when this bit is changed.
        public var FJOIN_TX: FJOIN_TX_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Number of bits shifted out of OSR before autopull, or conditional pull (PULL IFEMPTY), will take place.
        /// Write 0 for value of 32.
        public var PULL_THRESH: PULL_THRESH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Number of bits shifted into ISR before autopush, or conditional push (PUSH IFFULL), will take place.
        /// Write 0 for value of 32.
        public var PUSH_THRESH: PUSH_THRESH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 1 = shift out of output shift register to right. 0 = to left.
        public var OUT_SHIFTDIR: OUT_SHIFTDIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 1 = shift input shift register to right (data enters from left). 0 = to left.
        public var IN_SHIFTDIR: IN_SHIFTDIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Pull automatically when the output shift register is emptied, i.e. on or following an OUT instruction which causes the output shift counter to reach or exceed PULL_THRESH.
        public var AUTOPULL: AUTOPULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Push automatically when the input shift register is filled, i.e. on an IN instruction which causes the input shift counter to reach or exceed PUSH_THRESH.
        public var AUTOPUSH: AUTOPUSH_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FJOIN_RX_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum FJOIN_TX_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PULL_THRESH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 30
        }

        public enum PUSH_THRESH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 25
        }

        public enum OUT_SHIFTDIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum IN_SHIFTDIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum AUTOPULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum AUTOPUSH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SM1_SHIFTCTRL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FJOIN_RX: UInt32 {
                @inlinable @inline(__always) get {
                    FJOIN_RX_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FJOIN_RX_Field.insert(newValue, into: &self.storage)
                }
                }
              public var FJOIN_TX: UInt32 {
                @inlinable @inline(__always) get {
                  FJOIN_TX_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FJOIN_TX_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PULL_THRESH: UInt32 {
                @inlinable @inline(__always) get {
                  PULL_THRESH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PULL_THRESH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PUSH_THRESH: UInt32 {
                @inlinable @inline(__always) get {
                  PUSH_THRESH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PUSH_THRESH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUT_SHIFTDIR: UInt32 {
                @inlinable @inline(__always) get {
                  OUT_SHIFTDIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUT_SHIFTDIR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IN_SHIFTDIR: UInt32 {
                @inlinable @inline(__always) get {
                  IN_SHIFTDIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IN_SHIFTDIR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AUTOPULL: UInt32 {
                @inlinable @inline(__always) get {
                  AUTOPULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AUTOPULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AUTOPUSH: UInt32 {
                @inlinable @inline(__always) get {
                  AUTOPUSH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AUTOPUSH_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SM1_SHIFTCTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FJOIN_RX: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FJOIN_RX_Field.self, Bool.self)
                    return Bool(storage: self.raw.FJOIN_RX)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FJOIN_RX_Field.self, Bool.self)
                    self.raw.FJOIN_RX = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var FJOIN_TX: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FJOIN_TX_Field.self, Bool.self)
                  return Bool(storage: self.raw.FJOIN_TX)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FJOIN_TX_Field.self, Bool.self)
                  self.raw.FJOIN_TX = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PULL_THRESH: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PULL_THRESH_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.PULL_THRESH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PULL_THRESH_Field.self, BitField5.self)
                  self.raw.PULL_THRESH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PUSH_THRESH: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PUSH_THRESH_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.PUSH_THRESH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PUSH_THRESH_Field.self, BitField5.self)
                  self.raw.PUSH_THRESH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OUT_SHIFTDIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUT_SHIFTDIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.OUT_SHIFTDIR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OUT_SHIFTDIR_Field.self, Bool.self)
                  self.raw.OUT_SHIFTDIR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IN_SHIFTDIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IN_SHIFTDIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.IN_SHIFTDIR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IN_SHIFTDIR_Field.self, Bool.self)
                  self.raw.IN_SHIFTDIR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AUTOPULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AUTOPULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.AUTOPULL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AUTOPULL_Field.self, Bool.self)
                  self.raw.AUTOPULL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AUTOPUSH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AUTOPUSH_Field.self, Bool.self)
                  return Bool(storage: self.raw.AUTOPUSH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AUTOPUSH_Field.self, Bool.self)
                  self.raw.AUTOPUSH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Current instruction address of state machine 1
    public var SM1_ADDR: Register<SM1_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00ec), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00ec))
          #endif
        }
    }
    public struct SM1_ADDR_Descriptor {
        @available(*, unavailable)
        public var SM1_ADDR: SM1_ADDR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SM1_ADDR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 5
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SM1_ADDR_Descriptor

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
                public var SM1_ADDR: UInt32 {
                @inlinable @inline(__always) get {
                    SM1_ADDR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SM1_ADDR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = SM1_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var SM1_ADDR: BitField5 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SM1_ADDR_Field.self, BitField5.self)
                    return BitField5(storage: self.raw.SM1_ADDR)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = SM1_ADDR_Descriptor
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

    /// Read to see the instruction currently addressed by state machine 1's program counter
    /// Write to execute an instruction immediately (including jumps) and then resume execution.
    public var SM1_INSTR: Register<SM1_INSTR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00f0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00f0))
          #endif
        }
    }
    public struct SM1_INSTR_Descriptor {
        @available(*, unavailable)
        public var SM1_INSTR: SM1_INSTR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SM1_INSTR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SM1_INSTR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var SM1_INSTR: UInt32 {
                @inlinable @inline(__always) get {
                    SM1_INSTR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SM1_INSTR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SM1_INSTR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var SM1_INSTR: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SM1_INSTR_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.SM1_INSTR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(SM1_INSTR_Field.self, BitField16.self)
                    self.raw.SM1_INSTR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// State machine pin control
    public var SM1_PINCTRL: Register<SM1_PINCTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00f4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00f4))
          #endif
        }
    }
    public struct SM1_PINCTRL_Descriptor {
        @available(*, unavailable)
        /// The number of MSBs of the Delay/Side-set instruction field which are used for side-set. Inclusive of the enable bit, if present. Minimum of 0 (all delay bits, no side-set) and maximum of 5 (all side-set, no delay).
        public var SIDESET_COUNT: SIDESET_COUNT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of pins asserted by a SET. In the range 0 to 5 inclusive.
        public var SET_COUNT: SET_COUNT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of pins asserted by an OUT PINS, OUT PINDIRS or MOV PINS instruction. In the range 0 to 32 inclusive.
        public var OUT_COUNT: OUT_COUNT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The pin which is mapped to the least-significant bit of a state machine's IN data bus. Higher-numbered pins are mapped to consecutively more-significant data bits, with a modulo of 32 applied to pin number.
        public var IN_BASE: IN_BASE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The lowest-numbered pin that will be affected by a side-set operation. The MSBs of an instruction's side-set/delay field (up to 5, determined by SIDESET_COUNT) are used for side-set data, with the remaining LSBs used for delay. The least-significant bit of the side-set portion is the bit written to this pin, with more-significant bits written to higher-numbered pins.
        public var SIDESET_BASE: SIDESET_BASE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The lowest-numbered pin that will be affected by a SET PINS or SET PINDIRS instruction. The data written to this pin is the least-significant bit of the SET data.
        public var SET_BASE: SET_BASE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The lowest-numbered pin that will be affected by an OUT PINS, OUT PINDIRS or MOV PINS instruction. The data written to this pin will always be the least-significant bit of the OUT or MOV data.
        public var OUT_BASE: OUT_BASE_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SIDESET_COUNT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 32
        }

        public enum SET_COUNT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 29
        }

        public enum OUT_COUNT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 26
        }

        public enum IN_BASE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 20
        }

        public enum SIDESET_BASE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 15
        }

        public enum SET_BASE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 10
        }

        public enum OUT_BASE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 5
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SM1_PINCTRL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var SIDESET_COUNT: UInt32 {
                @inlinable @inline(__always) get {
                    SIDESET_COUNT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SIDESET_COUNT_Field.insert(newValue, into: &self.storage)
                }
                }
              public var SET_COUNT: UInt32 {
                @inlinable @inline(__always) get {
                  SET_COUNT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SET_COUNT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUT_COUNT: UInt32 {
                @inlinable @inline(__always) get {
                  OUT_COUNT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUT_COUNT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IN_BASE: UInt32 {
                @inlinable @inline(__always) get {
                  IN_BASE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IN_BASE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SIDESET_BASE: UInt32 {
                @inlinable @inline(__always) get {
                  SIDESET_BASE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SIDESET_BASE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SET_BASE: UInt32 {
                @inlinable @inline(__always) get {
                  SET_BASE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SET_BASE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUT_BASE: UInt32 {
                @inlinable @inline(__always) get {
                  OUT_BASE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUT_BASE_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SM1_PINCTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var SIDESET_COUNT: BitField3 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SIDESET_COUNT_Field.self, BitField3.self)
                    return BitField3(storage: self.raw.SIDESET_COUNT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(SIDESET_COUNT_Field.self, BitField3.self)
                    self.raw.SIDESET_COUNT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var SET_COUNT: BitField3 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SET_COUNT_Field.self, BitField3.self)
                  return BitField3(storage: self.raw.SET_COUNT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SET_COUNT_Field.self, BitField3.self)
                  self.raw.SET_COUNT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OUT_COUNT: BitField6 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUT_COUNT_Field.self, BitField6.self)
                  return BitField6(storage: self.raw.OUT_COUNT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OUT_COUNT_Field.self, BitField6.self)
                  self.raw.OUT_COUNT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IN_BASE: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IN_BASE_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.IN_BASE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IN_BASE_Field.self, BitField5.self)
                  self.raw.IN_BASE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SIDESET_BASE: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SIDESET_BASE_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.SIDESET_BASE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SIDESET_BASE_Field.self, BitField5.self)
                  self.raw.SIDESET_BASE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SET_BASE: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SET_BASE_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.SET_BASE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SET_BASE_Field.self, BitField5.self)
                  self.raw.SET_BASE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OUT_BASE: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUT_BASE_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.OUT_BASE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OUT_BASE_Field.self, BitField5.self)
                  self.raw.OUT_BASE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Clock divisor register for state machine 2
    /// Frequency = clock freq / (CLKDIV_INT + CLKDIV_FRAC / 256)
    public var SM2_CLKDIV: Register<SM2_CLKDIV_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00f8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00f8))
          #endif
        }
    }
    public struct SM2_CLKDIV_Descriptor {
        @available(*, unavailable)
        /// Effective frequency is sysclk/(int + frac/256).
        /// Value of 0 is interpreted as 65536. If INT is 0, FRAC must also be 0.
        public var INT: INT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Fractional part of clock divisor
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
          public static let bitRange = 16 ..< 32
        }

        public enum FRAC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SM2_CLKDIV_Descriptor

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

                    public  typealias Value = SM2_CLKDIV_Descriptor
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

    /// Execution/behavioural settings for state machine 2
    public var SM2_EXECCTRL: Register<SM2_EXECCTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00fc), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00fc))
          #endif
        }
    }
    public struct SM2_EXECCTRL_Descriptor {
        @available(*, unavailable)
        /// If 1, an instruction written to SMx_INSTR is stalled, and latched by the state machine. Will clear to 0 once this instruction completes.
        public var EXEC_STALLED: EXEC_STALLED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the MSB of the Delay/Side-set instruction field is used as side-set enable, rather than a side-set data bit. This allows instructions to perform side-set optionally, rather than on every instruction, but the maximum possible side-set width is reduced from 5 to 4. Note that the value of PINCTRL_SIDESET_COUNT is inclusive of this enable bit.
        public var SIDE_EN: SIDE_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, side-set data is asserted to pin directions, instead of pin values
        public var SIDE_PINDIR: SIDE_PINDIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The GPIO number to use as condition for JMP PIN. Unaffected by input mapping.
        public var JMP_PIN: JMP_PIN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Which data bit to use for inline OUT enable
        public var OUT_EN_SEL: OUT_EN_SEL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, use a bit of OUT data as an auxiliary write enable
        /// When used in conjunction with OUT_STICKY, writes with an enable of 0 will
        /// deassert the latest pin write. This can create useful masking/override behaviour
        /// due to the priority ordering of state machine pin writes (SM0 < SM1 < ...)
        public var INLINE_OUT_EN: INLINE_OUT_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Continuously assert the most recent OUT/SET to the pins
        public var OUT_STICKY: OUT_STICKY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// After reaching this address, execution is wrapped to wrap_bottom.
        /// If the instruction is a jump, and the jump condition is true, the jump takes priority.
        public var WRAP_TOP: WRAP_TOP_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// After reaching wrap_top, execution is wrapped to this address.
        public var WRAP_BOTTOM: WRAP_BOTTOM_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Comparison used for the MOV x, STATUS instruction.
        public var STATUS_SEL: STATUS_SEL_Field {
            get {
                fatalError()
            }
        }

        public enum STATUS_SEL_Values: UInt, BitFieldProjectable {
            /// All-ones if TX FIFO level < N, otherwise all-zeroes
            case STATUS_SEL_TXLEVEL = 0
            /// All-ones if RX FIFO level < N, otherwise all-zeroes
            case STATUS_SEL_RXLEVEL = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// Comparison level for the MOV x, STATUS instruction
        public var STATUS_N: STATUS_N_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum EXEC_STALLED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum SIDE_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum SIDE_PINDIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum JMP_PIN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 29
        }

        public enum OUT_EN_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 24
        }

        public enum INLINE_OUT_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum OUT_STICKY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum WRAP_TOP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 17
        }

        public enum WRAP_BOTTOM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 12
        }

        public enum STATUS_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum STATUS_N_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 4
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SM2_EXECCTRL_Descriptor

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
                public var EXEC_STALLED: UInt32 {
                @inlinable @inline(__always) get {
                    EXEC_STALLED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    EXEC_STALLED_Field.insert(newValue, into: &self.storage)
                }
                }
              public var SIDE_EN: UInt32 {
                @inlinable @inline(__always) get {
                  SIDE_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SIDE_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SIDE_PINDIR: UInt32 {
                @inlinable @inline(__always) get {
                  SIDE_PINDIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SIDE_PINDIR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var JMP_PIN: UInt32 {
                @inlinable @inline(__always) get {
                  JMP_PIN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  JMP_PIN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUT_EN_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  OUT_EN_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUT_EN_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INLINE_OUT_EN: UInt32 {
                @inlinable @inline(__always) get {
                  INLINE_OUT_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INLINE_OUT_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUT_STICKY: UInt32 {
                @inlinable @inline(__always) get {
                  OUT_STICKY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUT_STICKY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var WRAP_TOP: UInt32 {
                @inlinable @inline(__always) get {
                  WRAP_TOP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  WRAP_TOP_Field.insert(newValue, into: &self.storage)
                }
              }
              public var WRAP_BOTTOM: UInt32 {
                @inlinable @inline(__always) get {
                  WRAP_BOTTOM_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  WRAP_BOTTOM_Field.insert(newValue, into: &self.storage)
                }
              }
              public var STATUS_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  STATUS_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  STATUS_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var STATUS_N: UInt32 {
                @inlinable @inline(__always) get {
                  STATUS_N_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  STATUS_N_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = SM2_EXECCTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var EXEC_STALLED: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(EXEC_STALLED_Field.self, Bool.self)
                    return Bool(storage: self.raw.EXEC_STALLED)
                }
                }
              public var SIDE_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SIDE_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SIDE_EN)
                }
              }
              public var SIDE_PINDIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SIDE_PINDIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.SIDE_PINDIR)
                }
              }
              public var JMP_PIN: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(JMP_PIN_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.JMP_PIN)
                }
              }
              public var OUT_EN_SEL: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUT_EN_SEL_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.OUT_EN_SEL)
                }
              }
              public var INLINE_OUT_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INLINE_OUT_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.INLINE_OUT_EN)
                }
              }
              public var OUT_STICKY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUT_STICKY_Field.self, Bool.self)
                  return Bool(storage: self.raw.OUT_STICKY)
                }
              }
              public var WRAP_TOP: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRAP_TOP_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.WRAP_TOP)
                }
              }
              public var WRAP_BOTTOM: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRAP_BOTTOM_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.WRAP_BOTTOM)
                }
              }
              public var STATUS_SEL: STATUS_SEL_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(STATUS_SEL_Field.self, STATUS_SEL_Values.self)
                  return STATUS_SEL_Values(storage: self.raw.STATUS_SEL)
                }
              }
              public var STATUS_N: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(STATUS_N_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.STATUS_N)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = SM2_EXECCTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var SIDE_EN: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SIDE_EN_Field.self, Bool.self)
                    return Bool(storage: self.raw.SIDE_EN)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(SIDE_EN_Field.self, Bool.self)
                    self.raw.SIDE_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var SIDE_PINDIR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SIDE_PINDIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.SIDE_PINDIR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SIDE_PINDIR_Field.self, Bool.self)
                  self.raw.SIDE_PINDIR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var JMP_PIN: BitField5 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(JMP_PIN_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.JMP_PIN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(JMP_PIN_Field.self, BitField5.self)
                  self.raw.JMP_PIN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OUT_EN_SEL: BitField5 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUT_EN_SEL_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.OUT_EN_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OUT_EN_SEL_Field.self, BitField5.self)
                  self.raw.OUT_EN_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INLINE_OUT_EN: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INLINE_OUT_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.INLINE_OUT_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INLINE_OUT_EN_Field.self, Bool.self)
                  self.raw.INLINE_OUT_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OUT_STICKY: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUT_STICKY_Field.self, Bool.self)
                  return Bool(storage: self.raw.OUT_STICKY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OUT_STICKY_Field.self, Bool.self)
                  self.raw.OUT_STICKY = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var WRAP_TOP: BitField5 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRAP_TOP_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.WRAP_TOP)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(WRAP_TOP_Field.self, BitField5.self)
                  self.raw.WRAP_TOP = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var WRAP_BOTTOM: BitField5 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRAP_BOTTOM_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.WRAP_BOTTOM)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(WRAP_BOTTOM_Field.self, BitField5.self)
                  self.raw.WRAP_BOTTOM = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var STATUS_SEL: STATUS_SEL_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(STATUS_SEL_Field.self, STATUS_SEL_Values.self)
                  return STATUS_SEL_Values(storage: self.raw.STATUS_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(STATUS_SEL_Field.self, STATUS_SEL_Values.self)
                  self.raw.STATUS_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var STATUS_N: BitField4 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(STATUS_N_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.STATUS_N)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(STATUS_N_Field.self, BitField4.self)
                  self.raw.STATUS_N = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Control behaviour of the input/output shift registers for state machine 2
    public var SM2_SHIFTCTRL: Register<SM2_SHIFTCTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0100), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0100))
          #endif
        }
    }
    public struct SM2_SHIFTCTRL_Descriptor {
        @available(*, unavailable)
        /// When 1, RX FIFO steals the TX FIFO's storage, and becomes twice as deep.
        /// TX FIFO is disabled as a result (always reads as both full and empty).
        /// FIFOs are flushed when this bit is changed.
        public var FJOIN_RX: FJOIN_RX_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// When 1, TX FIFO steals the RX FIFO's storage, and becomes twice as deep.
        /// RX FIFO is disabled as a result (always reads as both full and empty).
        /// FIFOs are flushed when this bit is changed.
        public var FJOIN_TX: FJOIN_TX_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Number of bits shifted out of OSR before autopull, or conditional pull (PULL IFEMPTY), will take place.
        /// Write 0 for value of 32.
        public var PULL_THRESH: PULL_THRESH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Number of bits shifted into ISR before autopush, or conditional push (PUSH IFFULL), will take place.
        /// Write 0 for value of 32.
        public var PUSH_THRESH: PUSH_THRESH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 1 = shift out of output shift register to right. 0 = to left.
        public var OUT_SHIFTDIR: OUT_SHIFTDIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 1 = shift input shift register to right (data enters from left). 0 = to left.
        public var IN_SHIFTDIR: IN_SHIFTDIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Pull automatically when the output shift register is emptied, i.e. on or following an OUT instruction which causes the output shift counter to reach or exceed PULL_THRESH.
        public var AUTOPULL: AUTOPULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Push automatically when the input shift register is filled, i.e. on an IN instruction which causes the input shift counter to reach or exceed PUSH_THRESH.
        public var AUTOPUSH: AUTOPUSH_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FJOIN_RX_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum FJOIN_TX_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PULL_THRESH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 30
        }

        public enum PUSH_THRESH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 25
        }

        public enum OUT_SHIFTDIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum IN_SHIFTDIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum AUTOPULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum AUTOPUSH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SM2_SHIFTCTRL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FJOIN_RX: UInt32 {
                @inlinable @inline(__always) get {
                    FJOIN_RX_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FJOIN_RX_Field.insert(newValue, into: &self.storage)
                }
                }
              public var FJOIN_TX: UInt32 {
                @inlinable @inline(__always) get {
                  FJOIN_TX_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FJOIN_TX_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PULL_THRESH: UInt32 {
                @inlinable @inline(__always) get {
                  PULL_THRESH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PULL_THRESH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PUSH_THRESH: UInt32 {
                @inlinable @inline(__always) get {
                  PUSH_THRESH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PUSH_THRESH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUT_SHIFTDIR: UInt32 {
                @inlinable @inline(__always) get {
                  OUT_SHIFTDIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUT_SHIFTDIR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IN_SHIFTDIR: UInt32 {
                @inlinable @inline(__always) get {
                  IN_SHIFTDIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IN_SHIFTDIR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AUTOPULL: UInt32 {
                @inlinable @inline(__always) get {
                  AUTOPULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AUTOPULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AUTOPUSH: UInt32 {
                @inlinable @inline(__always) get {
                  AUTOPUSH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AUTOPUSH_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SM2_SHIFTCTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FJOIN_RX: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FJOIN_RX_Field.self, Bool.self)
                    return Bool(storage: self.raw.FJOIN_RX)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FJOIN_RX_Field.self, Bool.self)
                    self.raw.FJOIN_RX = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var FJOIN_TX: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FJOIN_TX_Field.self, Bool.self)
                  return Bool(storage: self.raw.FJOIN_TX)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FJOIN_TX_Field.self, Bool.self)
                  self.raw.FJOIN_TX = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PULL_THRESH: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PULL_THRESH_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.PULL_THRESH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PULL_THRESH_Field.self, BitField5.self)
                  self.raw.PULL_THRESH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PUSH_THRESH: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PUSH_THRESH_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.PUSH_THRESH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PUSH_THRESH_Field.self, BitField5.self)
                  self.raw.PUSH_THRESH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OUT_SHIFTDIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUT_SHIFTDIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.OUT_SHIFTDIR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OUT_SHIFTDIR_Field.self, Bool.self)
                  self.raw.OUT_SHIFTDIR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IN_SHIFTDIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IN_SHIFTDIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.IN_SHIFTDIR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IN_SHIFTDIR_Field.self, Bool.self)
                  self.raw.IN_SHIFTDIR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AUTOPULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AUTOPULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.AUTOPULL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AUTOPULL_Field.self, Bool.self)
                  self.raw.AUTOPULL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AUTOPUSH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AUTOPUSH_Field.self, Bool.self)
                  return Bool(storage: self.raw.AUTOPUSH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AUTOPUSH_Field.self, Bool.self)
                  self.raw.AUTOPUSH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Current instruction address of state machine 2
    public var SM2_ADDR: Register<SM2_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0104), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0104))
          #endif
        }
    }
    public struct SM2_ADDR_Descriptor {
        @available(*, unavailable)
        public var SM2_ADDR: SM2_ADDR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SM2_ADDR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 5
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SM2_ADDR_Descriptor

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
                public var SM2_ADDR: UInt32 {
                @inlinable @inline(__always) get {
                    SM2_ADDR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SM2_ADDR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = SM2_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var SM2_ADDR: BitField5 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SM2_ADDR_Field.self, BitField5.self)
                    return BitField5(storage: self.raw.SM2_ADDR)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = SM2_ADDR_Descriptor
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

    /// Read to see the instruction currently addressed by state machine 2's program counter
    /// Write to execute an instruction immediately (including jumps) and then resume execution.
    public var SM2_INSTR: Register<SM2_INSTR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0108), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0108))
          #endif
        }
    }
    public struct SM2_INSTR_Descriptor {
        @available(*, unavailable)
        public var SM2_INSTR: SM2_INSTR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SM2_INSTR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SM2_INSTR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var SM2_INSTR: UInt32 {
                @inlinable @inline(__always) get {
                    SM2_INSTR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SM2_INSTR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SM2_INSTR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var SM2_INSTR: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SM2_INSTR_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.SM2_INSTR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(SM2_INSTR_Field.self, BitField16.self)
                    self.raw.SM2_INSTR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// State machine pin control
    public var SM2_PINCTRL: Register<SM2_PINCTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x010c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x010c))
          #endif
        }
    }
    public struct SM2_PINCTRL_Descriptor {
        @available(*, unavailable)
        /// The number of MSBs of the Delay/Side-set instruction field which are used for side-set. Inclusive of the enable bit, if present. Minimum of 0 (all delay bits, no side-set) and maximum of 5 (all side-set, no delay).
        public var SIDESET_COUNT: SIDESET_COUNT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of pins asserted by a SET. In the range 0 to 5 inclusive.
        public var SET_COUNT: SET_COUNT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of pins asserted by an OUT PINS, OUT PINDIRS or MOV PINS instruction. In the range 0 to 32 inclusive.
        public var OUT_COUNT: OUT_COUNT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The pin which is mapped to the least-significant bit of a state machine's IN data bus. Higher-numbered pins are mapped to consecutively more-significant data bits, with a modulo of 32 applied to pin number.
        public var IN_BASE: IN_BASE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The lowest-numbered pin that will be affected by a side-set operation. The MSBs of an instruction's side-set/delay field (up to 5, determined by SIDESET_COUNT) are used for side-set data, with the remaining LSBs used for delay. The least-significant bit of the side-set portion is the bit written to this pin, with more-significant bits written to higher-numbered pins.
        public var SIDESET_BASE: SIDESET_BASE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The lowest-numbered pin that will be affected by a SET PINS or SET PINDIRS instruction. The data written to this pin is the least-significant bit of the SET data.
        public var SET_BASE: SET_BASE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The lowest-numbered pin that will be affected by an OUT PINS, OUT PINDIRS or MOV PINS instruction. The data written to this pin will always be the least-significant bit of the OUT or MOV data.
        public var OUT_BASE: OUT_BASE_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SIDESET_COUNT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 32
        }

        public enum SET_COUNT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 29
        }

        public enum OUT_COUNT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 26
        }

        public enum IN_BASE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 20
        }

        public enum SIDESET_BASE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 15
        }

        public enum SET_BASE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 10
        }

        public enum OUT_BASE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 5
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SM2_PINCTRL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var SIDESET_COUNT: UInt32 {
                @inlinable @inline(__always) get {
                    SIDESET_COUNT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SIDESET_COUNT_Field.insert(newValue, into: &self.storage)
                }
                }
              public var SET_COUNT: UInt32 {
                @inlinable @inline(__always) get {
                  SET_COUNT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SET_COUNT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUT_COUNT: UInt32 {
                @inlinable @inline(__always) get {
                  OUT_COUNT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUT_COUNT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IN_BASE: UInt32 {
                @inlinable @inline(__always) get {
                  IN_BASE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IN_BASE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SIDESET_BASE: UInt32 {
                @inlinable @inline(__always) get {
                  SIDESET_BASE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SIDESET_BASE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SET_BASE: UInt32 {
                @inlinable @inline(__always) get {
                  SET_BASE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SET_BASE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUT_BASE: UInt32 {
                @inlinable @inline(__always) get {
                  OUT_BASE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUT_BASE_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SM2_PINCTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var SIDESET_COUNT: BitField3 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SIDESET_COUNT_Field.self, BitField3.self)
                    return BitField3(storage: self.raw.SIDESET_COUNT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(SIDESET_COUNT_Field.self, BitField3.self)
                    self.raw.SIDESET_COUNT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var SET_COUNT: BitField3 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SET_COUNT_Field.self, BitField3.self)
                  return BitField3(storage: self.raw.SET_COUNT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SET_COUNT_Field.self, BitField3.self)
                  self.raw.SET_COUNT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OUT_COUNT: BitField6 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUT_COUNT_Field.self, BitField6.self)
                  return BitField6(storage: self.raw.OUT_COUNT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OUT_COUNT_Field.self, BitField6.self)
                  self.raw.OUT_COUNT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IN_BASE: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IN_BASE_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.IN_BASE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IN_BASE_Field.self, BitField5.self)
                  self.raw.IN_BASE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SIDESET_BASE: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SIDESET_BASE_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.SIDESET_BASE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SIDESET_BASE_Field.self, BitField5.self)
                  self.raw.SIDESET_BASE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SET_BASE: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SET_BASE_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.SET_BASE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SET_BASE_Field.self, BitField5.self)
                  self.raw.SET_BASE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OUT_BASE: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUT_BASE_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.OUT_BASE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OUT_BASE_Field.self, BitField5.self)
                  self.raw.OUT_BASE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Clock divisor register for state machine 3
    /// Frequency = clock freq / (CLKDIV_INT + CLKDIV_FRAC / 256)
    public var SM3_CLKDIV: Register<SM3_CLKDIV_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0110), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0110))
          #endif
        }
    }
    public struct SM3_CLKDIV_Descriptor {
        @available(*, unavailable)
        /// Effective frequency is sysclk/(int + frac/256).
        /// Value of 0 is interpreted as 65536. If INT is 0, FRAC must also be 0.
        public var INT: INT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Fractional part of clock divisor
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
          public static let bitRange = 16 ..< 32
        }

        public enum FRAC_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SM3_CLKDIV_Descriptor

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

                    public  typealias Value = SM3_CLKDIV_Descriptor
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

    /// Execution/behavioural settings for state machine 3
    public var SM3_EXECCTRL: Register<SM3_EXECCTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0114), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0114))
          #endif
        }
    }
    public struct SM3_EXECCTRL_Descriptor {
        @available(*, unavailable)
        /// If 1, an instruction written to SMx_INSTR is stalled, and latched by the state machine. Will clear to 0 once this instruction completes.
        public var EXEC_STALLED: EXEC_STALLED_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, the MSB of the Delay/Side-set instruction field is used as side-set enable, rather than a side-set data bit. This allows instructions to perform side-set optionally, rather than on every instruction, but the maximum possible side-set width is reduced from 5 to 4. Note that the value of PINCTRL_SIDESET_COUNT is inclusive of this enable bit.
        public var SIDE_EN: SIDE_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, side-set data is asserted to pin directions, instead of pin values
        public var SIDE_PINDIR: SIDE_PINDIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The GPIO number to use as condition for JMP PIN. Unaffected by input mapping.
        public var JMP_PIN: JMP_PIN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Which data bit to use for inline OUT enable
        public var OUT_EN_SEL: OUT_EN_SEL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// If 1, use a bit of OUT data as an auxiliary write enable
        /// When used in conjunction with OUT_STICKY, writes with an enable of 0 will
        /// deassert the latest pin write. This can create useful masking/override behaviour
        /// due to the priority ordering of state machine pin writes (SM0 < SM1 < ...)
        public var INLINE_OUT_EN: INLINE_OUT_EN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Continuously assert the most recent OUT/SET to the pins
        public var OUT_STICKY: OUT_STICKY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// After reaching this address, execution is wrapped to wrap_bottom.
        /// If the instruction is a jump, and the jump condition is true, the jump takes priority.
        public var WRAP_TOP: WRAP_TOP_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// After reaching wrap_top, execution is wrapped to this address.
        public var WRAP_BOTTOM: WRAP_BOTTOM_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Comparison used for the MOV x, STATUS instruction.
        public var STATUS_SEL: STATUS_SEL_Field {
            get {
                fatalError()
            }
        }

        public enum STATUS_SEL_Values: UInt, BitFieldProjectable {
            /// All-ones if TX FIFO level < N, otherwise all-zeroes
            case STATUS_SEL_TXLEVEL = 0
            /// All-ones if RX FIFO level < N, otherwise all-zeroes
            case STATUS_SEL_RXLEVEL = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// Comparison level for the MOV x, STATUS instruction
        public var STATUS_N: STATUS_N_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum EXEC_STALLED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum SIDE_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum SIDE_PINDIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 30
        }

        public enum JMP_PIN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 29
        }

        public enum OUT_EN_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 24
        }

        public enum INLINE_OUT_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum OUT_STICKY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum WRAP_TOP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 17
        }

        public enum WRAP_BOTTOM_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 12
        }

        public enum STATUS_SEL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum STATUS_N_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 4
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SM3_EXECCTRL_Descriptor

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
                public var EXEC_STALLED: UInt32 {
                @inlinable @inline(__always) get {
                    EXEC_STALLED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    EXEC_STALLED_Field.insert(newValue, into: &self.storage)
                }
                }
              public var SIDE_EN: UInt32 {
                @inlinable @inline(__always) get {
                  SIDE_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SIDE_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SIDE_PINDIR: UInt32 {
                @inlinable @inline(__always) get {
                  SIDE_PINDIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SIDE_PINDIR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var JMP_PIN: UInt32 {
                @inlinable @inline(__always) get {
                  JMP_PIN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  JMP_PIN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUT_EN_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  OUT_EN_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUT_EN_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INLINE_OUT_EN: UInt32 {
                @inlinable @inline(__always) get {
                  INLINE_OUT_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INLINE_OUT_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUT_STICKY: UInt32 {
                @inlinable @inline(__always) get {
                  OUT_STICKY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUT_STICKY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var WRAP_TOP: UInt32 {
                @inlinable @inline(__always) get {
                  WRAP_TOP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  WRAP_TOP_Field.insert(newValue, into: &self.storage)
                }
              }
              public var WRAP_BOTTOM: UInt32 {
                @inlinable @inline(__always) get {
                  WRAP_BOTTOM_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  WRAP_BOTTOM_Field.insert(newValue, into: &self.storage)
                }
              }
              public var STATUS_SEL: UInt32 {
                @inlinable @inline(__always) get {
                  STATUS_SEL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  STATUS_SEL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var STATUS_N: UInt32 {
                @inlinable @inline(__always) get {
                  STATUS_N_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  STATUS_N_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = SM3_EXECCTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var EXEC_STALLED: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(EXEC_STALLED_Field.self, Bool.self)
                    return Bool(storage: self.raw.EXEC_STALLED)
                }
                }
              public var SIDE_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SIDE_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.SIDE_EN)
                }
              }
              public var SIDE_PINDIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SIDE_PINDIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.SIDE_PINDIR)
                }
              }
              public var JMP_PIN: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(JMP_PIN_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.JMP_PIN)
                }
              }
              public var OUT_EN_SEL: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUT_EN_SEL_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.OUT_EN_SEL)
                }
              }
              public var INLINE_OUT_EN: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INLINE_OUT_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.INLINE_OUT_EN)
                }
              }
              public var OUT_STICKY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUT_STICKY_Field.self, Bool.self)
                  return Bool(storage: self.raw.OUT_STICKY)
                }
              }
              public var WRAP_TOP: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRAP_TOP_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.WRAP_TOP)
                }
              }
              public var WRAP_BOTTOM: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRAP_BOTTOM_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.WRAP_BOTTOM)
                }
              }
              public var STATUS_SEL: STATUS_SEL_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(STATUS_SEL_Field.self, STATUS_SEL_Values.self)
                  return STATUS_SEL_Values(storage: self.raw.STATUS_SEL)
                }
              }
              public var STATUS_N: BitField4 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(STATUS_N_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.STATUS_N)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = SM3_EXECCTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var SIDE_EN: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SIDE_EN_Field.self, Bool.self)
                    return Bool(storage: self.raw.SIDE_EN)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(SIDE_EN_Field.self, Bool.self)
                    self.raw.SIDE_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var SIDE_PINDIR: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SIDE_PINDIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.SIDE_PINDIR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SIDE_PINDIR_Field.self, Bool.self)
                  self.raw.SIDE_PINDIR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var JMP_PIN: BitField5 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(JMP_PIN_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.JMP_PIN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(JMP_PIN_Field.self, BitField5.self)
                  self.raw.JMP_PIN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OUT_EN_SEL: BitField5 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUT_EN_SEL_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.OUT_EN_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OUT_EN_SEL_Field.self, BitField5.self)
                  self.raw.OUT_EN_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var INLINE_OUT_EN: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INLINE_OUT_EN_Field.self, Bool.self)
                  return Bool(storage: self.raw.INLINE_OUT_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(INLINE_OUT_EN_Field.self, Bool.self)
                  self.raw.INLINE_OUT_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OUT_STICKY: Bool {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUT_STICKY_Field.self, Bool.self)
                  return Bool(storage: self.raw.OUT_STICKY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OUT_STICKY_Field.self, Bool.self)
                  self.raw.OUT_STICKY = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var WRAP_TOP: BitField5 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRAP_TOP_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.WRAP_TOP)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(WRAP_TOP_Field.self, BitField5.self)
                  self.raw.WRAP_TOP = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var WRAP_BOTTOM: BitField5 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(WRAP_BOTTOM_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.WRAP_BOTTOM)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(WRAP_BOTTOM_Field.self, BitField5.self)
                  self.raw.WRAP_BOTTOM = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var STATUS_SEL: STATUS_SEL_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(STATUS_SEL_Field.self, STATUS_SEL_Values.self)
                  return STATUS_SEL_Values(storage: self.raw.STATUS_SEL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(STATUS_SEL_Field.self, STATUS_SEL_Values.self)
                  self.raw.STATUS_SEL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var STATUS_N: BitField4 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(STATUS_N_Field.self, BitField4.self)
                  return BitField4(storage: self.raw.STATUS_N)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(STATUS_N_Field.self, BitField4.self)
                  self.raw.STATUS_N = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Control behaviour of the input/output shift registers for state machine 3
    public var SM3_SHIFTCTRL: Register<SM3_SHIFTCTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0118), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0118))
          #endif
        }
    }
    public struct SM3_SHIFTCTRL_Descriptor {
        @available(*, unavailable)
        /// When 1, RX FIFO steals the TX FIFO's storage, and becomes twice as deep.
        /// TX FIFO is disabled as a result (always reads as both full and empty).
        /// FIFOs are flushed when this bit is changed.
        public var FJOIN_RX: FJOIN_RX_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// When 1, TX FIFO steals the RX FIFO's storage, and becomes twice as deep.
        /// RX FIFO is disabled as a result (always reads as both full and empty).
        /// FIFOs are flushed when this bit is changed.
        public var FJOIN_TX: FJOIN_TX_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Number of bits shifted out of OSR before autopull, or conditional pull (PULL IFEMPTY), will take place.
        /// Write 0 for value of 32.
        public var PULL_THRESH: PULL_THRESH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Number of bits shifted into ISR before autopush, or conditional push (PUSH IFFULL), will take place.
        /// Write 0 for value of 32.
        public var PUSH_THRESH: PUSH_THRESH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 1 = shift out of output shift register to right. 0 = to left.
        public var OUT_SHIFTDIR: OUT_SHIFTDIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// 1 = shift input shift register to right (data enters from left). 0 = to left.
        public var IN_SHIFTDIR: IN_SHIFTDIR_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Pull automatically when the output shift register is emptied, i.e. on or following an OUT instruction which causes the output shift counter to reach or exceed PULL_THRESH.
        public var AUTOPULL: AUTOPULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Push automatically when the input shift register is filled, i.e. on an IN instruction which causes the input shift counter to reach or exceed PUSH_THRESH.
        public var AUTOPUSH: AUTOPUSH_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FJOIN_RX_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 31 ..< 32
        }

        public enum FJOIN_TX_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 30 ..< 31
        }

        public enum PULL_THRESH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 25 ..< 30
        }

        public enum PUSH_THRESH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 25
        }

        public enum OUT_SHIFTDIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum IN_SHIFTDIR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum AUTOPULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum AUTOPUSH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SM3_SHIFTCTRL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FJOIN_RX: UInt32 {
                @inlinable @inline(__always) get {
                    FJOIN_RX_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FJOIN_RX_Field.insert(newValue, into: &self.storage)
                }
                }
              public var FJOIN_TX: UInt32 {
                @inlinable @inline(__always) get {
                  FJOIN_TX_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FJOIN_TX_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PULL_THRESH: UInt32 {
                @inlinable @inline(__always) get {
                  PULL_THRESH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PULL_THRESH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var PUSH_THRESH: UInt32 {
                @inlinable @inline(__always) get {
                  PUSH_THRESH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  PUSH_THRESH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUT_SHIFTDIR: UInt32 {
                @inlinable @inline(__always) get {
                  OUT_SHIFTDIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUT_SHIFTDIR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IN_SHIFTDIR: UInt32 {
                @inlinable @inline(__always) get {
                  IN_SHIFTDIR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IN_SHIFTDIR_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AUTOPULL: UInt32 {
                @inlinable @inline(__always) get {
                  AUTOPULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AUTOPULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var AUTOPUSH: UInt32 {
                @inlinable @inline(__always) get {
                  AUTOPUSH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  AUTOPUSH_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SM3_SHIFTCTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FJOIN_RX: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FJOIN_RX_Field.self, Bool.self)
                    return Bool(storage: self.raw.FJOIN_RX)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FJOIN_RX_Field.self, Bool.self)
                    self.raw.FJOIN_RX = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var FJOIN_TX: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FJOIN_TX_Field.self, Bool.self)
                  return Bool(storage: self.raw.FJOIN_TX)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(FJOIN_TX_Field.self, Bool.self)
                  self.raw.FJOIN_TX = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PULL_THRESH: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PULL_THRESH_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.PULL_THRESH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PULL_THRESH_Field.self, BitField5.self)
                  self.raw.PULL_THRESH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var PUSH_THRESH: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(PUSH_THRESH_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.PUSH_THRESH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(PUSH_THRESH_Field.self, BitField5.self)
                  self.raw.PUSH_THRESH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OUT_SHIFTDIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUT_SHIFTDIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.OUT_SHIFTDIR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OUT_SHIFTDIR_Field.self, Bool.self)
                  self.raw.OUT_SHIFTDIR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IN_SHIFTDIR: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IN_SHIFTDIR_Field.self, Bool.self)
                  return Bool(storage: self.raw.IN_SHIFTDIR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IN_SHIFTDIR_Field.self, Bool.self)
                  self.raw.IN_SHIFTDIR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AUTOPULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AUTOPULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.AUTOPULL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AUTOPULL_Field.self, Bool.self)
                  self.raw.AUTOPULL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var AUTOPUSH: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(AUTOPUSH_Field.self, Bool.self)
                  return Bool(storage: self.raw.AUTOPUSH)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(AUTOPUSH_Field.self, Bool.self)
                  self.raw.AUTOPUSH = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Current instruction address of state machine 3
    public var SM3_ADDR: Register<SM3_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x011c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x011c))
          #endif
        }
    }
    public struct SM3_ADDR_Descriptor {
        @available(*, unavailable)
        public var SM3_ADDR: SM3_ADDR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SM3_ADDR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 5
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SM3_ADDR_Descriptor

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
                public var SM3_ADDR: UInt32 {
                @inlinable @inline(__always) get {
                    SM3_ADDR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SM3_ADDR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = SM3_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var SM3_ADDR: BitField5 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SM3_ADDR_Field.self, BitField5.self)
                    return BitField5(storage: self.raw.SM3_ADDR)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = SM3_ADDR_Descriptor
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

    /// Read to see the instruction currently addressed by state machine 3's program counter
    /// Write to execute an instruction immediately (including jumps) and then resume execution.
    public var SM3_INSTR: Register<SM3_INSTR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0120), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0120))
          #endif
        }
    }
    public struct SM3_INSTR_Descriptor {
        @available(*, unavailable)
        public var SM3_INSTR: SM3_INSTR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SM3_INSTR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SM3_INSTR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var SM3_INSTR: UInt32 {
                @inlinable @inline(__always) get {
                    SM3_INSTR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SM3_INSTR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SM3_INSTR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var SM3_INSTR: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SM3_INSTR_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.SM3_INSTR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(SM3_INSTR_Field.self, BitField16.self)
                    self.raw.SM3_INSTR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// State machine pin control
    public var SM3_PINCTRL: Register<SM3_PINCTRL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0124), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0124))
          #endif
        }
    }
    public struct SM3_PINCTRL_Descriptor {
        @available(*, unavailable)
        /// The number of MSBs of the Delay/Side-set instruction field which are used for side-set. Inclusive of the enable bit, if present. Minimum of 0 (all delay bits, no side-set) and maximum of 5 (all side-set, no delay).
        public var SIDESET_COUNT: SIDESET_COUNT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of pins asserted by a SET. In the range 0 to 5 inclusive.
        public var SET_COUNT: SET_COUNT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The number of pins asserted by an OUT PINS, OUT PINDIRS or MOV PINS instruction. In the range 0 to 32 inclusive.
        public var OUT_COUNT: OUT_COUNT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The pin which is mapped to the least-significant bit of a state machine's IN data bus. Higher-numbered pins are mapped to consecutively more-significant data bits, with a modulo of 32 applied to pin number.
        public var IN_BASE: IN_BASE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The lowest-numbered pin that will be affected by a side-set operation. The MSBs of an instruction's side-set/delay field (up to 5, determined by SIDESET_COUNT) are used for side-set data, with the remaining LSBs used for delay. The least-significant bit of the side-set portion is the bit written to this pin, with more-significant bits written to higher-numbered pins.
        public var SIDESET_BASE: SIDESET_BASE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The lowest-numbered pin that will be affected by a SET PINS or SET PINDIRS instruction. The data written to this pin is the least-significant bit of the SET data.
        public var SET_BASE: SET_BASE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// The lowest-numbered pin that will be affected by an OUT PINS, OUT PINDIRS or MOV PINS instruction. The data written to this pin will always be the least-significant bit of the OUT or MOV data.
        public var OUT_BASE: OUT_BASE_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SIDESET_COUNT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 29 ..< 32
        }

        public enum SET_COUNT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 26 ..< 29
        }

        public enum OUT_COUNT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 26
        }

        public enum IN_BASE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 20
        }

        public enum SIDESET_BASE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 15
        }

        public enum SET_BASE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 10
        }

        public enum OUT_BASE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 5
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = SM3_PINCTRL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var SIDESET_COUNT: UInt32 {
                @inlinable @inline(__always) get {
                    SIDESET_COUNT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SIDESET_COUNT_Field.insert(newValue, into: &self.storage)
                }
                }
              public var SET_COUNT: UInt32 {
                @inlinable @inline(__always) get {
                  SET_COUNT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SET_COUNT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUT_COUNT: UInt32 {
                @inlinable @inline(__always) get {
                  OUT_COUNT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUT_COUNT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IN_BASE: UInt32 {
                @inlinable @inline(__always) get {
                  IN_BASE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IN_BASE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SIDESET_BASE: UInt32 {
                @inlinable @inline(__always) get {
                  SIDESET_BASE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SIDESET_BASE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SET_BASE: UInt32 {
                @inlinable @inline(__always) get {
                  SET_BASE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SET_BASE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var OUT_BASE: UInt32 {
                @inlinable @inline(__always) get {
                  OUT_BASE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  OUT_BASE_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = SM3_PINCTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var SIDESET_COUNT: BitField3 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SIDESET_COUNT_Field.self, BitField3.self)
                    return BitField3(storage: self.raw.SIDESET_COUNT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(SIDESET_COUNT_Field.self, BitField3.self)
                    self.raw.SIDESET_COUNT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var SET_COUNT: BitField3 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SET_COUNT_Field.self, BitField3.self)
                  return BitField3(storage: self.raw.SET_COUNT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SET_COUNT_Field.self, BitField3.self)
                  self.raw.SET_COUNT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OUT_COUNT: BitField6 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUT_COUNT_Field.self, BitField6.self)
                  return BitField6(storage: self.raw.OUT_COUNT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OUT_COUNT_Field.self, BitField6.self)
                  self.raw.OUT_COUNT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IN_BASE: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IN_BASE_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.IN_BASE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IN_BASE_Field.self, BitField5.self)
                  self.raw.IN_BASE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SIDESET_BASE: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SIDESET_BASE_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.SIDESET_BASE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SIDESET_BASE_Field.self, BitField5.self)
                  self.raw.SIDESET_BASE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SET_BASE: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SET_BASE_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.SET_BASE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SET_BASE_Field.self, BitField5.self)
                  self.raw.SET_BASE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var OUT_BASE: BitField5 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(OUT_BASE_Field.self, BitField5.self)
                  return BitField5(storage: self.raw.OUT_BASE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(OUT_BASE_Field.self, BitField5.self)
                  self.raw.OUT_BASE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Raw Interrupts
    public var INTR: Register<INTR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0128), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0128))
          #endif
        }
    }
    public struct INTR_Descriptor {
        @available(*, unavailable)
        public var SM3: SM3_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM2: SM2_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM1: SM1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM0: SM0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM3_TXNFULL: SM3_TXNFULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM2_TXNFULL: SM2_TXNFULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM1_TXNFULL: SM1_TXNFULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM0_TXNFULL: SM0_TXNFULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM3_RXNEMPTY: SM3_RXNEMPTY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM2_RXNEMPTY: SM2_RXNEMPTY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM1_RXNEMPTY: SM1_RXNEMPTY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM0_RXNEMPTY: SM0_RXNEMPTY_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SM3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum SM2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum SM1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum SM0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum SM3_TXNFULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum SM2_TXNFULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum SM1_TXNFULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum SM0_TXNFULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum SM3_RXNEMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum SM2_RXNEMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum SM1_RXNEMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum SM0_RXNEMPTY_Field: ContiguousBitField {
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
                public var SM3: UInt32 {
                @inlinable @inline(__always) get {
                    SM3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SM3_Field.insert(newValue, into: &self.storage)
                }
                }
              public var SM2: UInt32 {
                @inlinable @inline(__always) get {
                  SM2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM2_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM1: UInt32 {
                @inlinable @inline(__always) get {
                  SM1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM0: UInt32 {
                @inlinable @inline(__always) get {
                  SM0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM3_TXNFULL: UInt32 {
                @inlinable @inline(__always) get {
                  SM3_TXNFULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM3_TXNFULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM2_TXNFULL: UInt32 {
                @inlinable @inline(__always) get {
                  SM2_TXNFULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM2_TXNFULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM1_TXNFULL: UInt32 {
                @inlinable @inline(__always) get {
                  SM1_TXNFULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM1_TXNFULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM0_TXNFULL: UInt32 {
                @inlinable @inline(__always) get {
                  SM0_TXNFULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM0_TXNFULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM3_RXNEMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  SM3_RXNEMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM3_RXNEMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM2_RXNEMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  SM2_RXNEMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM2_RXNEMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM1_RXNEMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  SM1_RXNEMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM1_RXNEMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM0_RXNEMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  SM0_RXNEMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM0_RXNEMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = INTR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var SM3: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SM3_Field.self, Bool.self)
                    return Bool(storage: self.raw.SM3)
                }
                }
              public var SM2: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM2_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM2)
                }
              }
              public var SM1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM1_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM1)
                }
              }
              public var SM0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM0_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM0)
                }
              }
              public var SM3_TXNFULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM3_TXNFULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM3_TXNFULL)
                }
              }
              public var SM2_TXNFULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM2_TXNFULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM2_TXNFULL)
                }
              }
              public var SM1_TXNFULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM1_TXNFULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM1_TXNFULL)
                }
              }
              public var SM0_TXNFULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM0_TXNFULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM0_TXNFULL)
                }
              }
              public var SM3_RXNEMPTY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM3_RXNEMPTY_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM3_RXNEMPTY)
                }
              }
              public var SM2_RXNEMPTY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM2_RXNEMPTY_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM2_RXNEMPTY)
                }
              }
              public var SM1_RXNEMPTY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM1_RXNEMPTY_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM1_RXNEMPTY)
                }
              }
              public var SM0_RXNEMPTY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM0_RXNEMPTY_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM0_RXNEMPTY)
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

    /// Interrupt Enable for irq0
    public var IRQ0_INTE: Register<IRQ0_INTE_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x012c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x012c))
          #endif
        }
    }
    public struct IRQ0_INTE_Descriptor {
        @available(*, unavailable)
        public var SM3: SM3_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM2: SM2_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM1: SM1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM0: SM0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM3_TXNFULL: SM3_TXNFULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM2_TXNFULL: SM2_TXNFULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM1_TXNFULL: SM1_TXNFULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM0_TXNFULL: SM0_TXNFULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM3_RXNEMPTY: SM3_RXNEMPTY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM2_RXNEMPTY: SM2_RXNEMPTY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM1_RXNEMPTY: SM1_RXNEMPTY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM0_RXNEMPTY: SM0_RXNEMPTY_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SM3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum SM2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum SM1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum SM0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum SM3_TXNFULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum SM2_TXNFULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum SM1_TXNFULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum SM0_TXNFULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum SM3_RXNEMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum SM2_RXNEMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum SM1_RXNEMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum SM0_RXNEMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IRQ0_INTE_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var SM3: UInt32 {
                @inlinable @inline(__always) get {
                    SM3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SM3_Field.insert(newValue, into: &self.storage)
                }
                }
              public var SM2: UInt32 {
                @inlinable @inline(__always) get {
                  SM2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM2_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM1: UInt32 {
                @inlinable @inline(__always) get {
                  SM1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM0: UInt32 {
                @inlinable @inline(__always) get {
                  SM0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM3_TXNFULL: UInt32 {
                @inlinable @inline(__always) get {
                  SM3_TXNFULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM3_TXNFULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM2_TXNFULL: UInt32 {
                @inlinable @inline(__always) get {
                  SM2_TXNFULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM2_TXNFULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM1_TXNFULL: UInt32 {
                @inlinable @inline(__always) get {
                  SM1_TXNFULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM1_TXNFULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM0_TXNFULL: UInt32 {
                @inlinable @inline(__always) get {
                  SM0_TXNFULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM0_TXNFULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM3_RXNEMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  SM3_RXNEMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM3_RXNEMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM2_RXNEMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  SM2_RXNEMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM2_RXNEMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM1_RXNEMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  SM1_RXNEMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM1_RXNEMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM0_RXNEMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  SM0_RXNEMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM0_RXNEMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = IRQ0_INTE_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var SM3: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SM3_Field.self, Bool.self)
                    return Bool(storage: self.raw.SM3)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(SM3_Field.self, Bool.self)
                    self.raw.SM3 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var SM2: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM2_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM2)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM2_Field.self, Bool.self)
                  self.raw.SM2 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM1_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM1_Field.self, Bool.self)
                  self.raw.SM1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM0_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM0_Field.self, Bool.self)
                  self.raw.SM0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM3_TXNFULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM3_TXNFULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM3_TXNFULL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM3_TXNFULL_Field.self, Bool.self)
                  self.raw.SM3_TXNFULL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM2_TXNFULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM2_TXNFULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM2_TXNFULL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM2_TXNFULL_Field.self, Bool.self)
                  self.raw.SM2_TXNFULL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM1_TXNFULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM1_TXNFULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM1_TXNFULL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM1_TXNFULL_Field.self, Bool.self)
                  self.raw.SM1_TXNFULL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM0_TXNFULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM0_TXNFULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM0_TXNFULL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM0_TXNFULL_Field.self, Bool.self)
                  self.raw.SM0_TXNFULL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM3_RXNEMPTY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM3_RXNEMPTY_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM3_RXNEMPTY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM3_RXNEMPTY_Field.self, Bool.self)
                  self.raw.SM3_RXNEMPTY = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM2_RXNEMPTY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM2_RXNEMPTY_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM2_RXNEMPTY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM2_RXNEMPTY_Field.self, Bool.self)
                  self.raw.SM2_RXNEMPTY = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM1_RXNEMPTY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM1_RXNEMPTY_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM1_RXNEMPTY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM1_RXNEMPTY_Field.self, Bool.self)
                  self.raw.SM1_RXNEMPTY = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM0_RXNEMPTY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM0_RXNEMPTY_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM0_RXNEMPTY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM0_RXNEMPTY_Field.self, Bool.self)
                  self.raw.SM0_RXNEMPTY = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt Force for irq0
    public var IRQ0_INTF: Register<IRQ0_INTF_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0130), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0130))
          #endif
        }
    }
    public struct IRQ0_INTF_Descriptor {
        @available(*, unavailable)
        public var SM3: SM3_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM2: SM2_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM1: SM1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM0: SM0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM3_TXNFULL: SM3_TXNFULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM2_TXNFULL: SM2_TXNFULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM1_TXNFULL: SM1_TXNFULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM0_TXNFULL: SM0_TXNFULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM3_RXNEMPTY: SM3_RXNEMPTY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM2_RXNEMPTY: SM2_RXNEMPTY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM1_RXNEMPTY: SM1_RXNEMPTY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM0_RXNEMPTY: SM0_RXNEMPTY_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SM3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum SM2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum SM1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum SM0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum SM3_TXNFULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum SM2_TXNFULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum SM1_TXNFULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum SM0_TXNFULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum SM3_RXNEMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum SM2_RXNEMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum SM1_RXNEMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum SM0_RXNEMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IRQ0_INTF_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var SM3: UInt32 {
                @inlinable @inline(__always) get {
                    SM3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SM3_Field.insert(newValue, into: &self.storage)
                }
                }
              public var SM2: UInt32 {
                @inlinable @inline(__always) get {
                  SM2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM2_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM1: UInt32 {
                @inlinable @inline(__always) get {
                  SM1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM0: UInt32 {
                @inlinable @inline(__always) get {
                  SM0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM3_TXNFULL: UInt32 {
                @inlinable @inline(__always) get {
                  SM3_TXNFULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM3_TXNFULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM2_TXNFULL: UInt32 {
                @inlinable @inline(__always) get {
                  SM2_TXNFULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM2_TXNFULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM1_TXNFULL: UInt32 {
                @inlinable @inline(__always) get {
                  SM1_TXNFULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM1_TXNFULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM0_TXNFULL: UInt32 {
                @inlinable @inline(__always) get {
                  SM0_TXNFULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM0_TXNFULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM3_RXNEMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  SM3_RXNEMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM3_RXNEMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM2_RXNEMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  SM2_RXNEMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM2_RXNEMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM1_RXNEMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  SM1_RXNEMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM1_RXNEMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM0_RXNEMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  SM0_RXNEMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM0_RXNEMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = IRQ0_INTF_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var SM3: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SM3_Field.self, Bool.self)
                    return Bool(storage: self.raw.SM3)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(SM3_Field.self, Bool.self)
                    self.raw.SM3 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var SM2: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM2_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM2)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM2_Field.self, Bool.self)
                  self.raw.SM2 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM1_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM1_Field.self, Bool.self)
                  self.raw.SM1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM0_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM0_Field.self, Bool.self)
                  self.raw.SM0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM3_TXNFULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM3_TXNFULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM3_TXNFULL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM3_TXNFULL_Field.self, Bool.self)
                  self.raw.SM3_TXNFULL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM2_TXNFULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM2_TXNFULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM2_TXNFULL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM2_TXNFULL_Field.self, Bool.self)
                  self.raw.SM2_TXNFULL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM1_TXNFULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM1_TXNFULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM1_TXNFULL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM1_TXNFULL_Field.self, Bool.self)
                  self.raw.SM1_TXNFULL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM0_TXNFULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM0_TXNFULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM0_TXNFULL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM0_TXNFULL_Field.self, Bool.self)
                  self.raw.SM0_TXNFULL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM3_RXNEMPTY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM3_RXNEMPTY_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM3_RXNEMPTY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM3_RXNEMPTY_Field.self, Bool.self)
                  self.raw.SM3_RXNEMPTY = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM2_RXNEMPTY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM2_RXNEMPTY_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM2_RXNEMPTY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM2_RXNEMPTY_Field.self, Bool.self)
                  self.raw.SM2_RXNEMPTY = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM1_RXNEMPTY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM1_RXNEMPTY_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM1_RXNEMPTY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM1_RXNEMPTY_Field.self, Bool.self)
                  self.raw.SM1_RXNEMPTY = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM0_RXNEMPTY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM0_RXNEMPTY_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM0_RXNEMPTY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM0_RXNEMPTY_Field.self, Bool.self)
                  self.raw.SM0_RXNEMPTY = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt status after masking & forcing for irq0
    public var IRQ0_INTS: Register<IRQ0_INTS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0134), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0134))
          #endif
        }
    }
    public struct IRQ0_INTS_Descriptor {
        @available(*, unavailable)
        public var SM3: SM3_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM2: SM2_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM1: SM1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM0: SM0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM3_TXNFULL: SM3_TXNFULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM2_TXNFULL: SM2_TXNFULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM1_TXNFULL: SM1_TXNFULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM0_TXNFULL: SM0_TXNFULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM3_RXNEMPTY: SM3_RXNEMPTY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM2_RXNEMPTY: SM2_RXNEMPTY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM1_RXNEMPTY: SM1_RXNEMPTY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM0_RXNEMPTY: SM0_RXNEMPTY_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SM3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum SM2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum SM1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum SM0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum SM3_TXNFULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum SM2_TXNFULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum SM1_TXNFULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum SM0_TXNFULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum SM3_RXNEMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum SM2_RXNEMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum SM1_RXNEMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum SM0_RXNEMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IRQ0_INTS_Descriptor

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
                public var SM3: UInt32 {
                @inlinable @inline(__always) get {
                    SM3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SM3_Field.insert(newValue, into: &self.storage)
                }
                }
              public var SM2: UInt32 {
                @inlinable @inline(__always) get {
                  SM2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM2_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM1: UInt32 {
                @inlinable @inline(__always) get {
                  SM1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM0: UInt32 {
                @inlinable @inline(__always) get {
                  SM0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM3_TXNFULL: UInt32 {
                @inlinable @inline(__always) get {
                  SM3_TXNFULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM3_TXNFULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM2_TXNFULL: UInt32 {
                @inlinable @inline(__always) get {
                  SM2_TXNFULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM2_TXNFULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM1_TXNFULL: UInt32 {
                @inlinable @inline(__always) get {
                  SM1_TXNFULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM1_TXNFULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM0_TXNFULL: UInt32 {
                @inlinable @inline(__always) get {
                  SM0_TXNFULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM0_TXNFULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM3_RXNEMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  SM3_RXNEMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM3_RXNEMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM2_RXNEMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  SM2_RXNEMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM2_RXNEMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM1_RXNEMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  SM1_RXNEMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM1_RXNEMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM0_RXNEMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  SM0_RXNEMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM0_RXNEMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = IRQ0_INTS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var SM3: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SM3_Field.self, Bool.self)
                    return Bool(storage: self.raw.SM3)
                }
                }
              public var SM2: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM2_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM2)
                }
              }
              public var SM1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM1_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM1)
                }
              }
              public var SM0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM0_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM0)
                }
              }
              public var SM3_TXNFULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM3_TXNFULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM3_TXNFULL)
                }
              }
              public var SM2_TXNFULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM2_TXNFULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM2_TXNFULL)
                }
              }
              public var SM1_TXNFULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM1_TXNFULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM1_TXNFULL)
                }
              }
              public var SM0_TXNFULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM0_TXNFULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM0_TXNFULL)
                }
              }
              public var SM3_RXNEMPTY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM3_RXNEMPTY_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM3_RXNEMPTY)
                }
              }
              public var SM2_RXNEMPTY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM2_RXNEMPTY_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM2_RXNEMPTY)
                }
              }
              public var SM1_RXNEMPTY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM1_RXNEMPTY_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM1_RXNEMPTY)
                }
              }
              public var SM0_RXNEMPTY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM0_RXNEMPTY_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM0_RXNEMPTY)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = IRQ0_INTS_Descriptor
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

    /// Interrupt Enable for irq1
    public var IRQ1_INTE: Register<IRQ1_INTE_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0138), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0138))
          #endif
        }
    }
    public struct IRQ1_INTE_Descriptor {
        @available(*, unavailable)
        public var SM3: SM3_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM2: SM2_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM1: SM1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM0: SM0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM3_TXNFULL: SM3_TXNFULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM2_TXNFULL: SM2_TXNFULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM1_TXNFULL: SM1_TXNFULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM0_TXNFULL: SM0_TXNFULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM3_RXNEMPTY: SM3_RXNEMPTY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM2_RXNEMPTY: SM2_RXNEMPTY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM1_RXNEMPTY: SM1_RXNEMPTY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM0_RXNEMPTY: SM0_RXNEMPTY_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SM3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum SM2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum SM1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum SM0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum SM3_TXNFULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum SM2_TXNFULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum SM1_TXNFULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum SM0_TXNFULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum SM3_RXNEMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum SM2_RXNEMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum SM1_RXNEMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum SM0_RXNEMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IRQ1_INTE_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var SM3: UInt32 {
                @inlinable @inline(__always) get {
                    SM3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SM3_Field.insert(newValue, into: &self.storage)
                }
                }
              public var SM2: UInt32 {
                @inlinable @inline(__always) get {
                  SM2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM2_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM1: UInt32 {
                @inlinable @inline(__always) get {
                  SM1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM0: UInt32 {
                @inlinable @inline(__always) get {
                  SM0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM3_TXNFULL: UInt32 {
                @inlinable @inline(__always) get {
                  SM3_TXNFULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM3_TXNFULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM2_TXNFULL: UInt32 {
                @inlinable @inline(__always) get {
                  SM2_TXNFULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM2_TXNFULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM1_TXNFULL: UInt32 {
                @inlinable @inline(__always) get {
                  SM1_TXNFULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM1_TXNFULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM0_TXNFULL: UInt32 {
                @inlinable @inline(__always) get {
                  SM0_TXNFULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM0_TXNFULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM3_RXNEMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  SM3_RXNEMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM3_RXNEMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM2_RXNEMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  SM2_RXNEMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM2_RXNEMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM1_RXNEMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  SM1_RXNEMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM1_RXNEMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM0_RXNEMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  SM0_RXNEMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM0_RXNEMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = IRQ1_INTE_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var SM3: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SM3_Field.self, Bool.self)
                    return Bool(storage: self.raw.SM3)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(SM3_Field.self, Bool.self)
                    self.raw.SM3 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var SM2: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM2_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM2)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM2_Field.self, Bool.self)
                  self.raw.SM2 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM1_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM1_Field.self, Bool.self)
                  self.raw.SM1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM0_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM0_Field.self, Bool.self)
                  self.raw.SM0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM3_TXNFULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM3_TXNFULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM3_TXNFULL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM3_TXNFULL_Field.self, Bool.self)
                  self.raw.SM3_TXNFULL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM2_TXNFULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM2_TXNFULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM2_TXNFULL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM2_TXNFULL_Field.self, Bool.self)
                  self.raw.SM2_TXNFULL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM1_TXNFULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM1_TXNFULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM1_TXNFULL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM1_TXNFULL_Field.self, Bool.self)
                  self.raw.SM1_TXNFULL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM0_TXNFULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM0_TXNFULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM0_TXNFULL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM0_TXNFULL_Field.self, Bool.self)
                  self.raw.SM0_TXNFULL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM3_RXNEMPTY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM3_RXNEMPTY_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM3_RXNEMPTY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM3_RXNEMPTY_Field.self, Bool.self)
                  self.raw.SM3_RXNEMPTY = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM2_RXNEMPTY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM2_RXNEMPTY_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM2_RXNEMPTY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM2_RXNEMPTY_Field.self, Bool.self)
                  self.raw.SM2_RXNEMPTY = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM1_RXNEMPTY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM1_RXNEMPTY_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM1_RXNEMPTY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM1_RXNEMPTY_Field.self, Bool.self)
                  self.raw.SM1_RXNEMPTY = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM0_RXNEMPTY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM0_RXNEMPTY_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM0_RXNEMPTY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM0_RXNEMPTY_Field.self, Bool.self)
                  self.raw.SM0_RXNEMPTY = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt Force for irq1
    public var IRQ1_INTF: Register<IRQ1_INTF_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x013c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x013c))
          #endif
        }
    }
    public struct IRQ1_INTF_Descriptor {
        @available(*, unavailable)
        public var SM3: SM3_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM2: SM2_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM1: SM1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM0: SM0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM3_TXNFULL: SM3_TXNFULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM2_TXNFULL: SM2_TXNFULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM1_TXNFULL: SM1_TXNFULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM0_TXNFULL: SM0_TXNFULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM3_RXNEMPTY: SM3_RXNEMPTY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM2_RXNEMPTY: SM2_RXNEMPTY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM1_RXNEMPTY: SM1_RXNEMPTY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM0_RXNEMPTY: SM0_RXNEMPTY_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SM3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum SM2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum SM1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum SM0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum SM3_TXNFULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum SM2_TXNFULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum SM1_TXNFULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum SM0_TXNFULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum SM3_RXNEMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum SM2_RXNEMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum SM1_RXNEMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum SM0_RXNEMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IRQ1_INTF_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var SM3: UInt32 {
                @inlinable @inline(__always) get {
                    SM3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SM3_Field.insert(newValue, into: &self.storage)
                }
                }
              public var SM2: UInt32 {
                @inlinable @inline(__always) get {
                  SM2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM2_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM1: UInt32 {
                @inlinable @inline(__always) get {
                  SM1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM0: UInt32 {
                @inlinable @inline(__always) get {
                  SM0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM3_TXNFULL: UInt32 {
                @inlinable @inline(__always) get {
                  SM3_TXNFULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM3_TXNFULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM2_TXNFULL: UInt32 {
                @inlinable @inline(__always) get {
                  SM2_TXNFULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM2_TXNFULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM1_TXNFULL: UInt32 {
                @inlinable @inline(__always) get {
                  SM1_TXNFULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM1_TXNFULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM0_TXNFULL: UInt32 {
                @inlinable @inline(__always) get {
                  SM0_TXNFULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM0_TXNFULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM3_RXNEMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  SM3_RXNEMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM3_RXNEMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM2_RXNEMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  SM2_RXNEMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM2_RXNEMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM1_RXNEMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  SM1_RXNEMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM1_RXNEMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM0_RXNEMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  SM0_RXNEMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM0_RXNEMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = IRQ1_INTF_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var SM3: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SM3_Field.self, Bool.self)
                    return Bool(storage: self.raw.SM3)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(SM3_Field.self, Bool.self)
                    self.raw.SM3 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var SM2: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM2_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM2)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM2_Field.self, Bool.self)
                  self.raw.SM2 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM1_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM1_Field.self, Bool.self)
                  self.raw.SM1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM0_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM0_Field.self, Bool.self)
                  self.raw.SM0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM3_TXNFULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM3_TXNFULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM3_TXNFULL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM3_TXNFULL_Field.self, Bool.self)
                  self.raw.SM3_TXNFULL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM2_TXNFULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM2_TXNFULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM2_TXNFULL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM2_TXNFULL_Field.self, Bool.self)
                  self.raw.SM2_TXNFULL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM1_TXNFULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM1_TXNFULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM1_TXNFULL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM1_TXNFULL_Field.self, Bool.self)
                  self.raw.SM1_TXNFULL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM0_TXNFULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM0_TXNFULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM0_TXNFULL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM0_TXNFULL_Field.self, Bool.self)
                  self.raw.SM0_TXNFULL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM3_RXNEMPTY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM3_RXNEMPTY_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM3_RXNEMPTY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM3_RXNEMPTY_Field.self, Bool.self)
                  self.raw.SM3_RXNEMPTY = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM2_RXNEMPTY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM2_RXNEMPTY_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM2_RXNEMPTY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM2_RXNEMPTY_Field.self, Bool.self)
                  self.raw.SM2_RXNEMPTY = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM1_RXNEMPTY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM1_RXNEMPTY_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM1_RXNEMPTY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM1_RXNEMPTY_Field.self, Bool.self)
                  self.raw.SM1_RXNEMPTY = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SM0_RXNEMPTY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM0_RXNEMPTY_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM0_RXNEMPTY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SM0_RXNEMPTY_Field.self, Bool.self)
                  self.raw.SM0_RXNEMPTY = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Interrupt status after masking & forcing for irq1
    public var IRQ1_INTS: Register<IRQ1_INTS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0140), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0140))
          #endif
        }
    }
    public struct IRQ1_INTS_Descriptor {
        @available(*, unavailable)
        public var SM3: SM3_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM2: SM2_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM1: SM1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM0: SM0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM3_TXNFULL: SM3_TXNFULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM2_TXNFULL: SM2_TXNFULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM1_TXNFULL: SM1_TXNFULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM0_TXNFULL: SM0_TXNFULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM3_RXNEMPTY: SM3_RXNEMPTY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM2_RXNEMPTY: SM2_RXNEMPTY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM1_RXNEMPTY: SM1_RXNEMPTY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var SM0_RXNEMPTY: SM0_RXNEMPTY_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SM3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum SM2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum SM1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum SM0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum SM3_TXNFULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum SM2_TXNFULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum SM1_TXNFULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum SM0_TXNFULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum SM3_RXNEMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum SM2_RXNEMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum SM1_RXNEMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum SM0_RXNEMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IRQ1_INTS_Descriptor

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
                public var SM3: UInt32 {
                @inlinable @inline(__always) get {
                    SM3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SM3_Field.insert(newValue, into: &self.storage)
                }
                }
              public var SM2: UInt32 {
                @inlinable @inline(__always) get {
                  SM2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM2_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM1: UInt32 {
                @inlinable @inline(__always) get {
                  SM1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM0: UInt32 {
                @inlinable @inline(__always) get {
                  SM0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM3_TXNFULL: UInt32 {
                @inlinable @inline(__always) get {
                  SM3_TXNFULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM3_TXNFULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM2_TXNFULL: UInt32 {
                @inlinable @inline(__always) get {
                  SM2_TXNFULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM2_TXNFULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM1_TXNFULL: UInt32 {
                @inlinable @inline(__always) get {
                  SM1_TXNFULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM1_TXNFULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM0_TXNFULL: UInt32 {
                @inlinable @inline(__always) get {
                  SM0_TXNFULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM0_TXNFULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM3_RXNEMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  SM3_RXNEMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM3_RXNEMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM2_RXNEMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  SM2_RXNEMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM2_RXNEMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM1_RXNEMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  SM1_RXNEMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM1_RXNEMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SM0_RXNEMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  SM0_RXNEMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SM0_RXNEMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = IRQ1_INTS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var SM3: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SM3_Field.self, Bool.self)
                    return Bool(storage: self.raw.SM3)
                }
                }
              public var SM2: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM2_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM2)
                }
              }
              public var SM1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM1_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM1)
                }
              }
              public var SM0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM0_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM0)
                }
              }
              public var SM3_TXNFULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM3_TXNFULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM3_TXNFULL)
                }
              }
              public var SM2_TXNFULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM2_TXNFULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM2_TXNFULL)
                }
              }
              public var SM1_TXNFULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM1_TXNFULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM1_TXNFULL)
                }
              }
              public var SM0_TXNFULL: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM0_TXNFULL_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM0_TXNFULL)
                }
              }
              public var SM3_RXNEMPTY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM3_RXNEMPTY_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM3_RXNEMPTY)
                }
              }
              public var SM2_RXNEMPTY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM2_RXNEMPTY_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM2_RXNEMPTY)
                }
              }
              public var SM1_RXNEMPTY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM1_RXNEMPTY_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM1_RXNEMPTY)
                }
              }
              public var SM0_RXNEMPTY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SM0_RXNEMPTY_Field.self, Bool.self)
                  return Bool(storage: self.raw.SM0_RXNEMPTY)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = IRQ1_INTS_Descriptor
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

extension PIO1.CTRL_Descriptor: RegisterValue {
}

extension PIO1.FSTAT_Descriptor: RegisterValue {
}

extension PIO1.FDEBUG_Descriptor: RegisterValue {
}

extension PIO1.FLEVEL_Descriptor: RegisterValue {
}

extension PIO1.TXF0_Descriptor: RegisterValue {
}

extension PIO1.TXF1_Descriptor: RegisterValue {
}

extension PIO1.TXF2_Descriptor: RegisterValue {
}

extension PIO1.TXF3_Descriptor: RegisterValue {
}

extension PIO1.RXF0_Descriptor: RegisterValue {
}

extension PIO1.RXF1_Descriptor: RegisterValue {
}

extension PIO1.RXF2_Descriptor: RegisterValue {
}

extension PIO1.RXF3_Descriptor: RegisterValue {
}

extension PIO1.IRQ_Descriptor: RegisterValue {
}

extension PIO1.IRQ_FORCE_Descriptor: RegisterValue {
}

extension PIO1.INPUT_SYNC_BYPASS_Descriptor: RegisterValue {
}

extension PIO1.DBG_PADOUT_Descriptor: RegisterValue {
}

extension PIO1.DBG_PADOE_Descriptor: RegisterValue {
}

extension PIO1.DBG_CFGINFO_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM0_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM1_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM2_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM3_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM4_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM5_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM6_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM7_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM8_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM9_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM10_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM11_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM12_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM13_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM14_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM15_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM16_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM17_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM18_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM19_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM20_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM21_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM22_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM23_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM24_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM25_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM26_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM27_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM28_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM29_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM30_Descriptor: RegisterValue {
}

extension PIO1.INSTR_MEM31_Descriptor: RegisterValue {
}

extension PIO1.SM0_CLKDIV_Descriptor: RegisterValue {
}

extension PIO1.SM0_EXECCTRL_Descriptor: RegisterValue {
}

extension PIO1.SM0_SHIFTCTRL_Descriptor: RegisterValue {
}

extension PIO1.SM0_ADDR_Descriptor: RegisterValue {
}

extension PIO1.SM0_INSTR_Descriptor: RegisterValue {
}

extension PIO1.SM0_PINCTRL_Descriptor: RegisterValue {
}

extension PIO1.SM1_CLKDIV_Descriptor: RegisterValue {
}

extension PIO1.SM1_EXECCTRL_Descriptor: RegisterValue {
}

extension PIO1.SM1_SHIFTCTRL_Descriptor: RegisterValue {
}

extension PIO1.SM1_ADDR_Descriptor: RegisterValue {
}

extension PIO1.SM1_INSTR_Descriptor: RegisterValue {
}

extension PIO1.SM1_PINCTRL_Descriptor: RegisterValue {
}

extension PIO1.SM2_CLKDIV_Descriptor: RegisterValue {
}

extension PIO1.SM2_EXECCTRL_Descriptor: RegisterValue {
}

extension PIO1.SM2_SHIFTCTRL_Descriptor: RegisterValue {
}

extension PIO1.SM2_ADDR_Descriptor: RegisterValue {
}

extension PIO1.SM2_INSTR_Descriptor: RegisterValue {
}

extension PIO1.SM2_PINCTRL_Descriptor: RegisterValue {
}

extension PIO1.SM3_CLKDIV_Descriptor: RegisterValue {
}

extension PIO1.SM3_EXECCTRL_Descriptor: RegisterValue {
}

extension PIO1.SM3_SHIFTCTRL_Descriptor: RegisterValue {
}

extension PIO1.SM3_ADDR_Descriptor: RegisterValue {
}

extension PIO1.SM3_INSTR_Descriptor: RegisterValue {
}

extension PIO1.SM3_PINCTRL_Descriptor: RegisterValue {
}

extension PIO1.INTR_Descriptor: RegisterValue {
}

extension PIO1.IRQ0_INTE_Descriptor: RegisterValue {
}

extension PIO1.IRQ0_INTF_Descriptor: RegisterValue {
}

extension PIO1.IRQ0_INTS_Descriptor: RegisterValue {
}

extension PIO1.IRQ1_INTE_Descriptor: RegisterValue {
}

extension PIO1.IRQ1_INTF_Descriptor: RegisterValue {
}

extension PIO1.IRQ1_INTS_Descriptor: RegisterValue {
}
