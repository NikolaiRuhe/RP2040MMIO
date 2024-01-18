import MMIO
import MMIOExtensions

/// DMA with separate read and write masters
@RegisterBank
public struct DMA {

    public static var `default`: Self { .init(unsafeAddress: 0x50000000) }

    /// DMA Channel 0 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    @RegisterBank(offset: 0x0000)
    public var ch0_read_addr: Register<CH0_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH0_READ_ADDR {}

    /// DMA Channel 0 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    @RegisterBank(offset: 0x0004)
    public var ch0_write_addr: Register<CH0_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH0_WRITE_ADDR {}

    /// DMA Channel 0 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    @RegisterBank(offset: 0x0008)
    public var ch0_trans_count: Register<CH0_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH0_TRANS_COUNT {}

    /// DMA Channel 0 Control and Status
    @RegisterBank(offset: 0x000c)
    public var ch0_ctrl_trig: Register<CH0_CTRL_TRIG>

    @Register(bitWidth: 32)
    public struct CH0_CTRL_TRIG {
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var ahb_error: AHB_ERROR_Field

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var read_error: READ_ERROR_Field

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var write_error: WRITE_ERROR_Field

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var busy: BUSY_Field

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var sniff_en: SNIFF_EN_Field

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var bswap: BSWAP_Field

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var irq_quiet: IRQ_QUIET_Field

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        @ReadWrite(bits: 15..<21, as: TREQ_SEL_Values.self)
        public var treq_sel: TREQ_SEL_Field

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

        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        @ReadWrite(bits: 11..<15, as: BitField4.self)
        public var chain_to: CHAIN_TO_Field

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var ring_sel: RING_SEL_Field

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        @ReadWrite(bits: 6..<10, as: RING_SIZE_Values.self)
        public var ring_size: RING_SIZE_Field

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var incr_write: INCR_WRITE_Field

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var incr_read: INCR_READ_Field

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        @ReadWrite(bits: 2..<4, as: DATA_SIZE_Values.self)
        public var data_size: DATA_SIZE_Field

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var high_priority: HIGH_PRIORITY_Field

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var en: EN_Field
    }

    /// Alias for channel 0 CTRL register
    @RegisterBank(offset: 0x0010)
    public var ch0_al1_ctrl: Register<CH0_AL1_CTRL>

    @Register(bitWidth: 32)
    public struct CH0_AL1_CTRL {}

    /// Alias for channel 0 READ_ADDR register
    @RegisterBank(offset: 0x0014)
    public var ch0_al1_read_addr: Register<CH0_AL1_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH0_AL1_READ_ADDR {}

    /// Alias for channel 0 WRITE_ADDR register
    @RegisterBank(offset: 0x0018)
    public var ch0_al1_write_addr: Register<CH0_AL1_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH0_AL1_WRITE_ADDR {}

    /// Alias for channel 0 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x001c)
    public var ch0_al1_trans_count_trig: Register<CH0_AL1_TRANS_COUNT_TRIG>

    @Register(bitWidth: 32)
    public struct CH0_AL1_TRANS_COUNT_TRIG {}

    /// Alias for channel 0 CTRL register
    @RegisterBank(offset: 0x0020)
    public var ch0_al2_ctrl: Register<CH0_AL2_CTRL>

    @Register(bitWidth: 32)
    public struct CH0_AL2_CTRL {}

    /// Alias for channel 0 TRANS_COUNT register
    @RegisterBank(offset: 0x0024)
    public var ch0_al2_trans_count: Register<CH0_AL2_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH0_AL2_TRANS_COUNT {}

    /// Alias for channel 0 READ_ADDR register
    @RegisterBank(offset: 0x0028)
    public var ch0_al2_read_addr: Register<CH0_AL2_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH0_AL2_READ_ADDR {}

    /// Alias for channel 0 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x002c)
    public var ch0_al2_write_addr_trig: Register<CH0_AL2_WRITE_ADDR_TRIG>

    @Register(bitWidth: 32)
    public struct CH0_AL2_WRITE_ADDR_TRIG {}

    /// Alias for channel 0 CTRL register
    @RegisterBank(offset: 0x0030)
    public var ch0_al3_ctrl: Register<CH0_AL3_CTRL>

    @Register(bitWidth: 32)
    public struct CH0_AL3_CTRL {}

    /// Alias for channel 0 WRITE_ADDR register
    @RegisterBank(offset: 0x0034)
    public var ch0_al3_write_addr: Register<CH0_AL3_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH0_AL3_WRITE_ADDR {}

    /// Alias for channel 0 TRANS_COUNT register
    @RegisterBank(offset: 0x0038)
    public var ch0_al3_trans_count: Register<CH0_AL3_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH0_AL3_TRANS_COUNT {}

    /// Alias for channel 0 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x003c)
    public var ch0_al3_read_addr_trig: Register<CH0_AL3_READ_ADDR_TRIG>

    @Register(bitWidth: 32)
    public struct CH0_AL3_READ_ADDR_TRIG {}

    /// DMA Channel 1 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    @RegisterBank(offset: 0x0040)
    public var ch1_read_addr: Register<CH1_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH1_READ_ADDR {}

    /// DMA Channel 1 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    @RegisterBank(offset: 0x0044)
    public var ch1_write_addr: Register<CH1_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH1_WRITE_ADDR {}

    /// DMA Channel 1 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    @RegisterBank(offset: 0x0048)
    public var ch1_trans_count: Register<CH1_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH1_TRANS_COUNT {}

    /// DMA Channel 1 Control and Status
    @RegisterBank(offset: 0x004c)
    public var ch1_ctrl_trig: Register<CH1_CTRL_TRIG>

    @Register(bitWidth: 32)
    public struct CH1_CTRL_TRIG {
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var ahb_error: AHB_ERROR_Field

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var read_error: READ_ERROR_Field

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var write_error: WRITE_ERROR_Field

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var busy: BUSY_Field

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var sniff_en: SNIFF_EN_Field

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var bswap: BSWAP_Field

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var irq_quiet: IRQ_QUIET_Field

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        @ReadWrite(bits: 15..<21, as: TREQ_SEL_Values.self)
        public var treq_sel: TREQ_SEL_Field

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

        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        @ReadWrite(bits: 11..<15, as: BitField4.self)
        public var chain_to: CHAIN_TO_Field

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var ring_sel: RING_SEL_Field

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        @ReadWrite(bits: 6..<10, as: RING_SIZE_Values.self)
        public var ring_size: RING_SIZE_Field

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var incr_write: INCR_WRITE_Field

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var incr_read: INCR_READ_Field

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        @ReadWrite(bits: 2..<4, as: DATA_SIZE_Values.self)
        public var data_size: DATA_SIZE_Field

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var high_priority: HIGH_PRIORITY_Field

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var en: EN_Field
    }

    /// Alias for channel 1 CTRL register
    @RegisterBank(offset: 0x0050)
    public var ch1_al1_ctrl: Register<CH1_AL1_CTRL>

    @Register(bitWidth: 32)
    public struct CH1_AL1_CTRL {}

    /// Alias for channel 1 READ_ADDR register
    @RegisterBank(offset: 0x0054)
    public var ch1_al1_read_addr: Register<CH1_AL1_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH1_AL1_READ_ADDR {}

    /// Alias for channel 1 WRITE_ADDR register
    @RegisterBank(offset: 0x0058)
    public var ch1_al1_write_addr: Register<CH1_AL1_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH1_AL1_WRITE_ADDR {}

    /// Alias for channel 1 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x005c)
    public var ch1_al1_trans_count_trig: Register<CH1_AL1_TRANS_COUNT_TRIG>

    @Register(bitWidth: 32)
    public struct CH1_AL1_TRANS_COUNT_TRIG {}

    /// Alias for channel 1 CTRL register
    @RegisterBank(offset: 0x0060)
    public var ch1_al2_ctrl: Register<CH1_AL2_CTRL>

    @Register(bitWidth: 32)
    public struct CH1_AL2_CTRL {}

    /// Alias for channel 1 TRANS_COUNT register
    @RegisterBank(offset: 0x0064)
    public var ch1_al2_trans_count: Register<CH1_AL2_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH1_AL2_TRANS_COUNT {}

    /// Alias for channel 1 READ_ADDR register
    @RegisterBank(offset: 0x0068)
    public var ch1_al2_read_addr: Register<CH1_AL2_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH1_AL2_READ_ADDR {}

    /// Alias for channel 1 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x006c)
    public var ch1_al2_write_addr_trig: Register<CH1_AL2_WRITE_ADDR_TRIG>

    @Register(bitWidth: 32)
    public struct CH1_AL2_WRITE_ADDR_TRIG {}

    /// Alias for channel 1 CTRL register
    @RegisterBank(offset: 0x0070)
    public var ch1_al3_ctrl: Register<CH1_AL3_CTRL>

    @Register(bitWidth: 32)
    public struct CH1_AL3_CTRL {}

    /// Alias for channel 1 WRITE_ADDR register
    @RegisterBank(offset: 0x0074)
    public var ch1_al3_write_addr: Register<CH1_AL3_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH1_AL3_WRITE_ADDR {}

