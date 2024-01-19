import MMIO
import MMIOExtensions

/// DMA with separate read and write masters
@RegisterBank
public struct DMA {

    public static var `default`: Self { .init(unsafeAddress: 0x50000000) }

    /// DMA Channel 0 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    @RegisterBank(offset: 0x0000)
    public var CH0_READ_ADDR: Register<CH0_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH0_READ_ADDR_Descriptor {}

    /// DMA Channel 0 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    @RegisterBank(offset: 0x0004)
    public var CH0_WRITE_ADDR: Register<CH0_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH0_WRITE_ADDR_Descriptor {}

    /// DMA Channel 0 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    @RegisterBank(offset: 0x0008)
    public var CH0_TRANS_COUNT: Register<CH0_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH0_TRANS_COUNT_Descriptor {}

    /// DMA Channel 0 Control and Status
    @RegisterBank(offset: 0x000c)
    public var CH0_CTRL_TRIG: Register<CH0_CTRL_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH0_CTRL_TRIG_Descriptor {
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var AHB_ERROR: AHB_ERROR_Field

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var READ_ERROR: READ_ERROR_Field

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var WRITE_ERROR: WRITE_ERROR_Field

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var BUSY: BUSY_Field

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var SNIFF_EN: SNIFF_EN_Field

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var BSWAP: BSWAP_Field

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var IRQ_QUIET: IRQ_QUIET_Field

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        @ReadWrite(bits: 15..<21, as: TREQ_SEL_Values.self)
        public var TREQ_SEL: TREQ_SEL_Field

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
        public var CHAIN_TO: CHAIN_TO_Field

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var RING_SEL: RING_SEL_Field

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        @ReadWrite(bits: 6..<10, as: RING_SIZE_Values.self)
        public var RING_SIZE: RING_SIZE_Field

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var INCR_WRITE: INCR_WRITE_Field

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var INCR_READ: INCR_READ_Field

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        @ReadWrite(bits: 2..<4, as: DATA_SIZE_Values.self)
        public var DATA_SIZE: DATA_SIZE_Field

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var HIGH_PRIORITY: HIGH_PRIORITY_Field

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var EN: EN_Field
    }

    /// Alias for channel 0 CTRL register
    @RegisterBank(offset: 0x0010)
    public var CH0_AL1_CTRL: Register<CH0_AL1_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH0_AL1_CTRL_Descriptor {}

    /// Alias for channel 0 READ_ADDR register
    @RegisterBank(offset: 0x0014)
    public var CH0_AL1_READ_ADDR: Register<CH0_AL1_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH0_AL1_READ_ADDR_Descriptor {}

    /// Alias for channel 0 WRITE_ADDR register
    @RegisterBank(offset: 0x0018)
    public var CH0_AL1_WRITE_ADDR: Register<CH0_AL1_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH0_AL1_WRITE_ADDR_Descriptor {}

    /// Alias for channel 0 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x001c)
    public var CH0_AL1_TRANS_COUNT_TRIG: Register<CH0_AL1_TRANS_COUNT_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH0_AL1_TRANS_COUNT_TRIG_Descriptor {}

    /// Alias for channel 0 CTRL register
    @RegisterBank(offset: 0x0020)
    public var CH0_AL2_CTRL: Register<CH0_AL2_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH0_AL2_CTRL_Descriptor {}

    /// Alias for channel 0 TRANS_COUNT register
    @RegisterBank(offset: 0x0024)
    public var CH0_AL2_TRANS_COUNT: Register<CH0_AL2_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH0_AL2_TRANS_COUNT_Descriptor {}

    /// Alias for channel 0 READ_ADDR register
    @RegisterBank(offset: 0x0028)
    public var CH0_AL2_READ_ADDR: Register<CH0_AL2_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH0_AL2_READ_ADDR_Descriptor {}

    /// Alias for channel 0 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x002c)
    public var CH0_AL2_WRITE_ADDR_TRIG: Register<CH0_AL2_WRITE_ADDR_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH0_AL2_WRITE_ADDR_TRIG_Descriptor {}

    /// Alias for channel 0 CTRL register
    @RegisterBank(offset: 0x0030)
    public var CH0_AL3_CTRL: Register<CH0_AL3_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH0_AL3_CTRL_Descriptor {}

    /// Alias for channel 0 WRITE_ADDR register
    @RegisterBank(offset: 0x0034)
    public var CH0_AL3_WRITE_ADDR: Register<CH0_AL3_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH0_AL3_WRITE_ADDR_Descriptor {}

    /// Alias for channel 0 TRANS_COUNT register
    @RegisterBank(offset: 0x0038)
    public var CH0_AL3_TRANS_COUNT: Register<CH0_AL3_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH0_AL3_TRANS_COUNT_Descriptor {}

    /// Alias for channel 0 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x003c)
    public var CH0_AL3_READ_ADDR_TRIG: Register<CH0_AL3_READ_ADDR_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH0_AL3_READ_ADDR_TRIG_Descriptor {}

    /// DMA Channel 1 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    @RegisterBank(offset: 0x0040)
    public var CH1_READ_ADDR: Register<CH1_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH1_READ_ADDR_Descriptor {}

    /// DMA Channel 1 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    @RegisterBank(offset: 0x0044)
    public var CH1_WRITE_ADDR: Register<CH1_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH1_WRITE_ADDR_Descriptor {}

    /// DMA Channel 1 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    @RegisterBank(offset: 0x0048)
    public var CH1_TRANS_COUNT: Register<CH1_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH1_TRANS_COUNT_Descriptor {}

    /// DMA Channel 1 Control and Status
    @RegisterBank(offset: 0x004c)
    public var CH1_CTRL_TRIG: Register<CH1_CTRL_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH1_CTRL_TRIG_Descriptor {
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var AHB_ERROR: AHB_ERROR_Field

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var READ_ERROR: READ_ERROR_Field

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var WRITE_ERROR: WRITE_ERROR_Field

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var BUSY: BUSY_Field

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var SNIFF_EN: SNIFF_EN_Field

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var BSWAP: BSWAP_Field

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var IRQ_QUIET: IRQ_QUIET_Field

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        @ReadWrite(bits: 15..<21, as: TREQ_SEL_Values.self)
        public var TREQ_SEL: TREQ_SEL_Field

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
        public var CHAIN_TO: CHAIN_TO_Field

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var RING_SEL: RING_SEL_Field

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        @ReadWrite(bits: 6..<10, as: RING_SIZE_Values.self)
        public var RING_SIZE: RING_SIZE_Field

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var INCR_WRITE: INCR_WRITE_Field

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var INCR_READ: INCR_READ_Field

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        @ReadWrite(bits: 2..<4, as: DATA_SIZE_Values.self)
        public var DATA_SIZE: DATA_SIZE_Field

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var HIGH_PRIORITY: HIGH_PRIORITY_Field

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var EN: EN_Field
    }

    /// Alias for channel 1 CTRL register
    @RegisterBank(offset: 0x0050)
    public var CH1_AL1_CTRL: Register<CH1_AL1_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH1_AL1_CTRL_Descriptor {}

    /// Alias for channel 1 READ_ADDR register
    @RegisterBank(offset: 0x0054)
    public var CH1_AL1_READ_ADDR: Register<CH1_AL1_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH1_AL1_READ_ADDR_Descriptor {}

    /// Alias for channel 1 WRITE_ADDR register
    @RegisterBank(offset: 0x0058)
    public var CH1_AL1_WRITE_ADDR: Register<CH1_AL1_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH1_AL1_WRITE_ADDR_Descriptor {}

    /// Alias for channel 1 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x005c)
    public var CH1_AL1_TRANS_COUNT_TRIG: Register<CH1_AL1_TRANS_COUNT_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH1_AL1_TRANS_COUNT_TRIG_Descriptor {}

    /// Alias for channel 1 CTRL register
    @RegisterBank(offset: 0x0060)
    public var CH1_AL2_CTRL: Register<CH1_AL2_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH1_AL2_CTRL_Descriptor {}

    /// Alias for channel 1 TRANS_COUNT register
    @RegisterBank(offset: 0x0064)
    public var CH1_AL2_TRANS_COUNT: Register<CH1_AL2_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH1_AL2_TRANS_COUNT_Descriptor {}

    /// Alias for channel 1 READ_ADDR register
    @RegisterBank(offset: 0x0068)
    public var CH1_AL2_READ_ADDR: Register<CH1_AL2_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH1_AL2_READ_ADDR_Descriptor {}

    /// Alias for channel 1 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x006c)
    public var CH1_AL2_WRITE_ADDR_TRIG: Register<CH1_AL2_WRITE_ADDR_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH1_AL2_WRITE_ADDR_TRIG_Descriptor {}

    /// Alias for channel 1 CTRL register
    @RegisterBank(offset: 0x0070)
    public var CH1_AL3_CTRL: Register<CH1_AL3_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH1_AL3_CTRL_Descriptor {}

    /// Alias for channel 1 WRITE_ADDR register
    @RegisterBank(offset: 0x0074)
    public var CH1_AL3_WRITE_ADDR: Register<CH1_AL3_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH1_AL3_WRITE_ADDR_Descriptor {}

    /// Alias for channel 1 TRANS_COUNT register
    @RegisterBank(offset: 0x0078)
    public var CH1_AL3_TRANS_COUNT: Register<CH1_AL3_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH1_AL3_TRANS_COUNT_Descriptor {}

    /// Alias for channel 1 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x007c)
    public var CH1_AL3_READ_ADDR_TRIG: Register<CH1_AL3_READ_ADDR_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH1_AL3_READ_ADDR_TRIG_Descriptor {}

    /// DMA Channel 2 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    @RegisterBank(offset: 0x0080)
    public var CH2_READ_ADDR: Register<CH2_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH2_READ_ADDR_Descriptor {}

