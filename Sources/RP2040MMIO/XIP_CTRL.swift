import MMIO
import MMIOExtensions

/// QSPI flash execute-in-place block
@RegisterBank
public struct XIP_CTRL {

    public static var `default`: Self { .init(unsafeAddress: 0x14000000) }

    /// Cache control
    @RegisterBank(offset: 0x0000)
    public var CTRL: Register<CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CTRL_Descriptor {
        /// When 1, the cache memories are powered down. They retain state,
        /// but can not be accessed. This reduces static power dissipation.
        /// Writing 1 to this bit forces CTRL_EN to 0, i.e. the cache cannot
        /// be enabled when powered down.
        /// Cache-as-SRAM accesses will produce a bus error response when
        /// the cache is powered down.
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var POWER_DOWN: POWER_DOWN_Field

        /// When 1, writes to any alias other than 0x0 (caching, allocating)
        /// will produce a bus fault. When 0, these writes are silently ignored.
        /// In either case, writes to the 0x0 alias will deallocate on tag match,
        /// as usual.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var ERR_BADWRITE: ERR_BADWRITE_Field

        /// When 1, enable the cache. When the cache is disabled, all XIP accesses
        /// will go straight to the flash, without querying the cache. When enabled,
        /// cacheable XIP accesses will query the cache, and the flash will
        /// not be accessed if the tag matches and the valid bit is set.
        /// If the cache is enabled, cache-as-SRAM accesses have no effect on the
        /// cache data RAM, and will produce a bus error response.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var EN: EN_Field
    }

    /// Cache Flush control
    @RegisterBank(offset: 0x0004)
    public var FLUSH: Register<FLUSH_Descriptor>


    @Register(bitWidth: 32)
    public struct FLUSH_Descriptor {
        /// Write 1 to flush the cache. This clears the tag memory, but
        /// the data memory retains its contents. (This means cache-as-SRAM
        /// contents is not affected by flush or reset.)
        /// Reading will hold the bus (stall the processor) until the flush
        /// completes. Alternatively STAT can be polled until completion.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var FLUSH: FLUSH_Field
    }

    /// Cache Status
    @RegisterBank(offset: 0x0008)
    public var STAT: Register<STAT_Descriptor>


    @Register(bitWidth: 32)
    public struct STAT_Descriptor {
        /// When 1, indicates the XIP streaming FIFO is completely full.
        /// The streaming FIFO is 2 entries deep, so the full and empty
        /// flag allow its level to be ascertained.
        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var FIFO_FULL: FIFO_FULL_Field

        /// When 1, indicates the XIP streaming FIFO is completely empty.
        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var FIFO_EMPTY: FIFO_EMPTY_Field

        /// Reads as 0 while a cache flush is in progress, and 1 otherwise.
        /// The cache is flushed whenever the XIP block is reset, and also
        /// when requested via the FLUSH register.
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var FLUSH_READY: FLUSH_READY_Field
    }

    /// Cache Hit counter
    /// A 32 bit saturating counter that increments upon each cache hit,
    /// i.e. when an XIP access is serviced directly from cached data.
    /// Write any value to clear.
    @RegisterBank(offset: 0x000c)
    public var CTR_HIT: Register<CTR_HIT_Descriptor>


    @Register(bitWidth: 32)
    public struct CTR_HIT_Descriptor {}

    /// Cache Access counter
    /// A 32 bit saturating counter that increments upon each XIP access,
    /// whether the cache is hit or not. This includes noncacheable accesses.
    /// Write any value to clear.
    @RegisterBank(offset: 0x0010)
    public var CTR_ACC: Register<CTR_ACC_Descriptor>


    @Register(bitWidth: 32)
    public struct CTR_ACC_Descriptor {}

    /// FIFO stream address
    @RegisterBank(offset: 0x0014)
    public var STREAM_ADDR: Register<STREAM_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct STREAM_ADDR_Descriptor {
        /// The address of the next word to be streamed from flash to the streaming FIFO.
        /// Increments automatically after each flash access.
        /// Write the initial access address here before starting a streaming read.
        @ReadWrite(bits: 2..<32, as: BitField30.self)
        public var STREAM_ADDR: STREAM_ADDR_Field
    }

    /// FIFO stream control
    @RegisterBank(offset: 0x0018)
    public var STREAM_CTR: Register<STREAM_CTR_Descriptor>


    @Register(bitWidth: 32)
    public struct STREAM_CTR_Descriptor {
        /// Write a nonzero value to start a streaming read. This will then
        /// progress in the background, using flash idle cycles to transfer
        /// a linear data block from flash to the streaming FIFO.
        /// Decrements automatically (1 at a time) as the stream
        /// progresses, and halts on reaching 0.
        /// Write 0 to halt an in-progress stream, and discard any in-flight
        /// read, so that a new stream can immediately be started (after
        /// draining the FIFO and reinitialising STREAM_ADDR)
        @ReadWrite(bits: 0..<22, as: BitField22.self)
        public var STREAM_CTR: STREAM_CTR_Field
    }

    /// FIFO stream data
    /// Streamed data is buffered here, for retrieval by the system DMA.
    /// This FIFO can also be accessed via the XIP_AUX slave, to avoid exposing
    /// the DMA to bus stalls caused by other XIP traffic.
    @RegisterBank(offset: 0x001c)
    public var STREAM_FIFO: Register<STREAM_FIFO_Descriptor>


    @Register(bitWidth: 32)
    public struct STREAM_FIFO_Descriptor {}
}