    /// Alias for channel 1 TRANS_COUNT register
    @RegisterBank(offset: 0x0078)
    public var ch1_al3_trans_count: Register<CH1_AL3_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH1_AL3_TRANS_COUNT {}

    /// Alias for channel 1 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x007c)
    public var ch1_al3_read_addr_trig: Register<CH1_AL3_READ_ADDR_TRIG>

    @Register(bitWidth: 32)
    public struct CH1_AL3_READ_ADDR_TRIG {}

    /// DMA Channel 2 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    @RegisterBank(offset: 0x0080)
    public var ch2_read_addr: Register<CH2_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH2_READ_ADDR {}

    /// DMA Channel 2 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    @RegisterBank(offset: 0x0084)
    public var ch2_write_addr: Register<CH2_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH2_WRITE_ADDR {}

    /// DMA Channel 2 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    @RegisterBank(offset: 0x0088)
    public var ch2_trans_count: Register<CH2_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH2_TRANS_COUNT {}

    /// DMA Channel 2 Control and Status
    @RegisterBank(offset: 0x008c)
    public var ch2_ctrl_trig: Register<CH2_CTRL_TRIG>

    @Register(bitWidth: 32)
    public struct CH2_CTRL_TRIG {
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var ahb_error: AHB_ERROR_Field

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var read_error: READ_ERROR_Field

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var write_error: WRITE_ERROR_Field

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var busy: BUSY_Field

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var sniff_en: SNIFF_EN_Field

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var bswap: BSWAP_Field

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var irq_quiet: IRQ_QUIET_Field

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        @ReadWrite(bits: 15..<21, as: TREQ_SEL_Values.self)
        public var treq_sel: TREQ_SEL_Field

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

        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        @ReadWrite(bits: 11..<15, as: BitField4.self)
        public var chain_to: CHAIN_TO_Field

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var ring_sel: RING_SEL_Field

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        @ReadWrite(bits: 6..<10, as: RING_SIZE_Values.self)
        public var ring_size: RING_SIZE_Field

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var incr_write: INCR_WRITE_Field

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var incr_read: INCR_READ_Field

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        @ReadWrite(bits: 2..<4, as: DATA_SIZE_Values.self)
        public var data_size: DATA_SIZE_Field

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var high_priority: HIGH_PRIORITY_Field

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var en: EN_Field
    }

    /// Alias for channel 2 CTRL register
    @RegisterBank(offset: 0x0090)
    public var ch2_al1_ctrl: Register<CH2_AL1_CTRL>

    @Register(bitWidth: 32)
    public struct CH2_AL1_CTRL {}

    /// Alias for channel 2 READ_ADDR register
    @RegisterBank(offset: 0x0094)
    public var ch2_al1_read_addr: Register<CH2_AL1_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH2_AL1_READ_ADDR {}

    /// Alias for channel 2 WRITE_ADDR register
    @RegisterBank(offset: 0x0098)
    public var ch2_al1_write_addr: Register<CH2_AL1_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH2_AL1_WRITE_ADDR {}

    /// Alias for channel 2 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x009c)
    public var ch2_al1_trans_count_trig: Register<CH2_AL1_TRANS_COUNT_TRIG>

    @Register(bitWidth: 32)
    public struct CH2_AL1_TRANS_COUNT_TRIG {}

    /// Alias for channel 2 CTRL register
    @RegisterBank(offset: 0x00a0)
    public var ch2_al2_ctrl: Register<CH2_AL2_CTRL>

    @Register(bitWidth: 32)
    public struct CH2_AL2_CTRL {}

    /// Alias for channel 2 TRANS_COUNT register
    @RegisterBank(offset: 0x00a4)
    public var ch2_al2_trans_count: Register<CH2_AL2_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH2_AL2_TRANS_COUNT {}

    /// Alias for channel 2 READ_ADDR register
    @RegisterBank(offset: 0x00a8)
    public var ch2_al2_read_addr: Register<CH2_AL2_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH2_AL2_READ_ADDR {}

    /// Alias for channel 2 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x00ac)
    public var ch2_al2_write_addr_trig: Register<CH2_AL2_WRITE_ADDR_TRIG>

    @Register(bitWidth: 32)
    public struct CH2_AL2_WRITE_ADDR_TRIG {}

    /// Alias for channel 2 CTRL register
    @RegisterBank(offset: 0x00b0)
    public var ch2_al3_ctrl: Register<CH2_AL3_CTRL>

    @Register(bitWidth: 32)
    public struct CH2_AL3_CTRL {}

    /// Alias for channel 2 WRITE_ADDR register
    @RegisterBank(offset: 0x00b4)
    public var ch2_al3_write_addr: Register<CH2_AL3_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH2_AL3_WRITE_ADDR {}

    /// Alias for channel 2 TRANS_COUNT register
    @RegisterBank(offset: 0x00b8)
    public var ch2_al3_trans_count: Register<CH2_AL3_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH2_AL3_TRANS_COUNT {}

    /// Alias for channel 2 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x00bc)
    public var ch2_al3_read_addr_trig: Register<CH2_AL3_READ_ADDR_TRIG>

    @Register(bitWidth: 32)
    public struct CH2_AL3_READ_ADDR_TRIG {}

    /// DMA Channel 3 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    @RegisterBank(offset: 0x00c0)
    public var ch3_read_addr: Register<CH3_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH3_READ_ADDR {}

    /// DMA Channel 3 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    @RegisterBank(offset: 0x00c4)
    public var ch3_write_addr: Register<CH3_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH3_WRITE_ADDR {}

    /// DMA Channel 3 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    @RegisterBank(offset: 0x00c8)
    public var ch3_trans_count: Register<CH3_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH3_TRANS_COUNT {}

    /// DMA Channel 3 Control and Status
    @RegisterBank(offset: 0x00cc)
    public var ch3_ctrl_trig: Register<CH3_CTRL_TRIG>

    @Register(bitWidth: 32)
    public struct CH3_CTRL_TRIG {
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var ahb_error: AHB_ERROR_Field

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var read_error: READ_ERROR_Field

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var write_error: WRITE_ERROR_Field

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var busy: BUSY_Field

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var sniff_en: SNIFF_EN_Field

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var bswap: BSWAP_Field

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var irq_quiet: IRQ_QUIET_Field

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        @ReadWrite(bits: 15..<21, as: TREQ_SEL_Values.self)
        public var treq_sel: TREQ_SEL_Field

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

        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        @ReadWrite(bits: 11..<15, as: BitField4.self)
        public var chain_to: CHAIN_TO_Field

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var ring_sel: RING_SEL_Field

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        @ReadWrite(bits: 6..<10, as: RING_SIZE_Values.self)
        public var ring_size: RING_SIZE_Field

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var incr_write: INCR_WRITE_Field

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var incr_read: INCR_READ_Field

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        @ReadWrite(bits: 2..<4, as: DATA_SIZE_Values.self)
        public var data_size: DATA_SIZE_Field

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var high_priority: HIGH_PRIORITY_Field

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var en: EN_Field
    }

    /// Alias for channel 3 CTRL register
    @RegisterBank(offset: 0x00d0)
    public var ch3_al1_ctrl: Register<CH3_AL1_CTRL>

    @Register(bitWidth: 32)
    public struct CH3_AL1_CTRL {}

    /// Alias for channel 3 READ_ADDR register
    @RegisterBank(offset: 0x00d4)
    public var ch3_al1_read_addr: Register<CH3_AL1_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH3_AL1_READ_ADDR {}

    /// Alias for channel 3 WRITE_ADDR register
    @RegisterBank(offset: 0x00d8)
    public var ch3_al1_write_addr: Register<CH3_AL1_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH3_AL1_WRITE_ADDR {}

    /// Alias for channel 3 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x00dc)
    public var ch3_al1_trans_count_trig: Register<CH3_AL1_TRANS_COUNT_TRIG>

    @Register(bitWidth: 32)
    public struct CH3_AL1_TRANS_COUNT_TRIG {}

    /// Alias for channel 3 CTRL register
    @RegisterBank(offset: 0x00e0)
    public var ch3_al2_ctrl: Register<CH3_AL2_CTRL>

    @Register(bitWidth: 32)
    public struct CH3_AL2_CTRL {}

    /// Alias for channel 3 TRANS_COUNT register
    @RegisterBank(offset: 0x00e4)
    public var ch3_al2_trans_count: Register<CH3_AL2_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH3_AL2_TRANS_COUNT {}

    /// Alias for channel 3 READ_ADDR register
    @RegisterBank(offset: 0x00e8)
    public var ch3_al2_read_addr: Register<CH3_AL2_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH3_AL2_READ_ADDR {}

    /// Alias for channel 3 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x00ec)
    public var ch3_al2_write_addr_trig: Register<CH3_AL2_WRITE_ADDR_TRIG>

    @Register(bitWidth: 32)
    public struct CH3_AL2_WRITE_ADDR_TRIG {}

    /// Alias for channel 3 CTRL register
    @RegisterBank(offset: 0x00f0)
    public var ch3_al3_ctrl: Register<CH3_AL3_CTRL>