    /// DMA Channel 2 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    @RegisterBank(offset: 0x0084)
    public var CH2_WRITE_ADDR: Register<CH2_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH2_WRITE_ADDR_Descriptor {}

    /// DMA Channel 2 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    @RegisterBank(offset: 0x0088)
    public var CH2_TRANS_COUNT: Register<CH2_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH2_TRANS_COUNT_Descriptor {}

    /// DMA Channel 2 Control and Status
    @RegisterBank(offset: 0x008c)
    public var CH2_CTRL_TRIG: Register<CH2_CTRL_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH2_CTRL_TRIG_Descriptor {
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var AHB_ERROR: AHB_ERROR_Field

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var READ_ERROR: READ_ERROR_Field

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var WRITE_ERROR: WRITE_ERROR_Field

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var BUSY: BUSY_Field

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var SNIFF_EN: SNIFF_EN_Field

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var BSWAP: BSWAP_Field

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var IRQ_QUIET: IRQ_QUIET_Field

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        @ReadWrite(bits: 15..<21, as: TREQ_SEL_Values.self)
        public var TREQ_SEL: TREQ_SEL_Field

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
        public var CHAIN_TO: CHAIN_TO_Field

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var RING_SEL: RING_SEL_Field

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        @ReadWrite(bits: 6..<10, as: RING_SIZE_Values.self)
        public var RING_SIZE: RING_SIZE_Field

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var INCR_WRITE: INCR_WRITE_Field

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var INCR_READ: INCR_READ_Field

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        @ReadWrite(bits: 2..<4, as: DATA_SIZE_Values.self)
        public var DATA_SIZE: DATA_SIZE_Field

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var HIGH_PRIORITY: HIGH_PRIORITY_Field

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var EN: EN_Field
    }

    /// Alias for channel 2 CTRL register
    @RegisterBank(offset: 0x0090)
    public var CH2_AL1_CTRL: Register<CH2_AL1_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH2_AL1_CTRL_Descriptor {}

    /// Alias for channel 2 READ_ADDR register
    @RegisterBank(offset: 0x0094)
    public var CH2_AL1_READ_ADDR: Register<CH2_AL1_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH2_AL1_READ_ADDR_Descriptor {}

    /// Alias for channel 2 WRITE_ADDR register
    @RegisterBank(offset: 0x0098)
    public var CH2_AL1_WRITE_ADDR: Register<CH2_AL1_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH2_AL1_WRITE_ADDR_Descriptor {}

    /// Alias for channel 2 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x009c)
    public var CH2_AL1_TRANS_COUNT_TRIG: Register<CH2_AL1_TRANS_COUNT_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH2_AL1_TRANS_COUNT_TRIG_Descriptor {}

    /// Alias for channel 2 CTRL register
    @RegisterBank(offset: 0x00a0)
    public var CH2_AL2_CTRL: Register<CH2_AL2_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH2_AL2_CTRL_Descriptor {}

    /// Alias for channel 2 TRANS_COUNT register
    @RegisterBank(offset: 0x00a4)
    public var CH2_AL2_TRANS_COUNT: Register<CH2_AL2_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH2_AL2_TRANS_COUNT_Descriptor {}

    /// Alias for channel 2 READ_ADDR register
    @RegisterBank(offset: 0x00a8)
    public var CH2_AL2_READ_ADDR: Register<CH2_AL2_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH2_AL2_READ_ADDR_Descriptor {}

    /// Alias for channel 2 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x00ac)
    public var CH2_AL2_WRITE_ADDR_TRIG: Register<CH2_AL2_WRITE_ADDR_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH2_AL2_WRITE_ADDR_TRIG_Descriptor {}

    /// Alias for channel 2 CTRL register
    @RegisterBank(offset: 0x00b0)
    public var CH2_AL3_CTRL: Register<CH2_AL3_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH2_AL3_CTRL_Descriptor {}

    /// Alias for channel 2 WRITE_ADDR register
    @RegisterBank(offset: 0x00b4)
    public var CH2_AL3_WRITE_ADDR: Register<CH2_AL3_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH2_AL3_WRITE_ADDR_Descriptor {}

    /// Alias for channel 2 TRANS_COUNT register
    @RegisterBank(offset: 0x00b8)
    public var CH2_AL3_TRANS_COUNT: Register<CH2_AL3_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH2_AL3_TRANS_COUNT_Descriptor {}

    /// Alias for channel 2 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x00bc)
    public var CH2_AL3_READ_ADDR_TRIG: Register<CH2_AL3_READ_ADDR_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH2_AL3_READ_ADDR_TRIG_Descriptor {}

    /// DMA Channel 3 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    @RegisterBank(offset: 0x00c0)
    public var CH3_READ_ADDR: Register<CH3_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH3_READ_ADDR_Descriptor {}

    /// DMA Channel 3 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    @RegisterBank(offset: 0x00c4)
    public var CH3_WRITE_ADDR: Register<CH3_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH3_WRITE_ADDR_Descriptor {}

    /// DMA Channel 3 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    @RegisterBank(offset: 0x00c8)
    public var CH3_TRANS_COUNT: Register<CH3_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH3_TRANS_COUNT_Descriptor {}

    /// DMA Channel 3 Control and Status
    @RegisterBank(offset: 0x00cc)
    public var CH3_CTRL_TRIG: Register<CH3_CTRL_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH3_CTRL_TRIG_Descriptor {
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var AHB_ERROR: AHB_ERROR_Field

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var READ_ERROR: READ_ERROR_Field

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var WRITE_ERROR: WRITE_ERROR_Field

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var BUSY: BUSY_Field

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var SNIFF_EN: SNIFF_EN_Field

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var BSWAP: BSWAP_Field

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var IRQ_QUIET: IRQ_QUIET_Field

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        @ReadWrite(bits: 15..<21, as: TREQ_SEL_Values.self)
        public var TREQ_SEL: TREQ_SEL_Field

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
        public var CHAIN_TO: CHAIN_TO_Field

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var RING_SEL: RING_SEL_Field

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        @ReadWrite(bits: 6..<10, as: RING_SIZE_Values.self)
        public var RING_SIZE: RING_SIZE_Field

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var INCR_WRITE: INCR_WRITE_Field

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var INCR_READ: INCR_READ_Field

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        @ReadWrite(bits: 2..<4, as: DATA_SIZE_Values.self)
        public var DATA_SIZE: DATA_SIZE_Field

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var HIGH_PRIORITY: HIGH_PRIORITY_Field

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var EN: EN_Field
    }

    /// Alias for channel 3 CTRL register
    @RegisterBank(offset: 0x00d0)
    public var CH3_AL1_CTRL: Register<CH3_AL1_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH3_AL1_CTRL_Descriptor {}

    /// Alias for channel 3 READ_ADDR register
    @RegisterBank(offset: 0x00d4)
    public var CH3_AL1_READ_ADDR: Register<CH3_AL1_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH3_AL1_READ_ADDR_Descriptor {}

    /// Alias for channel 3 WRITE_ADDR register
    @RegisterBank(offset: 0x00d8)
    public var CH3_AL1_WRITE_ADDR: Register<CH3_AL1_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH3_AL1_WRITE_ADDR_Descriptor {}

    /// Alias for channel 3 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x00dc)
    public var CH3_AL1_TRANS_COUNT_TRIG: Register<CH3_AL1_TRANS_COUNT_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH3_AL1_TRANS_COUNT_TRIG_Descriptor {}

    /// Alias for channel 3 CTRL register
    @RegisterBank(offset: 0x00e0)
    public var CH3_AL2_CTRL: Register<CH3_AL2_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH3_AL2_CTRL_Descriptor {}

    /// Alias for channel 3 TRANS_COUNT register
    @RegisterBank(offset: 0x00e4)
    public var CH3_AL2_TRANS_COUNT: Register<CH3_AL2_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH3_AL2_TRANS_COUNT_Descriptor {}

    /// Alias for channel 3 READ_ADDR register
    @RegisterBank(offset: 0x00e8)
    public var CH3_AL2_READ_ADDR: Register<CH3_AL2_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH3_AL2_READ_ADDR_Descriptor {}

    /// Alias for channel 3 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x00ec)
    public var CH3_AL2_WRITE_ADDR_TRIG: Register<CH3_AL2_WRITE_ADDR_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH3_AL2_WRITE_ADDR_TRIG_Descriptor {}

    /// Alias for channel 3 CTRL register
    @RegisterBank(offset: 0x00f0)
    public var CH3_AL3_CTRL: Register<CH3_AL3_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH3_AL3_CTRL_Descriptor {}

    /// Alias for channel 3 WRITE_ADDR register
    @RegisterBank(offset: 0x00f4)
    public var CH3_AL3_WRITE_ADDR: Register<CH3_AL3_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH3_AL3_WRITE_ADDR_Descriptor {}

    /// Alias for channel 3 TRANS_COUNT register
    @RegisterBank(offset: 0x00f8)
    public var CH3_AL3_TRANS_COUNT: Register<CH3_AL3_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH3_AL3_TRANS_COUNT_Descriptor {}

    /// Alias for channel 3 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x00fc)
    public var CH3_AL3_READ_ADDR_TRIG: Register<CH3_AL3_READ_ADDR_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH3_AL3_READ_ADDR_TRIG_Descriptor {}

    /// DMA Channel 4 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    @RegisterBank(offset: 0x0100)
    public var CH4_READ_ADDR: Register<CH4_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH4_READ_ADDR_Descriptor {}

    /// DMA Channel 4 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    @RegisterBank(offset: 0x0104)
    public var CH4_WRITE_ADDR: Register<CH4_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH4_WRITE_ADDR_Descriptor {}

    /// DMA Channel 4 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    @RegisterBank(offset: 0x0108)
    public var CH4_TRANS_COUNT: Register<CH4_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH4_TRANS_COUNT_Descriptor {}

