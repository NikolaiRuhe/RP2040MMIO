import MMIO
import MMIOExtensions

/// Programmable IO block
@RegisterBank
public struct PIO1 {

    public static var `default`: Self { .init(unsafeAddress: 0x50300000) }

    /// PIO control register
    @RegisterBank(offset: 0x0000)
    public var CTRL: Register<CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CTRL_Descriptor {
        /// Restart a state machine's clock divider from an initial phase of 0. Clock dividers are free-running, so once started, their output (including fractional jitter) is completely determined by the integer/fractional divisor configured in SMx_CLKDIV. This means that, if multiple clock dividers with the same divisor are restarted simultaneously, by writing multiple 1 bits to this field, the execution clocks of those state machines will run in precise lockstep.
        /// Note that setting/clearing SM_ENABLE does not stop the clock divider from running, so once multiple state machines' clocks are synchronised, it is safe to disable/reenable a state machine, whilst keeping the clock dividers in sync.
        /// Note also that CLKDIV_RESTART can be written to whilst the state machine is running, and this is useful to resynchronise clock dividers after the divisors (SMx_CLKDIV) have been changed on-the-fly.
        @ReadWrite(bits: 8..<12, as: BitField4.self)
        public var CLKDIV_RESTART: CLKDIV_RESTART_Field

        /// Write 1 to instantly clear internal SM state which may be otherwise difficult to access and will affect future execution.
        /// Specifically, the following are cleared: input and output shift counters; the contents of the input shift register; the delay counter; the waiting-on-IRQ state; any stalled instruction written to SMx_INSTR or run by OUT/MOV EXEC; any pin write left asserted due to OUT_STICKY.
        /// The program counter, the contents of the output shift register and the X/Y scratch registers are not affected.
        @ReadWrite(bits: 4..<8, as: BitField4.self)
        public var SM_RESTART: SM_RESTART_Field

        /// Enable/disable each of the four state machines by writing 1/0 to each of these four bits. When disabled, a state machine will cease executing instructions, except those written directly to SMx_INSTR by the system. Multiple bits can be set/cleared at once to run/halt multiple state machines simultaneously.
        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var SM_ENABLE: SM_ENABLE_Field
    }

    /// FIFO status register
    @RegisterBank(offset: 0x0004)
    public var FSTAT: Register<FSTAT_Descriptor>


    @Register(bitWidth: 32)
    public struct FSTAT_Descriptor {
        /// State machine TX FIFO is empty
        @ReadOnly(bits: 24..<28, as: BitField4.self)
        public var TXEMPTY: TXEMPTY_Field

        /// State machine TX FIFO is full
        @ReadOnly(bits: 16..<20, as: BitField4.self)
        public var TXFULL: TXFULL_Field

        /// State machine RX FIFO is empty
        @ReadOnly(bits: 8..<12, as: BitField4.self)
        public var RXEMPTY: RXEMPTY_Field

        /// State machine RX FIFO is full
        @ReadOnly(bits: 0..<4, as: BitField4.self)
        public var RXFULL: RXFULL_Field
    }

    /// FIFO debug register
    @RegisterBank(offset: 0x0008)
    public var FDEBUG: Register<FDEBUG_Descriptor>


    @Register(bitWidth: 32)
    public struct FDEBUG_Descriptor {
        /// State machine has stalled on empty TX FIFO during a blocking PULL, or an OUT with autopull enabled. Write 1 to clear.
        @ReadWrite(bits: 24..<28, as: BitField4.self)
        public var TXSTALL: TXSTALL_Field

        /// TX FIFO overflow (i.e. write-on-full by the system) has occurred. Write 1 to clear. Note that write-on-full does not alter the state or contents of the FIFO in any way, but the data that the system attempted to write is dropped, so if this flag is set, your software has quite likely dropped some data on the floor.
        @ReadWrite(bits: 16..<20, as: BitField4.self)
        public var TXOVER: TXOVER_Field

        /// RX FIFO underflow (i.e. read-on-empty by the system) has occurred. Write 1 to clear. Note that read-on-empty does not perturb the state of the FIFO in any way, but the data returned by reading from an empty FIFO is undefined, so this flag generally only becomes set due to some kind of software error.
        @ReadWrite(bits: 8..<12, as: BitField4.self)
        public var RXUNDER: RXUNDER_Field

        /// State machine has stalled on full RX FIFO during a blocking PUSH, or an IN with autopush enabled. This flag is also set when a nonblocking PUSH to a full FIFO took place, in which case the state machine has dropped data. Write 1 to clear.
        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var RXSTALL: RXSTALL_Field
    }

    /// FIFO levels
    @RegisterBank(offset: 0x000c)
    public var FLEVEL: Register<FLEVEL_Descriptor>


    @Register(bitWidth: 32)
    public struct FLEVEL_Descriptor {
        @ReadOnly(bits: 28..<32, as: BitField4.self)
        public var RX3: RX3_Field

        @ReadOnly(bits: 24..<28, as: BitField4.self)
        public var TX3: TX3_Field

        @ReadOnly(bits: 20..<24, as: BitField4.self)
        public var RX2: RX2_Field

        @ReadOnly(bits: 16..<20, as: BitField4.self)
        public var TX2: TX2_Field

        @ReadOnly(bits: 12..<16, as: BitField4.self)
        public var RX1: RX1_Field

        @ReadOnly(bits: 8..<12, as: BitField4.self)
        public var TX1: TX1_Field

        @ReadOnly(bits: 4..<8, as: BitField4.self)
        public var RX0: RX0_Field

        @ReadOnly(bits: 0..<4, as: BitField4.self)
        public var TX0: TX0_Field
    }

    /// Direct write access to the TX FIFO for this state machine. Each write pushes one word to the FIFO. Attempting to write to a full FIFO has no effect on the FIFO state or contents, and sets the sticky FDEBUG_TXOVER error flag for this FIFO.
    @RegisterBank(offset: 0x0010)
    public var TXF0: Register<TXF0_Descriptor>


    @Register(bitWidth: 32)
    public struct TXF0_Descriptor {}

    /// Direct write access to the TX FIFO for this state machine. Each write pushes one word to the FIFO. Attempting to write to a full FIFO has no effect on the FIFO state or contents, and sets the sticky FDEBUG_TXOVER error flag for this FIFO.
    @RegisterBank(offset: 0x0014)
    public var TXF1: Register<TXF1_Descriptor>


    @Register(bitWidth: 32)
    public struct TXF1_Descriptor {}

    /// Direct write access to the TX FIFO for this state machine. Each write pushes one word to the FIFO. Attempting to write to a full FIFO has no effect on the FIFO state or contents, and sets the sticky FDEBUG_TXOVER error flag for this FIFO.
    @RegisterBank(offset: 0x0018)
    public var TXF2: Register<TXF2_Descriptor>


    @Register(bitWidth: 32)
    public struct TXF2_Descriptor {}

    /// Direct write access to the TX FIFO for this state machine. Each write pushes one word to the FIFO. Attempting to write to a full FIFO has no effect on the FIFO state or contents, and sets the sticky FDEBUG_TXOVER error flag for this FIFO.
    @RegisterBank(offset: 0x001c)
    public var TXF3: Register<TXF3_Descriptor>


    @Register(bitWidth: 32)
    public struct TXF3_Descriptor {}

    /// Direct read access to the RX FIFO for this state machine. Each read pops one word from the FIFO. Attempting to read from an empty FIFO has no effect on the FIFO state, and sets the sticky FDEBUG_RXUNDER error flag for this FIFO. The data returned to the system on a read from an empty FIFO is undefined.
    @RegisterBank(offset: 0x0020)
    public var RXF0: Register<RXF0_Descriptor>