    @Register(bitWidth: 32)
    public struct CH3_AL3_CTRL {}

    /// Alias for channel 3 WRITE_ADDR register
    @RegisterBank(offset: 0x00f4)
    public var ch3_al3_write_addr: Register<CH3_AL3_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH3_AL3_WRITE_ADDR {}

    /// Alias for channel 3 TRANS_COUNT register
    @RegisterBank(offset: 0x00f8)
    public var ch3_al3_trans_count: Register<CH3_AL3_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH3_AL3_TRANS_COUNT {}

    /// Alias for channel 3 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x00fc)
    public var ch3_al3_read_addr_trig: Register<CH3_AL3_READ_ADDR_TRIG>

    @Register(bitWidth: 32)
    public struct CH3_AL3_READ_ADDR_TRIG {}

    /// DMA Channel 4 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    @RegisterBank(offset: 0x0100)
    public var ch4_read_addr: Register<CH4_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH4_READ_ADDR {}

    /// DMA Channel 4 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    @RegisterBank(offset: 0x0104)
    public var ch4_write_addr: Register<CH4_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH4_WRITE_ADDR {}

    /// DMA Channel 4 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    @RegisterBank(offset: 0x0108)
    public var ch4_trans_count: Register<CH4_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH4_TRANS_COUNT {}

    /// DMA Channel 4 Control and Status
    @RegisterBank(offset: 0x010c)
    public var ch4_ctrl_trig: Register<CH4_CTRL_TRIG>

    @Register(bitWidth: 32)
    public struct CH4_CTRL_TRIG {
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var ahb_error: AHB_ERROR_Field

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var read_error: READ_ERROR_Field

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var write_error: WRITE_ERROR_Field

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var busy: BUSY_Field

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var sniff_en: SNIFF_EN_Field

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var bswap: BSWAP_Field

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var irq_quiet: IRQ_QUIET_Field

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        @ReadWrite(bits: 15..<21, as: TREQ_SEL_Values.self)
        public var treq_sel: TREQ_SEL_Field

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

        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        @ReadWrite(bits: 11..<15, as: BitField4.self)
        public var chain_to: CHAIN_TO_Field

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var ring_sel: RING_SEL_Field

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        @ReadWrite(bits: 6..<10, as: RING_SIZE_Values.self)
        public var ring_size: RING_SIZE_Field

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var incr_write: INCR_WRITE_Field

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var incr_read: INCR_READ_Field

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        @ReadWrite(bits: 2..<4, as: DATA_SIZE_Values.self)
        public var data_size: DATA_SIZE_Field

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var high_priority: HIGH_PRIORITY_Field

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var en: EN_Field
    }

    /// Alias for channel 4 CTRL register
    @RegisterBank(offset: 0x0110)
    public var ch4_al1_ctrl: Register<CH4_AL1_CTRL>

    @Register(bitWidth: 32)
    public struct CH4_AL1_CTRL {}

    /// Alias for channel 4 READ_ADDR register
    @RegisterBank(offset: 0x0114)
    public var ch4_al1_read_addr: Register<CH4_AL1_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH4_AL1_READ_ADDR {}

    /// Alias for channel 4 WRITE_ADDR register
    @RegisterBank(offset: 0x0118)
    public var ch4_al1_write_addr: Register<CH4_AL1_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH4_AL1_WRITE_ADDR {}

    /// Alias for channel 4 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x011c)
    public var ch4_al1_trans_count_trig: Register<CH4_AL1_TRANS_COUNT_TRIG>

    @Register(bitWidth: 32)
    public struct CH4_AL1_TRANS_COUNT_TRIG {}

    /// Alias for channel 4 CTRL register
    @RegisterBank(offset: 0x0120)
    public var ch4_al2_ctrl: Register<CH4_AL2_CTRL>

    @Register(bitWidth: 32)
    public struct CH4_AL2_CTRL {}

    /// Alias for channel 4 TRANS_COUNT register
    @RegisterBank(offset: 0x0124)
    public var ch4_al2_trans_count: Register<CH4_AL2_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH4_AL2_TRANS_COUNT {}

    /// Alias for channel 4 READ_ADDR register
    @RegisterBank(offset: 0x0128)
    public var ch4_al2_read_addr: Register<CH4_AL2_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH4_AL2_READ_ADDR {}

    /// Alias for channel 4 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x012c)
    public var ch4_al2_write_addr_trig: Register<CH4_AL2_WRITE_ADDR_TRIG>

    @Register(bitWidth: 32)
    public struct CH4_AL2_WRITE_ADDR_TRIG {}

    /// Alias for channel 4 CTRL register
    @RegisterBank(offset: 0x0130)
    public var ch4_al3_ctrl: Register<CH4_AL3_CTRL>

    @Register(bitWidth: 32)
    public struct CH4_AL3_CTRL {}

    /// Alias for channel 4 WRITE_ADDR register
    @RegisterBank(offset: 0x0134)
    public var ch4_al3_write_addr: Register<CH4_AL3_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH4_AL3_WRITE_ADDR {}

    /// Alias for channel 4 TRANS_COUNT register
    @RegisterBank(offset: 0x0138)
    public var ch4_al3_trans_count: Register<CH4_AL3_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH4_AL3_TRANS_COUNT {}

    /// Alias for channel 4 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x013c)
    public var ch4_al3_read_addr_trig: Register<CH4_AL3_READ_ADDR_TRIG>

    @Register(bitWidth: 32)
    public struct CH4_AL3_READ_ADDR_TRIG {}

    /// DMA Channel 5 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    @RegisterBank(offset: 0x0140)
    public var ch5_read_addr: Register<CH5_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH5_READ_ADDR {}

    /// DMA Channel 5 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    @RegisterBank(offset: 0x0144)
    public var ch5_write_addr: Register<CH5_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH5_WRITE_ADDR {}

    /// DMA Channel 5 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    @RegisterBank(offset: 0x0148)
    public var ch5_trans_count: Register<CH5_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH5_TRANS_COUNT {}

    /// DMA Channel 5 Control and Status
    @RegisterBank(offset: 0x014c)
    public var ch5_ctrl_trig: Register<CH5_CTRL_TRIG>

    @Register(bitWidth: 32)
    public struct CH5_CTRL_TRIG {
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var ahb_error: AHB_ERROR_Field

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var read_error: READ_ERROR_Field

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var write_error: WRITE_ERROR_Field

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var busy: BUSY_Field

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var sniff_en: SNIFF_EN_Field

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var bswap: BSWAP_Field

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var irq_quiet: IRQ_QUIET_Field

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        @ReadWrite(bits: 15..<21, as: TREQ_SEL_Values.self)
        public var treq_sel: TREQ_SEL_Field

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

        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        @ReadWrite(bits: 11..<15, as: BitField4.self)
        public var chain_to: CHAIN_TO_Field

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var ring_sel: RING_SEL_Field

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        @ReadWrite(bits: 6..<10, as: RING_SIZE_Values.self)
        public var ring_size: RING_SIZE_Field

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var incr_write: INCR_WRITE_Field

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var incr_read: INCR_READ_Field

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        @ReadWrite(bits: 2..<4, as: DATA_SIZE_Values.self)
        public var data_size: DATA_SIZE_Field

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var high_priority: HIGH_PRIORITY_Field

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var en: EN_Field
    }

    /// Alias for channel 5 CTRL register
    @RegisterBank(offset: 0x0150)
    public var ch5_al1_ctrl: Register<CH5_AL1_CTRL>

    @Register(bitWidth: 32)
    public struct CH5_AL1_CTRL {}

    /// Alias for channel 5 READ_ADDR register
    @RegisterBank(offset: 0x0154)
    public var ch5_al1_read_addr: Register<CH5_AL1_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH5_AL1_READ_ADDR {}

    /// Alias for channel 5 WRITE_ADDR register
    @RegisterBank(offset: 0x0158)
    public var ch5_al1_write_addr: Register<CH5_AL1_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH5_AL1_WRITE_ADDR {}

    /// Alias for channel 5 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x015c)
    public var ch5_al1_trans_count_trig: Register<CH5_AL1_TRANS_COUNT_TRIG>

    @Register(bitWidth: 32)
    public struct CH5_AL1_TRANS_COUNT_TRIG {}

    /// Alias for channel 5 CTRL register
    @RegisterBank(offset: 0x0160)
    public var ch5_al2_ctrl: Register<CH5_AL2_CTRL>

    @Register(bitWidth: 32)
    public struct CH5_AL2_CTRL {}

    /// Alias for channel 5 TRANS_COUNT register
    @RegisterBank(offset: 0x0164)
    public var ch5_al2_trans_count: Register<CH5_AL2_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH5_AL2_TRANS_COUNT {}

    /// Alias for channel 5 READ_ADDR register
    @RegisterBank(offset: 0x0168)
    public var ch5_al2_read_addr: Register<CH5_AL2_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH5_AL2_READ_ADDR {}

    /// Alias for channel 5 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x016c)
    public var ch5_al2_write_addr_trig: Register<CH5_AL2_WRITE_ADDR_TRIG>