    /// DMA Channel 4 Control and Status
    @RegisterBank(offset: 0x010c)
    public var CH4_CTRL_TRIG: Register<CH4_CTRL_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH4_CTRL_TRIG_Descriptor {
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var AHB_ERROR: AHB_ERROR_Field

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var READ_ERROR: READ_ERROR_Field

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var WRITE_ERROR: WRITE_ERROR_Field

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var BUSY: BUSY_Field

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var SNIFF_EN: SNIFF_EN_Field

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var BSWAP: BSWAP_Field

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var IRQ_QUIET: IRQ_QUIET_Field

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        @ReadWrite(bits: 15..<21, as: TREQ_SEL_Values.self)
        public var TREQ_SEL: TREQ_SEL_Field

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
        public var CHAIN_TO: CHAIN_TO_Field

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var RING_SEL: RING_SEL_Field

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        @ReadWrite(bits: 6..<10, as: RING_SIZE_Values.self)
        public var RING_SIZE: RING_SIZE_Field

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var INCR_WRITE: INCR_WRITE_Field

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var INCR_READ: INCR_READ_Field

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        @ReadWrite(bits: 2..<4, as: DATA_SIZE_Values.self)
        public var DATA_SIZE: DATA_SIZE_Field

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var HIGH_PRIORITY: HIGH_PRIORITY_Field

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var EN: EN_Field
    }

    /// Alias for channel 4 CTRL register
    @RegisterBank(offset: 0x0110)
    public var CH4_AL1_CTRL: Register<CH4_AL1_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH4_AL1_CTRL_Descriptor {}

    /// Alias for channel 4 READ_ADDR register
    @RegisterBank(offset: 0x0114)
    public var CH4_AL1_READ_ADDR: Register<CH4_AL1_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH4_AL1_READ_ADDR_Descriptor {}

    /// Alias for channel 4 WRITE_ADDR register
    @RegisterBank(offset: 0x0118)
    public var CH4_AL1_WRITE_ADDR: Register<CH4_AL1_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH4_AL1_WRITE_ADDR_Descriptor {}

    /// Alias for channel 4 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x011c)
    public var CH4_AL1_TRANS_COUNT_TRIG: Register<CH4_AL1_TRANS_COUNT_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH4_AL1_TRANS_COUNT_TRIG_Descriptor {}

    /// Alias for channel 4 CTRL register
    @RegisterBank(offset: 0x0120)
    public var CH4_AL2_CTRL: Register<CH4_AL2_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH4_AL2_CTRL_Descriptor {}

    /// Alias for channel 4 TRANS_COUNT register
    @RegisterBank(offset: 0x0124)
    public var CH4_AL2_TRANS_COUNT: Register<CH4_AL2_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH4_AL2_TRANS_COUNT_Descriptor {}

    /// Alias for channel 4 READ_ADDR register
    @RegisterBank(offset: 0x0128)
    public var CH4_AL2_READ_ADDR: Register<CH4_AL2_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH4_AL2_READ_ADDR_Descriptor {}

    /// Alias for channel 4 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x012c)
    public var CH4_AL2_WRITE_ADDR_TRIG: Register<CH4_AL2_WRITE_ADDR_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH4_AL2_WRITE_ADDR_TRIG_Descriptor {}

    /// Alias for channel 4 CTRL register
    @RegisterBank(offset: 0x0130)
    public var CH4_AL3_CTRL: Register<CH4_AL3_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH4_AL3_CTRL_Descriptor {}

    /// Alias for channel 4 WRITE_ADDR register
    @RegisterBank(offset: 0x0134)
    public var CH4_AL3_WRITE_ADDR: Register<CH4_AL3_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH4_AL3_WRITE_ADDR_Descriptor {}

    /// Alias for channel 4 TRANS_COUNT register
    @RegisterBank(offset: 0x0138)
    public var CH4_AL3_TRANS_COUNT: Register<CH4_AL3_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH4_AL3_TRANS_COUNT_Descriptor {}

    /// Alias for channel 4 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x013c)
    public var CH4_AL3_READ_ADDR_TRIG: Register<CH4_AL3_READ_ADDR_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH4_AL3_READ_ADDR_TRIG_Descriptor {}

    /// DMA Channel 5 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    @RegisterBank(offset: 0x0140)
    public var CH5_READ_ADDR: Register<CH5_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH5_READ_ADDR_Descriptor {}

    /// DMA Channel 5 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    @RegisterBank(offset: 0x0144)
    public var CH5_WRITE_ADDR: Register<CH5_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH5_WRITE_ADDR_Descriptor {}

    /// DMA Channel 5 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    @RegisterBank(offset: 0x0148)
    public var CH5_TRANS_COUNT: Register<CH5_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH5_TRANS_COUNT_Descriptor {}

    /// DMA Channel 5 Control and Status
    @RegisterBank(offset: 0x014c)
    public var CH5_CTRL_TRIG: Register<CH5_CTRL_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH5_CTRL_TRIG_Descriptor {
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var AHB_ERROR: AHB_ERROR_Field

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var READ_ERROR: READ_ERROR_Field

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var WRITE_ERROR: WRITE_ERROR_Field

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var BUSY: BUSY_Field

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var SNIFF_EN: SNIFF_EN_Field

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var BSWAP: BSWAP_Field

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var IRQ_QUIET: IRQ_QUIET_Field

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        @ReadWrite(bits: 15..<21, as: TREQ_SEL_Values.self)
        public var TREQ_SEL: TREQ_SEL_Field

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
        public var CHAIN_TO: CHAIN_TO_Field

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var RING_SEL: RING_SEL_Field

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        @ReadWrite(bits: 6..<10, as: RING_SIZE_Values.self)
        public var RING_SIZE: RING_SIZE_Field

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var INCR_WRITE: INCR_WRITE_Field

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var INCR_READ: INCR_READ_Field

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        @ReadWrite(bits: 2..<4, as: DATA_SIZE_Values.self)
        public var DATA_SIZE: DATA_SIZE_Field

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var HIGH_PRIORITY: HIGH_PRIORITY_Field

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var EN: EN_Field
    }

    /// Alias for channel 5 CTRL register
    @RegisterBank(offset: 0x0150)
    public var CH5_AL1_CTRL: Register<CH5_AL1_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH5_AL1_CTRL_Descriptor {}

    /// Alias for channel 5 READ_ADDR register
    @RegisterBank(offset: 0x0154)
    public var CH5_AL1_READ_ADDR: Register<CH5_AL1_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH5_AL1_READ_ADDR_Descriptor {}

    /// Alias for channel 5 WRITE_ADDR register
    @RegisterBank(offset: 0x0158)
    public var CH5_AL1_WRITE_ADDR: Register<CH5_AL1_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH5_AL1_WRITE_ADDR_Descriptor {}

    /// Alias for channel 5 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x015c)
    public var CH5_AL1_TRANS_COUNT_TRIG: Register<CH5_AL1_TRANS_COUNT_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH5_AL1_TRANS_COUNT_TRIG_Descriptor {}

    /// Alias for channel 5 CTRL register
    @RegisterBank(offset: 0x0160)
    public var CH5_AL2_CTRL: Register<CH5_AL2_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH5_AL2_CTRL_Descriptor {}

    /// Alias for channel 5 TRANS_COUNT register
    @RegisterBank(offset: 0x0164)
    public var CH5_AL2_TRANS_COUNT: Register<CH5_AL2_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH5_AL2_TRANS_COUNT_Descriptor {}

    /// Alias for channel 5 READ_ADDR register
    @RegisterBank(offset: 0x0168)
    public var CH5_AL2_READ_ADDR: Register<CH5_AL2_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH5_AL2_READ_ADDR_Descriptor {}

    /// Alias for channel 5 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x016c)
    public var CH5_AL2_WRITE_ADDR_TRIG: Register<CH5_AL2_WRITE_ADDR_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH5_AL2_WRITE_ADDR_TRIG_Descriptor {}

    /// Alias for channel 5 CTRL register
    @RegisterBank(offset: 0x0170)
    public var CH5_AL3_CTRL: Register<CH5_AL3_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH5_AL3_CTRL_Descriptor {}

    /// Alias for channel 5 WRITE_ADDR register
    @RegisterBank(offset: 0x0174)
    public var CH5_AL3_WRITE_ADDR: Register<CH5_AL3_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH5_AL3_WRITE_ADDR_Descriptor {}

    /// Alias for channel 5 TRANS_COUNT register
    @RegisterBank(offset: 0x0178)
    public var CH5_AL3_TRANS_COUNT: Register<CH5_AL3_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH5_AL3_TRANS_COUNT_Descriptor {}

    /// Alias for channel 5 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x017c)
    public var CH5_AL3_READ_ADDR_TRIG: Register<CH5_AL3_READ_ADDR_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH5_AL3_READ_ADDR_TRIG_Descriptor {}

    /// DMA Channel 6 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    @RegisterBank(offset: 0x0180)
    public var CH6_READ_ADDR: Register<CH6_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH6_READ_ADDR_Descriptor {}

    /// DMA Channel 6 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    @RegisterBank(offset: 0x0184)
    public var CH6_WRITE_ADDR: Register<CH6_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH6_WRITE_ADDR_Descriptor {}

    /// DMA Channel 6 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    @RegisterBank(offset: 0x0188)
    public var CH6_TRANS_COUNT: Register<CH6_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH6_TRANS_COUNT_Descriptor {}

