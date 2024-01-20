import MMIO
import MMIOExtensions

/// QSPI flash execute-in-place block
public struct XIP_CTRL {

    public static var `default`: Self { .init(unsafeAddress: 0x14000000) }

    /// Cache control
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
        /// When 1, the cache memories are powered down. They retain state,
        /// but can not be accessed. This reduces static power dissipation.
        /// Writing 1 to this bit forces CTRL_EN to 0, i.e. the cache cannot
        /// be enabled when powered down.
        /// Cache-as-SRAM accesses will produce a bus error response when
        /// the cache is powered down.
        public var POWER_DOWN: POWER_DOWN_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// When 1, writes to any alias other than 0x0 (caching, allocating)
        /// will produce a bus fault. When 0, these writes are silently ignored.
        /// In either case, writes to the 0x0 alias will deallocate on tag match,
        /// as usual.
        public var ERR_BADWRITE: ERR_BADWRITE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// When 1, enable the cache. When the cache is disabled, all XIP accesses
        /// will go straight to the flash, without querying the cache. When enabled,
        /// cacheable XIP accesses will query the cache, and the flash will
        /// not be accessed if the tag matches and the valid bit is set.
        /// If the cache is enabled, cache-as-SRAM accesses have no effect on the
        /// cache data RAM, and will produce a bus error response.
        public var EN: EN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum POWER_DOWN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum ERR_BADWRITE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
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
                public var POWER_DOWN: UInt32 {
                @inlinable @inline(__always) get {
                    POWER_DOWN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    POWER_DOWN_Field.insert(newValue, into: &self.storage)
                }
                }
              public var ERR_BADWRITE: UInt32 {
                @inlinable @inline(__always) get {
                  ERR_BADWRITE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ERR_BADWRITE_Field.insert(newValue, into: &self.storage)
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

                    public  typealias Value = CTRL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var POWER_DOWN: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(POWER_DOWN_Field.self, Bool.self)
                    return Bool(storage: self.raw.POWER_DOWN)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(POWER_DOWN_Field.self, Bool.self)
                    self.raw.POWER_DOWN = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var ERR_BADWRITE: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ERR_BADWRITE_Field.self, Bool.self)
                  return Bool(storage: self.raw.ERR_BADWRITE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ERR_BADWRITE_Field.self, Bool.self)
                  self.raw.ERR_BADWRITE = newValue.storage(Self.Value.Raw.Storage.self)
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

    /// Cache Flush control
    public var FLUSH: Register<FLUSH_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0004), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0004))
          #endif
        }
    }
    public struct FLUSH_Descriptor {
        @available(*, unavailable)
        /// Write 1 to flush the cache. This clears the tag memory, but
        /// the data memory retains its contents. (This means cache-as-SRAM
        /// contents is not affected by flush or reset.)
        /// Reading will hold the bus (stall the processor) until the flush
        /// completes. Alternatively STAT can be polled until completion.
        public var FLUSH: FLUSH_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FLUSH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = FLUSH_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var FLUSH: UInt32 {
                @inlinable @inline(__always) get {
                    FLUSH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FLUSH_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = FLUSH_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var FLUSH: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FLUSH_Field.self, Bool.self)
                    return Bool(storage: self.raw.FLUSH)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(FLUSH_Field.self, Bool.self)
                    self.raw.FLUSH = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Cache Status
    public var STAT: Register<STAT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0008), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0008))
          #endif
        }
    }
    public struct STAT_Descriptor {
        @available(*, unavailable)
        /// When 1, indicates the XIP streaming FIFO is completely full.
        /// The streaming FIFO is 2 entries deep, so the full and empty
        /// flag allow its level to be ascertained.
        public var FIFO_FULL: FIFO_FULL_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// When 1, indicates the XIP streaming FIFO is completely empty.
        public var FIFO_EMPTY: FIFO_EMPTY_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Reads as 0 while a cache flush is in progress, and 1 otherwise.
        /// The cache is flushed whenever the XIP block is reset, and also
        /// when requested via the FLUSH register.
        public var FLUSH_READY: FLUSH_READY_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FIFO_FULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum FIFO_EMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum FLUSH_READY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = STAT_Descriptor

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
                public var FIFO_FULL: UInt32 {
                @inlinable @inline(__always) get {
                    FIFO_FULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FIFO_FULL_Field.insert(newValue, into: &self.storage)
                }
                }
              public var FIFO_EMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  FIFO_EMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FIFO_EMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var FLUSH_READY: UInt32 {
                @inlinable @inline(__always) get {
                  FLUSH_READY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  FLUSH_READY_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = STAT_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var FIFO_FULL: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FIFO_FULL_Field.self, Bool.self)
                    return Bool(storage: self.raw.FIFO_FULL)
                }
                }
              public var FIFO_EMPTY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FIFO_EMPTY_Field.self, Bool.self)
                  return Bool(storage: self.raw.FIFO_EMPTY)
                }
              }
              public var FLUSH_READY: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(FLUSH_READY_Field.self, Bool.self)
                  return Bool(storage: self.raw.FLUSH_READY)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = STAT_Descriptor
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

    /// Cache Hit counter
    /// A 32 bit saturating counter that increments upon each cache hit,
    /// i.e. when an XIP access is serviced directly from cached data.
    /// Write any value to clear.
    public var CTR_HIT: Register<CTR_HIT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x000c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x000c))
          #endif
        }
    }
    public struct CTR_HIT_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CTR_HIT_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }

        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CTR_HIT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// Cache Access counter
    /// A 32 bit saturating counter that increments upon each XIP access,
    /// whether the cache is hit or not. This includes noncacheable accesses.
    /// Write any value to clear.
    public var CTR_ACC: Register<CTR_ACC_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0010), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0010))
          #endif
        }
    }
    public struct CTR_ACC_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = CTR_ACC_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }

        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = CTR_ACC_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

        }}

    /// FIFO stream address
    public var STREAM_ADDR: Register<STREAM_ADDR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0014), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0014))
          #endif
        }
    }
    public struct STREAM_ADDR_Descriptor {
        @available(*, unavailable)
        /// The address of the next word to be streamed from flash to the streaming FIFO.
        /// Increments automatically after each flash access.
        /// Write the initial access address here before starting a streaming read.
        public var STREAM_ADDR: STREAM_ADDR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum STREAM_ADDR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 32
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = STREAM_ADDR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var STREAM_ADDR: UInt32 {
                @inlinable @inline(__always) get {
                    STREAM_ADDR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    STREAM_ADDR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = STREAM_ADDR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var STREAM_ADDR: BitField30 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(STREAM_ADDR_Field.self, BitField30.self)
                    return BitField30(storage: self.raw.STREAM_ADDR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(STREAM_ADDR_Field.self, BitField30.self)
                    self.raw.STREAM_ADDR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// FIFO stream control
    public var STREAM_CTR: Register<STREAM_CTR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0018), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0018))
          #endif
        }
    }
    public struct STREAM_CTR_Descriptor {
        @available(*, unavailable)
        /// Write a nonzero value to start a streaming read. This will then
        /// progress in the background, using flash idle cycles to transfer
        /// a linear data block from flash to the streaming FIFO.
        /// Decrements automatically (1 at a time) as the stream
        /// progresses, and halts on reaching 0.
        /// Write 0 to halt an in-progress stream, and discard any in-flight
        /// read, so that a new stream can immediately be started (after
        /// draining the FIFO and reinitialising STREAM_ADDR)
        public var STREAM_CTR: STREAM_CTR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum STREAM_CTR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 22
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = STREAM_CTR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var STREAM_CTR: UInt32 {
                @inlinable @inline(__always) get {
                    STREAM_CTR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    STREAM_CTR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = STREAM_CTR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var STREAM_CTR: BitField22 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(STREAM_CTR_Field.self, BitField22.self)
                    return BitField22(storage: self.raw.STREAM_CTR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(STREAM_CTR_Field.self, BitField22.self)
                    self.raw.STREAM_CTR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// FIFO stream data
    /// Streamed data is buffered here, for retrieval by the system DMA.
    /// This FIFO can also be accessed via the XIP_AUX slave, to avoid exposing
    /// the DMA to bus stalls caused by other XIP traffic.
    public var STREAM_FIFO: Register<STREAM_FIFO_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x001c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x001c))
          #endif
        }
    }
    public struct STREAM_FIFO_Descriptor {

        private init() {
            fatalError()
        }

        private var _never: Never

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = STREAM_FIFO_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }

        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = STREAM_FIFO_Descriptor
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

extension XIP_CTRL.CTRL_Descriptor: RegisterValue {
}

extension XIP_CTRL.FLUSH_Descriptor: RegisterValue {
}

extension XIP_CTRL.STAT_Descriptor: RegisterValue {
}

extension XIP_CTRL.CTR_HIT_Descriptor: RegisterValue {
}

extension XIP_CTRL.CTR_ACC_Descriptor: RegisterValue {
}

extension XIP_CTRL.STREAM_ADDR_Descriptor: RegisterValue {
}

extension XIP_CTRL.STREAM_CTR_Descriptor: RegisterValue {
}

extension XIP_CTRL.STREAM_FIFO_Descriptor: RegisterValue {
}