    @Register(bitWidth: 32)
    public struct CH5_AL2_WRITE_ADDR_TRIG {}

    /// Alias for channel 5 CTRL register
    @RegisterBank(offset: 0x0170)
    public var ch5_al3_ctrl: Register<CH5_AL3_CTRL>

    @Register(bitWidth: 32)
    public struct CH5_AL3_CTRL {}

    /// Alias for channel 5 WRITE_ADDR register
    @RegisterBank(offset: 0x0174)
    public var ch5_al3_write_addr: Register<CH5_AL3_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH5_AL3_WRITE_ADDR {}

    /// Alias for channel 5 TRANS_COUNT register
    @RegisterBank(offset: 0x0178)
    public var ch5_al3_trans_count: Register<CH5_AL3_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH5_AL3_TRANS_COUNT {}

    /// Alias for channel 5 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x017c)
    public var ch5_al3_read_addr_trig: Register<CH5_AL3_READ_ADDR_TRIG>

    @Register(bitWidth: 32)
    public struct CH5_AL3_READ_ADDR_TRIG {}

    /// DMA Channel 6 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    @RegisterBank(offset: 0x0180)
    public var ch6_read_addr: Register<CH6_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH6_READ_ADDR {}

    /// DMA Channel 6 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    @RegisterBank(offset: 0x0184)
    public var ch6_write_addr: Register<CH6_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH6_WRITE_ADDR {}

    /// DMA Channel 6 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    @RegisterBank(offset: 0x0188)
    public var ch6_trans_count: Register<CH6_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH6_TRANS_COUNT {}

    /// DMA Channel 6 Control and Status
    @RegisterBank(offset: 0x018c)
    public var ch6_ctrl_trig: Register<CH6_CTRL_TRIG>

    @Register(bitWidth: 32)
    public struct CH6_CTRL_TRIG {
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var ahb_error: AHB_ERROR_Field

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var read_error: READ_ERROR_Field

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var write_error: WRITE_ERROR_Field

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var busy: BUSY_Field

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var sniff_en: SNIFF_EN_Field

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var bswap: BSWAP_Field

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var irq_quiet: IRQ_QUIET_Field

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        @ReadWrite(bits: 15..<21, as: TREQ_SEL_Values.self)
        public var treq_sel: TREQ_SEL_Field

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

        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        @ReadWrite(bits: 11..<15, as: BitField4.self)
        public var chain_to: CHAIN_TO_Field

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var ring_sel: RING_SEL_Field

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        @ReadWrite(bits: 6..<10, as: RING_SIZE_Values.self)
        public var ring_size: RING_SIZE_Field

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var incr_write: INCR_WRITE_Field

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var incr_read: INCR_READ_Field

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        @ReadWrite(bits: 2..<4, as: DATA_SIZE_Values.self)
        public var data_size: DATA_SIZE_Field

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var high_priority: HIGH_PRIORITY_Field

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var en: EN_Field
    }

    /// Alias for channel 6 CTRL register
    @RegisterBank(offset: 0x0190)
    public var ch6_al1_ctrl: Register<CH6_AL1_CTRL>

    @Register(bitWidth: 32)
    public struct CH6_AL1_CTRL {}

    /// Alias for channel 6 READ_ADDR register
    @RegisterBank(offset: 0x0194)
    public var ch6_al1_read_addr: Register<CH6_AL1_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH6_AL1_READ_ADDR {}

    /// Alias for channel 6 WRITE_ADDR register
    @RegisterBank(offset: 0x0198)
    public var ch6_al1_write_addr: Register<CH6_AL1_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH6_AL1_WRITE_ADDR {}

    /// Alias for channel 6 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x019c)
    public var ch6_al1_trans_count_trig: Register<CH6_AL1_TRANS_COUNT_TRIG>

    @Register(bitWidth: 32)
    public struct CH6_AL1_TRANS_COUNT_TRIG {}

    /// Alias for channel 6 CTRL register
    @RegisterBank(offset: 0x01a0)
    public var ch6_al2_ctrl: Register<CH6_AL2_CTRL>

    @Register(bitWidth: 32)
    public struct CH6_AL2_CTRL {}

    /// Alias for channel 6 TRANS_COUNT register
    @RegisterBank(offset: 0x01a4)
    public var ch6_al2_trans_count: Register<CH6_AL2_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH6_AL2_TRANS_COUNT {}

    /// Alias for channel 6 READ_ADDR register
    @RegisterBank(offset: 0x01a8)
    public var ch6_al2_read_addr: Register<CH6_AL2_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH6_AL2_READ_ADDR {}

    /// Alias for channel 6 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x01ac)
    public var ch6_al2_write_addr_trig: Register<CH6_AL2_WRITE_ADDR_TRIG>

    @Register(bitWidth: 32)
    public struct CH6_AL2_WRITE_ADDR_TRIG {}

    /// Alias for channel 6 CTRL register
    @RegisterBank(offset: 0x01b0)
    public var ch6_al3_ctrl: Register<CH6_AL3_CTRL>

    @Register(bitWidth: 32)
    public struct CH6_AL3_CTRL {}

    /// Alias for channel 6 WRITE_ADDR register
    @RegisterBank(offset: 0x01b4)
    public var ch6_al3_write_addr: Register<CH6_AL3_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH6_AL3_WRITE_ADDR {}

    /// Alias for channel 6 TRANS_COUNT register
    @RegisterBank(offset: 0x01b8)
    public var ch6_al3_trans_count: Register<CH6_AL3_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH6_AL3_TRANS_COUNT {}

    /// Alias for channel 6 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x01bc)
    public var ch6_al3_read_addr_trig: Register<CH6_AL3_READ_ADDR_TRIG>

    @Register(bitWidth: 32)
    public struct CH6_AL3_READ_ADDR_TRIG {}

    /// DMA Channel 7 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    @RegisterBank(offset: 0x01c0)
    public var ch7_read_addr: Register<CH7_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH7_READ_ADDR {}

    /// DMA Channel 7 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    @RegisterBank(offset: 0x01c4)
    public var ch7_write_addr: Register<CH7_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH7_WRITE_ADDR {}

    /// DMA Channel 7 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    @RegisterBank(offset: 0x01c8)
    public var ch7_trans_count: Register<CH7_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH7_TRANS_COUNT {}

    /// DMA Channel 7 Control and Status
    @RegisterBank(offset: 0x01cc)
    public var ch7_ctrl_trig: Register<CH7_CTRL_TRIG>

    @Register(bitWidth: 32)
    public struct CH7_CTRL_TRIG {
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var ahb_error: AHB_ERROR_Field

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var read_error: READ_ERROR_Field

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var write_error: WRITE_ERROR_Field

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var busy: BUSY_Field

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var sniff_en: SNIFF_EN_Field

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var bswap: BSWAP_Field

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var irq_quiet: IRQ_QUIET_Field

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        @ReadWrite(bits: 15..<21, as: TREQ_SEL_Values.self)
        public var treq_sel: TREQ_SEL_Field

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

        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        @ReadWrite(bits: 11..<15, as: BitField4.self)
        public var chain_to: CHAIN_TO_Field

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var ring_sel: RING_SEL_Field

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        @ReadWrite(bits: 6..<10, as: RING_SIZE_Values.self)
        public var ring_size: RING_SIZE_Field

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var incr_write: INCR_WRITE_Field

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var incr_read: INCR_READ_Field

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        @ReadWrite(bits: 2..<4, as: DATA_SIZE_Values.self)
        public var data_size: DATA_SIZE_Field

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var high_priority: HIGH_PRIORITY_Field

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var en: EN_Field
    }

    /// Alias for channel 7 CTRL register
    @RegisterBank(offset: 0x01d0)
    public var ch7_al1_ctrl: Register<CH7_AL1_CTRL>

    @Register(bitWidth: 32)
    public struct CH7_AL1_CTRL {}

    /// Alias for channel 7 READ_ADDR register
    @RegisterBank(offset: 0x01d4)
    public var ch7_al1_read_addr: Register<CH7_AL1_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH7_AL1_READ_ADDR {}

    /// Alias for channel 7 WRITE_ADDR register
    @RegisterBank(offset: 0x01d8)
    public var ch7_al1_write_addr: Register<CH7_AL1_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH7_AL1_WRITE_ADDR {}

    /// Alias for channel 7 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x01dc)
    public var ch7_al1_trans_count_trig: Register<CH7_AL1_TRANS_COUNT_TRIG>

    @Register(bitWidth: 32)
    public struct CH7_AL1_TRANS_COUNT_TRIG {}

    /// Alias for channel 7 CTRL register
    @RegisterBank(offset: 0x01e0)
    public var ch7_al2_ctrl: Register<CH7_AL2_CTRL>

    @Register(bitWidth: 32)
    public struct CH7_AL2_CTRL {}

    /// Alias for channel 7 TRANS_COUNT register
    @RegisterBank(offset: 0x01e4)
    public var ch7_al2_trans_count: Register<CH7_AL2_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH7_AL2_TRANS_COUNT {}