    /// DMA Channel 6 Control and Status
    @RegisterBank(offset: 0x018c)
    public var CH6_CTRL_TRIG: Register<CH6_CTRL_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH6_CTRL_TRIG_Descriptor {
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var AHB_ERROR: AHB_ERROR_Field

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var READ_ERROR: READ_ERROR_Field

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var WRITE_ERROR: WRITE_ERROR_Field

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var BUSY: BUSY_Field

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var SNIFF_EN: SNIFF_EN_Field

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var BSWAP: BSWAP_Field

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var IRQ_QUIET: IRQ_QUIET_Field

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        @ReadWrite(bits: 15..<21, as: TREQ_SEL_Values.self)
        public var TREQ_SEL: TREQ_SEL_Field

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
        public var CHAIN_TO: CHAIN_TO_Field

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var RING_SEL: RING_SEL_Field

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        @ReadWrite(bits: 6..<10, as: RING_SIZE_Values.self)
        public var RING_SIZE: RING_SIZE_Field

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var INCR_WRITE: INCR_WRITE_Field

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var INCR_READ: INCR_READ_Field

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        @ReadWrite(bits: 2..<4, as: DATA_SIZE_Values.self)
        public var DATA_SIZE: DATA_SIZE_Field

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var HIGH_PRIORITY: HIGH_PRIORITY_Field

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var EN: EN_Field
    }

    /// Alias for channel 6 CTRL register
    @RegisterBank(offset: 0x0190)
    public var CH6_AL1_CTRL: Register<CH6_AL1_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH6_AL1_CTRL_Descriptor {}

    /// Alias for channel 6 READ_ADDR register
    @RegisterBank(offset: 0x0194)
    public var CH6_AL1_READ_ADDR: Register<CH6_AL1_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH6_AL1_READ_ADDR_Descriptor {}

    /// Alias for channel 6 WRITE_ADDR register
    @RegisterBank(offset: 0x0198)
    public var CH6_AL1_WRITE_ADDR: Register<CH6_AL1_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH6_AL1_WRITE_ADDR_Descriptor {}

    /// Alias for channel 6 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x019c)
    public var CH6_AL1_TRANS_COUNT_TRIG: Register<CH6_AL1_TRANS_COUNT_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH6_AL1_TRANS_COUNT_TRIG_Descriptor {}

    /// Alias for channel 6 CTRL register
    @RegisterBank(offset: 0x01a0)
    public var CH6_AL2_CTRL: Register<CH6_AL2_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH6_AL2_CTRL_Descriptor {}

    /// Alias for channel 6 TRANS_COUNT register
    @RegisterBank(offset: 0x01a4)
    public var CH6_AL2_TRANS_COUNT: Register<CH6_AL2_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH6_AL2_TRANS_COUNT_Descriptor {}

    /// Alias for channel 6 READ_ADDR register
    @RegisterBank(offset: 0x01a8)
    public var CH6_AL2_READ_ADDR: Register<CH6_AL2_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH6_AL2_READ_ADDR_Descriptor {}

    /// Alias for channel 6 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x01ac)
    public var CH6_AL2_WRITE_ADDR_TRIG: Register<CH6_AL2_WRITE_ADDR_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH6_AL2_WRITE_ADDR_TRIG_Descriptor {}

    /// Alias for channel 6 CTRL register
    @RegisterBank(offset: 0x01b0)
    public var CH6_AL3_CTRL: Register<CH6_AL3_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH6_AL3_CTRL_Descriptor {}

    /// Alias for channel 6 WRITE_ADDR register
    @RegisterBank(offset: 0x01b4)
    public var CH6_AL3_WRITE_ADDR: Register<CH6_AL3_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH6_AL3_WRITE_ADDR_Descriptor {}

    /// Alias for channel 6 TRANS_COUNT register
    @RegisterBank(offset: 0x01b8)
    public var CH6_AL3_TRANS_COUNT: Register<CH6_AL3_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH6_AL3_TRANS_COUNT_Descriptor {}

    /// Alias for channel 6 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x01bc)
    public var CH6_AL3_READ_ADDR_TRIG: Register<CH6_AL3_READ_ADDR_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH6_AL3_READ_ADDR_TRIG_Descriptor {}

    /// DMA Channel 7 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    @RegisterBank(offset: 0x01c0)
    public var CH7_READ_ADDR: Register<CH7_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH7_READ_ADDR_Descriptor {}

    /// DMA Channel 7 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    @RegisterBank(offset: 0x01c4)
    public var CH7_WRITE_ADDR: Register<CH7_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH7_WRITE_ADDR_Descriptor {}

    /// DMA Channel 7 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    @RegisterBank(offset: 0x01c8)
    public var CH7_TRANS_COUNT: Register<CH7_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH7_TRANS_COUNT_Descriptor {}

    /// DMA Channel 7 Control and Status
    @RegisterBank(offset: 0x01cc)
    public var CH7_CTRL_TRIG: Register<CH7_CTRL_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH7_CTRL_TRIG_Descriptor {
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var AHB_ERROR: AHB_ERROR_Field

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var READ_ERROR: READ_ERROR_Field

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var WRITE_ERROR: WRITE_ERROR_Field

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var BUSY: BUSY_Field

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var SNIFF_EN: SNIFF_EN_Field

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var BSWAP: BSWAP_Field

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var IRQ_QUIET: IRQ_QUIET_Field

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        @ReadWrite(bits: 15..<21, as: TREQ_SEL_Values.self)
        public var TREQ_SEL: TREQ_SEL_Field

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
        public var CHAIN_TO: CHAIN_TO_Field

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var RING_SEL: RING_SEL_Field

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        @ReadWrite(bits: 6..<10, as: RING_SIZE_Values.self)
        public var RING_SIZE: RING_SIZE_Field

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var INCR_WRITE: INCR_WRITE_Field

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var INCR_READ: INCR_READ_Field

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        @ReadWrite(bits: 2..<4, as: DATA_SIZE_Values.self)
        public var DATA_SIZE: DATA_SIZE_Field

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var HIGH_PRIORITY: HIGH_PRIORITY_Field

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var EN: EN_Field
    }

    /// Alias for channel 7 CTRL register
    @RegisterBank(offset: 0x01d0)
    public var CH7_AL1_CTRL: Register<CH7_AL1_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH7_AL1_CTRL_Descriptor {}

    /// Alias for channel 7 READ_ADDR register
    @RegisterBank(offset: 0x01d4)
    public var CH7_AL1_READ_ADDR: Register<CH7_AL1_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH7_AL1_READ_ADDR_Descriptor {}

    /// Alias for channel 7 WRITE_ADDR register
    @RegisterBank(offset: 0x01d8)
    public var CH7_AL1_WRITE_ADDR: Register<CH7_AL1_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH7_AL1_WRITE_ADDR_Descriptor {}

    /// Alias for channel 7 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x01dc)
    public var CH7_AL1_TRANS_COUNT_TRIG: Register<CH7_AL1_TRANS_COUNT_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH7_AL1_TRANS_COUNT_TRIG_Descriptor {}

    /// Alias for channel 7 CTRL register
    @RegisterBank(offset: 0x01e0)
    public var CH7_AL2_CTRL: Register<CH7_AL2_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH7_AL2_CTRL_Descriptor {}

    /// Alias for channel 7 TRANS_COUNT register
    @RegisterBank(offset: 0x01e4)
    public var CH7_AL2_TRANS_COUNT: Register<CH7_AL2_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH7_AL2_TRANS_COUNT_Descriptor {}

    /// Alias for channel 7 READ_ADDR register
    @RegisterBank(offset: 0x01e8)
    public var CH7_AL2_READ_ADDR: Register<CH7_AL2_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH7_AL2_READ_ADDR_Descriptor {}

    /// Alias for channel 7 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x01ec)
    public var CH7_AL2_WRITE_ADDR_TRIG: Register<CH7_AL2_WRITE_ADDR_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH7_AL2_WRITE_ADDR_TRIG_Descriptor {}

    /// Alias for channel 7 CTRL register
    @RegisterBank(offset: 0x01f0)
    public var CH7_AL3_CTRL: Register<CH7_AL3_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH7_AL3_CTRL_Descriptor {}

    /// Alias for channel 7 WRITE_ADDR register
    @RegisterBank(offset: 0x01f4)
    public var CH7_AL3_WRITE_ADDR: Register<CH7_AL3_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH7_AL3_WRITE_ADDR_Descriptor {}

    /// Alias for channel 7 TRANS_COUNT register
    @RegisterBank(offset: 0x01f8)
    public var CH7_AL3_TRANS_COUNT: Register<CH7_AL3_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH7_AL3_TRANS_COUNT_Descriptor {}

    /// Alias for channel 7 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x01fc)
    public var CH7_AL3_READ_ADDR_TRIG: Register<CH7_AL3_READ_ADDR_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH7_AL3_READ_ADDR_TRIG_Descriptor {}

    /// DMA Channel 8 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    @RegisterBank(offset: 0x0200)
    public var CH8_READ_ADDR: Register<CH8_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH8_READ_ADDR_Descriptor {}

    /// DMA Channel 8 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    @RegisterBank(offset: 0x0204)
    public var CH8_WRITE_ADDR: Register<CH8_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH8_WRITE_ADDR_Descriptor {}

    /// DMA Channel 8 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    @RegisterBank(offset: 0x0208)
    public var CH8_TRANS_COUNT: Register<CH8_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH8_TRANS_COUNT_Descriptor {}

    /// DMA Channel 8 Control and Status
    @RegisterBank(offset: 0x020c)
    public var CH8_CTRL_TRIG: Register<CH8_CTRL_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH8_CTRL_TRIG_Descriptor {
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var AHB_ERROR: AHB_ERROR_Field

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var READ_ERROR: READ_ERROR_Field

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var WRITE_ERROR: WRITE_ERROR_Field

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var BUSY: BUSY_Field

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var SNIFF_EN: SNIFF_EN_Field

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var BSWAP: BSWAP_Field

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var IRQ_QUIET: IRQ_QUIET_Field

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        @ReadWrite(bits: 15..<21, as: TREQ_SEL_Values.self)
        public var TREQ_SEL: TREQ_SEL_Field

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
        public var CHAIN_TO: CHAIN_TO_Field

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var RING_SEL: RING_SEL_Field

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        @ReadWrite(bits: 6..<10, as: RING_SIZE_Values.self)
        public var RING_SIZE: RING_SIZE_Field

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var INCR_WRITE: INCR_WRITE_Field

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var INCR_READ: INCR_READ_Field

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        @ReadWrite(bits: 2..<4, as: DATA_SIZE_Values.self)
        public var DATA_SIZE: DATA_SIZE_Field

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var HIGH_PRIORITY: HIGH_PRIORITY_Field

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var EN: EN_Field
    }