    @Register(bitWidth: 32)
    public struct RXF0_Descriptor {}

    /// Direct read access to the RX FIFO for this state machine. Each read pops one word from the FIFO. Attempting to read from an empty FIFO has no effect on the FIFO state, and sets the sticky FDEBUG_RXUNDER error flag for this FIFO. The data returned to the system on a read from an empty FIFO is undefined.
    @RegisterBank(offset: 0x0024)
    public var RXF1: Register<RXF1_Descriptor>


    @Register(bitWidth: 32)
    public struct RXF1_Descriptor {}

    /// Direct read access to the RX FIFO for this state machine. Each read pops one word from the FIFO. Attempting to read from an empty FIFO has no effect on the FIFO state, and sets the sticky FDEBUG_RXUNDER error flag for this FIFO. The data returned to the system on a read from an empty FIFO is undefined.
    @RegisterBank(offset: 0x0028)
    public var RXF2: Register<RXF2_Descriptor>


    @Register(bitWidth: 32)
    public struct RXF2_Descriptor {}

    /// Direct read access to the RX FIFO for this state machine. Each read pops one word from the FIFO. Attempting to read from an empty FIFO has no effect on the FIFO state, and sets the sticky FDEBUG_RXUNDER error flag for this FIFO. The data returned to the system on a read from an empty FIFO is undefined.
    @RegisterBank(offset: 0x002c)
    public var RXF3: Register<RXF3_Descriptor>


    @Register(bitWidth: 32)
    public struct RXF3_Descriptor {}

    /// State machine IRQ flags register. Write 1 to clear. There are 8 state machine IRQ flags, which can be set, cleared, and waited on by the state machines. There's no fixed association between flags and state machines -- any state machine can use any flag.
    /// Any of the 8 flags can be used for timing synchronisation between state machines, using IRQ and WAIT instructions. The lower four of these flags are also routed out to system-level interrupt requests, alongside FIFO status interrupts -- see e.g. IRQ0_INTE.
    @RegisterBank(offset: 0x0030)
    public var IRQ: Register<IRQ_Descriptor>


    @Register(bitWidth: 32)
    public struct IRQ_Descriptor {
        @ReadWrite(bits: 0..<8, as: BitField8.self)
        public var IRQ: IRQ_Field
    }

    /// Writing a 1 to each of these bits will forcibly assert the corresponding IRQ. Note this is different to the INTF register: writing here affects PIO internal state. INTF just asserts the processor-facing IRQ signal for testing ISRs, and is not visible to the state machines.
    @RegisterBank(offset: 0x0034)
    public var IRQ_FORCE: Register<IRQ_FORCE_Descriptor>


    @Register(bitWidth: 32)
    public struct IRQ_FORCE_Descriptor {
        @WriteOnly(bits: 0..<8, as: BitField8.self)
        public var IRQ_FORCE: IRQ_FORCE_Field
    }

    /// There is a 2-flipflop synchronizer on each GPIO input, which protects PIO logic from metastabilities. This increases input delay, and for fast synchronous IO (e.g. SPI) these synchronizers may need to be bypassed. Each bit in this register corresponds to one GPIO.
    /// 0 -> input is synchronized (default)
    /// 1 -> synchronizer is bypassed
    /// If in doubt, leave this register as all zeroes.
    @RegisterBank(offset: 0x0038)
    public var INPUT_SYNC_BYPASS: Register<INPUT_SYNC_BYPASS_Descriptor>


    @Register(bitWidth: 32)
    public struct INPUT_SYNC_BYPASS_Descriptor {}

    /// Read to sample the pad output values PIO is currently driving to the GPIOs. On RP2040 there are 30 GPIOs, so the two most significant bits are hardwired to 0.
    @RegisterBank(offset: 0x003c)
    public var DBG_PADOUT: Register<DBG_PADOUT_Descriptor>


    @Register(bitWidth: 32)
    public struct DBG_PADOUT_Descriptor {}

    /// Read to sample the pad output enables (direction) PIO is currently driving to the GPIOs. On RP2040 there are 30 GPIOs, so the two most significant bits are hardwired to 0.
    @RegisterBank(offset: 0x0040)
    public var DBG_PADOE: Register<DBG_PADOE_Descriptor>


    @Register(bitWidth: 32)
    public struct DBG_PADOE_Descriptor {}

    /// The PIO hardware has some free parameters that may vary between chip products.
    /// These should be provided in the chip datasheet, but are also exposed here.
    @RegisterBank(offset: 0x0044)
    public var DBG_CFGINFO: Register<DBG_CFGINFO_Descriptor>


    @Register(bitWidth: 32)
    public struct DBG_CFGINFO_Descriptor {
        /// The size of the instruction memory, measured in units of one instruction
        @ReadOnly(bits: 16..<22, as: BitField6.self)
        public var IMEM_SIZE: IMEM_SIZE_Field

        /// The number of state machines this PIO instance is equipped with.
        @ReadOnly(bits: 8..<12, as: BitField4.self)
        public var SM_COUNT: SM_COUNT_Field

        /// The depth of the state machine TX/RX FIFOs, measured in words.
        /// Joining fifos via SHIFTCTRL_FJOIN gives one FIFO with double
        /// this depth.
        @ReadOnly(bits: 0..<6, as: BitField6.self)
        public var FIFO_DEPTH: FIFO_DEPTH_Field
    }