    /// Alias for channel 7 READ_ADDR register
    @RegisterBank(offset: 0x01e8)
    public var ch7_al2_read_addr: Register<CH7_AL2_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH7_AL2_READ_ADDR {}

    /// Alias for channel 7 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x01ec)
    public var ch7_al2_write_addr_trig: Register<CH7_AL2_WRITE_ADDR_TRIG>

    @Register(bitWidth: 32)
    public struct CH7_AL2_WRITE_ADDR_TRIG {}

    /// Alias for channel 7 CTRL register
    @RegisterBank(offset: 0x01f0)
    public var ch7_al3_ctrl: Register<CH7_AL3_CTRL>

    @Register(bitWidth: 32)
    public struct CH7_AL3_CTRL {}

    /// Alias for channel 7 WRITE_ADDR register
    @RegisterBank(offset: 0x01f4)
    public var ch7_al3_write_addr: Register<CH7_AL3_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH7_AL3_WRITE_ADDR {}

    /// Alias for channel 7 TRANS_COUNT register
    @RegisterBank(offset: 0x01f8)
    public var ch7_al3_trans_count: Register<CH7_AL3_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH7_AL3_TRANS_COUNT {}

    /// Alias for channel 7 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x01fc)
    public var ch7_al3_read_addr_trig: Register<CH7_AL3_READ_ADDR_TRIG>

    @Register(bitWidth: 32)
    public struct CH7_AL3_READ_ADDR_TRIG {}

    /// DMA Channel 8 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    @RegisterBank(offset: 0x0200)
    public var ch8_read_addr: Register<CH8_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH8_READ_ADDR {}

    /// DMA Channel 8 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    @RegisterBank(offset: 0x0204)
    public var ch8_write_addr: Register<CH8_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH8_WRITE_ADDR {}

    /// DMA Channel 8 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    @RegisterBank(offset: 0x0208)
    public var ch8_trans_count: Register<CH8_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH8_TRANS_COUNT {}

    /// DMA Channel 8 Control and Status
    @RegisterBank(offset: 0x020c)
    public var ch8_ctrl_trig: Register<CH8_CTRL_TRIG>

    @Register(bitWidth: 32)
    public struct CH8_CTRL_TRIG {
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var ahb_error: AHB_ERROR_Field

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var read_error: READ_ERROR_Field

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var write_error: WRITE_ERROR_Field

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var busy: BUSY_Field

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var sniff_en: SNIFF_EN_Field

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var bswap: BSWAP_Field

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var irq_quiet: IRQ_QUIET_Field

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        @ReadWrite(bits: 15..<21, as: TREQ_SEL_Values.self)
        public var treq_sel: TREQ_SEL_Field

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

        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        @ReadWrite(bits: 11..<15, as: BitField4.self)
        public var chain_to: CHAIN_TO_Field

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var ring_sel: RING_SEL_Field

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        @ReadWrite(bits: 6..<10, as: RING_SIZE_Values.self)
        public var ring_size: RING_SIZE_Field

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var incr_write: INCR_WRITE_Field

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var incr_read: INCR_READ_Field

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        @ReadWrite(bits: 2..<4, as: DATA_SIZE_Values.self)
        public var data_size: DATA_SIZE_Field

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var high_priority: HIGH_PRIORITY_Field

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var en: EN_Field
    }

    /// Alias for channel 8 CTRL register
    @RegisterBank(offset: 0x0210)
    public var ch8_al1_ctrl: Register<CH8_AL1_CTRL>

    @Register(bitWidth: 32)
    public struct CH8_AL1_CTRL {}

    /// Alias for channel 8 READ_ADDR register
    @RegisterBank(offset: 0x0214)
    public var ch8_al1_read_addr: Register<CH8_AL1_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH8_AL1_READ_ADDR {}

    /// Alias for channel 8 WRITE_ADDR register
    @RegisterBank(offset: 0x0218)
    public var ch8_al1_write_addr: Register<CH8_AL1_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH8_AL1_WRITE_ADDR {}

    /// Alias for channel 8 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x021c)
    public var ch8_al1_trans_count_trig: Register<CH8_AL1_TRANS_COUNT_TRIG>

    @Register(bitWidth: 32)
    public struct CH8_AL1_TRANS_COUNT_TRIG {}

    /// Alias for channel 8 CTRL register
    @RegisterBank(offset: 0x0220)
    public var ch8_al2_ctrl: Register<CH8_AL2_CTRL>

    @Register(bitWidth: 32)
    public struct CH8_AL2_CTRL {}

    /// Alias for channel 8 TRANS_COUNT register
    @RegisterBank(offset: 0x0224)
    public var ch8_al2_trans_count: Register<CH8_AL2_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH8_AL2_TRANS_COUNT {}

    /// Alias for channel 8 READ_ADDR register
    @RegisterBank(offset: 0x0228)
    public var ch8_al2_read_addr: Register<CH8_AL2_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH8_AL2_READ_ADDR {}

    /// Alias for channel 8 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x022c)
    public var ch8_al2_write_addr_trig: Register<CH8_AL2_WRITE_ADDR_TRIG>

    @Register(bitWidth: 32)
    public struct CH8_AL2_WRITE_ADDR_TRIG {}

    /// Alias for channel 8 CTRL register
    @RegisterBank(offset: 0x0230)
    public var ch8_al3_ctrl: Register<CH8_AL3_CTRL>

    @Register(bitWidth: 32)
    public struct CH8_AL3_CTRL {}

    /// Alias for channel 8 WRITE_ADDR register
    @RegisterBank(offset: 0x0234)
    public var ch8_al3_write_addr: Register<CH8_AL3_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH8_AL3_WRITE_ADDR {}

    /// Alias for channel 8 TRANS_COUNT register
    @RegisterBank(offset: 0x0238)
    public var ch8_al3_trans_count: Register<CH8_AL3_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH8_AL3_TRANS_COUNT {}

    /// Alias for channel 8 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x023c)
    public var ch8_al3_read_addr_trig: Register<CH8_AL3_READ_ADDR_TRIG>

    @Register(bitWidth: 32)
    public struct CH8_AL3_READ_ADDR_TRIG {}

    /// DMA Channel 9 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    @RegisterBank(offset: 0x0240)
    public var ch9_read_addr: Register<CH9_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH9_READ_ADDR {}

    /// DMA Channel 9 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    @RegisterBank(offset: 0x0244)
    public var ch9_write_addr: Register<CH9_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH9_WRITE_ADDR {}

    /// DMA Channel 9 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    @RegisterBank(offset: 0x0248)
    public var ch9_trans_count: Register<CH9_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH9_TRANS_COUNT {}

    /// DMA Channel 9 Control and Status
    @RegisterBank(offset: 0x024c)
    public var ch9_ctrl_trig: Register<CH9_CTRL_TRIG>

    @Register(bitWidth: 32)
    public struct CH9_CTRL_TRIG {
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var ahb_error: AHB_ERROR_Field

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var read_error: READ_ERROR_Field

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var write_error: WRITE_ERROR_Field

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var busy: BUSY_Field

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var sniff_en: SNIFF_EN_Field

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var bswap: BSWAP_Field

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var irq_quiet: IRQ_QUIET_Field

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        @ReadWrite(bits: 15..<21, as: TREQ_SEL_Values.self)
        public var treq_sel: TREQ_SEL_Field

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

        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        @ReadWrite(bits: 11..<15, as: BitField4.self)
        public var chain_to: CHAIN_TO_Field

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var ring_sel: RING_SEL_Field

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        @ReadWrite(bits: 6..<10, as: RING_SIZE_Values.self)
        public var ring_size: RING_SIZE_Field

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var incr_write: INCR_WRITE_Field

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var incr_read: INCR_READ_Field

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        @ReadWrite(bits: 2..<4, as: DATA_SIZE_Values.self)
        public var data_size: DATA_SIZE_Field

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var high_priority: HIGH_PRIORITY_Field

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var en: EN_Field
    }

    /// Alias for channel 9 CTRL register
    @RegisterBank(offset: 0x0250)
    public var ch9_al1_ctrl: Register<CH9_AL1_CTRL>

    @Register(bitWidth: 32)
    public struct CH9_AL1_CTRL {}

    /// Alias for channel 9 READ_ADDR register
    @RegisterBank(offset: 0x0254)
    public var ch9_al1_read_addr: Register<CH9_AL1_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH9_AL1_READ_ADDR {}

    /// Alias for channel 9 WRITE_ADDR register
    @RegisterBank(offset: 0x0258)
    public var ch9_al1_write_addr: Register<CH9_AL1_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH9_AL1_WRITE_ADDR {}

    /// Alias for channel 9 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x025c)
    public var ch9_al1_trans_count_trig: Register<CH9_AL1_TRANS_COUNT_TRIG>

    @Register(bitWidth: 32)
    public struct CH9_AL1_TRANS_COUNT_TRIG {}

    /// Alias for channel 9 CTRL register
    @RegisterBank(offset: 0x0260)
    public var ch9_al2_ctrl: Register<CH9_AL2_CTRL>

    @Register(bitWidth: 32)
    public struct CH9_AL2_CTRL {}