    /// Alias for channel 8 CTRL register
    @RegisterBank(offset: 0x0210)
    public var CH8_AL1_CTRL: Register<CH8_AL1_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH8_AL1_CTRL_Descriptor {}

    /// Alias for channel 8 READ_ADDR register
    @RegisterBank(offset: 0x0214)
    public var CH8_AL1_READ_ADDR: Register<CH8_AL1_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH8_AL1_READ_ADDR_Descriptor {}

    /// Alias for channel 8 WRITE_ADDR register
    @RegisterBank(offset: 0x0218)
    public var CH8_AL1_WRITE_ADDR: Register<CH8_AL1_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH8_AL1_WRITE_ADDR_Descriptor {}

    /// Alias for channel 8 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x021c)
    public var CH8_AL1_TRANS_COUNT_TRIG: Register<CH8_AL1_TRANS_COUNT_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH8_AL1_TRANS_COUNT_TRIG_Descriptor {}

    /// Alias for channel 8 CTRL register
    @RegisterBank(offset: 0x0220)
    public var CH8_AL2_CTRL: Register<CH8_AL2_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH8_AL2_CTRL_Descriptor {}

    /// Alias for channel 8 TRANS_COUNT register
    @RegisterBank(offset: 0x0224)
    public var CH8_AL2_TRANS_COUNT: Register<CH8_AL2_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH8_AL2_TRANS_COUNT_Descriptor {}

    /// Alias for channel 8 READ_ADDR register
    @RegisterBank(offset: 0x0228)
    public var CH8_AL2_READ_ADDR: Register<CH8_AL2_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH8_AL2_READ_ADDR_Descriptor {}

    /// Alias for channel 8 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x022c)
    public var CH8_AL2_WRITE_ADDR_TRIG: Register<CH8_AL2_WRITE_ADDR_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH8_AL2_WRITE_ADDR_TRIG_Descriptor {}

    /// Alias for channel 8 CTRL register
    @RegisterBank(offset: 0x0230)
    public var CH8_AL3_CTRL: Register<CH8_AL3_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH8_AL3_CTRL_Descriptor {}

    /// Alias for channel 8 WRITE_ADDR register
    @RegisterBank(offset: 0x0234)
    public var CH8_AL3_WRITE_ADDR: Register<CH8_AL3_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH8_AL3_WRITE_ADDR_Descriptor {}

    /// Alias for channel 8 TRANS_COUNT register
    @RegisterBank(offset: 0x0238)
    public var CH8_AL3_TRANS_COUNT: Register<CH8_AL3_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH8_AL3_TRANS_COUNT_Descriptor {}

    /// Alias for channel 8 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x023c)
    public var CH8_AL3_READ_ADDR_TRIG: Register<CH8_AL3_READ_ADDR_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH8_AL3_READ_ADDR_TRIG_Descriptor {}

    /// DMA Channel 9 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    @RegisterBank(offset: 0x0240)
    public var CH9_READ_ADDR: Register<CH9_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH9_READ_ADDR_Descriptor {}

    /// DMA Channel 9 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    @RegisterBank(offset: 0x0244)
    public var CH9_WRITE_ADDR: Register<CH9_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH9_WRITE_ADDR_Descriptor {}

    /// DMA Channel 9 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    @RegisterBank(offset: 0x0248)
    public var CH9_TRANS_COUNT: Register<CH9_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH9_TRANS_COUNT_Descriptor {}

    /// DMA Channel 9 Control and Status
    @RegisterBank(offset: 0x024c)
    public var CH9_CTRL_TRIG: Register<CH9_CTRL_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH9_CTRL_TRIG_Descriptor {
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var AHB_ERROR: AHB_ERROR_Field

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var READ_ERROR: READ_ERROR_Field

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var WRITE_ERROR: WRITE_ERROR_Field

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var BUSY: BUSY_Field

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var SNIFF_EN: SNIFF_EN_Field

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var BSWAP: BSWAP_Field

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var IRQ_QUIET: IRQ_QUIET_Field

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        @ReadWrite(bits: 15..<21, as: TREQ_SEL_Values.self)
        public var TREQ_SEL: TREQ_SEL_Field

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
        public var CHAIN_TO: CHAIN_TO_Field

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var RING_SEL: RING_SEL_Field

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        @ReadWrite(bits: 6..<10, as: RING_SIZE_Values.self)
        public var RING_SIZE: RING_SIZE_Field

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var INCR_WRITE: INCR_WRITE_Field

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var INCR_READ: INCR_READ_Field

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        @ReadWrite(bits: 2..<4, as: DATA_SIZE_Values.self)
        public var DATA_SIZE: DATA_SIZE_Field

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var HIGH_PRIORITY: HIGH_PRIORITY_Field

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var EN: EN_Field
    }

    /// Alias for channel 9 CTRL register
    @RegisterBank(offset: 0x0250)
    public var CH9_AL1_CTRL: Register<CH9_AL1_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH9_AL1_CTRL_Descriptor {}

    /// Alias for channel 9 READ_ADDR register
    @RegisterBank(offset: 0x0254)
    public var CH9_AL1_READ_ADDR: Register<CH9_AL1_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH9_AL1_READ_ADDR_Descriptor {}

    /// Alias for channel 9 WRITE_ADDR register
    @RegisterBank(offset: 0x0258)
    public var CH9_AL1_WRITE_ADDR: Register<CH9_AL1_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH9_AL1_WRITE_ADDR_Descriptor {}

    /// Alias for channel 9 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x025c)
    public var CH9_AL1_TRANS_COUNT_TRIG: Register<CH9_AL1_TRANS_COUNT_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH9_AL1_TRANS_COUNT_TRIG_Descriptor {}

    /// Alias for channel 9 CTRL register
    @RegisterBank(offset: 0x0260)
    public var CH9_AL2_CTRL: Register<CH9_AL2_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH9_AL2_CTRL_Descriptor {}

    /// Alias for channel 9 TRANS_COUNT register
    @RegisterBank(offset: 0x0264)
    public var CH9_AL2_TRANS_COUNT: Register<CH9_AL2_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH9_AL2_TRANS_COUNT_Descriptor {}

    /// Alias for channel 9 READ_ADDR register
    @RegisterBank(offset: 0x0268)
    public var CH9_AL2_READ_ADDR: Register<CH9_AL2_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH9_AL2_READ_ADDR_Descriptor {}

    /// Alias for channel 9 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x026c)
    public var CH9_AL2_WRITE_ADDR_TRIG: Register<CH9_AL2_WRITE_ADDR_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH9_AL2_WRITE_ADDR_TRIG_Descriptor {}

    /// Alias for channel 9 CTRL register
    @RegisterBank(offset: 0x0270)
    public var CH9_AL3_CTRL: Register<CH9_AL3_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH9_AL3_CTRL_Descriptor {}

    /// Alias for channel 9 WRITE_ADDR register
    @RegisterBank(offset: 0x0274)
    public var CH9_AL3_WRITE_ADDR: Register<CH9_AL3_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH9_AL3_WRITE_ADDR_Descriptor {}

    /// Alias for channel 9 TRANS_COUNT register
    @RegisterBank(offset: 0x0278)
    public var CH9_AL3_TRANS_COUNT: Register<CH9_AL3_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH9_AL3_TRANS_COUNT_Descriptor {}

    /// Alias for channel 9 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x027c)
    public var CH9_AL3_READ_ADDR_TRIG: Register<CH9_AL3_READ_ADDR_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH9_AL3_READ_ADDR_TRIG_Descriptor {}

    /// DMA Channel 10 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    @RegisterBank(offset: 0x0280)
    public var CH10_READ_ADDR: Register<CH10_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH10_READ_ADDR_Descriptor {}

    /// DMA Channel 10 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    @RegisterBank(offset: 0x0284)
    public var CH10_WRITE_ADDR: Register<CH10_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH10_WRITE_ADDR_Descriptor {}

    /// DMA Channel 10 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    @RegisterBank(offset: 0x0288)
    public var CH10_TRANS_COUNT: Register<CH10_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH10_TRANS_COUNT_Descriptor {}

    /// DMA Channel 10 Control and Status
    @RegisterBank(offset: 0x028c)
    public var CH10_CTRL_TRIG: Register<CH10_CTRL_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH10_CTRL_TRIG_Descriptor {
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var AHB_ERROR: AHB_ERROR_Field

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var READ_ERROR: READ_ERROR_Field

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var WRITE_ERROR: WRITE_ERROR_Field

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var BUSY: BUSY_Field

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var SNIFF_EN: SNIFF_EN_Field

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var BSWAP: BSWAP_Field

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var IRQ_QUIET: IRQ_QUIET_Field

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        @ReadWrite(bits: 15..<21, as: TREQ_SEL_Values.self)
        public var TREQ_SEL: TREQ_SEL_Field

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
        public var CHAIN_TO: CHAIN_TO_Field

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var RING_SEL: RING_SEL_Field

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        @ReadWrite(bits: 6..<10, as: RING_SIZE_Values.self)
        public var RING_SIZE: RING_SIZE_Field

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var INCR_WRITE: INCR_WRITE_Field

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var INCR_READ: INCR_READ_Field

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        @ReadWrite(bits: 2..<4, as: DATA_SIZE_Values.self)
        public var DATA_SIZE: DATA_SIZE_Field

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var HIGH_PRIORITY: HIGH_PRIORITY_Field

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var EN: EN_Field
    }