    /// Write-only access to instruction memory location 0
    @RegisterBank(offset: 0x0048)
    public var INSTR_MEM0: Register<INSTR_MEM0_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM0_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM0: INSTR_MEM0_Field
    }

    /// Write-only access to instruction memory location 1
    @RegisterBank(offset: 0x004c)
    public var INSTR_MEM1: Register<INSTR_MEM1_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM1_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM1: INSTR_MEM1_Field
    }

    /// Write-only access to instruction memory location 2
    @RegisterBank(offset: 0x0050)
    public var INSTR_MEM2: Register<INSTR_MEM2_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM2_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM2: INSTR_MEM2_Field
    }

    /// Write-only access to instruction memory location 3
    @RegisterBank(offset: 0x0054)
    public var INSTR_MEM3: Register<INSTR_MEM3_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM3_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM3: INSTR_MEM3_Field
    }

    /// Write-only access to instruction memory location 4
    @RegisterBank(offset: 0x0058)
    public var INSTR_MEM4: Register<INSTR_MEM4_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM4_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM4: INSTR_MEM4_Field
    }

    /// Write-only access to instruction memory location 5
    @RegisterBank(offset: 0x005c)
    public var INSTR_MEM5: Register<INSTR_MEM5_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM5_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM5: INSTR_MEM5_Field
    }

    /// Write-only access to instruction memory location 6
    @RegisterBank(offset: 0x0060)
    public var INSTR_MEM6: Register<INSTR_MEM6_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM6_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM6: INSTR_MEM6_Field
    }

    /// Write-only access to instruction memory location 7
    @RegisterBank(offset: 0x0064)
    public var INSTR_MEM7: Register<INSTR_MEM7_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM7_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM7: INSTR_MEM7_Field
    }

    /// Write-only access to instruction memory location 8
    @RegisterBank(offset: 0x0068)
    public var INSTR_MEM8: Register<INSTR_MEM8_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM8_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM8: INSTR_MEM8_Field
    }

    /// Write-only access to instruction memory location 9
    @RegisterBank(offset: 0x006c)
    public var INSTR_MEM9: Register<INSTR_MEM9_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM9_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM9: INSTR_MEM9_Field
    }

    /// Write-only access to instruction memory location 10
    @RegisterBank(offset: 0x0070)
    public var INSTR_MEM10: Register<INSTR_MEM10_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM10_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM10: INSTR_MEM10_Field
    }

    /// Write-only access to instruction memory location 11
    @RegisterBank(offset: 0x0074)
    public var INSTR_MEM11: Register<INSTR_MEM11_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM11_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM11: INSTR_MEM11_Field
    }

    /// Write-only access to instruction memory location 12
    @RegisterBank(offset: 0x0078)
    public var INSTR_MEM12: Register<INSTR_MEM12_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM12_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM12: INSTR_MEM12_Field
    }

    /// Write-only access to instruction memory location 13
    @RegisterBank(offset: 0x007c)
    public var INSTR_MEM13: Register<INSTR_MEM13_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM13_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM13: INSTR_MEM13_Field
    }

    /// Write-only access to instruction memory location 14
    @RegisterBank(offset: 0x0080)
    public var INSTR_MEM14: Register<INSTR_MEM14_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM14_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM14: INSTR_MEM14_Field
    }

    /// Write-only access to instruction memory location 15
    @RegisterBank(offset: 0x0084)
    public var INSTR_MEM15: Register<INSTR_MEM15_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM15_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM15: INSTR_MEM15_Field
    }

    /// Write-only access to instruction memory location 16
    @RegisterBank(offset: 0x0088)
    public var INSTR_MEM16: Register<INSTR_MEM16_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM16_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM16: INSTR_MEM16_Field
    }

    /// Write-only access to instruction memory location 17
    @RegisterBank(offset: 0x008c)
    public var INSTR_MEM17: Register<INSTR_MEM17_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM17_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM17: INSTR_MEM17_Field
    }

    /// Write-only access to instruction memory location 18
    @RegisterBank(offset: 0x0090)
    public var INSTR_MEM18: Register<INSTR_MEM18_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM18_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM18: INSTR_MEM18_Field
    }

    /// Write-only access to instruction memory location 19
    @RegisterBank(offset: 0x0094)
    public var INSTR_MEM19: Register<INSTR_MEM19_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM19_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM19: INSTR_MEM19_Field
    }

    /// Write-only access to instruction memory location 20
    @RegisterBank(offset: 0x0098)
    public var INSTR_MEM20: Register<INSTR_MEM20_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM20_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM20: INSTR_MEM20_Field
    }

    /// Write-only access to instruction memory location 21
    @RegisterBank(offset: 0x009c)
    public var INSTR_MEM21: Register<INSTR_MEM21_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM21_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM21: INSTR_MEM21_Field
    }

    /// Write-only access to instruction memory location 22
    @RegisterBank(offset: 0x00a0)
    public var INSTR_MEM22: Register<INSTR_MEM22_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM22_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM22: INSTR_MEM22_Field
    }

    /// Write-only access to instruction memory location 23
    @RegisterBank(offset: 0x00a4)
    public var INSTR_MEM23: Register<INSTR_MEM23_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM23_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM23: INSTR_MEM23_Field
    }

    /// Write-only access to instruction memory location 24
    @RegisterBank(offset: 0x00a8)
    public var INSTR_MEM24: Register<INSTR_MEM24_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM24_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM24: INSTR_MEM24_Field
    }

    /// Write-only access to instruction memory location 25
    @RegisterBank(offset: 0x00ac)
    public var INSTR_MEM25: Register<INSTR_MEM25_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM25_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM25: INSTR_MEM25_Field
    }

    /// Write-only access to instruction memory location 26
    @RegisterBank(offset: 0x00b0)
    public var INSTR_MEM26: Register<INSTR_MEM26_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM26_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM26: INSTR_MEM26_Field
    }

    /// Write-only access to instruction memory location 27
    @RegisterBank(offset: 0x00b4)
    public var INSTR_MEM27: Register<INSTR_MEM27_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM27_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM27: INSTR_MEM27_Field
    }

    /// Write-only access to instruction memory location 28
    @RegisterBank(offset: 0x00b8)
    public var INSTR_MEM28: Register<INSTR_MEM28_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM28_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM28: INSTR_MEM28_Field
    }

    /// Write-only access to instruction memory location 29
    @RegisterBank(offset: 0x00bc)
    public var INSTR_MEM29: Register<INSTR_MEM29_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM29_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM29: INSTR_MEM29_Field
    }

    /// Write-only access to instruction memory location 30
    @RegisterBank(offset: 0x00c0)
    public var INSTR_MEM30: Register<INSTR_MEM30_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM30_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM30: INSTR_MEM30_Field
    }

    /// Write-only access to instruction memory location 31
    @RegisterBank(offset: 0x00c4)
    public var INSTR_MEM31: Register<INSTR_MEM31_Descriptor>


    @Register(bitWidth: 32)
    public struct INSTR_MEM31_Descriptor {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var INSTR_MEM31: INSTR_MEM31_Field
    }

    /// Clock divisor register for state machine 0
    /// Frequency = clock freq / (CLKDIV_INT + CLKDIV_FRAC / 256)
    @RegisterBank(offset: 0x00c8)
    public var SM0_CLKDIV: Register<SM0_CLKDIV_Descriptor>


    @Register(bitWidth: 32)
    public struct SM0_CLKDIV_Descriptor {
        /// Effective frequency is sysclk/(int + frac/256).
        /// Value of 0 is interpreted as 65536. If INT is 0, FRAC must also be 0.
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var INT: INT_Field

        /// Fractional part of clock divisor
        @ReadWrite(bits: 8..<16, as: BitField8.self)
        public var FRAC: FRAC_Field
    }

    /// Execution/behavioural settings for state machine 0
    @RegisterBank(offset: 0x00cc)
    public var SM0_EXECCTRL: Register<SM0_EXECCTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct SM0_EXECCTRL_Descriptor {
        /// If 1, an instruction written to SMx_INSTR is stalled, and latched by the state machine. Will clear to 0 once this instruction completes.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var EXEC_STALLED: EXEC_STALLED_Field

        /// If 1, the MSB of the Delay/Side-set instruction field is used as side-set enable, rather than a side-set data bit. This allows instructions to perform side-set optionally, rather than on every instruction, but the maximum possible side-set width is reduced from 5 to 4. Note that the value of PINCTRL_SIDESET_COUNT is inclusive of this enable bit.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var SIDE_EN: SIDE_EN_Field

        /// If 1, side-set data is asserted to pin directions, instead of pin values
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var SIDE_PINDIR: SIDE_PINDIR_Field

        /// The GPIO number to use as condition for JMP PIN. Unaffected by input mapping.
        @ReadWrite(bits: 24..<29, as: BitField5.self)
        public var JMP_PIN: JMP_PIN_Field

        /// Which data bit to use for inline OUT enable
        @ReadWrite(bits: 19..<24, as: BitField5.self)
        public var OUT_EN_SEL: OUT_EN_SEL_Field

        /// If 1, use a bit of OUT data as an auxiliary write enable
        /// When used in conjunction with OUT_STICKY, writes with an enable of 0 will
        /// deassert the latest pin write. This can create useful masking/override behaviour
        /// due to the priority ordering of state machine pin writes (SM0 < SM1 < ...)
        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var INLINE_OUT_EN: INLINE_OUT_EN_Field

        /// Continuously assert the most recent OUT/SET to the pins
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var OUT_STICKY: OUT_STICKY_Field

        /// After reaching this address, execution is wrapped to wrap_bottom.
        /// If the instruction is a jump, and the jump condition is true, the jump takes priority.
        @ReadWrite(bits: 12..<17, as: BitField5.self)
        public var WRAP_TOP: WRAP_TOP_Field

        /// After reaching wrap_top, execution is wrapped to this address.
        @ReadWrite(bits: 7..<12, as: BitField5.self)
        public var WRAP_BOTTOM: WRAP_BOTTOM_Field

        /// Comparison used for the MOV x, STATUS instruction.
        @ReadWrite(bits: 4..<5, as: STATUS_SEL_Values.self)
        public var STATUS_SEL: STATUS_SEL_Field

        public enum STATUS_SEL_Values: UInt, BitFieldProjectable {
            /// All-ones if TX FIFO level < N, otherwise all-zeroes
            case STATUS_SEL_TXLEVEL = 0
            /// All-ones if RX FIFO level < N, otherwise all-zeroes
            case STATUS_SEL_RXLEVEL = 1

            public static var bitWidth: Int { 1 }
        }

        /// Comparison level for the MOV x, STATUS instruction
        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var STATUS_N: STATUS_N_Field
    }

    /// Control behaviour of the input/output shift registers for state machine 0
    @RegisterBank(offset: 0x00d0)
    public var SM0_SHIFTCTRL: Register<SM0_SHIFTCTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct SM0_SHIFTCTRL_Descriptor {
        /// When 1, RX FIFO steals the TX FIFO's storage, and becomes twice as deep.
        /// TX FIFO is disabled as a result (always reads as both full and empty).
        /// FIFOs are flushed when this bit is changed.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var FJOIN_RX: FJOIN_RX_Field

        /// When 1, TX FIFO steals the RX FIFO's storage, and becomes twice as deep.
        /// RX FIFO is disabled as a result (always reads as both full and empty).
        /// FIFOs are flushed when this bit is changed.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var FJOIN_TX: FJOIN_TX_Field

        /// Number of bits shifted out of OSR before autopull, or conditional pull (PULL IFEMPTY), will take place.
        /// Write 0 for value of 32.
        @ReadWrite(bits: 25..<30, as: BitField5.self)
        public var PULL_THRESH: PULL_THRESH_Field

        /// Number of bits shifted into ISR before autopush, or conditional push (PUSH IFFULL), will take place.
        /// Write 0 for value of 32.
        @ReadWrite(bits: 20..<25, as: BitField5.self)
        public var PUSH_THRESH: PUSH_THRESH_Field

        /// 1 = shift out of output shift register to right. 0 = to left.
        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var OUT_SHIFTDIR: OUT_SHIFTDIR_Field

        /// 1 = shift input shift register to right (data enters from left). 0 = to left.
        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var IN_SHIFTDIR: IN_SHIFTDIR_Field

        /// Pull automatically when the output shift register is emptied, i.e. on or following an OUT instruction which causes the output shift counter to reach or exceed PULL_THRESH.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var AUTOPULL: AUTOPULL_Field

        /// Push automatically when the input shift register is filled, i.e. on an IN instruction which causes the input shift counter to reach or exceed PUSH_THRESH.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var AUTOPUSH: AUTOPUSH_Field
    }

    /// Current instruction address of state machine 0
    @RegisterBank(offset: 0x00d4)
    public var SM0_ADDR: Register<SM0_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct SM0_ADDR_Descriptor {
        @ReadOnly(bits: 0..<5, as: BitField5.self)
        public var SM0_ADDR: SM0_ADDR_Field
    }

    /// Read to see the instruction currently addressed by state machine 0's program counter
    /// Write to execute an instruction immediately (including jumps) and then resume execution.
    @RegisterBank(offset: 0x00d8)
    public var SM0_INSTR: Register<SM0_INSTR_Descriptor>


    @Register(bitWidth: 32)
    public struct SM0_INSTR_Descriptor {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var SM0_INSTR: SM0_INSTR_Field
    }

    /// State machine pin control
    @RegisterBank(offset: 0x00dc)
    public var SM0_PINCTRL: Register<SM0_PINCTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct SM0_PINCTRL_Descriptor {
        /// The number of MSBs of the Delay/Side-set instruction field which are used for side-set. Inclusive of the enable bit, if present. Minimum of 0 (all delay bits, no side-set) and maximum of 5 (all side-set, no delay).
        @ReadWrite(bits: 29..<32, as: BitField3.self)
        public var SIDESET_COUNT: SIDESET_COUNT_Field

        /// The number of pins asserted by a SET. In the range 0 to 5 inclusive.
        @ReadWrite(bits: 26..<29, as: BitField3.self)
        public var SET_COUNT: SET_COUNT_Field

        /// The number of pins asserted by an OUT PINS, OUT PINDIRS or MOV PINS instruction. In the range 0 to 32 inclusive.
        @ReadWrite(bits: 20..<26, as: BitField6.self)
        public var OUT_COUNT: OUT_COUNT_Field

        /// The pin which is mapped to the least-significant bit of a state machine's IN data bus. Higher-numbered pins are mapped to consecutively more-significant data bits, with a modulo of 32 applied to pin number.
        @ReadWrite(bits: 15..<20, as: BitField5.self)
        public var IN_BASE: IN_BASE_Field

        /// The lowest-numbered pin that will be affected by a side-set operation. The MSBs of an instruction's side-set/delay field (up to 5, determined by SIDESET_COUNT) are used for side-set data, with the remaining LSBs used for delay. The least-significant bit of the side-set portion is the bit written to this pin, with more-significant bits written to higher-numbered pins.
        @ReadWrite(bits: 10..<15, as: BitField5.self)
        public var SIDESET_BASE: SIDESET_BASE_Field

        /// The lowest-numbered pin that will be affected by a SET PINS or SET PINDIRS instruction. The data written to this pin is the least-significant bit of the SET data.
        @ReadWrite(bits: 5..<10, as: BitField5.self)
        public var SET_BASE: SET_BASE_Field

        /// The lowest-numbered pin that will be affected by an OUT PINS, OUT PINDIRS or MOV PINS instruction. The data written to this pin will always be the least-significant bit of the OUT or MOV data.
        @ReadWrite(bits: 0..<5, as: BitField5.self)
        public var OUT_BASE: OUT_BASE_Field
    }

    /// Clock divisor register for state machine 1
    /// Frequency = clock freq / (CLKDIV_INT + CLKDIV_FRAC / 256)
    @RegisterBank(offset: 0x00e0)
    public var SM1_CLKDIV: Register<SM1_CLKDIV_Descriptor>


    @Register(bitWidth: 32)
    public struct SM1_CLKDIV_Descriptor {
        /// Effective frequency is sysclk/(int + frac/256).
        /// Value of 0 is interpreted as 65536. If INT is 0, FRAC must also be 0.
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var INT: INT_Field

        /// Fractional part of clock divisor
        @ReadWrite(bits: 8..<16, as: BitField8.self)
        public var FRAC: FRAC_Field
    }

    /// Execution/behavioural settings for state machine 1
    @RegisterBank(offset: 0x00e4)
    public var SM1_EXECCTRL: Register<SM1_EXECCTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct SM1_EXECCTRL_Descriptor {
        /// If 1, an instruction written to SMx_INSTR is stalled, and latched by the state machine. Will clear to 0 once this instruction completes.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var EXEC_STALLED: EXEC_STALLED_Field

        /// If 1, the MSB of the Delay/Side-set instruction field is used as side-set enable, rather than a side-set data bit. This allows instructions to perform side-set optionally, rather than on every instruction, but the maximum possible side-set width is reduced from 5 to 4. Note that the value of PINCTRL_SIDESET_COUNT is inclusive of this enable bit.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var SIDE_EN: SIDE_EN_Field

        /// If 1, side-set data is asserted to pin directions, instead of pin values
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var SIDE_PINDIR: SIDE_PINDIR_Field

        /// The GPIO number to use as condition for JMP PIN. Unaffected by input mapping.
        @ReadWrite(bits: 24..<29, as: BitField5.self)
        public var JMP_PIN: JMP_PIN_Field

        /// Which data bit to use for inline OUT enable
        @ReadWrite(bits: 19..<24, as: BitField5.self)
        public var OUT_EN_SEL: OUT_EN_SEL_Field

        /// If 1, use a bit of OUT data as an auxiliary write enable
        /// When used in conjunction with OUT_STICKY, writes with an enable of 0 will
        /// deassert the latest pin write. This can create useful masking/override behaviour
        /// due to the priority ordering of state machine pin writes (SM0 < SM1 < ...)
        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var INLINE_OUT_EN: INLINE_OUT_EN_Field

        /// Continuously assert the most recent OUT/SET to the pins
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var OUT_STICKY: OUT_STICKY_Field

        /// After reaching this address, execution is wrapped to wrap_bottom.
        /// If the instruction is a jump, and the jump condition is true, the jump takes priority.
        @ReadWrite(bits: 12..<17, as: BitField5.self)
        public var WRAP_TOP: WRAP_TOP_Field

        /// After reaching wrap_top, execution is wrapped to this address.
        @ReadWrite(bits: 7..<12, as: BitField5.self)
        public var WRAP_BOTTOM: WRAP_BOTTOM_Field

        /// Comparison used for the MOV x, STATUS instruction.
        @ReadWrite(bits: 4..<5, as: STATUS_SEL_Values.self)
        public var STATUS_SEL: STATUS_SEL_Field

        public enum STATUS_SEL_Values: UInt, BitFieldProjectable {
            /// All-ones if TX FIFO level < N, otherwise all-zeroes
            case STATUS_SEL_TXLEVEL = 0
            /// All-ones if RX FIFO level < N, otherwise all-zeroes
            case STATUS_SEL_RXLEVEL = 1

            public static var bitWidth: Int { 1 }
        }

        /// Comparison level for the MOV x, STATUS instruction
        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var STATUS_N: STATUS_N_Field
    }

    /// Control behaviour of the input/output shift registers for state machine 1
    @RegisterBank(offset: 0x00e8)
    public var SM1_SHIFTCTRL: Register<SM1_SHIFTCTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct SM1_SHIFTCTRL_Descriptor {
        /// When 1, RX FIFO steals the TX FIFO's storage, and becomes twice as deep.
        /// TX FIFO is disabled as a result (always reads as both full and empty).
        /// FIFOs are flushed when this bit is changed.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var FJOIN_RX: FJOIN_RX_Field

        /// When 1, TX FIFO steals the RX FIFO's storage, and becomes twice as deep.
        /// RX FIFO is disabled as a result (always reads as both full and empty).
        /// FIFOs are flushed when this bit is changed.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var FJOIN_TX: FJOIN_TX_Field

        /// Number of bits shifted out of OSR before autopull, or conditional pull (PULL IFEMPTY), will take place.
        /// Write 0 for value of 32.
        @ReadWrite(bits: 25..<30, as: BitField5.self)
        public var PULL_THRESH: PULL_THRESH_Field

        /// Number of bits shifted into ISR before autopush, or conditional push (PUSH IFFULL), will take place.
        /// Write 0 for value of 32.
        @ReadWrite(bits: 20..<25, as: BitField5.self)
        public var PUSH_THRESH: PUSH_THRESH_Field

        /// 1 = shift out of output shift register to right. 0 = to left.
        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var OUT_SHIFTDIR: OUT_SHIFTDIR_Field

        /// 1 = shift input shift register to right (data enters from left). 0 = to left.
        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var IN_SHIFTDIR: IN_SHIFTDIR_Field

        /// Pull automatically when the output shift register is emptied, i.e. on or following an OUT instruction which causes the output shift counter to reach or exceed PULL_THRESH.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var AUTOPULL: AUTOPULL_Field

        /// Push automatically when the input shift register is filled, i.e. on an IN instruction which causes the input shift counter to reach or exceed PUSH_THRESH.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var AUTOPUSH: AUTOPUSH_Field
    }

    /// Current instruction address of state machine 1
    @RegisterBank(offset: 0x00ec)
    public var SM1_ADDR: Register<SM1_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct SM1_ADDR_Descriptor {
        @ReadOnly(bits: 0..<5, as: BitField5.self)
        public var SM1_ADDR: SM1_ADDR_Field
    }

    /// Read to see the instruction currently addressed by state machine 1's program counter
    /// Write to execute an instruction immediately (including jumps) and then resume execution.
    @RegisterBank(offset: 0x00f0)
    public var SM1_INSTR: Register<SM1_INSTR_Descriptor>


    @Register(bitWidth: 32)
    public struct SM1_INSTR_Descriptor {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var SM1_INSTR: SM1_INSTR_Field
    }

    /// State machine pin control
    @RegisterBank(offset: 0x00f4)
    public var SM1_PINCTRL: Register<SM1_PINCTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct SM1_PINCTRL_Descriptor {
        /// The number of MSBs of the Delay/Side-set instruction field which are used for side-set. Inclusive of the enable bit, if present. Minimum of 0 (all delay bits, no side-set) and maximum of 5 (all side-set, no delay).
        @ReadWrite(bits: 29..<32, as: BitField3.self)
        public var SIDESET_COUNT: SIDESET_COUNT_Field

        /// The number of pins asserted by a SET. In the range 0 to 5 inclusive.
        @ReadWrite(bits: 26..<29, as: BitField3.self)
        public var SET_COUNT: SET_COUNT_Field

        /// The number of pins asserted by an OUT PINS, OUT PINDIRS or MOV PINS instruction. In the range 0 to 32 inclusive.
        @ReadWrite(bits: 20..<26, as: BitField6.self)
        public var OUT_COUNT: OUT_COUNT_Field

        /// The pin which is mapped to the least-significant bit of a state machine's IN data bus. Higher-numbered pins are mapped to consecutively more-significant data bits, with a modulo of 32 applied to pin number.
        @ReadWrite(bits: 15..<20, as: BitField5.self)
        public var IN_BASE: IN_BASE_Field

        /// The lowest-numbered pin that will be affected by a side-set operation. The MSBs of an instruction's side-set/delay field (up to 5, determined by SIDESET_COUNT) are used for side-set data, with the remaining LSBs used for delay. The least-significant bit of the side-set portion is the bit written to this pin, with more-significant bits written to higher-numbered pins.
        @ReadWrite(bits: 10..<15, as: BitField5.self)
        public var SIDESET_BASE: SIDESET_BASE_Field

        /// The lowest-numbered pin that will be affected by a SET PINS or SET PINDIRS instruction. The data written to this pin is the least-significant bit of the SET data.
        @ReadWrite(bits: 5..<10, as: BitField5.self)
        public var SET_BASE: SET_BASE_Field

        /// The lowest-numbered pin that will be affected by an OUT PINS, OUT PINDIRS or MOV PINS instruction. The data written to this pin will always be the least-significant bit of the OUT or MOV data.
        @ReadWrite(bits: 0..<5, as: BitField5.self)
        public var OUT_BASE: OUT_BASE_Field
    }

    /// Clock divisor register for state machine 2
    /// Frequency = clock freq / (CLKDIV_INT + CLKDIV_FRAC / 256)
    @RegisterBank(offset: 0x00f8)
    public var SM2_CLKDIV: Register<SM2_CLKDIV_Descriptor>


    @Register(bitWidth: 32)
    public struct SM2_CLKDIV_Descriptor {
        /// Effective frequency is sysclk/(int + frac/256).
        /// Value of 0 is interpreted as 65536. If INT is 0, FRAC must also be 0.
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var INT: INT_Field

        /// Fractional part of clock divisor
        @ReadWrite(bits: 8..<16, as: BitField8.self)
        public var FRAC: FRAC_Field
    }

    /// Execution/behavioural settings for state machine 2
    @RegisterBank(offset: 0x00fc)
    public var SM2_EXECCTRL: Register<SM2_EXECCTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct SM2_EXECCTRL_Descriptor {
        /// If 1, an instruction written to SMx_INSTR is stalled, and latched by the state machine. Will clear to 0 once this instruction completes.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var EXEC_STALLED: EXEC_STALLED_Field

        /// If 1, the MSB of the Delay/Side-set instruction field is used as side-set enable, rather than a side-set data bit. This allows instructions to perform side-set optionally, rather than on every instruction, but the maximum possible side-set width is reduced from 5 to 4. Note that the value of PINCTRL_SIDESET_COUNT is inclusive of this enable bit.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var SIDE_EN: SIDE_EN_Field

        /// If 1, side-set data is asserted to pin directions, instead of pin values
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var SIDE_PINDIR: SIDE_PINDIR_Field

        /// The GPIO number to use as condition for JMP PIN. Unaffected by input mapping.
        @ReadWrite(bits: 24..<29, as: BitField5.self)
        public var JMP_PIN: JMP_PIN_Field

        /// Which data bit to use for inline OUT enable
        @ReadWrite(bits: 19..<24, as: BitField5.self)
        public var OUT_EN_SEL: OUT_EN_SEL_Field

        /// If 1, use a bit of OUT data as an auxiliary write enable
        /// When used in conjunction with OUT_STICKY, writes with an enable of 0 will
        /// deassert the latest pin write. This can create useful masking/override behaviour
        /// due to the priority ordering of state machine pin writes (SM0 < SM1 < ...)
        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var INLINE_OUT_EN: INLINE_OUT_EN_Field

        /// Continuously assert the most recent OUT/SET to the pins
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var OUT_STICKY: OUT_STICKY_Field

        /// After reaching this address, execution is wrapped to wrap_bottom.
        /// If the instruction is a jump, and the jump condition is true, the jump takes priority.
        @ReadWrite(bits: 12..<17, as: BitField5.self)
        public var WRAP_TOP: WRAP_TOP_Field

        /// After reaching wrap_top, execution is wrapped to this address.
        @ReadWrite(bits: 7..<12, as: BitField5.self)
        public var WRAP_BOTTOM: WRAP_BOTTOM_Field

        /// Comparison used for the MOV x, STATUS instruction.
        @ReadWrite(bits: 4..<5, as: STATUS_SEL_Values.self)
        public var STATUS_SEL: STATUS_SEL_Field

        public enum STATUS_SEL_Values: UInt, BitFieldProjectable {
            /// All-ones if TX FIFO level < N, otherwise all-zeroes
            case STATUS_SEL_TXLEVEL = 0
            /// All-ones if RX FIFO level < N, otherwise all-zeroes
            case STATUS_SEL_RXLEVEL = 1

            public static var bitWidth: Int { 1 }
        }

        /// Comparison level for the MOV x, STATUS instruction
        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var STATUS_N: STATUS_N_Field
    }

    /// Control behaviour of the input/output shift registers for state machine 2
    @RegisterBank(offset: 0x0100)
    public var SM2_SHIFTCTRL: Register<SM2_SHIFTCTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct SM2_SHIFTCTRL_Descriptor {
        /// When 1, RX FIFO steals the TX FIFO's storage, and becomes twice as deep.
        /// TX FIFO is disabled as a result (always reads as both full and empty).
        /// FIFOs are flushed when this bit is changed.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var FJOIN_RX: FJOIN_RX_Field

        /// When 1, TX FIFO steals the RX FIFO's storage, and becomes twice as deep.
        /// RX FIFO is disabled as a result (always reads as both full and empty).
        /// FIFOs are flushed when this bit is changed.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var FJOIN_TX: FJOIN_TX_Field

        /// Number of bits shifted out of OSR before autopull, or conditional pull (PULL IFEMPTY), will take place.
        /// Write 0 for value of 32.
        @ReadWrite(bits: 25..<30, as: BitField5.self)
        public var PULL_THRESH: PULL_THRESH_Field

        /// Number of bits shifted into ISR before autopush, or conditional push (PUSH IFFULL), will take place.
        /// Write 0 for value of 32.
        @ReadWrite(bits: 20..<25, as: BitField5.self)
        public var PUSH_THRESH: PUSH_THRESH_Field

        /// 1 = shift out of output shift register to right. 0 = to left.
        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var OUT_SHIFTDIR: OUT_SHIFTDIR_Field

        /// 1 = shift input shift register to right (data enters from left). 0 = to left.
        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var IN_SHIFTDIR: IN_SHIFTDIR_Field

        /// Pull automatically when the output shift register is emptied, i.e. on or following an OUT instruction which causes the output shift counter to reach or exceed PULL_THRESH.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var AUTOPULL: AUTOPULL_Field

        /// Push automatically when the input shift register is filled, i.e. on an IN instruction which causes the input shift counter to reach or exceed PUSH_THRESH.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var AUTOPUSH: AUTOPUSH_Field
    }

    /// Current instruction address of state machine 2
    @RegisterBank(offset: 0x0104)
    public var SM2_ADDR: Register<SM2_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct SM2_ADDR_Descriptor {
        @ReadOnly(bits: 0..<5, as: BitField5.self)
        public var SM2_ADDR: SM2_ADDR_Field
    }

    /// Read to see the instruction currently addressed by state machine 2's program counter
    /// Write to execute an instruction immediately (including jumps) and then resume execution.
    @RegisterBank(offset: 0x0108)
    public var SM2_INSTR: Register<SM2_INSTR_Descriptor>


    @Register(bitWidth: 32)
    public struct SM2_INSTR_Descriptor {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var SM2_INSTR: SM2_INSTR_Field
    }

    /// State machine pin control
    @RegisterBank(offset: 0x010c)
    public var SM2_PINCTRL: Register<SM2_PINCTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct SM2_PINCTRL_Descriptor {
        /// The number of MSBs of the Delay/Side-set instruction field which are used for side-set. Inclusive of the enable bit, if present. Minimum of 0 (all delay bits, no side-set) and maximum of 5 (all side-set, no delay).
        @ReadWrite(bits: 29..<32, as: BitField3.self)
        public var SIDESET_COUNT: SIDESET_COUNT_Field

        /// The number of pins asserted by a SET. In the range 0 to 5 inclusive.
        @ReadWrite(bits: 26..<29, as: BitField3.self)
        public var SET_COUNT: SET_COUNT_Field

        /// The number of pins asserted by an OUT PINS, OUT PINDIRS or MOV PINS instruction. In the range 0 to 32 inclusive.
        @ReadWrite(bits: 20..<26, as: BitField6.self)
        public var OUT_COUNT: OUT_COUNT_Field

        /// The pin which is mapped to the least-significant bit of a state machine's IN data bus. Higher-numbered pins are mapped to consecutively more-significant data bits, with a modulo of 32 applied to pin number.
        @ReadWrite(bits: 15..<20, as: BitField5.self)
        public var IN_BASE: IN_BASE_Field

        /// The lowest-numbered pin that will be affected by a side-set operation. The MSBs of an instruction's side-set/delay field (up to 5, determined by SIDESET_COUNT) are used for side-set data, with the remaining LSBs used for delay. The least-significant bit of the side-set portion is the bit written to this pin, with more-significant bits written to higher-numbered pins.
        @ReadWrite(bits: 10..<15, as: BitField5.self)
        public var SIDESET_BASE: SIDESET_BASE_Field

        /// The lowest-numbered pin that will be affected by a SET PINS or SET PINDIRS instruction. The data written to this pin is the least-significant bit of the SET data.
        @ReadWrite(bits: 5..<10, as: BitField5.self)
        public var SET_BASE: SET_BASE_Field

        /// The lowest-numbered pin that will be affected by an OUT PINS, OUT PINDIRS or MOV PINS instruction. The data written to this pin will always be the least-significant bit of the OUT or MOV data.
        @ReadWrite(bits: 0..<5, as: BitField5.self)
        public var OUT_BASE: OUT_BASE_Field
    }

    /// Clock divisor register for state machine 3
    /// Frequency = clock freq / (CLKDIV_INT + CLKDIV_FRAC / 256)
    @RegisterBank(offset: 0x0110)
    public var SM3_CLKDIV: Register<SM3_CLKDIV_Descriptor>


    @Register(bitWidth: 32)
    public struct SM3_CLKDIV_Descriptor {
        /// Effective frequency is sysclk/(int + frac/256).
        /// Value of 0 is interpreted as 65536. If INT is 0, FRAC must also be 0.
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var INT: INT_Field

        /// Fractional part of clock divisor
        @ReadWrite(bits: 8..<16, as: BitField8.self)
        public var FRAC: FRAC_Field
    }

    /// Execution/behavioural settings for state machine 3
    @RegisterBank(offset: 0x0114)
    public var SM3_EXECCTRL: Register<SM3_EXECCTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct SM3_EXECCTRL_Descriptor {
        /// If 1, an instruction written to SMx_INSTR is stalled, and latched by the state machine. Will clear to 0 once this instruction completes.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var EXEC_STALLED: EXEC_STALLED_Field

        /// If 1, the MSB of the Delay/Side-set instruction field is used as side-set enable, rather than a side-set data bit. This allows instructions to perform side-set optionally, rather than on every instruction, but the maximum possible side-set width is reduced from 5 to 4. Note that the value of PINCTRL_SIDESET_COUNT is inclusive of this enable bit.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var SIDE_EN: SIDE_EN_Field

        /// If 1, side-set data is asserted to pin directions, instead of pin values
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var SIDE_PINDIR: SIDE_PINDIR_Field

        /// The GPIO number to use as condition for JMP PIN. Unaffected by input mapping.
        @ReadWrite(bits: 24..<29, as: BitField5.self)
        public var JMP_PIN: JMP_PIN_Field

        /// Which data bit to use for inline OUT enable
        @ReadWrite(bits: 19..<24, as: BitField5.self)
        public var OUT_EN_SEL: OUT_EN_SEL_Field

        /// If 1, use a bit of OUT data as an auxiliary write enable
        /// When used in conjunction with OUT_STICKY, writes with an enable of 0 will
        /// deassert the latest pin write. This can create useful masking/override behaviour
        /// due to the priority ordering of state machine pin writes (SM0 < SM1 < ...)
        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var INLINE_OUT_EN: INLINE_OUT_EN_Field

        /// Continuously assert the most recent OUT/SET to the pins
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var OUT_STICKY: OUT_STICKY_Field

        /// After reaching this address, execution is wrapped to wrap_bottom.
        /// If the instruction is a jump, and the jump condition is true, the jump takes priority.
        @ReadWrite(bits: 12..<17, as: BitField5.self)
        public var WRAP_TOP: WRAP_TOP_Field

        /// After reaching wrap_top, execution is wrapped to this address.
        @ReadWrite(bits: 7..<12, as: BitField5.self)
        public var WRAP_BOTTOM: WRAP_BOTTOM_Field

        /// Comparison used for the MOV x, STATUS instruction.
        @ReadWrite(bits: 4..<5, as: STATUS_SEL_Values.self)
        public var STATUS_SEL: STATUS_SEL_Field

        public enum STATUS_SEL_Values: UInt, BitFieldProjectable {
            /// All-ones if TX FIFO level < N, otherwise all-zeroes
            case STATUS_SEL_TXLEVEL = 0
            /// All-ones if RX FIFO level < N, otherwise all-zeroes
            case STATUS_SEL_RXLEVEL = 1

            public static var bitWidth: Int { 1 }
        }

        /// Comparison level for the MOV x, STATUS instruction
        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var STATUS_N: STATUS_N_Field
    }

    /// Control behaviour of the input/output shift registers for state machine 3
    @RegisterBank(offset: 0x0118)
    public var SM3_SHIFTCTRL: Register<SM3_SHIFTCTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct SM3_SHIFTCTRL_Descriptor {
        /// When 1, RX FIFO steals the TX FIFO's storage, and becomes twice as deep.
        /// TX FIFO is disabled as a result (always reads as both full and empty).
        /// FIFOs are flushed when this bit is changed.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var FJOIN_RX: FJOIN_RX_Field

        /// When 1, TX FIFO steals the RX FIFO's storage, and becomes twice as deep.
        /// RX FIFO is disabled as a result (always reads as both full and empty).
        /// FIFOs are flushed when this bit is changed.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var FJOIN_TX: FJOIN_TX_Field

        /// Number of bits shifted out of OSR before autopull, or conditional pull (PULL IFEMPTY), will take place.
        /// Write 0 for value of 32.
        @ReadWrite(bits: 25..<30, as: BitField5.self)
        public var PULL_THRESH: PULL_THRESH_Field

        /// Number of bits shifted into ISR before autopush, or conditional push (PUSH IFFULL), will take place.
        /// Write 0 for value of 32.
        @ReadWrite(bits: 20..<25, as: BitField5.self)
        public var PUSH_THRESH: PUSH_THRESH_Field

        /// 1 = shift out of output shift register to right. 0 = to left.
        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var OUT_SHIFTDIR: OUT_SHIFTDIR_Field

        /// 1 = shift input shift register to right (data enters from left). 0 = to left.
        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var IN_SHIFTDIR: IN_SHIFTDIR_Field

        /// Pull automatically when the output shift register is emptied, i.e. on or following an OUT instruction which causes the output shift counter to reach or exceed PULL_THRESH.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var AUTOPULL: AUTOPULL_Field

        /// Push automatically when the input shift register is filled, i.e. on an IN instruction which causes the input shift counter to reach or exceed PUSH_THRESH.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var AUTOPUSH: AUTOPUSH_Field
    }

    /// Current instruction address of state machine 3
    @RegisterBank(offset: 0x011c)
    public var SM3_ADDR: Register<SM3_ADDR_Descriptor>


    @Register(bitWidth: 32)
    public struct SM3_ADDR_Descriptor {
        @ReadOnly(bits: 0..<5, as: BitField5.self)
        public var SM3_ADDR: SM3_ADDR_Field
    }

    /// Read to see the instruction currently addressed by state machine 3's program counter
    /// Write to execute an instruction immediately (including jumps) and then resume execution.
    @RegisterBank(offset: 0x0120)
    public var SM3_INSTR: Register<SM3_INSTR_Descriptor>


    @Register(bitWidth: 32)
    public struct SM3_INSTR_Descriptor {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var SM3_INSTR: SM3_INSTR_Field
    }

    /// State machine pin control
    @RegisterBank(offset: 0x0124)
    public var SM3_PINCTRL: Register<SM3_PINCTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct SM3_PINCTRL_Descriptor {
        /// The number of MSBs of the Delay/Side-set instruction field which are used for side-set. Inclusive of the enable bit, if present. Minimum of 0 (all delay bits, no side-set) and maximum of 5 (all side-set, no delay).
        @ReadWrite(bits: 29..<32, as: BitField3.self)
        public var SIDESET_COUNT: SIDESET_COUNT_Field

        /// The number of pins asserted by a SET. In the range 0 to 5 inclusive.
        @ReadWrite(bits: 26..<29, as: BitField3.self)
        public var SET_COUNT: SET_COUNT_Field

        /// The number of pins asserted by an OUT PINS, OUT PINDIRS or MOV PINS instruction. In the range 0 to 32 inclusive.
        @ReadWrite(bits: 20..<26, as: BitField6.self)
        public var OUT_COUNT: OUT_COUNT_Field

        /// The pin which is mapped to the least-significant bit of a state machine's IN data bus. Higher-numbered pins are mapped to consecutively more-significant data bits, with a modulo of 32 applied to pin number.
        @ReadWrite(bits: 15..<20, as: BitField5.self)
        public var IN_BASE: IN_BASE_Field

        /// The lowest-numbered pin that will be affected by a side-set operation. The MSBs of an instruction's side-set/delay field (up to 5, determined by SIDESET_COUNT) are used for side-set data, with the remaining LSBs used for delay. The least-significant bit of the side-set portion is the bit written to this pin, with more-significant bits written to higher-numbered pins.
        @ReadWrite(bits: 10..<15, as: BitField5.self)
        public var SIDESET_BASE: SIDESET_BASE_Field

        /// The lowest-numbered pin that will be affected by a SET PINS or SET PINDIRS instruction. The data written to this pin is the least-significant bit of the SET data.
        @ReadWrite(bits: 5..<10, as: BitField5.self)
        public var SET_BASE: SET_BASE_Field

        /// The lowest-numbered pin that will be affected by an OUT PINS, OUT PINDIRS or MOV PINS instruction. The data written to this pin will always be the least-significant bit of the OUT or MOV data.
        @ReadWrite(bits: 0..<5, as: BitField5.self)
        public var OUT_BASE: OUT_BASE_Field
    }

    /// Raw Interrupts
    @RegisterBank(offset: 0x0128)
    public var INTR: Register<INTR_Descriptor>


    @Register(bitWidth: 32)
    public struct INTR_Descriptor {
        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var SM3: SM3_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var SM2: SM2_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var SM1: SM1_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var SM0: SM0_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var SM3_TXNFULL: SM3_TXNFULL_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var SM2_TXNFULL: SM2_TXNFULL_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var SM1_TXNFULL: SM1_TXNFULL_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var SM0_TXNFULL: SM0_TXNFULL_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var SM3_RXNEMPTY: SM3_RXNEMPTY_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var SM2_RXNEMPTY: SM2_RXNEMPTY_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var SM1_RXNEMPTY: SM1_RXNEMPTY_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var SM0_RXNEMPTY: SM0_RXNEMPTY_Field
    }

    /// Interrupt Enable for irq0
    @RegisterBank(offset: 0x012c)
    public var IRQ0_INTE: Register<IRQ0_INTE_Descriptor>


    @Register(bitWidth: 32)
    public struct IRQ0_INTE_Descriptor {
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var SM3: SM3_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var SM2: SM2_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var SM1: SM1_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var SM0: SM0_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var SM3_TXNFULL: SM3_TXNFULL_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var SM2_TXNFULL: SM2_TXNFULL_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var SM1_TXNFULL: SM1_TXNFULL_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var SM0_TXNFULL: SM0_TXNFULL_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var SM3_RXNEMPTY: SM3_RXNEMPTY_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var SM2_RXNEMPTY: SM2_RXNEMPTY_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SM1_RXNEMPTY: SM1_RXNEMPTY_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SM0_RXNEMPTY: SM0_RXNEMPTY_Field
    }

    /// Interrupt Force for irq0
    @RegisterBank(offset: 0x0130)
    public var IRQ0_INTF: Register<IRQ0_INTF_Descriptor>


    @Register(bitWidth: 32)
    public struct IRQ0_INTF_Descriptor {
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var SM3: SM3_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var SM2: SM2_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var SM1: SM1_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var SM0: SM0_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var SM3_TXNFULL: SM3_TXNFULL_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var SM2_TXNFULL: SM2_TXNFULL_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var SM1_TXNFULL: SM1_TXNFULL_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var SM0_TXNFULL: SM0_TXNFULL_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var SM3_RXNEMPTY: SM3_RXNEMPTY_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var SM2_RXNEMPTY: SM2_RXNEMPTY_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SM1_RXNEMPTY: SM1_RXNEMPTY_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SM0_RXNEMPTY: SM0_RXNEMPTY_Field
    }

    /// Interrupt status after masking & forcing for irq0
    @RegisterBank(offset: 0x0134)
    public var IRQ0_INTS: Register<IRQ0_INTS_Descriptor>


    @Register(bitWidth: 32)
    public struct IRQ0_INTS_Descriptor {
        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var SM3: SM3_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var SM2: SM2_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var SM1: SM1_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var SM0: SM0_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var SM3_TXNFULL: SM3_TXNFULL_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var SM2_TXNFULL: SM2_TXNFULL_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var SM1_TXNFULL: SM1_TXNFULL_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var SM0_TXNFULL: SM0_TXNFULL_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var SM3_RXNEMPTY: SM3_RXNEMPTY_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var SM2_RXNEMPTY: SM2_RXNEMPTY_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var SM1_RXNEMPTY: SM1_RXNEMPTY_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var SM0_RXNEMPTY: SM0_RXNEMPTY_Field
    }

    /// Interrupt Enable for irq1
    @RegisterBank(offset: 0x0138)
    public var IRQ1_INTE: Register<IRQ1_INTE_Descriptor>


    @Register(bitWidth: 32)
    public struct IRQ1_INTE_Descriptor {
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var SM3: SM3_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var SM2: SM2_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var SM1: SM1_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var SM0: SM0_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var SM3_TXNFULL: SM3_TXNFULL_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var SM2_TXNFULL: SM2_TXNFULL_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var SM1_TXNFULL: SM1_TXNFULL_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var SM0_TXNFULL: SM0_TXNFULL_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var SM3_RXNEMPTY: SM3_RXNEMPTY_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var SM2_RXNEMPTY: SM2_RXNEMPTY_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SM1_RXNEMPTY: SM1_RXNEMPTY_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SM0_RXNEMPTY: SM0_RXNEMPTY_Field
    }

    /// Interrupt Force for irq1
    @RegisterBank(offset: 0x013c)
    public var IRQ1_INTF: Register<IRQ1_INTF_Descriptor>


    @Register(bitWidth: 32)
    public struct IRQ1_INTF_Descriptor {
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var SM3: SM3_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var SM2: SM2_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var SM1: SM1_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var SM0: SM0_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var SM3_TXNFULL: SM3_TXNFULL_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var SM2_TXNFULL: SM2_TXNFULL_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var SM1_TXNFULL: SM1_TXNFULL_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var SM0_TXNFULL: SM0_TXNFULL_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var SM3_RXNEMPTY: SM3_RXNEMPTY_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var SM2_RXNEMPTY: SM2_RXNEMPTY_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SM1_RXNEMPTY: SM1_RXNEMPTY_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SM0_RXNEMPTY: SM0_RXNEMPTY_Field
    }

    /// Interrupt status after masking & forcing for irq1
    @RegisterBank(offset: 0x0140)
    public var IRQ1_INTS: Register<IRQ1_INTS_Descriptor>


    @Register(bitWidth: 32)
    public struct IRQ1_INTS_Descriptor {
        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var SM3: SM3_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var SM2: SM2_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var SM1: SM1_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var SM0: SM0_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var SM3_TXNFULL: SM3_TXNFULL_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var SM2_TXNFULL: SM2_TXNFULL_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var SM1_TXNFULL: SM1_TXNFULL_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var SM0_TXNFULL: SM0_TXNFULL_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var SM3_RXNEMPTY: SM3_RXNEMPTY_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var SM2_RXNEMPTY: SM2_RXNEMPTY_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var SM1_RXNEMPTY: SM1_RXNEMPTY_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var SM0_RXNEMPTY: SM0_RXNEMPTY_Field
    }
}