    /// Alias for channel 9 TRANS_COUNT register
    @RegisterBank(offset: 0x0264)
    public var ch9_al2_trans_count: Register<CH9_AL2_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH9_AL2_TRANS_COUNT {}

    /// Alias for channel 9 READ_ADDR register
    @RegisterBank(offset: 0x0268)
    public var ch9_al2_read_addr: Register<CH9_AL2_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH9_AL2_READ_ADDR {}

    /// Alias for channel 9 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x026c)
    public var ch9_al2_write_addr_trig: Register<CH9_AL2_WRITE_ADDR_TRIG>

    @Register(bitWidth: 32)
    public struct CH9_AL2_WRITE_ADDR_TRIG {}

    /// Alias for channel 9 CTRL register
    @RegisterBank(offset: 0x0270)
    public var ch9_al3_ctrl: Register<CH9_AL3_CTRL>

    @Register(bitWidth: 32)
    public struct CH9_AL3_CTRL {}

    /// Alias for channel 9 WRITE_ADDR register
    @RegisterBank(offset: 0x0274)
    public var ch9_al3_write_addr: Register<CH9_AL3_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH9_AL3_WRITE_ADDR {}

    /// Alias for channel 9 TRANS_COUNT register
    @RegisterBank(offset: 0x0278)
    public var ch9_al3_trans_count: Register<CH9_AL3_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH9_AL3_TRANS_COUNT {}

    /// Alias for channel 9 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x027c)
    public var ch9_al3_read_addr_trig: Register<CH9_AL3_READ_ADDR_TRIG>

    @Register(bitWidth: 32)
    public struct CH9_AL3_READ_ADDR_TRIG {}

    /// DMA Channel 10 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    @RegisterBank(offset: 0x0280)
    public var ch10_read_addr: Register<CH10_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH10_READ_ADDR {}

    /// DMA Channel 10 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    @RegisterBank(offset: 0x0284)
    public var ch10_write_addr: Register<CH10_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH10_WRITE_ADDR {}

    /// DMA Channel 10 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    @RegisterBank(offset: 0x0288)
    public var ch10_trans_count: Register<CH10_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH10_TRANS_COUNT {}

    /// DMA Channel 10 Control and Status
    @RegisterBank(offset: 0x028c)
    public var ch10_ctrl_trig: Register<CH10_CTRL_TRIG>

    @Register(bitWidth: 32)
    public struct CH10_CTRL_TRIG {
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var ahb_error: AHB_ERROR_Field

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var read_error: READ_ERROR_Field

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var write_error: WRITE_ERROR_Field

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var busy: BUSY_Field

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var sniff_en: SNIFF_EN_Field

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var bswap: BSWAP_Field

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var irq_quiet: IRQ_QUIET_Field

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        @ReadWrite(bits: 15..<21, as: TREQ_SEL_Values.self)
        public var treq_sel: TREQ_SEL_Field

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

        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        @ReadWrite(bits: 11..<15, as: BitField4.self)
        public var chain_to: CHAIN_TO_Field

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var ring_sel: RING_SEL_Field

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        @ReadWrite(bits: 6..<10, as: RING_SIZE_Values.self)
        public var ring_size: RING_SIZE_Field

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var incr_write: INCR_WRITE_Field

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var incr_read: INCR_READ_Field

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        @ReadWrite(bits: 2..<4, as: DATA_SIZE_Values.self)
        public var data_size: DATA_SIZE_Field

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var high_priority: HIGH_PRIORITY_Field

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var en: EN_Field
    }

    /// Alias for channel 10 CTRL register
    @RegisterBank(offset: 0x0290)
    public var ch10_al1_ctrl: Register<CH10_AL1_CTRL>

    @Register(bitWidth: 32)
    public struct CH10_AL1_CTRL {}

    /// Alias for channel 10 READ_ADDR register
    @RegisterBank(offset: 0x0294)
    public var ch10_al1_read_addr: Register<CH10_AL1_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH10_AL1_READ_ADDR {}

    /// Alias for channel 10 WRITE_ADDR register
    @RegisterBank(offset: 0x0298)
    public var ch10_al1_write_addr: Register<CH10_AL1_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH10_AL1_WRITE_ADDR {}

    /// Alias for channel 10 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x029c)
    public var ch10_al1_trans_count_trig: Register<CH10_AL1_TRANS_COUNT_TRIG>

    @Register(bitWidth: 32)
    public struct CH10_AL1_TRANS_COUNT_TRIG {}

    /// Alias for channel 10 CTRL register
    @RegisterBank(offset: 0x02a0)
    public var ch10_al2_ctrl: Register<CH10_AL2_CTRL>

    @Register(bitWidth: 32)
    public struct CH10_AL2_CTRL {}

    /// Alias for channel 10 TRANS_COUNT register
    @RegisterBank(offset: 0x02a4)
    public var ch10_al2_trans_count: Register<CH10_AL2_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH10_AL2_TRANS_COUNT {}

    /// Alias for channel 10 READ_ADDR register
    @RegisterBank(offset: 0x02a8)
    public var ch10_al2_read_addr: Register<CH10_AL2_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH10_AL2_READ_ADDR {}

    /// Alias for channel 10 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x02ac)
    public var ch10_al2_write_addr_trig: Register<CH10_AL2_WRITE_ADDR_TRIG>

    @Register(bitWidth: 32)
    public struct CH10_AL2_WRITE_ADDR_TRIG {}

    /// Alias for channel 10 CTRL register
    @RegisterBank(offset: 0x02b0)
    public var ch10_al3_ctrl: Register<CH10_AL3_CTRL>

    @Register(bitWidth: 32)
    public struct CH10_AL3_CTRL {}

    /// Alias for channel 10 WRITE_ADDR register
    @RegisterBank(offset: 0x02b4)
    public var ch10_al3_write_addr: Register<CH10_AL3_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH10_AL3_WRITE_ADDR {}

    /// Alias for channel 10 TRANS_COUNT register
    @RegisterBank(offset: 0x02b8)
    public var ch10_al3_trans_count: Register<CH10_AL3_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH10_AL3_TRANS_COUNT {}

    /// Alias for channel 10 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x02bc)
    public var ch10_al3_read_addr_trig: Register<CH10_AL3_READ_ADDR_TRIG>

    @Register(bitWidth: 32)
    public struct CH10_AL3_READ_ADDR_TRIG {}

    /// DMA Channel 11 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    @RegisterBank(offset: 0x02c0)
    public var ch11_read_addr: Register<CH11_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH11_READ_ADDR {}

    /// DMA Channel 11 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    @RegisterBank(offset: 0x02c4)
    public var ch11_write_addr: Register<CH11_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH11_WRITE_ADDR {}

    /// DMA Channel 11 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    @RegisterBank(offset: 0x02c8)
    public var ch11_trans_count: Register<CH11_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH11_TRANS_COUNT {}

    /// DMA Channel 11 Control and Status
    @RegisterBank(offset: 0x02cc)
    public var ch11_ctrl_trig: Register<CH11_CTRL_TRIG>

    @Register(bitWidth: 32)
    public struct CH11_CTRL_TRIG {
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var ahb_error: AHB_ERROR_Field

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var read_error: READ_ERROR_Field

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var write_error: WRITE_ERROR_Field

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var busy: BUSY_Field

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var sniff_en: SNIFF_EN_Field

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var bswap: BSWAP_Field

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var irq_quiet: IRQ_QUIET_Field

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        @ReadWrite(bits: 15..<21, as: TREQ_SEL_Values.self)
        public var treq_sel: TREQ_SEL_Field

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

        /// When this channel completes, it will trigger the channel indicated by CHAIN_TO. Disable by setting CHAIN_TO = _(this channel)_.
        @ReadWrite(bits: 11..<15, as: BitField4.self)
        public var chain_to: CHAIN_TO_Field

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var ring_sel: RING_SEL_Field

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        @ReadWrite(bits: 6..<10, as: RING_SIZE_Values.self)
        public var ring_size: RING_SIZE_Field

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var incr_write: INCR_WRITE_Field

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var incr_read: INCR_READ_Field

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        @ReadWrite(bits: 2..<4, as: DATA_SIZE_Values.self)
        public var data_size: DATA_SIZE_Field

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var high_priority: HIGH_PRIORITY_Field

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var en: EN_Field
    }

    /// Alias for channel 11 CTRL register
    @RegisterBank(offset: 0x02d0)
    public var ch11_al1_ctrl: Register<CH11_AL1_CTRL>

    @Register(bitWidth: 32)
    public struct CH11_AL1_CTRL {}

    /// Alias for channel 11 READ_ADDR register
    @RegisterBank(offset: 0x02d4)
    public var ch11_al1_read_addr: Register<CH11_AL1_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH11_AL1_READ_ADDR {}

    /// Alias for channel 11 WRITE_ADDR register
    @RegisterBank(offset: 0x02d8)
    public var ch11_al1_write_addr: Register<CH11_AL1_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH11_AL1_WRITE_ADDR {}

    /// Alias for channel 11 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x02dc)
    public var ch11_al1_trans_count_trig: Register<CH11_AL1_TRANS_COUNT_TRIG>