    /// Alias for channel 10 CTRL register
    @RegisterBank(offset: 0x0290)
    public var CH10_AL1_CTRL: Register<CH10_AL1_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH10_AL1_CTRL_Descriptor {}

    /// Alias for channel 10 READ_ADDR register
    @RegisterBank(offset: 0x0294)
    public var CH10_AL1_READ_ADDR: Register<CH10_AL1_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH10_AL1_READ_ADDR_Descriptor {}

    /// Alias for channel 10 WRITE_ADDR register
    @RegisterBank(offset: 0x0298)
    public var CH10_AL1_WRITE_ADDR: Register<CH10_AL1_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH10_AL1_WRITE_ADDR_Descriptor {}

    /// Alias for channel 10 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x029c)
    public var CH10_AL1_TRANS_COUNT_TRIG: Register<CH10_AL1_TRANS_COUNT_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH10_AL1_TRANS_COUNT_TRIG_Descriptor {}

    /// Alias for channel 10 CTRL register
    @RegisterBank(offset: 0x02a0)
    public var CH10_AL2_CTRL: Register<CH10_AL2_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH10_AL2_CTRL_Descriptor {}

    /// Alias for channel 10 TRANS_COUNT register
    @RegisterBank(offset: 0x02a4)
    public var CH10_AL2_TRANS_COUNT: Register<CH10_AL2_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH10_AL2_TRANS_COUNT_Descriptor {}

    /// Alias for channel 10 READ_ADDR register
    @RegisterBank(offset: 0x02a8)
    public var CH10_AL2_READ_ADDR: Register<CH10_AL2_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH10_AL2_READ_ADDR_Descriptor {}

    /// Alias for channel 10 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x02ac)
    public var CH10_AL2_WRITE_ADDR_TRIG: Register<CH10_AL2_WRITE_ADDR_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH10_AL2_WRITE_ADDR_TRIG_Descriptor {}

    /// Alias for channel 10 CTRL register
    @RegisterBank(offset: 0x02b0)
    public var CH10_AL3_CTRL: Register<CH10_AL3_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH10_AL3_CTRL_Descriptor {}

    /// Alias for channel 10 WRITE_ADDR register
    @RegisterBank(offset: 0x02b4)
    public var CH10_AL3_WRITE_ADDR: Register<CH10_AL3_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH10_AL3_WRITE_ADDR_Descriptor {}

    /// Alias for channel 10 TRANS_COUNT register
    @RegisterBank(offset: 0x02b8)
    public var CH10_AL3_TRANS_COUNT: Register<CH10_AL3_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH10_AL3_TRANS_COUNT_Descriptor {}

    /// Alias for channel 10 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x02bc)
    public var CH10_AL3_READ_ADDR_TRIG: Register<CH10_AL3_READ_ADDR_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH10_AL3_READ_ADDR_TRIG_Descriptor {}

    /// DMA Channel 11 Read Address pointer
    /// This register updates automatically each time a read completes. The current value is the next address to be read by this channel.
    @RegisterBank(offset: 0x02c0)
    public var CH11_READ_ADDR: Register<CH11_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH11_READ_ADDR_Descriptor {}

    /// DMA Channel 11 Write Address pointer
    /// This register updates automatically each time a write completes. The current value is the next address to be written by this channel.
    @RegisterBank(offset: 0x02c4)
    public var CH11_WRITE_ADDR: Register<CH11_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH11_WRITE_ADDR_Descriptor {}

    /// DMA Channel 11 Transfer Count
    /// Program the number of bus transfers a channel will perform before halting. Note that, if transfers are larger than one byte in size, this is not equal to the number of bytes transferred (see CTRL_DATA_SIZE).
    /// When the channel is active, reading this register shows the number of transfers remaining, updating automatically each time a write transfer completes.
    /// Writing this register sets the RELOAD value for the transfer counter. Each time this channel is triggered, the RELOAD value is copied into the live transfer counter. The channel can be started multiple times, and will perform the same number of transfers each time, as programmed by most recent write.
    /// The RELOAD value can be observed at CHx_DBG_TCR. If TRANS_COUNT is used as a trigger, the written value is used immediately as the length of the new transfer sequence, as well as being written to RELOAD.
    @RegisterBank(offset: 0x02c8)
    public var CH11_TRANS_COUNT: Register<CH11_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH11_TRANS_COUNT_Descriptor {}

    /// DMA Channel 11 Control and Status
    @RegisterBank(offset: 0x02cc)
    public var CH11_CTRL_TRIG: Register<CH11_CTRL_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH11_CTRL_TRIG_Descriptor {
        /// Logical OR of the READ_ERROR and WRITE_ERROR flags. The channel halts when it encounters any bus error, and always raises its channel IRQ flag.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var AHB_ERROR: AHB_ERROR_Field

        /// If 1, the channel received a read bus error. Write one to clear.
        /// READ_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 3 transfers later)
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var READ_ERROR: READ_ERROR_Field

        /// If 1, the channel received a write bus error. Write one to clear.
        /// WRITE_ADDR shows the approximate address where the bus error was encountered (will not be earlier, or more than 5 transfers later)
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var WRITE_ERROR: WRITE_ERROR_Field

        /// This flag goes high when the channel starts a new transfer sequence, and low when the last transfer of that sequence completes. Clearing EN while BUSY is high pauses the channel, and BUSY will stay high while paused.
        /// To terminate a sequence early (and clear the BUSY flag), see CHAN_ABORT.
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var BUSY: BUSY_Field

        /// If 1, this channel's data transfers are visible to the sniff hardware, and each transfer will advance the state of the checksum. This only applies if the sniff hardware is enabled, and has this channel selected.
        /// This allows checksum to be enabled or disabled on a per-control- block basis.
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var SNIFF_EN: SNIFF_EN_Field

        /// Apply byte-swap transformation to DMA data.
        /// For byte data, this has no effect. For halfword data, the two bytes of each halfword are swapped. For word data, the four bytes of each word are swapped to reverse order.
        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var BSWAP: BSWAP_Field

        /// In QUIET mode, the channel does not generate IRQs at the end of every transfer block. Instead, an IRQ is raised when NULL is written to a trigger register, indicating the end of a control block chain.
        /// This reduces the number of interrupts to be serviced by the CPU when transferring a DMA chain of many small control blocks.
        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var IRQ_QUIET: IRQ_QUIET_Field

        /// Select a Transfer Request signal.
        /// The channel uses the transfer request signal to pace its data transfer rate. Sources for TREQ signals are internal (TIMERS) or external (DREQ, a Data Request from the system).
        /// 0x0 to 0x3a -> select DREQ n as TREQ
        @ReadWrite(bits: 15..<21, as: TREQ_SEL_Values.self)
        public var TREQ_SEL: TREQ_SEL_Field

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
        public var CHAIN_TO: CHAIN_TO_Field

        /// Select whether RING_SIZE applies to read or write addresses.
        /// If 0, read addresses are wrapped on a (1 << RING_SIZE) boundary. If 1, write addresses are wrapped.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var RING_SEL: RING_SEL_Field

        /// Size of address wrap region. If 0, don't wrap. For values n > 0, only the lower n bits of the address will change. This wraps the address on a (1 << n) byte boundary, facilitating access to naturally-aligned ring buffers.
        /// Ring sizes between 2 and 32768 bytes are possible. This can apply to either read or write addresses, based on value of RING_SEL.
        @ReadWrite(bits: 6..<10, as: RING_SIZE_Values.self)
        public var RING_SIZE: RING_SIZE_Field

        public enum RING_SIZE_Values: UInt, BitFieldProjectable {
            case RING_SIZE_RING_NONE = 0

            public static var bitWidth: Int { 4 }
        }

        /// If 1, the write address increments with each transfer. If 0, each write is directed to the same, initial address.
        /// Generally this should be disabled for memory-to-peripheral transfers.
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var INCR_WRITE: INCR_WRITE_Field

        /// If 1, the read address increments with each transfer. If 0, each read is directed to the same, initial address.
        /// Generally this should be disabled for peripheral-to-memory transfers.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var INCR_READ: INCR_READ_Field

        /// Set the size of each bus transfer (byte/halfword/word). READ_ADDR and WRITE_ADDR advance by this amount (1/2/4 bytes) with each transfer.
        @ReadWrite(bits: 2..<4, as: DATA_SIZE_Values.self)
        public var DATA_SIZE: DATA_SIZE_Field

        public enum DATA_SIZE_Values: UInt, BitFieldProjectable {
            case DATA_SIZE_SIZE_BYTE = 0
            case DATA_SIZE_SIZE_HALFWORD = 1
            case DATA_SIZE_SIZE_WORD = 2

            public static var bitWidth: Int { 2 }
        }

        /// HIGH_PRIORITY gives a channel preferential treatment in issue scheduling: in each scheduling round, all high priority channels are considered first, and then only a single low priority channel, before returning to the high priority channels.
        /// This only affects the order in which the DMA schedules channels. The DMA's bus priority is not changed. If the DMA is not saturated then a low priority channel will see no loss of throughput.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var HIGH_PRIORITY: HIGH_PRIORITY_Field

        /// DMA Channel Enable.
        /// When 1, the channel will respond to triggering events, which will cause it to become BUSY and start transferring data. When 0, the channel will ignore triggers, stop issuing transfers, and pause the current transfer sequence (i.e. BUSY will remain high if already high)
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var EN: EN_Field
    }

    /// Alias for channel 11 CTRL register
    @RegisterBank(offset: 0x02d0)
    public var CH11_AL1_CTRL: Register<CH11_AL1_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH11_AL1_CTRL_Descriptor {}

    /// Alias for channel 11 READ_ADDR register
    @RegisterBank(offset: 0x02d4)
    public var CH11_AL1_READ_ADDR: Register<CH11_AL1_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH11_AL1_READ_ADDR_Descriptor {}

    /// Alias for channel 11 WRITE_ADDR register
    @RegisterBank(offset: 0x02d8)
    public var CH11_AL1_WRITE_ADDR: Register<CH11_AL1_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH11_AL1_WRITE_ADDR_Descriptor {}

    /// Alias for channel 11 TRANS_COUNT register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x02dc)
    public var CH11_AL1_TRANS_COUNT_TRIG: Register<CH11_AL1_TRANS_COUNT_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH11_AL1_TRANS_COUNT_TRIG_Descriptor {}

    /// Alias for channel 11 CTRL register
    @RegisterBank(offset: 0x02e0)
    public var CH11_AL2_CTRL: Register<CH11_AL2_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH11_AL2_CTRL_Descriptor {}

    /// Alias for channel 11 TRANS_COUNT register
    @RegisterBank(offset: 0x02e4)
    public var CH11_AL2_TRANS_COUNT: Register<CH11_AL2_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH11_AL2_TRANS_COUNT_Descriptor {}

    /// Alias for channel 11 READ_ADDR register
    @RegisterBank(offset: 0x02e8)
    public var CH11_AL2_READ_ADDR: Register<CH11_AL2_READ_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH11_AL2_READ_ADDR_Descriptor {}

    /// Alias for channel 11 WRITE_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x02ec)
    public var CH11_AL2_WRITE_ADDR_TRIG: Register<CH11_AL2_WRITE_ADDR_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH11_AL2_WRITE_ADDR_TRIG_Descriptor {}

    /// Alias for channel 11 CTRL register
    @RegisterBank(offset: 0x02f0)
    public var CH11_AL3_CTRL: Register<CH11_AL3_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CH11_AL3_CTRL_Descriptor {}

    /// Alias for channel 11 WRITE_ADDR register
    @RegisterBank(offset: 0x02f4)
    public var CH11_AL3_WRITE_ADDR: Register<CH11_AL3_WRITE_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH11_AL3_WRITE_ADDR_Descriptor {}

    /// Alias for channel 11 TRANS_COUNT register
    @RegisterBank(offset: 0x02f8)
    public var CH11_AL3_TRANS_COUNT: Register<CH11_AL3_TRANS_COUNT_Descriptor>


    @Register(bitWidth: 32)
    public struct CH11_AL3_TRANS_COUNT_Descriptor {}

    /// Alias for channel 11 READ_ADDR register
    /// This is a trigger register (0xc). Writing a nonzero value will
    /// reload the channel counter and start the channel.
    @RegisterBank(offset: 0x02fc)
    public var CH11_AL3_READ_ADDR_TRIG: Register<CH11_AL3_READ_ADDR_TRIG_Descriptor>


    @Register(bitWidth: 32)
    public struct CH11_AL3_READ_ADDR_TRIG_Descriptor {}

    /// Interrupt Status (raw)
    @RegisterBank(offset: 0x0400)
    public var INTR: Register<INTR_Descriptor>


    @Register(bitWidth: 32)
    public struct INTR_Descriptor {
        /// Raw interrupt status for DMA Channels 0..15. Bit n corresponds to channel n. Ignores any masking or forcing. Channel interrupts can be cleared by writing a bit mask to INTR, INTS0 or INTS1.
        /// Channel interrupts can be routed to either of two system-level IRQs based on INTE0 and INTE1.
        /// This can be used vector different channel interrupts to different ISRs: this might be done to allow NVIC IRQ preemption for more time-critical channels, or to spread IRQ load across different cores.
        /// It is also valid to ignore this behaviour and just use INTE0/INTS0/IRQ 0.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var INTR: INTR_Field
    }

    /// Interrupt Enables for IRQ 0
    @RegisterBank(offset: 0x0404)
    public var INTE0: Register<INTE0_Descriptor>


    @Register(bitWidth: 32)
    public struct INTE0_Descriptor {
        /// Set bit n to pass interrupts from channel n to DMA IRQ 0.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var INTE0: INTE0_Field
    }

    /// Force Interrupts
    @RegisterBank(offset: 0x0408)
    public var INTF0: Register<INTF0_Descriptor>


    @Register(bitWidth: 32)
    public struct INTF0_Descriptor {
        /// Write 1s to force the corresponding bits in INTE0. The interrupt remains asserted until INTF0 is cleared.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var INTF0: INTF0_Field
    }

    /// Interrupt Status for IRQ 0
    @RegisterBank(offset: 0x040c)
    public var INTS0: Register<INTS0_Descriptor>


    @Register(bitWidth: 32)
    public struct INTS0_Descriptor {
        /// Indicates active channel interrupt requests which are currently causing IRQ 0 to be asserted.
        /// Channel interrupts can be cleared by writing a bit mask here.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var INTS0: INTS0_Field
    }

    /// Interrupt Enables for IRQ 1
    @RegisterBank(offset: 0x0414)
    public var INTE1: Register<INTE1_Descriptor>


    @Register(bitWidth: 32)
    public struct INTE1_Descriptor {
        /// Set bit n to pass interrupts from channel n to DMA IRQ 1.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var INTE1: INTE1_Field
    }

    /// Force Interrupts for IRQ 1
    @RegisterBank(offset: 0x0418)
    public var INTF1: Register<INTF1_Descriptor>


    @Register(bitWidth: 32)
    public struct INTF1_Descriptor {
        /// Write 1s to force the corresponding bits in INTE0. The interrupt remains asserted until INTF0 is cleared.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var INTF1: INTF1_Field
    }

    /// Interrupt Status (masked) for IRQ 1
    @RegisterBank(offset: 0x041c)
    public var INTS1: Register<INTS1_Descriptor>


    @Register(bitWidth: 32)
    public struct INTS1_Descriptor {
        /// Indicates active channel interrupt requests which are currently causing IRQ 1 to be asserted.
        /// Channel interrupts can be cleared by writing a bit mask here.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var INTS1: INTS1_Field
    }

    /// Pacing (X/Y) Fractional Timer
    /// The pacing timer produces TREQ assertions at a rate set by ((X/Y) * sys_clk). This equation is evaluated every sys_clk cycles and therefore can only generate TREQs at a rate of 1 per sys_clk (i.e. permanent TREQ) or less.
    @RegisterBank(offset: 0x0420)
    public var TIMER0: Register<TIMER0_Descriptor>


    @Register(bitWidth: 32)
    public struct TIMER0_Descriptor {
        /// Pacing Timer Dividend. Specifies the X value for the (X/Y) fractional timer.
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var X: X_Field

        /// Pacing Timer Divisor. Specifies the Y value for the (X/Y) fractional timer.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var Y: Y_Field
    }

    /// Pacing (X/Y) Fractional Timer
    /// The pacing timer produces TREQ assertions at a rate set by ((X/Y) * sys_clk). This equation is evaluated every sys_clk cycles and therefore can only generate TREQs at a rate of 1 per sys_clk (i.e. permanent TREQ) or less.
    @RegisterBank(offset: 0x0424)
    public var TIMER1: Register<TIMER1_Descriptor>


    @Register(bitWidth: 32)
    public struct TIMER1_Descriptor {
        /// Pacing Timer Dividend. Specifies the X value for the (X/Y) fractional timer.
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var X: X_Field

        /// Pacing Timer Divisor. Specifies the Y value for the (X/Y) fractional timer.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var Y: Y_Field
    }

    /// Pacing (X/Y) Fractional Timer
    /// The pacing timer produces TREQ assertions at a rate set by ((X/Y) * sys_clk). This equation is evaluated every sys_clk cycles and therefore can only generate TREQs at a rate of 1 per sys_clk (i.e. permanent TREQ) or less.
    @RegisterBank(offset: 0x0428)
    public var TIMER2: Register<TIMER2_Descriptor>


    @Register(bitWidth: 32)
    public struct TIMER2_Descriptor {
        /// Pacing Timer Dividend. Specifies the X value for the (X/Y) fractional timer.
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var X: X_Field

        /// Pacing Timer Divisor. Specifies the Y value for the (X/Y) fractional timer.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var Y: Y_Field
    }

    /// Pacing (X/Y) Fractional Timer
    /// The pacing timer produces TREQ assertions at a rate set by ((X/Y) * sys_clk). This equation is evaluated every sys_clk cycles and therefore can only generate TREQs at a rate of 1 per sys_clk (i.e. permanent TREQ) or less.
    @RegisterBank(offset: 0x042c)
    public var TIMER3: Register<TIMER3_Descriptor>


    @Register(bitWidth: 32)
    public struct TIMER3_Descriptor {
        /// Pacing Timer Dividend. Specifies the X value for the (X/Y) fractional timer.
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var X: X_Field

        /// Pacing Timer Divisor. Specifies the Y value for the (X/Y) fractional timer.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var Y: Y_Field
    }

    /// Trigger one or more channels simultaneously
    @RegisterBank(offset: 0x0430)
    public var MULTI_CHAN_TRIGGER: Register<MULTI_CHAN_TRIGGER_Descriptor>


    @Register(bitWidth: 32)
    public struct MULTI_CHAN_TRIGGER_Descriptor {
        /// Each bit in this register corresponds to a DMA channel. Writing a 1 to the relevant bit is the same as writing to that channel's trigger register; the channel will start if it is currently enabled and not already busy.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var MULTI_CHAN_TRIGGER: MULTI_CHAN_TRIGGER_Field
    }