    @Register(bitWidth: 32)
    public struct CH11_AL1_TRANS_COUNT_TRIG {}

    /// Alias for channel 11 CTRL register
    @RegisterBank(offset: 0x02e0)
    public var ch11_al2_ctrl: Register<CH11_AL2_CTRL>

    @Register(bitWidth: 32)
    public struct CH11_AL2_CTRL {}

    /// Alias for channel 11 TRANS_COUNT register
    @RegisterBank(offset: 0x02e4)
    public var ch11_al2_trans_count: Register<CH11_AL2_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH11_AL2_TRANS_COUNT {}

    /// Alias for channel 11 READ_ADDR register
    @RegisterBank(offset: 0x02e8)
    public var ch11_al2_read_addr: Register<CH11_AL2_READ_ADDR>

    @Register(bitWidth: 32)
    public struct CH11_AL2_READ_ADDR {}

    /// Alias for channel 11 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x02ec)
    public var ch11_al2_write_addr_trig: Register<CH11_AL2_WRITE_ADDR_TRIG>

    @Register(bitWidth: 32)
    public struct CH11_AL2_WRITE_ADDR_TRIG {}

    /// Alias for channel 11 CTRL register
    @RegisterBank(offset: 0x02f0)
    public var ch11_al3_ctrl: Register<CH11_AL3_CTRL>

    @Register(bitWidth: 32)
    public struct CH11_AL3_CTRL {}

    /// Alias for channel 11 WRITE_ADDR register
    @RegisterBank(offset: 0x02f4)
    public var ch11_al3_write_addr: Register<CH11_AL3_WRITE_ADDR>

    @Register(bitWidth: 32)
    public struct CH11_AL3_WRITE_ADDR {}

    /// Alias for channel 11 TRANS_COUNT register
    @RegisterBank(offset: 0x02f8)
    public var ch11_al3_trans_count: Register<CH11_AL3_TRANS_COUNT>

    @Register(bitWidth: 32)
    public struct CH11_AL3_TRANS_COUNT {}

    /// Alias for channel 11 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x02fc)
    public var ch11_al3_read_addr_trig: Register<CH11_AL3_READ_ADDR_TRIG>

    @Register(bitWidth: 32)
    public struct CH11_AL3_READ_ADDR_TRIG {}

    /// Interrupt Status (raw)
    @RegisterBank(offset: 0x0400)
    public var intr: Register<INTR>

    @Register(bitWidth: 32)
    public struct INTR {
        /// Raw interrupt status for DMA Channels 0..15. Bit n corresponds to channel n. Ignores any masking or forcing. Channel interrupts can be cleared by writing a bit mask to INTR, INTS0 or INTS1.
        /// Channel interrupts can be routed to either of two system-level IRQs based on INTE0 and INTE1.
        /// This can be used vector different channel interrupts to different ISRs: this might be done to allow NVIC IRQ preemption for more time-critical channels, or to spread IRQ load across different cores.
        /// It is also valid to ignore this behaviour and just use INTE0/INTS0/IRQ 0.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var intr: INTR_Field
    }

    /// Interrupt Enables for IRQ 0
    @RegisterBank(offset: 0x0404)
    public var inte0: Register<INTE0>

    @Register(bitWidth: 32)
    public struct INTE0 {
        /// Set bit n to pass interrupts from channel n to DMA IRQ 0.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var inte0: INTE0_Field
    }

    /// Force Interrupts
    @RegisterBank(offset: 0x0408)
    public var intf0: Register<INTF0>

    @Register(bitWidth: 32)
    public struct INTF0 {
        /// Write 1s to force the corresponding bits in INTE0. The interrupt remains asserted until INTF0 is cleared.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var intf0: INTF0_Field
    }

    /// Interrupt Status for IRQ 0
    @RegisterBank(offset: 0x040c)
    public var ints0: Register<INTS0>

    @Register(bitWidth: 32)
    public struct INTS0 {
        /// Indicates active channel interrupt requests which are currently causing IRQ 0 to be asserted.
        /// Channel interrupts can be cleared by writing a bit mask here.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var ints0: INTS0_Field
    }

    /// Interrupt Enables for IRQ 1
    @RegisterBank(offset: 0x0414)
    public var inte1: Register<INTE1>

    @Register(bitWidth: 32)
    public struct INTE1 {
        /// Set bit n to pass interrupts from channel n to DMA IRQ 1.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var inte1: INTE1_Field
    }

    /// Force Interrupts for IRQ 1
    @RegisterBank(offset: 0x0418)
    public var intf1: Register<INTF1>

    @Register(bitWidth: 32)
    public struct INTF1 {
        /// Write 1s to force the corresponding bits in INTE0. The interrupt remains asserted until INTF0 is cleared.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var intf1: INTF1_Field
    }

    /// Interrupt Status (masked) for IRQ 1
    @RegisterBank(offset: 0x041c)
    public var ints1: Register<INTS1>

    @Register(bitWidth: 32)
    public struct INTS1 {
        /// Indicates active channel interrupt requests which are currently causing IRQ 1 to be asserted.
        /// Channel interrupts can be cleared by writing a bit mask here.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var ints1: INTS1_Field
    }

    /// Pacing (X/Y) Fractional Timer
    /// The pacing timer produces TREQ assertions at a rate set by ((X/Y) * sys_clk). This equation is evaluated every sys_clk cycles and therefore can only generate TREQs at a rate of 1 per sys_clk (i.e. permanent TREQ) or less.
    @RegisterBank(offset: 0x0420)
    public var timer0: Register<TIMER0>

    @Register(bitWidth: 32)
    public struct TIMER0 {
        /// Pacing Timer Dividend. Specifies the X value for the (X/Y) fractional timer.
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var x: X_Field

        /// Pacing Timer Divisor. Specifies the Y value for the (X/Y) fractional timer.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var y: Y_Field
    }

    /// Pacing (X/Y) Fractional Timer
    /// The pacing timer produces TREQ assertions at a rate set by ((X/Y) * sys_clk). This equation is evaluated every sys_clk cycles and therefore can only generate TREQs at a rate of 1 per sys_clk (i.e. permanent TREQ) or less.
    @RegisterBank(offset: 0x0424)
    public var timer1: Register<TIMER1>

    @Register(bitWidth: 32)
    public struct TIMER1 {
        /// Pacing Timer Dividend. Specifies the X value for the (X/Y) fractional timer.
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var x: X_Field

        /// Pacing Timer Divisor. Specifies the Y value for the (X/Y) fractional timer.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var y: Y_Field
    }

    /// Pacing (X/Y) Fractional Timer
    /// The pacing timer produces TREQ assertions at a rate set by ((X/Y) * sys_clk). This equation is evaluated every sys_clk cycles and therefore can only generate TREQs at a rate of 1 per sys_clk (i.e. permanent TREQ) or less.
    @RegisterBank(offset: 0x0428)
    public var timer2: Register<TIMER2>

    @Register(bitWidth: 32)
    public struct TIMER2 {
        /// Pacing Timer Dividend. Specifies the X value for the (X/Y) fractional timer.
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var x: X_Field

        /// Pacing Timer Divisor. Specifies the Y value for the (X/Y) fractional timer.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var y: Y_Field
    }

    /// Pacing (X/Y) Fractional Timer
    /// The pacing timer produces TREQ assertions at a rate set by ((X/Y) * sys_clk). This equation is evaluated every sys_clk cycles and therefore can only generate TREQs at a rate of 1 per sys_clk (i.e. permanent TREQ) or less.
    @RegisterBank(offset: 0x042c)
    public var timer3: Register<TIMER3>

    @Register(bitWidth: 32)
    public struct TIMER3 {
        /// Pacing Timer Dividend. Specifies the X value for the (X/Y) fractional timer.
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var x: X_Field

        /// Pacing Timer Divisor. Specifies the Y value for the (X/Y) fractional timer.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var y: Y_Field
    }

    /// Trigger one or more channels simultaneously
    @RegisterBank(offset: 0x0430)
    public var multi_chan_trigger: Register<MULTI_CHAN_TRIGGER>

    @Register(bitWidth: 32)
    public struct MULTI_CHAN_TRIGGER {
        /// Each bit in this register corresponds to a DMA channel. Writing a 1 to the relevant bit is the same as writing to that channel's trigger register; the channel will start if it is currently enabled and not already busy.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var multi_chan_trigger: MULTI_CHAN_TRIGGER_Field
    }

    /// Sniffer Control
    @RegisterBank(offset: 0x0434)
    public var sniff_ctrl: Register<SNIFF_CTRL>

    @Register(bitWidth: 32)
    public struct SNIFF_CTRL {
        /// If set, the result appears inverted (bitwise complement) when read. This does not affect the way the checksum is calculated; the result is transformed on-the-fly between the result register and the bus.
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var out_inv: OUT_INV_Field

        /// If set, the result appears bit-reversed when read. This does not affect the way the checksum is calculated; the result is transformed on-the-fly between the result register and the bus.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var out_rev: OUT_REV_Field