    /// Sniffer Control
    @RegisterBank(offset: 0x0434)
    public var SNIFF_CTRL: Register<SNIFF_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct SNIFF_CTRL_Descriptor {
        /// If set, the result appears inverted (bitwise complement) when read. This does not affect the way the checksum is calculated; the result is transformed on-the-fly between the result register and the bus.
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var OUT_INV: OUT_INV_Field

        /// If set, the result appears bit-reversed when read. This does not affect the way the checksum is calculated; the result is transformed on-the-fly between the result register and the bus.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var OUT_REV: OUT_REV_Field

        /// Locally perform a byte reverse on the sniffed data, before feeding into checksum.
        /// Note that the sniff hardware is downstream of the DMA channel byteswap performed in the read master: if channel CTRL_BSWAP and SNIFF_CTRL_BSWAP are both enabled, their effects cancel from the sniffer's point of view.
        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var BSWAP: BSWAP_Field

        @ReadWrite(bits: 5..<9, as: CALC_Values.self)
        public var CALC: CALC_Field

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
        public var DMACH: DMACH_Field

        /// Enable sniffer
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var EN: EN_Field
    }

    /// Data accumulator for sniff hardware
    /// Write an initial seed value here before starting a DMA transfer on the channel indicated by SNIFF_CTRL_DMACH. The hardware will update this register each time it observes a read from the indicated channel. Once the channel completes, the final result can be read from this register.
    @RegisterBank(offset: 0x0438)
    public var SNIFF_DATA: Register<SNIFF_DATA_Descriptor>


    @Register(bitWidth: 32)
    public struct SNIFF_DATA_Descriptor {}

    /// Debug RAF, WAF, TDF levels
    @RegisterBank(offset: 0x0440)
    public var FIFO_LEVELS: Register<FIFO_LEVELS_Descriptor>


    @Register(bitWidth: 32)
    public struct FIFO_LEVELS_Descriptor {
        /// Current Read-Address-FIFO fill level
        @ReadOnly(bits: 16..<24, as: BitField8.self)
        public var RAF_LVL: RAF_LVL_Field

        /// Current Write-Address-FIFO fill level
        @ReadOnly(bits: 8..<16, as: BitField8.self)
        public var WAF_LVL: WAF_LVL_Field

        /// Current Transfer-Data-FIFO fill level
        @ReadOnly(bits: 0..<8, as: BitField8.self)
        public var TDF_LVL: TDF_LVL_Field
    }

    /// Abort an in-progress transfer sequence on one or more channels
    @RegisterBank(offset: 0x0444)
    public var CHAN_ABORT: Register<CHAN_ABORT_Descriptor>


    @Register(bitWidth: 32)
    public struct CHAN_ABORT_Descriptor {
        /// Each bit corresponds to a channel. Writing a 1 aborts whatever transfer sequence is in progress on that channel. The bit will remain high until any in-flight transfers have been flushed through the address and data FIFOs.
        /// After writing, this register must be polled until it returns all-zero. Until this point, it is unsafe to restart the channel.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var CHAN_ABORT: CHAN_ABORT_Field
    }

    /// The number of channels this DMA instance is equipped with. This DMA supports up to 16 hardware channels, but can be configured with as few as one, to minimise silicon area.
    @RegisterBank(offset: 0x0448)
    public var N_CHANNELS: Register<N_CHANNELS_Descriptor>


    @Register(bitWidth: 32)
    public struct N_CHANNELS_Descriptor {
        @ReadOnly(bits: 0..<5, as: BitField5.self)
        public var N_CHANNELS: N_CHANNELS_Field
    }

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    @RegisterBank(offset: 0x0800)
    public var CH0_DBG_CTDREQ: Register<CH0_DBG_CTDREQ_Descriptor>


    @Register(bitWidth: 32)
    public struct CH0_DBG_CTDREQ_Descriptor {
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var CH0_DBG_CTDREQ: CH0_DBG_CTDREQ_Field
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    @RegisterBank(offset: 0x0804)
    public var CH0_DBG_TCR: Register<CH0_DBG_TCR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH0_DBG_TCR_Descriptor {}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    @RegisterBank(offset: 0x0840)
    public var CH1_DBG_CTDREQ: Register<CH1_DBG_CTDREQ_Descriptor>


    @Register(bitWidth: 32)
    public struct CH1_DBG_CTDREQ_Descriptor {
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var CH1_DBG_CTDREQ: CH1_DBG_CTDREQ_Field
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    @RegisterBank(offset: 0x0844)
    public var CH1_DBG_TCR: Register<CH1_DBG_TCR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH1_DBG_TCR_Descriptor {}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    @RegisterBank(offset: 0x0880)
    public var CH2_DBG_CTDREQ: Register<CH2_DBG_CTDREQ_Descriptor>


    @Register(bitWidth: 32)
    public struct CH2_DBG_CTDREQ_Descriptor {
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var CH2_DBG_CTDREQ: CH2_DBG_CTDREQ_Field
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    @RegisterBank(offset: 0x0884)
    public var CH2_DBG_TCR: Register<CH2_DBG_TCR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH2_DBG_TCR_Descriptor {}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    @RegisterBank(offset: 0x08c0)
    public var CH3_DBG_CTDREQ: Register<CH3_DBG_CTDREQ_Descriptor>


    @Register(bitWidth: 32)
    public struct CH3_DBG_CTDREQ_Descriptor {
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var CH3_DBG_CTDREQ: CH3_DBG_CTDREQ_Field
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    @RegisterBank(offset: 0x08c4)
    public var CH3_DBG_TCR: Register<CH3_DBG_TCR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH3_DBG_TCR_Descriptor {}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    @RegisterBank(offset: 0x0900)
    public var CH4_DBG_CTDREQ: Register<CH4_DBG_CTDREQ_Descriptor>


    @Register(bitWidth: 32)
    public struct CH4_DBG_CTDREQ_Descriptor {
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var CH4_DBG_CTDREQ: CH4_DBG_CTDREQ_Field
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    @RegisterBank(offset: 0x0904)
    public var CH4_DBG_TCR: Register<CH4_DBG_TCR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH4_DBG_TCR_Descriptor {}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    @RegisterBank(offset: 0x0940)
    public var CH5_DBG_CTDREQ: Register<CH5_DBG_CTDREQ_Descriptor>


    @Register(bitWidth: 32)
    public struct CH5_DBG_CTDREQ_Descriptor {
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var CH5_DBG_CTDREQ: CH5_DBG_CTDREQ_Field
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    @RegisterBank(offset: 0x0944)
    public var CH5_DBG_TCR: Register<CH5_DBG_TCR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH5_DBG_TCR_Descriptor {}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    @RegisterBank(offset: 0x0980)
    public var CH6_DBG_CTDREQ: Register<CH6_DBG_CTDREQ_Descriptor>


    @Register(bitWidth: 32)
    public struct CH6_DBG_CTDREQ_Descriptor {
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var CH6_DBG_CTDREQ: CH6_DBG_CTDREQ_Field
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    @RegisterBank(offset: 0x0984)
    public var CH6_DBG_TCR: Register<CH6_DBG_TCR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH6_DBG_TCR_Descriptor {}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    @RegisterBank(offset: 0x09c0)
    public var CH7_DBG_CTDREQ: Register<CH7_DBG_CTDREQ_Descriptor>


    @Register(bitWidth: 32)
    public struct CH7_DBG_CTDREQ_Descriptor {
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var CH7_DBG_CTDREQ: CH7_DBG_CTDREQ_Field
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    @RegisterBank(offset: 0x09c4)
    public var CH7_DBG_TCR: Register<CH7_DBG_TCR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH7_DBG_TCR_Descriptor {}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    @RegisterBank(offset: 0x0a00)
    public var CH8_DBG_CTDREQ: Register<CH8_DBG_CTDREQ_Descriptor>


    @Register(bitWidth: 32)
    public struct CH8_DBG_CTDREQ_Descriptor {
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var CH8_DBG_CTDREQ: CH8_DBG_CTDREQ_Field
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    @RegisterBank(offset: 0x0a04)
    public var CH8_DBG_TCR: Register<CH8_DBG_TCR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH8_DBG_TCR_Descriptor {}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    @RegisterBank(offset: 0x0a40)
    public var CH9_DBG_CTDREQ: Register<CH9_DBG_CTDREQ_Descriptor>


    @Register(bitWidth: 32)
    public struct CH9_DBG_CTDREQ_Descriptor {
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var CH9_DBG_CTDREQ: CH9_DBG_CTDREQ_Field
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    @RegisterBank(offset: 0x0a44)
    public var CH9_DBG_TCR: Register<CH9_DBG_TCR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH9_DBG_TCR_Descriptor {}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    @RegisterBank(offset: 0x0a80)
    public var CH10_DBG_CTDREQ: Register<CH10_DBG_CTDREQ_Descriptor>


    @Register(bitWidth: 32)
    public struct CH10_DBG_CTDREQ_Descriptor {
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var CH10_DBG_CTDREQ: CH10_DBG_CTDREQ_Field
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    @RegisterBank(offset: 0x0a84)
    public var CH10_DBG_TCR: Register<CH10_DBG_TCR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH10_DBG_TCR_Descriptor {}

    /// Read: get channel DREQ counter (i.e. how many accesses the DMA expects it can perform on the peripheral without overflow/underflow. Write any value: clears the counter, and cause channel to re-initiate DREQ handshake.
    @RegisterBank(offset: 0x0ac0)
    public var CH11_DBG_CTDREQ: Register<CH11_DBG_CTDREQ_Descriptor>


    @Register(bitWidth: 32)
    public struct CH11_DBG_CTDREQ_Descriptor {
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var CH11_DBG_CTDREQ: CH11_DBG_CTDREQ_Field
    }

    /// Read to get channel TRANS_COUNT reload value, i.e. the length of the next transfer
    @RegisterBank(offset: 0x0ac4)
    public var CH11_DBG_TCR: Register<CH11_DBG_TCR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH11_DBG_TCR_Descriptor {}
}