        /// Locally perform a byte reverse on the sniffed data, before feeding into checksum.
        /// Note that the sniff hardware is downstream of the DMA channel byteswap performed in the read master: if channel CTRL_BSWAP and SNIFF_CTRL_BSWAP are both enabled, their effects cancel from the sniffer's point of view.
        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var bswap: BSWAP_Field

        @ReadWrite(bits: 5..<9, as: CALC_Values.self)
        public var calc: CALC_Field

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

        /// DMA channel for Sniffer to observe
        @ReadWrite(bits: 1..<5, as: BitField4.self)
        public var dmach: DMACH_Field

        /// Enable sniffer
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var en: EN_Field
    }

    /// Data accumulator for sniff hardware
    /// Write an initial seed value here before starting a DMA transfer on the channel indicated by SNIFF_CTRL_DMACH. The hardware will update this register each time it observes a read from the indicated channel. Once the channel completes, the final result can be read from this register.
    @RegisterBank(offset: 0x0438)
    public var sniff_data: Register<SNIFF_DATA>

    @Register(bitWidth: 32)
    public struct SNIFF_DATA {}

    /// Debug RAF, WAF, TDF levels
    @RegisterBank(offset: 0x0440)
    public var fifo_levels: Register<FIFO_LEVELS>

    @Register(bitWidth: 32)
    public struct FIFO_LEVELS {
        /// Current Read-Address-FIFO fill level
        @ReadOnly(bits: 16..<24, as: BitField8.self)
        public var raf_lvl: RAF_LVL_Field

        /// Current Write-Address-FIFO fill level
        @ReadOnly(bits: 8..<16, as: BitField8.self)
        public var waf_lvl: WAF_LVL_Field

        /// Current Transfer-Data-FIFO fill level
        @ReadOnly(bits: 0..<8, as: BitField8.self)
        public var tdf_lvl: TDF_LVL_Field
    }

    /// Abort an in-progress transfer sequence on one or more channels
    @RegisterBank(offset: 0x0444)
    public var chan_abort: Register<CHAN_ABORT>

    @Register(bitWidth: 32)
    public struct CHAN_ABORT {
        /// Each bit corresponds to a channel. Writing a 1 aborts whatever transfer sequence is in progress on that channel. The bit will remain high until any in-flight transfers have been flushed through the address and data FIFOs.
        /// After writing, this register must be polled until it returns all-zero. Until this point, it is unsafe to restart the channel.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var chan_abort: CHAN_ABORT_Field
    }

    /// The number of channels this DMA instance is equipped with. This DMA supports up to 16 hardware channels, but can be configured with as few as one, to minimise silicon area.
    @RegisterBank(offset: 0x0448)
    public var n_channels: Register<N_CHANNELS>

    @Register(bitWidth: 32)
    public struct N_CHANNELS {
        @ReadOnly(bits: 0..<5, as: BitField5.self)
        public var n_channels: N_CHANNELS_Field
    }

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    @RegisterBank(offset: 0x0800)
    public var ch0_dbg_ctdreq: Register<CH0_DBG_CTDREQ>

    @Register(bitWidth: 32)
    public struct CH0_DBG_CTDREQ {
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var ch0_dbg_ctdreq: CH0_DBG_CTDREQ_Field
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    @RegisterBank(offset: 0x0804)
    public var ch0_dbg_tcr: Register<CH0_DBG_TCR>

    @Register(bitWidth: 32)
    public struct CH0_DBG_TCR {}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    @RegisterBank(offset: 0x0840)
    public var ch1_dbg_ctdreq: Register<CH1_DBG_CTDREQ>

    @Register(bitWidth: 32)
    public struct CH1_DBG_CTDREQ {
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var ch1_dbg_ctdreq: CH1_DBG_CTDREQ_Field
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    @RegisterBank(offset: 0x0844)
    public var ch1_dbg_tcr: Register<CH1_DBG_TCR>

    @Register(bitWidth: 32)
    public struct CH1_DBG_TCR {}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    @RegisterBank(offset: 0x0880)
    public var ch2_dbg_ctdreq: Register<CH2_DBG_CTDREQ>

    @Register(bitWidth: 32)
    public struct CH2_DBG_CTDREQ {
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var ch2_dbg_ctdreq: CH2_DBG_CTDREQ_Field
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    @RegisterBank(offset: 0x0884)
    public var ch2_dbg_tcr: Register<CH2_DBG_TCR>

    @Register(bitWidth: 32)
    public struct CH2_DBG_TCR {}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    @RegisterBank(offset: 0x08c0)
    public var ch3_dbg_ctdreq: Register<CH3_DBG_CTDREQ>

    @Register(bitWidth: 32)
    public struct CH3_DBG_CTDREQ {
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var ch3_dbg_ctdreq: CH3_DBG_CTDREQ_Field
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    @RegisterBank(offset: 0x08c4)
    public var ch3_dbg_tcr: Register<CH3_DBG_TCR>

    @Register(bitWidth: 32)
    public struct CH3_DBG_TCR {}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    @RegisterBank(offset: 0x0900)
    public var ch4_dbg_ctdreq: Register<CH4_DBG_CTDREQ>

    @Register(bitWidth: 32)
    public struct CH4_DBG_CTDREQ {
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var ch4_dbg_ctdreq: CH4_DBG_CTDREQ_Field
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    @RegisterBank(offset: 0x0904)
    public var ch4_dbg_tcr: Register<CH4_DBG_TCR>

    @Register(bitWidth: 32)
    public struct CH4_DBG_TCR {}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    @RegisterBank(offset: 0x0940)
    public var ch5_dbg_ctdreq: Register<CH5_DBG_CTDREQ>

    @Register(bitWidth: 32)
    public struct CH5_DBG_CTDREQ {
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var ch5_dbg_ctdreq: CH5_DBG_CTDREQ_Field
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    @RegisterBank(offset: 0x0944)
    public var ch5_dbg_tcr: Register<CH5_DBG_TCR>

    @Register(bitWidth: 32)
    public struct CH5_DBG_TCR {}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    @RegisterBank(offset: 0x0980)
    public var ch6_dbg_ctdreq: Register<CH6_DBG_CTDREQ>

    @Register(bitWidth: 32)
    public struct CH6_DBG_CTDREQ {
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var ch6_dbg_ctdreq: CH6_DBG_CTDREQ_Field
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    @RegisterBank(offset: 0x0984)
    public var ch6_dbg_tcr: Register<CH6_DBG_TCR>

    @Register(bitWidth: 32)
    public struct CH6_DBG_TCR {}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    @RegisterBank(offset: 0x09c0)
    public var ch7_dbg_ctdreq: Register<CH7_DBG_CTDREQ>

    @Register(bitWidth: 32)
    public struct CH7_DBG_CTDREQ {
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var ch7_dbg_ctdreq: CH7_DBG_CTDREQ_Field
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    @RegisterBank(offset: 0x09c4)
    public var ch7_dbg_tcr: Register<CH7_DBG_TCR>

    @Register(bitWidth: 32)
    public struct CH7_DBG_TCR {}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    @RegisterBank(offset: 0x0a00)
    public var ch8_dbg_ctdreq: Register<CH8_DBG_CTDREQ>

    @Register(bitWidth: 32)
    public struct CH8_DBG_CTDREQ {
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var ch8_dbg_ctdreq: CH8_DBG_CTDREQ_Field
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    @RegisterBank(offset: 0x0a04)
    public var ch8_dbg_tcr: Register<CH8_DBG_TCR>

    @Register(bitWidth: 32)
    public struct CH8_DBG_TCR {}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    @RegisterBank(offset: 0x0a40)
    public var ch9_dbg_ctdreq: Register<CH9_DBG_CTDREQ>

    @Register(bitWidth: 32)
    public struct CH9_DBG_CTDREQ {
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var ch9_dbg_ctdreq: CH9_DBG_CTDREQ_Field
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    @RegisterBank(offset: 0x0a44)
    public var ch9_dbg_tcr: Register<CH9_DBG_TCR>

    @Register(bitWidth: 32)
    public struct CH9_DBG_TCR {}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    @RegisterBank(offset: 0x0a80)
    public var ch10_dbg_ctdreq: Register<CH10_DBG_CTDREQ>

    @Register(bitWidth: 32)
    public struct CH10_DBG_CTDREQ {
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var ch10_dbg_ctdreq: CH10_DBG_CTDREQ_Field
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    @RegisterBank(offset: 0x0a84)
    public var ch10_dbg_tcr: Register<CH10_DBG_TCR>

    @Register(bitWidth: 32)
    public struct CH10_DBG_TCR {}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    @RegisterBank(offset: 0x0ac0)
    public var ch11_dbg_ctdreq: Register<CH11_DBG_CTDREQ>

    @Register(bitWidth: 32)
    public struct CH11_DBG_CTDREQ {
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var ch11_dbg_ctdreq: CH11_DBG_CTDREQ_Field
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    @RegisterBank(offset: 0x0ac4)
    public var ch11_dbg_tcr: Register<CH11_DBG_TCR>

    @Register(bitWidth: 32)
    public struct CH11_DBG_TCR {}
}
