import MMIO
import MMIOExtensions

/// Programmable IO block
@RegisterBank
public struct PIO0 {

    public static var `default`: Self { .init(unsafeAddress: 0x50200000) }

    /// PIO control register
    @RegisterBank(offset: 0x0000)
    public var ctrl: Register<CTRL>

    @Register(bitWidth: 32)
    public struct CTRL {
        /// Restart a state machine's clock divider from an initial phase of 0. Clock dividers are free-running, so once started, their output (including fractional jitter) is completely determined by the integer/fractional divisor configured in SMx_CLKDIV. This means that, if multiple clock dividers with the same divisor are restarted simultaneously, by writing multiple 1 bits to this field, the execution clocks of those state machines will run in precise lockstep.
        /// Note that setting/clearing SM_ENABLE does not stop the clock divider from running, so once multiple state machines' clocks are synchronised, it is safe to disable/reenable a state machine, whilst keeping the clock dividers in sync.
        /// Note also that CLKDIV_RESTART can be written to whilst the state machine is running, and this is useful to resynchronise clock dividers after the divisors (SMx_CLKDIV) have been changed on-the-fly.
        @ReadWrite(bits: 8..<12, as: BitField4.self)
        public var clkdiv_restart: CLKDIV_RESTART_Field

        /// Write 1 to instantly clear internal SM state which may be otherwise difficult to access and will affect future execution.
        /// Specifically, the following are cleared: input and output shift counters; the contents of the input shift register; the delay counter; the waiting-on-IRQ state; any stalled instruction written to SMx_INSTR or run by OUT/MOV EXEC; any pin write left asserted due to OUT_STICKY.
        /// The program counter, the contents of the output shift register and the X/Y scratch registers are not affected.
        @ReadWrite(bits: 4..<8, as: BitField4.self)
        public var sm_restart: SM_RESTART_Field

        /// Enable/disable each of the four state machines by writing 1/0 to each of these four bits. When disabled, a state machine will cease executing instructions, except those written directly to SMx_INSTR by the system. Multiple bits can be set/cleared at once to run/halt multiple state machines simultaneously.
        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var sm_enable: SM_ENABLE_Field
    }

    /// FIFO status register
    @RegisterBank(offset: 0x0004)
    public var fstat: Register<FSTAT>

    @Register(bitWidth: 32)
    public struct FSTAT {
        /// State machine TX FIFO is empty
        @ReadOnly(bits: 24..<28, as: BitField4.self)
        public var txempty: TXEMPTY_Field

        /// State machine TX FIFO is full
        @ReadOnly(bits: 16..<20, as: BitField4.self)
        public var txfull: TXFULL_Field

        /// State machine RX FIFO is empty
        @ReadOnly(bits: 8..<12, as: BitField4.self)
        public var rxempty: RXEMPTY_Field

        /// State machine RX FIFO is full
        @ReadOnly(bits: 0..<4, as: BitField4.self)
        public var rxfull: RXFULL_Field
    }

    /// FIFO debug register
    @RegisterBank(offset: 0x0008)
    public var fdebug: Register<FDEBUG>

    @Register(bitWidth: 32)
    public struct FDEBUG {
        /// State machine has stalled on empty TX FIFO during a blocking PULL, or an OUT with autopull enabled. Write 1 to clear.
        @ReadWrite(bits: 24..<28, as: BitField4.self)
        public var txstall: TXSTALL_Field

        /// TX FIFO overflow (i.e. write-on-full by the system) has occurred. Write 1 to clear. Note that write-on-full does not alter the state or contents of the FIFO in any way, but the data that the system attempted to write is dropped, so if this flag is set, your software has quite likely dropped some data on the floor.
        @ReadWrite(bits: 16..<20, as: BitField4.self)
        public var txover: TXOVER_Field

        /// RX FIFO underflow (i.e. read-on-empty by the system) has occurred. Write 1 to clear. Note that read-on-empty does not perturb the state of the FIFO in any way, but the data returned by reading from an empty FIFO is undefined, so this flag generally only becomes set due to some kind of software error.
        @ReadWrite(bits: 8..<12, as: BitField4.self)
        public var rxunder: RXUNDER_Field

        /// State machine has stalled on full RX FIFO during a blocking PUSH, or an IN with autopush enabled. This flag is also set when a nonblocking PUSH to a full FIFO took place, in which case the state machine has dropped data. Write 1 to clear.
        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var rxstall: RXSTALL_Field
    }

    /// FIFO levels
    @RegisterBank(offset: 0x000c)
    public var flevel: Register<FLEVEL>

    @Register(bitWidth: 32)
    public struct FLEVEL {
        @ReadOnly(bits: 28..<32, as: BitField4.self)
        public var rx3: RX3_Field

        @ReadOnly(bits: 24..<28, as: BitField4.self)
        public var tx3: TX3_Field

        @ReadOnly(bits: 20..<24, as: BitField4.self)
        public var rx2: RX2_Field

        @ReadOnly(bits: 16..<20, as: BitField4.self)
        public var tx2: TX2_Field

        @ReadOnly(bits: 12..<16, as: BitField4.self)
        public var rx1: RX1_Field

        @ReadOnly(bits: 8..<12, as: BitField4.self)
        public var tx1: TX1_Field

        @ReadOnly(bits: 4..<8, as: BitField4.self)
        public var rx0: RX0_Field

        @ReadOnly(bits: 0..<4, as: BitField4.self)
        public var tx0: TX0_Field
    }

    /// Direct write access to the TX FIFO for this state machine. Each write pushes one word to the FIFO. Attempting to write to a full FIFO has no effect on the FIFO state or contents, and sets the sticky FDEBUG_TXOVER error flag for this FIFO.
    @RegisterBank(offset: 0x0010)
    public var txf0: Register<TXF0>

    @Register(bitWidth: 32)
    public struct TXF0 {}

    /// Direct write access to the TX FIFO for this state machine. Each write pushes one word to the FIFO. Attempting to write to a full FIFO has no effect on the FIFO state or contents, and sets the sticky FDEBUG_TXOVER error flag for this FIFO.
    @RegisterBank(offset: 0x0014)
    public var txf1: Register<TXF1>

    @Register(bitWidth: 32)
    public struct TXF1 {}

    /// Direct write access to the TX FIFO for this state machine. Each write pushes one word to the FIFO. Attempting to write to a full FIFO has no effect on the FIFO state or contents, and sets the sticky FDEBUG_TXOVER error flag for this FIFO.
    @RegisterBank(offset: 0x0018)
    public var txf2: Register<TXF2>

    @Register(bitWidth: 32)
    public struct TXF2 {}

    /// Direct write access to the TX FIFO for this state machine. Each write pushes one word to the FIFO. Attempting to write to a full FIFO has no effect on the FIFO state or contents, and sets the sticky FDEBUG_TXOVER error flag for this FIFO.
    @RegisterBank(offset: 0x001c)
    public var txf3: Register<TXF3>

    @Register(bitWidth: 32)
    public struct TXF3 {}

    /// Direct read access to the RX FIFO for this state machine. Each read pops one word from the FIFO. Attempting to read from an empty FIFO has no effect on the FIFO state, and sets the sticky FDEBUG_RXUNDER error flag for this FIFO. The data returned to the system on a read from an empty FIFO is undefined.
    @RegisterBank(offset: 0x0020)
    public var rxf0: Register<RXF0>

    @Register(bitWidth: 32)
    public struct RXF0 {}

    /// Direct read access to the RX FIFO for this state machine. Each read pops one word from the FIFO. Attempting to read from an empty FIFO has no effect on the FIFO state, and sets the sticky FDEBUG_RXUNDER error flag for this FIFO. The data returned to the system on a read from an empty FIFO is undefined.
    @RegisterBank(offset: 0x0024)
    public var rxf1: Register<RXF1>

    @Register(bitWidth: 32)
    public struct RXF1 {}

    /// Direct read access to the RX FIFO for this state machine. Each read pops one word from the FIFO. Attempting to read from an empty FIFO has no effect on the FIFO state, and sets the sticky FDEBUG_RXUNDER error flag for this FIFO. The data returned to the system on a read from an empty FIFO is undefined.
    @RegisterBank(offset: 0x0028)
    public var rxf2: Register<RXF2>

    @Register(bitWidth: 32)
    public struct RXF2 {}

    /// Direct read access to the RX FIFO for this state machine. Each read pops one word from the FIFO. Attempting to read from an empty FIFO has no effect on the FIFO state, and sets the sticky FDEBUG_RXUNDER error flag for this FIFO. The data returned to the system on a read from an empty FIFO is undefined.
    @RegisterBank(offset: 0x002c)
    public var rxf3: Register<RXF3>

    @Register(bitWidth: 32)
    public struct RXF3 {}

    /// State machine IRQ flags register. Write 1 to clear. There are 8 state machine IRQ flags, which can be set, cleared, and waited on by the state machines. There's no fixed association between flags and state machines -- any state machine can use any flag.
    /// Any of the 8 flags can be used for timing synchronisation between state machines, using IRQ and WAIT instructions. The lower four of these flags are also routed out to system-level interrupt requests, alongside FIFO status interrupts -- see e.g. IRQ0_INTE.
    @RegisterBank(offset: 0x0030)
    public var irq: Register<IRQ>

    @Register(bitWidth: 32)
    public struct IRQ {
        @ReadWrite(bits: 0..<8, as: BitField8.self)
        public var irq: IRQ_Field
    }

    /// Writing a 1 to each of these bits will forcibly assert the corresponding IRQ. Note this is different to the INTF register: writing here affects PIO internal state. INTF just asserts the processor-facing IRQ signal for testing ISRs, and is not visible to the state machines.
    @RegisterBank(offset: 0x0034)
    public var irq_force: Register<IRQ_FORCE>

    @Register(bitWidth: 32)
    public struct IRQ_FORCE {
        @WriteOnly(bits: 0..<8, as: BitField8.self)
        public var irq_force: IRQ_FORCE_Field
    }

    /// There is a 2-flipflop synchronizer on each GPIO input, which protects PIO logic from metastabilities. This increases input delay, and for fast synchronous IO (e.g. SPI) these synchronizers may need to be bypassed. Each bit in this register corresponds to one GPIO.
    /// 0 -> input is synchronized (default)
    /// 1 -> synchronizer is bypassed
    /// If in doubt, leave this register as all zeroes.
    @RegisterBank(offset: 0x0038)
    public var input_sync_bypass: Register<INPUT_SYNC_BYPASS>

    @Register(bitWidth: 32)
    public struct INPUT_SYNC_BYPASS {}

    /// Read to sample the pad output values PIO is currently driving to the GPIOs. On RP2040 there are 30 GPIOs, so the two most significant bits are hardwired to 0.
    @RegisterBank(offset: 0x003c)
    public var dbg_padout: Register<DBG_PADOUT>

    @Register(bitWidth: 32)
    public struct DBG_PADOUT {}

    /// Read to sample the pad output enables (direction) PIO is currently driving to the GPIOs. On RP2040 there are 30 GPIOs, so the two most significant bits are hardwired to 0.
    @RegisterBank(offset: 0x0040)
    public var dbg_padoe: Register<DBG_PADOE>

    @Register(bitWidth: 32)
    public struct DBG_PADOE {}

    /// The PIO hardware has some free parameters that may vary between chip products.
    /// These should be provided in the chip datasheet, but are also exposed here.
    @RegisterBank(offset: 0x0044)
    public var dbg_cfginfo: Register<DBG_CFGINFO>

    @Register(bitWidth: 32)
    public struct DBG_CFGINFO {
        /// The size of the instruction memory, measured in units of one instruction
        @ReadOnly(bits: 16..<22, as: BitField6.self)
        public var imem_size: IMEM_SIZE_Field

        /// The number of state machines this PIO instance is equipped with.
        @ReadOnly(bits: 8..<12, as: BitField4.self)
        public var sm_count: SM_COUNT_Field

        /// The depth of the state machine TX/RX FIFOs, measured in words.
        /// Joining fifos via SHIFTCTRL_FJOIN gives one FIFO with double
        /// this depth.
        @ReadOnly(bits: 0..<6, as: BitField6.self)
        public var fifo_depth: FIFO_DEPTH_Field
    }

    /// Write-only access to instruction memory location 0
    @RegisterBank(offset: 0x0048)
    public var instr_mem0: Register<INSTR_MEM0>

    @Register(bitWidth: 32)
    public struct INSTR_MEM0 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem0: INSTR_MEM0_Field
    }

    /// Write-only access to instruction memory location 1
    @RegisterBank(offset: 0x004c)
    public var instr_mem1: Register<INSTR_MEM1>

    @Register(bitWidth: 32)
    public struct INSTR_MEM1 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem1: INSTR_MEM1_Field
    }

    /// Write-only access to instruction memory location 2
    @RegisterBank(offset: 0x0050)
    public var instr_mem2: Register<INSTR_MEM2>

    @Register(bitWidth: 32)
    public struct INSTR_MEM2 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem2: INSTR_MEM2_Field
    }

    /// Write-only access to instruction memory location 3
    @RegisterBank(offset: 0x0054)
    public var instr_mem3: Register<INSTR_MEM3>

    @Register(bitWidth: 32)
    public struct INSTR_MEM3 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem3: INSTR_MEM3_Field
    }

    /// Write-only access to instruction memory location 4
    @RegisterBank(offset: 0x0058)
    public var instr_mem4: Register<INSTR_MEM4>

    @Register(bitWidth: 32)
    public struct INSTR_MEM4 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem4: INSTR_MEM4_Field
    }

    /// Write-only access to instruction memory location 5
    @RegisterBank(offset: 0x005c)
    public var instr_mem5: Register<INSTR_MEM5>

    @Register(bitWidth: 32)
    public struct INSTR_MEM5 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem5: INSTR_MEM5_Field
    }

    /// Write-only access to instruction memory location 6
    @RegisterBank(offset: 0x0060)
    public var instr_mem6: Register<INSTR_MEM6>

    @Register(bitWidth: 32)
    public struct INSTR_MEM6 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem6: INSTR_MEM6_Field
    }

    /// Write-only access to instruction memory location 7
    @RegisterBank(offset: 0x0064)
    public var instr_mem7: Register<INSTR_MEM7>

    @Register(bitWidth: 32)
    public struct INSTR_MEM7 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem7: INSTR_MEM7_Field
    }

    /// Write-only access to instruction memory location 8
    @RegisterBank(offset: 0x0068)
    public var instr_mem8: Register<INSTR_MEM8>

    @Register(bitWidth: 32)
    public struct INSTR_MEM8 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem8: INSTR_MEM8_Field
    }

    /// Write-only access to instruction memory location 9
    @RegisterBank(offset: 0x006c)
    public var instr_mem9: Register<INSTR_MEM9>

    @Register(bitWidth: 32)
    public struct INSTR_MEM9 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem9: INSTR_MEM9_Field
    }

    /// Write-only access to instruction memory location 10
    @RegisterBank(offset: 0x0070)
    public var instr_mem10: Register<INSTR_MEM10>

    @Register(bitWidth: 32)
    public struct INSTR_MEM10 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem10: INSTR_MEM10_Field
    }

    /// Write-only access to instruction memory location 11
    @RegisterBank(offset: 0x0074)
    public var instr_mem11: Register<INSTR_MEM11>

    @Register(bitWidth: 32)
    public struct INSTR_MEM11 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem11: INSTR_MEM11_Field
    }

    /// Write-only access to instruction memory location 12
    @RegisterBank(offset: 0x0078)
    public var instr_mem12: Register<INSTR_MEM12>

    @Register(bitWidth: 32)
    public struct INSTR_MEM12 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem12: INSTR_MEM12_Field
    }

    /// Write-only access to instruction memory location 13
    @RegisterBank(offset: 0x007c)
    public var instr_mem13: Register<INSTR_MEM13>

    @Register(bitWidth: 32)
    public struct INSTR_MEM13 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem13: INSTR_MEM13_Field
    }

    /// Write-only access to instruction memory location 14
    @RegisterBank(offset: 0x0080)
    public var instr_mem14: Register<INSTR_MEM14>

    @Register(bitWidth: 32)
    public struct INSTR_MEM14 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem14: INSTR_MEM14_Field
    }

    /// Write-only access to instruction memory location 15
    @RegisterBank(offset: 0x0084)
    public var instr_mem15: Register<INSTR_MEM15>

    @Register(bitWidth: 32)
    public struct INSTR_MEM15 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem15: INSTR_MEM15_Field
    }

    /// Write-only access to instruction memory location 16
    @RegisterBank(offset: 0x0088)
    public var instr_mem16: Register<INSTR_MEM16>

    @Register(bitWidth: 32)
    public struct INSTR_MEM16 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem16: INSTR_MEM16_Field
    }

    /// Write-only access to instruction memory location 17
    @RegisterBank(offset: 0x008c)
    public var instr_mem17: Register<INSTR_MEM17>

    @Register(bitWidth: 32)
    public struct INSTR_MEM17 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem17: INSTR_MEM17_Field
    }

    /// Write-only access to instruction memory location 18
    @RegisterBank(offset: 0x0090)
    public var instr_mem18: Register<INSTR_MEM18>

    @Register(bitWidth: 32)
    public struct INSTR_MEM18 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem18: INSTR_MEM18_Field
    }

    /// Write-only access to instruction memory location 19
    @RegisterBank(offset: 0x0094)
    public var instr_mem19: Register<INSTR_MEM19>

    @Register(bitWidth: 32)
    public struct INSTR_MEM19 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem19: INSTR_MEM19_Field
    }

    /// Write-only access to instruction memory location 20
    @RegisterBank(offset: 0x0098)
    public var instr_mem20: Register<INSTR_MEM20>

    @Register(bitWidth: 32)
    public struct INSTR_MEM20 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem20: INSTR_MEM20_Field
    }

    /// Write-only access to instruction memory location 21
    @RegisterBank(offset: 0x009c)
    public var instr_mem21: Register<INSTR_MEM21>

    @Register(bitWidth: 32)
    public struct INSTR_MEM21 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem21: INSTR_MEM21_Field
    }

    /// Write-only access to instruction memory location 22
    @RegisterBank(offset: 0x00a0)
    public var instr_mem22: Register<INSTR_MEM22>

    @Register(bitWidth: 32)
    public struct INSTR_MEM22 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem22: INSTR_MEM22_Field
    }

    /// Write-only access to instruction memory location 23
    @RegisterBank(offset: 0x00a4)
    public var instr_mem23: Register<INSTR_MEM23>

    @Register(bitWidth: 32)
    public struct INSTR_MEM23 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem23: INSTR_MEM23_Field
    }

    /// Write-only access to instruction memory location 24
    @RegisterBank(offset: 0x00a8)
    public var instr_mem24: Register<INSTR_MEM24>

    @Register(bitWidth: 32)
    public struct INSTR_MEM24 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem24: INSTR_MEM24_Field
    }

    /// Write-only access to instruction memory location 25
    @RegisterBank(offset: 0x00ac)
    public var instr_mem25: Register<INSTR_MEM25>

    @Register(bitWidth: 32)
    public struct INSTR_MEM25 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem25: INSTR_MEM25_Field
    }

    /// Write-only access to instruction memory location 26
    @RegisterBank(offset: 0x00b0)
    public var instr_mem26: Register<INSTR_MEM26>

    @Register(bitWidth: 32)
    public struct INSTR_MEM26 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem26: INSTR_MEM26_Field
    }

    /// Write-only access to instruction memory location 27
    @RegisterBank(offset: 0x00b4)
    public var instr_mem27: Register<INSTR_MEM27>

    @Register(bitWidth: 32)
    public struct INSTR_MEM27 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem27: INSTR_MEM27_Field
    }

    /// Write-only access to instruction memory location 28
    @RegisterBank(offset: 0x00b8)
    public var instr_mem28: Register<INSTR_MEM28>

    @Register(bitWidth: 32)
    public struct INSTR_MEM28 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem28: INSTR_MEM28_Field
    }

    /// Write-only access to instruction memory location 29
    @RegisterBank(offset: 0x00bc)
    public var instr_mem29: Register<INSTR_MEM29>

    @Register(bitWidth: 32)
    public struct INSTR_MEM29 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem29: INSTR_MEM29_Field
    }

    /// Write-only access to instruction memory location 30
    @RegisterBank(offset: 0x00c0)
    public var instr_mem30: Register<INSTR_MEM30>

    @Register(bitWidth: 32)
    public struct INSTR_MEM30 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem30: INSTR_MEM30_Field
    }

    /// Write-only access to instruction memory location 31
    @RegisterBank(offset: 0x00c4)
    public var instr_mem31: Register<INSTR_MEM31>

    @Register(bitWidth: 32)
    public struct INSTR_MEM31 {
        @WriteOnly(bits: 0..<16, as: BitField16.self)
        public var instr_mem31: INSTR_MEM31_Field
    }

    /// Clock divisor register for state machine 0
    /// Frequency = clock freq / (CLKDIV_INT + CLKDIV_FRAC / 256)
    @RegisterBank(offset: 0x00c8)
    public var sm0_clkdiv: Register<SM0_CLKDIV>

    @Register(bitWidth: 32)
    public struct SM0_CLKDIV {
        /// Effective frequency is sysclk/(int + frac/256).
        /// Value of 0 is interpreted as 65536. If INT is 0, FRAC must also be 0.
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var int: INT_Field

        /// Fractional part of clock divisor
        @ReadWrite(bits: 8..<16, as: BitField8.self)
        public var frac: FRAC_Field
    }

    /// Execution/behavioural settings for state machine 0
    @RegisterBank(offset: 0x00cc)
    public var sm0_execctrl: Register<SM0_EXECCTRL>

    @Register(bitWidth: 32)
    public struct SM0_EXECCTRL {
        /// If 1, an instruction written to SMx_INSTR is stalled, and latched by the state machine. Will clear to 0 once this instruction completes.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var exec_stalled: EXEC_STALLED_Field

        /// If 1, the MSB of the Delay/Side-set instruction field is used as side-set enable, rather than a side-set data bit. This allows instructions to perform side-set optionally, rather than on every instruction, but the maximum possible side-set width is reduced from 5 to 4. Note that the value of PINCTRL_SIDESET_COUNT is inclusive of this enable bit.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var side_en: SIDE_EN_Field

        /// If 1, side-set data is asserted to pin directions, instead of pin values
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var side_pindir: SIDE_PINDIR_Field

        /// The GPIO number to use as condition for JMP PIN. Unaffected by input mapping.
        @ReadWrite(bits: 24..<29, as: BitField5.self)
        public var jmp_pin: JMP_PIN_Field

        /// Which data bit to use for inline OUT enable
        @ReadWrite(bits: 19..<24, as: BitField5.self)
        public var out_en_sel: OUT_EN_SEL_Field

        /// If 1, use a bit of OUT data as an auxiliary write enable
        /// When used in conjunction with OUT_STICKY, writes with an enable of 0 will
        /// deassert the latest pin write. This can create useful masking/override behaviour
        /// due to the priority ordering of state machine pin writes (SM0 < SM1 < ...)
        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var inline_out_en: INLINE_OUT_EN_Field

        /// Continuously assert the most recent OUT/SET to the pins
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var out_sticky: OUT_STICKY_Field

        /// After reaching this address, execution is wrapped to wrap_bottom.
        /// If the instruction is a jump, and the jump condition is true, the jump takes priority.
        @ReadWrite(bits: 12..<17, as: BitField5.self)
        public var wrap_top: WRAP_TOP_Field

        /// After reaching wrap_top, execution is wrapped to this address.
        @ReadWrite(bits: 7..<12, as: BitField5.self)
        public var wrap_bottom: WRAP_BOTTOM_Field

        /// Comparison used for the MOV x, STATUS instruction.
        @ReadWrite(bits: 4..<5, as: STATUS_SEL_Values.self)
        public var status_sel: STATUS_SEL_Field

        public enum STATUS_SEL_Values: UInt, BitFieldProjectable {
            /// All-ones if TX FIFO level < N, otherwise all-zeroes
            case STATUS_SEL_TXLEVEL = 0
            /// All-ones if RX FIFO level < N, otherwise all-zeroes
            case STATUS_SEL_RXLEVEL = 1

            public static var bitWidth: Int { 1 }
        }

        /// Comparison level for the MOV x, STATUS instruction
        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var status_n: STATUS_N_Field
    }

    /// Control behaviour of the input/output shift registers for state machine 0
    @RegisterBank(offset: 0x00d0)
    public var sm0_shiftctrl: Register<SM0_SHIFTCTRL>

    @Register(bitWidth: 32)
    public struct SM0_SHIFTCTRL {
        /// When 1, RX FIFO steals the TX FIFO's storage, and becomes twice as deep.
        /// TX FIFO is disabled as a result (always reads as both full and empty).
        /// FIFOs are flushed when this bit is changed.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var fjoin_rx: FJOIN_RX_Field

        /// When 1, TX FIFO steals the RX FIFO's storage, and becomes twice as deep.
        /// RX FIFO is disabled as a result (always reads as both full and empty).
        /// FIFOs are flushed when this bit is changed.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var fjoin_tx: FJOIN_TX_Field

        /// Number of bits shifted out of OSR before autopull, or conditional pull (PULL IFEMPTY), will take place.
        /// Write 0 for value of 32.
        @ReadWrite(bits: 25..<30, as: BitField5.self)
        public var pull_thresh: PULL_THRESH_Field

        /// Number of bits shifted into ISR before autopush, or conditional push (PUSH IFFULL), will take place.
        /// Write 0 for value of 32.
        @ReadWrite(bits: 20..<25, as: BitField5.self)
        public var push_thresh: PUSH_THRESH_Field

        /// 1 = shift out of output shift register to right. 0 = to left.
        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var out_shiftdir: OUT_SHIFTDIR_Field

        /// 1 = shift input shift register to right (data enters from left). 0 = to left.
        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var in_shiftdir: IN_SHIFTDIR_Field

        /// Pull automatically when the output shift register is emptied, i.e. on or following an OUT instruction which causes the output shift counter to reach or exceed PULL_THRESH.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var autopull: AUTOPULL_Field

        /// Push automatically when the input shift register is filled, i.e. on an IN instruction which causes the input shift counter to reach or exceed PUSH_THRESH.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var autopush: AUTOPUSH_Field
    }

    /// Current instruction address of state machine 0
    @RegisterBank(offset: 0x00d4)
    public var sm0_addr: Register<SM0_ADDR>

    @Register(bitWidth: 32)
    public struct SM0_ADDR {
        @ReadOnly(bits: 0..<5, as: BitField5.self)
        public var sm0_addr: SM0_ADDR_Field
    }

    /// Read to see the instruction currently addressed by state machine 0's program counter
    /// Write to execute an instruction immediately (including jumps) and then resume execution.
    @RegisterBank(offset: 0x00d8)
    public var sm0_instr: Register<SM0_INSTR>

    @Register(bitWidth: 32)
    public struct SM0_INSTR {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var sm0_instr: SM0_INSTR_Field
    }

    /// State machine pin control
    @RegisterBank(offset: 0x00dc)
    public var sm0_pinctrl: Register<SM0_PINCTRL>

    @Register(bitWidth: 32)
    public struct SM0_PINCTRL {
        /// The number of MSBs of the Delay/Side-set instruction field which are used for side-set. Inclusive of the enable bit, if present. Minimum of 0 (all delay bits, no side-set) and maximum of 5 (all side-set, no delay).
        @ReadWrite(bits: 29..<32, as: BitField3.self)
        public var sideset_count: SIDESET_COUNT_Field

        /// The number of pins asserted by a SET. In the range 0 to 5 inclusive.
        @ReadWrite(bits: 26..<29, as: BitField3.self)
        public var set_count: SET_COUNT_Field

        /// The number of pins asserted by an OUT PINS, OUT PINDIRS or MOV PINS instruction. In the range 0 to 32 inclusive.
        @ReadWrite(bits: 20..<26, as: BitField6.self)
        public var out_count: OUT_COUNT_Field

        /// The pin which is mapped to the least-significant bit of a state machine's IN data bus. Higher-numbered pins are mapped to consecutively more-significant data bits, with a modulo of 32 applied to pin number.
        @ReadWrite(bits: 15..<20, as: BitField5.self)
        public var in_base: IN_BASE_Field

        /// The lowest-numbered pin that will be affected by a side-set operation. The MSBs of an instruction's side-set/delay field (up to 5, determined by SIDESET_COUNT) are used for side-set data, with the remaining LSBs used for delay. The least-significant bit of the side-set portion is the bit written to this pin, with more-significant bits written to higher-numbered pins.
        @ReadWrite(bits: 10..<15, as: BitField5.self)
        public var sideset_base: SIDESET_BASE_Field

        /// The lowest-numbered pin that will be affected by a SET PINS or SET PINDIRS instruction. The data written to this pin is the least-significant bit of the SET data.
        @ReadWrite(bits: 5..<10, as: BitField5.self)
        public var set_base: SET_BASE_Field

        /// The lowest-numbered pin that will be affected by an OUT PINS, OUT PINDIRS or MOV PINS instruction. The data written to this pin will always be the least-significant bit of the OUT or MOV data.
        @ReadWrite(bits: 0..<5, as: BitField5.self)
        public var out_base: OUT_BASE_Field
    }

    /// Clock divisor register for state machine 1
    /// Frequency = clock freq / (CLKDIV_INT + CLKDIV_FRAC / 256)
    @RegisterBank(offset: 0x00e0)
    public var sm1_clkdiv: Register<SM1_CLKDIV>

    @Register(bitWidth: 32)
    public struct SM1_CLKDIV {
        /// Effective frequency is sysclk/(int + frac/256).
        /// Value of 0 is interpreted as 65536. If INT is 0, FRAC must also be 0.
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var int: INT_Field

        /// Fractional part of clock divisor
        @ReadWrite(bits: 8..<16, as: BitField8.self)
        public var frac: FRAC_Field
    }

    /// Execution/behavioural settings for state machine 1
    @RegisterBank(offset: 0x00e4)
    public var sm1_execctrl: Register<SM1_EXECCTRL>

    @Register(bitWidth: 32)
    public struct SM1_EXECCTRL {
        /// If 1, an instruction written to SMx_INSTR is stalled, and latched by the state machine. Will clear to 0 once this instruction completes.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var exec_stalled: EXEC_STALLED_Field

        /// If 1, the MSB of the Delay/Side-set instruction field is used as side-set enable, rather than a side-set data bit. This allows instructions to perform side-set optionally, rather than on every instruction, but the maximum possible side-set width is reduced from 5 to 4. Note that the value of PINCTRL_SIDESET_COUNT is inclusive of this enable bit.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var side_en: SIDE_EN_Field

        /// If 1, side-set data is asserted to pin directions, instead of pin values
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var side_pindir: SIDE_PINDIR_Field

        /// The GPIO number to use as condition for JMP PIN. Unaffected by input mapping.
        @ReadWrite(bits: 24..<29, as: BitField5.self)
        public var jmp_pin: JMP_PIN_Field

        /// Which data bit to use for inline OUT enable
        @ReadWrite(bits: 19..<24, as: BitField5.self)
        public var out_en_sel: OUT_EN_SEL_Field

        /// If 1, use a bit of OUT data as an auxiliary write enable
        /// When used in conjunction with OUT_STICKY, writes with an enable of 0 will
        /// deassert the latest pin write. This can create useful masking/override behaviour
        /// due to the priority ordering of state machine pin writes (SM0 < SM1 < ...)
        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var inline_out_en: INLINE_OUT_EN_Field

        /// Continuously assert the most recent OUT/SET to the pins
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var out_sticky: OUT_STICKY_Field

        /// After reaching this address, execution is wrapped to wrap_bottom.
        /// If the instruction is a jump, and the jump condition is true, the jump takes priority.
        @ReadWrite(bits: 12..<17, as: BitField5.self)
        public var wrap_top: WRAP_TOP_Field

        /// After reaching wrap_top, execution is wrapped to this address.
        @ReadWrite(bits: 7..<12, as: BitField5.self)
        public var wrap_bottom: WRAP_BOTTOM_Field

        /// Comparison used for the MOV x, STATUS instruction.
        @ReadWrite(bits: 4..<5, as: STATUS_SEL_Values.self)
        public var status_sel: STATUS_SEL_Field

        public enum STATUS_SEL_Values: UInt, BitFieldProjectable {
            /// All-ones if TX FIFO level < N, otherwise all-zeroes
            case STATUS_SEL_TXLEVEL = 0
            /// All-ones if RX FIFO level < N, otherwise all-zeroes
            case STATUS_SEL_RXLEVEL = 1

            public static var bitWidth: Int { 1 }
        }

        /// Comparison level for the MOV x, STATUS instruction
        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var status_n: STATUS_N_Field
    }

    /// Control behaviour of the input/output shift registers for state machine 1
    @RegisterBank(offset: 0x00e8)
    public var sm1_shiftctrl: Register<SM1_SHIFTCTRL>

    @Register(bitWidth: 32)
    public struct SM1_SHIFTCTRL {
        /// When 1, RX FIFO steals the TX FIFO's storage, and becomes twice as deep.
        /// TX FIFO is disabled as a result (always reads as both full and empty).
        /// FIFOs are flushed when this bit is changed.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var fjoin_rx: FJOIN_RX_Field

        /// When 1, TX FIFO steals the RX FIFO's storage, and becomes twice as deep.
        /// RX FIFO is disabled as a result (always reads as both full and empty).
        /// FIFOs are flushed when this bit is changed.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var fjoin_tx: FJOIN_TX_Field

        /// Number of bits shifted out of OSR before autopull, or conditional pull (PULL IFEMPTY), will take place.
        /// Write 0 for value of 32.
        @ReadWrite(bits: 25..<30, as: BitField5.self)
        public var pull_thresh: PULL_THRESH_Field

        /// Number of bits shifted into ISR before autopush, or conditional push (PUSH IFFULL), will take place.
        /// Write 0 for value of 32.
        @ReadWrite(bits: 20..<25, as: BitField5.self)
        public var push_thresh: PUSH_THRESH_Field

        /// 1 = shift out of output shift register to right. 0 = to left.
        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var out_shiftdir: OUT_SHIFTDIR_Field

        /// 1 = shift input shift register to right (data enters from left). 0 = to left.
        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var in_shiftdir: IN_SHIFTDIR_Field

        /// Pull automatically when the output shift register is emptied, i.e. on or following an OUT instruction which causes the output shift counter to reach or exceed PULL_THRESH.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var autopull: AUTOPULL_Field

        /// Push automatically when the input shift register is filled, i.e. on an IN instruction which causes the input shift counter to reach or exceed PUSH_THRESH.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var autopush: AUTOPUSH_Field
    }

    /// Current instruction address of state machine 1
    @RegisterBank(offset: 0x00ec)
    public var sm1_addr: Register<SM1_ADDR>

    @Register(bitWidth: 32)
    public struct SM1_ADDR {
        @ReadOnly(bits: 0..<5, as: BitField5.self)
        public var sm1_addr: SM1_ADDR_Field
    }

    /// Read to see the instruction currently addressed by state machine 1's program counter
    /// Write to execute an instruction immediately (including jumps) and then resume execution.
    @RegisterBank(offset: 0x00f0)
    public var sm1_instr: Register<SM1_INSTR>

    @Register(bitWidth: 32)
    public struct SM1_INSTR {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var sm1_instr: SM1_INSTR_Field
    }

    /// State machine pin control
    @RegisterBank(offset: 0x00f4)
    public var sm1_pinctrl: Register<SM1_PINCTRL>

    @Register(bitWidth: 32)
    public struct SM1_PINCTRL {
        /// The number of MSBs of the Delay/Side-set instruction field which are used for side-set. Inclusive of the enable bit, if present. Minimum of 0 (all delay bits, no side-set) and maximum of 5 (all side-set, no delay).
        @ReadWrite(bits: 29..<32, as: BitField3.self)
        public var sideset_count: SIDESET_COUNT_Field

        /// The number of pins asserted by a SET. In the range 0 to 5 inclusive.
        @ReadWrite(bits: 26..<29, as: BitField3.self)
        public var set_count: SET_COUNT_Field

        /// The number of pins asserted by an OUT PINS, OUT PINDIRS or MOV PINS instruction. In the range 0 to 32 inclusive.
        @ReadWrite(bits: 20..<26, as: BitField6.self)
        public var out_count: OUT_COUNT_Field

        /// The pin which is mapped to the least-significant bit of a state machine's IN data bus. Higher-numbered pins are mapped to consecutively more-significant data bits, with a modulo of 32 applied to pin number.
        @ReadWrite(bits: 15..<20, as: BitField5.self)
        public var in_base: IN_BASE_Field

        /// The lowest-numbered pin that will be affected by a side-set operation. The MSBs of an instruction's side-set/delay field (up to 5, determined by SIDESET_COUNT) are used for side-set data, with the remaining LSBs used for delay. The least-significant bit of the side-set portion is the bit written to this pin, with more-significant bits written to higher-numbered pins.
        @ReadWrite(bits: 10..<15, as: BitField5.self)
        public var sideset_base: SIDESET_BASE_Field

        /// The lowest-numbered pin that will be affected by a SET PINS or SET PINDIRS instruction. The data written to this pin is the least-significant bit of the SET data.
        @ReadWrite(bits: 5..<10, as: BitField5.self)
        public var set_base: SET_BASE_Field

        /// The lowest-numbered pin that will be affected by an OUT PINS, OUT PINDIRS or MOV PINS instruction. The data written to this pin will always be the least-significant bit of the OUT or MOV data.
        @ReadWrite(bits: 0..<5, as: BitField5.self)
        public var out_base: OUT_BASE_Field
    }

    /// Clock divisor register for state machine 2
    /// Frequency = clock freq / (CLKDIV_INT + CLKDIV_FRAC / 256)
    @RegisterBank(offset: 0x00f8)
    public var sm2_clkdiv: Register<SM2_CLKDIV>

    @Register(bitWidth: 32)
    public struct SM2_CLKDIV {
        /// Effective frequency is sysclk/(int + frac/256).
        /// Value of 0 is interpreted as 65536. If INT is 0, FRAC must also be 0.
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var int: INT_Field

        /// Fractional part of clock divisor
        @ReadWrite(bits: 8..<16, as: BitField8.self)
        public var frac: FRAC_Field
    }

    /// Execution/behavioural settings for state machine 2
    @RegisterBank(offset: 0x00fc)
    public var sm2_execctrl: Register<SM2_EXECCTRL>

    @Register(bitWidth: 32)
    public struct SM2_EXECCTRL {
        /// If 1, an instruction written to SMx_INSTR is stalled, and latched by the state machine. Will clear to 0 once this instruction completes.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var exec_stalled: EXEC_STALLED_Field

        /// If 1, the MSB of the Delay/Side-set instruction field is used as side-set enable, rather than a side-set data bit. This allows instructions to perform side-set optionally, rather than on every instruction, but the maximum possible side-set width is reduced from 5 to 4. Note that the value of PINCTRL_SIDESET_COUNT is inclusive of this enable bit.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var side_en: SIDE_EN_Field

        /// If 1, side-set data is asserted to pin directions, instead of pin values
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var side_pindir: SIDE_PINDIR_Field

        /// The GPIO number to use as condition for JMP PIN. Unaffected by input mapping.
        @ReadWrite(bits: 24..<29, as: BitField5.self)
        public var jmp_pin: JMP_PIN_Field

        /// Which data bit to use for inline OUT enable
        @ReadWrite(bits: 19..<24, as: BitField5.self)
        public var out_en_sel: OUT_EN_SEL_Field

        /// If 1, use a bit of OUT data as an auxiliary write enable
        /// When used in conjunction with OUT_STICKY, writes with an enable of 0 will
        /// deassert the latest pin write. This can create useful masking/override behaviour
        /// due to the priority ordering of state machine pin writes (SM0 < SM1 < ...)
        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var inline_out_en: INLINE_OUT_EN_Field

        /// Continuously assert the most recent OUT/SET to the pins
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var out_sticky: OUT_STICKY_Field

        /// After reaching this address, execution is wrapped to wrap_bottom.
        /// If the instruction is a jump, and the jump condition is true, the jump takes priority.
        @ReadWrite(bits: 12..<17, as: BitField5.self)
        public var wrap_top: WRAP_TOP_Field

        /// After reaching wrap_top, execution is wrapped to this address.
        @ReadWrite(bits: 7..<12, as: BitField5.self)
        public var wrap_bottom: WRAP_BOTTOM_Field

        /// Comparison used for the MOV x, STATUS instruction.
        @ReadWrite(bits: 4..<5, as: STATUS_SEL_Values.self)
        public var status_sel: STATUS_SEL_Field

        public enum STATUS_SEL_Values: UInt, BitFieldProjectable {
            /// All-ones if TX FIFO level < N, otherwise all-zeroes
            case STATUS_SEL_TXLEVEL = 0
            /// All-ones if RX FIFO level < N, otherwise all-zeroes
            case STATUS_SEL_RXLEVEL = 1

            public static var bitWidth: Int { 1 }
        }

        /// Comparison level for the MOV x, STATUS instruction
        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var status_n: STATUS_N_Field
    }

    /// Control behaviour of the input/output shift registers for state machine 2
    @RegisterBank(offset: 0x0100)
    public var sm2_shiftctrl: Register<SM2_SHIFTCTRL>

    @Register(bitWidth: 32)
    public struct SM2_SHIFTCTRL {
        /// When 1, RX FIFO steals the TX FIFO's storage, and becomes twice as deep.
        /// TX FIFO is disabled as a result (always reads as both full and empty).
        /// FIFOs are flushed when this bit is changed.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var fjoin_rx: FJOIN_RX_Field

        /// When 1, TX FIFO steals the RX FIFO's storage, and becomes twice as deep.
        /// RX FIFO is disabled as a result (always reads as both full and empty).
        /// FIFOs are flushed when this bit is changed.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var fjoin_tx: FJOIN_TX_Field

        /// Number of bits shifted out of OSR before autopull, or conditional pull (PULL IFEMPTY), will take place.
        /// Write 0 for value of 32.
        @ReadWrite(bits: 25..<30, as: BitField5.self)
        public var pull_thresh: PULL_THRESH_Field

        /// Number of bits shifted into ISR before autopush, or conditional push (PUSH IFFULL), will take place.
        /// Write 0 for value of 32.
        @ReadWrite(bits: 20..<25, as: BitField5.self)
        public var push_thresh: PUSH_THRESH_Field

        /// 1 = shift out of output shift register to right. 0 = to left.
        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var out_shiftdir: OUT_SHIFTDIR_Field

        /// 1 = shift input shift register to right (data enters from left). 0 = to left.
        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var in_shiftdir: IN_SHIFTDIR_Field

        /// Pull automatically when the output shift register is emptied, i.e. on or following an OUT instruction which causes the output shift counter to reach or exceed PULL_THRESH.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var autopull: AUTOPULL_Field

        /// Push automatically when the input shift register is filled, i.e. on an IN instruction which causes the input shift counter to reach or exceed PUSH_THRESH.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var autopush: AUTOPUSH_Field
    }

    /// Current instruction address of state machine 2
    @RegisterBank(offset: 0x0104)
    public var sm2_addr: Register<SM2_ADDR>

    @Register(bitWidth: 32)
    public struct SM2_ADDR {
        @ReadOnly(bits: 0..<5, as: BitField5.self)
        public var sm2_addr: SM2_ADDR_Field
    }

    /// Read to see the instruction currently addressed by state machine 2's program counter
    /// Write to execute an instruction immediately (including jumps) and then resume execution.
    @RegisterBank(offset: 0x0108)
    public var sm2_instr: Register<SM2_INSTR>

    @Register(bitWidth: 32)
    public struct SM2_INSTR {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var sm2_instr: SM2_INSTR_Field
    }

    /// State machine pin control
    @RegisterBank(offset: 0x010c)
    public var sm2_pinctrl: Register<SM2_PINCTRL>

    @Register(bitWidth: 32)
    public struct SM2_PINCTRL {
        /// The number of MSBs of the Delay/Side-set instruction field which are used for side-set. Inclusive of the enable bit, if present. Minimum of 0 (all delay bits, no side-set) and maximum of 5 (all side-set, no delay).
        @ReadWrite(bits: 29..<32, as: BitField3.self)
        public var sideset_count: SIDESET_COUNT_Field

        /// The number of pins asserted by a SET. In the range 0 to 5 inclusive.
        @ReadWrite(bits: 26..<29, as: BitField3.self)
        public var set_count: SET_COUNT_Field

        /// The number of pins asserted by an OUT PINS, OUT PINDIRS or MOV PINS instruction. In the range 0 to 32 inclusive.
        @ReadWrite(bits: 20..<26, as: BitField6.self)
        public var out_count: OUT_COUNT_Field

        /// The pin which is mapped to the least-significant bit of a state machine's IN data bus. Higher-numbered pins are mapped to consecutively more-significant data bits, with a modulo of 32 applied to pin number.
        @ReadWrite(bits: 15..<20, as: BitField5.self)
        public var in_base: IN_BASE_Field

        /// The lowest-numbered pin that will be affected by a side-set operation. The MSBs of an instruction's side-set/delay field (up to 5, determined by SIDESET_COUNT) are used for side-set data, with the remaining LSBs used for delay. The least-significant bit of the side-set portion is the bit written to this pin, with more-significant bits written to higher-numbered pins.
        @ReadWrite(bits: 10..<15, as: BitField5.self)
        public var sideset_base: SIDESET_BASE_Field

        /// The lowest-numbered pin that will be affected by a SET PINS or SET PINDIRS instruction. The data written to this pin is the least-significant bit of the SET data.
        @ReadWrite(bits: 5..<10, as: BitField5.self)
        public var set_base: SET_BASE_Field

        /// The lowest-numbered pin that will be affected by an OUT PINS, OUT PINDIRS or MOV PINS instruction. The data written to this pin will always be the least-significant bit of the OUT or MOV data.
        @ReadWrite(bits: 0..<5, as: BitField5.self)
        public var out_base: OUT_BASE_Field
    }

    /// Clock divisor register for state machine 3
    /// Frequency = clock freq / (CLKDIV_INT + CLKDIV_FRAC / 256)
    @RegisterBank(offset: 0x0110)
    public var sm3_clkdiv: Register<SM3_CLKDIV>

    @Register(bitWidth: 32)
    public struct SM3_CLKDIV {
        /// Effective frequency is sysclk/(int + frac/256).
        /// Value of 0 is interpreted as 65536. If INT is 0, FRAC must also be 0.
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var int: INT_Field

        /// Fractional part of clock divisor
        @ReadWrite(bits: 8..<16, as: BitField8.self)
        public var frac: FRAC_Field
    }

    /// Execution/behavioural settings for state machine 3
    @RegisterBank(offset: 0x0114)
    public var sm3_execctrl: Register<SM3_EXECCTRL>

    @Register(bitWidth: 32)
    public struct SM3_EXECCTRL {
        /// If 1, an instruction written to SMx_INSTR is stalled, and latched by the state machine. Will clear to 0 once this instruction completes.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var exec_stalled: EXEC_STALLED_Field

        /// If 1, the MSB of the Delay/Side-set instruction field is used as side-set enable, rather than a side-set data bit. This allows instructions to perform side-set optionally, rather than on every instruction, but the maximum possible side-set width is reduced from 5 to 4. Note that the value of PINCTRL_SIDESET_COUNT is inclusive of this enable bit.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var side_en: SIDE_EN_Field

        /// If 1, side-set data is asserted to pin directions, instead of pin values
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var side_pindir: SIDE_PINDIR_Field

        /// The GPIO number to use as condition for JMP PIN. Unaffected by input mapping.
        @ReadWrite(bits: 24..<29, as: BitField5.self)
        public var jmp_pin: JMP_PIN_Field

        /// Which data bit to use for inline OUT enable
        @ReadWrite(bits: 19..<24, as: BitField5.self)
        public var out_en_sel: OUT_EN_SEL_Field

        /// If 1, use a bit of OUT data as an auxiliary write enable
        /// When used in conjunction with OUT_STICKY, writes with an enable of 0 will
        /// deassert the latest pin write. This can create useful masking/override behaviour
        /// due to the priority ordering of state machine pin writes (SM0 < SM1 < ...)
        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var inline_out_en: INLINE_OUT_EN_Field

        /// Continuously assert the most recent OUT/SET to the pins
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var out_sticky: OUT_STICKY_Field

        /// After reaching this address, execution is wrapped to wrap_bottom.
        /// If the instruction is a jump, and the jump condition is true, the jump takes priority.
        @ReadWrite(bits: 12..<17, as: BitField5.self)
        public var wrap_top: WRAP_TOP_Field

        /// After reaching wrap_top, execution is wrapped to this address.
        @ReadWrite(bits: 7..<12, as: BitField5.self)
        public var wrap_bottom: WRAP_BOTTOM_Field

        /// Comparison used for the MOV x, STATUS instruction.
        @ReadWrite(bits: 4..<5, as: STATUS_SEL_Values.self)
        public var status_sel: STATUS_SEL_Field

        public enum STATUS_SEL_Values: UInt, BitFieldProjectable {
            /// All-ones if TX FIFO level < N, otherwise all-zeroes
            case STATUS_SEL_TXLEVEL = 0
            /// All-ones if RX FIFO level < N, otherwise all-zeroes
            case STATUS_SEL_RXLEVEL = 1

            public static var bitWidth: Int { 1 }
        }

        /// Comparison level for the MOV x, STATUS instruction
        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var status_n: STATUS_N_Field
    }

    /// Control behaviour of the input/output shift registers for state machine 3
    @RegisterBank(offset: 0x0118)
    public var sm3_shiftctrl: Register<SM3_SHIFTCTRL>

    @Register(bitWidth: 32)
    public struct SM3_SHIFTCTRL {
        /// When 1, RX FIFO steals the TX FIFO's storage, and becomes twice as deep.
        /// TX FIFO is disabled as a result (always reads as both full and empty).
        /// FIFOs are flushed when this bit is changed.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var fjoin_rx: FJOIN_RX_Field

        /// When 1, TX FIFO steals the RX FIFO's storage, and becomes twice as deep.
        /// RX FIFO is disabled as a result (always reads as both full and empty).
        /// FIFOs are flushed when this bit is changed.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var fjoin_tx: FJOIN_TX_Field

        /// Number of bits shifted out of OSR before autopull, or conditional pull (PULL IFEMPTY), will take place.
        /// Write 0 for value of 32.
        @ReadWrite(bits: 25..<30, as: BitField5.self)
        public var pull_thresh: PULL_THRESH_Field

        /// Number of bits shifted into ISR before autopush, or conditional push (PUSH IFFULL), will take place.
        /// Write 0 for value of 32.
        @ReadWrite(bits: 20..<25, as: BitField5.self)
        public var push_thresh: PUSH_THRESH_Field

        /// 1 = shift out of output shift register to right. 0 = to left.
        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var out_shiftdir: OUT_SHIFTDIR_Field

        /// 1 = shift input shift register to right (data enters from left). 0 = to left.
        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var in_shiftdir: IN_SHIFTDIR_Field

        /// Pull automatically when the output shift register is emptied, i.e. on or following an OUT instruction which causes the output shift counter to reach or exceed PULL_THRESH.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var autopull: AUTOPULL_Field

        /// Push automatically when the input shift register is filled, i.e. on an IN instruction which causes the input shift counter to reach or exceed PUSH_THRESH.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var autopush: AUTOPUSH_Field
    }

    /// Current instruction address of state machine 3
    @RegisterBank(offset: 0x011c)
    public var sm3_addr: Register<SM3_ADDR>

    @Register(bitWidth: 32)
    public struct SM3_ADDR {
        @ReadOnly(bits: 0..<5, as: BitField5.self)
        public var sm3_addr: SM3_ADDR_Field
    }

    /// Read to see the instruction currently addressed by state machine 3's program counter
    /// Write to execute an instruction immediately (including jumps) and then resume execution.
    @RegisterBank(offset: 0x0120)
    public var sm3_instr: Register<SM3_INSTR>

    @Register(bitWidth: 32)
    public struct SM3_INSTR {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var sm3_instr: SM3_INSTR_Field
    }

    /// State machine pin control
    @RegisterBank(offset: 0x0124)
    public var sm3_pinctrl: Register<SM3_PINCTRL>

    @Register(bitWidth: 32)
    public struct SM3_PINCTRL {
        /// The number of MSBs of the Delay/Side-set instruction field which are used for side-set. Inclusive of the enable bit, if present. Minimum of 0 (all delay bits, no side-set) and maximum of 5 (all side-set, no delay).
        @ReadWrite(bits: 29..<32, as: BitField3.self)
        public var sideset_count: SIDESET_COUNT_Field

        /// The number of pins asserted by a SET. In the range 0 to 5 inclusive.
        @ReadWrite(bits: 26..<29, as: BitField3.self)
        public var set_count: SET_COUNT_Field

        /// The number of pins asserted by an OUT PINS, OUT PINDIRS or MOV PINS instruction. In the range 0 to 32 inclusive.
        @ReadWrite(bits: 20..<26, as: BitField6.self)
        public var out_count: OUT_COUNT_Field

        /// The pin which is mapped to the least-significant bit of a state machine's IN data bus. Higher-numbered pins are mapped to consecutively more-significant data bits, with a modulo of 32 applied to pin number.
        @ReadWrite(bits: 15..<20, as: BitField5.self)
        public var in_base: IN_BASE_Field

        /// The lowest-numbered pin that will be affected by a side-set operation. The MSBs of an instruction's side-set/delay field (up to 5, determined by SIDESET_COUNT) are used for side-set data, with the remaining LSBs used for delay. The least-significant bit of the side-set portion is the bit written to this pin, with more-significant bits written to higher-numbered pins.
        @ReadWrite(bits: 10..<15, as: BitField5.self)
        public var sideset_base: SIDESET_BASE_Field

        /// The lowest-numbered pin that will be affected by a SET PINS or SET PINDIRS instruction. The data written to this pin is the least-significant bit of the SET data.
        @ReadWrite(bits: 5..<10, as: BitField5.self)
        public var set_base: SET_BASE_Field

        /// The lowest-numbered pin that will be affected by an OUT PINS, OUT PINDIRS or MOV PINS instruction. The data written to this pin will always be the least-significant bit of the OUT or MOV data.
        @ReadWrite(bits: 0..<5, as: BitField5.self)
        public var out_base: OUT_BASE_Field
    }

    /// Raw Interrupts
    @RegisterBank(offset: 0x0128)
    public var intr: Register<INTR>

    @Register(bitWidth: 32)
    public struct INTR {
        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var sm3: SM3_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var sm2: SM2_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var sm1: SM1_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var sm0: SM0_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var sm3_txnfull: SM3_TXNFULL_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var sm2_txnfull: SM2_TXNFULL_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var sm1_txnfull: SM1_TXNFULL_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var sm0_txnfull: SM0_TXNFULL_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var sm3_rxnempty: SM3_RXNEMPTY_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var sm2_rxnempty: SM2_RXNEMPTY_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var sm1_rxnempty: SM1_RXNEMPTY_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var sm0_rxnempty: SM0_RXNEMPTY_Field
    }

    /// Interrupt Enable for irq0
    @RegisterBank(offset: 0x012c)
    public var irq0_inte: Register<IRQ0_INTE>

    @Register(bitWidth: 32)
    public struct IRQ0_INTE {
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var sm3: SM3_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var sm2: SM2_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var sm1: SM1_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var sm0: SM0_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var sm3_txnfull: SM3_TXNFULL_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var sm2_txnfull: SM2_TXNFULL_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var sm1_txnfull: SM1_TXNFULL_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var sm0_txnfull: SM0_TXNFULL_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var sm3_rxnempty: SM3_RXNEMPTY_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var sm2_rxnempty: SM2_RXNEMPTY_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var sm1_rxnempty: SM1_RXNEMPTY_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var sm0_rxnempty: SM0_RXNEMPTY_Field
    }

    /// Interrupt Force for irq0
    @RegisterBank(offset: 0x0130)
    public var irq0_intf: Register<IRQ0_INTF>

    @Register(bitWidth: 32)
    public struct IRQ0_INTF {
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var sm3: SM3_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var sm2: SM2_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var sm1: SM1_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var sm0: SM0_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var sm3_txnfull: SM3_TXNFULL_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var sm2_txnfull: SM2_TXNFULL_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var sm1_txnfull: SM1_TXNFULL_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var sm0_txnfull: SM0_TXNFULL_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var sm3_rxnempty: SM3_RXNEMPTY_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var sm2_rxnempty: SM2_RXNEMPTY_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var sm1_rxnempty: SM1_RXNEMPTY_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var sm0_rxnempty: SM0_RXNEMPTY_Field
    }

    /// Interrupt status after masking & forcing for irq0
    @RegisterBank(offset: 0x0134)
    public var irq0_ints: Register<IRQ0_INTS>

    @Register(bitWidth: 32)
    public struct IRQ0_INTS {
        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var sm3: SM3_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var sm2: SM2_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var sm1: SM1_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var sm0: SM0_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var sm3_txnfull: SM3_TXNFULL_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var sm2_txnfull: SM2_TXNFULL_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var sm1_txnfull: SM1_TXNFULL_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var sm0_txnfull: SM0_TXNFULL_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var sm3_rxnempty: SM3_RXNEMPTY_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var sm2_rxnempty: SM2_RXNEMPTY_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var sm1_rxnempty: SM1_RXNEMPTY_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var sm0_rxnempty: SM0_RXNEMPTY_Field
    }

    /// Interrupt Enable for irq1
    @RegisterBank(offset: 0x0138)
    public var irq1_inte: Register<IRQ1_INTE>

    @Register(bitWidth: 32)
    public struct IRQ1_INTE {
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var sm3: SM3_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var sm2: SM2_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var sm1: SM1_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var sm0: SM0_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var sm3_txnfull: SM3_TXNFULL_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var sm2_txnfull: SM2_TXNFULL_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var sm1_txnfull: SM1_TXNFULL_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var sm0_txnfull: SM0_TXNFULL_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var sm3_rxnempty: SM3_RXNEMPTY_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var sm2_rxnempty: SM2_RXNEMPTY_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var sm1_rxnempty: SM1_RXNEMPTY_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var sm0_rxnempty: SM0_RXNEMPTY_Field
    }

    /// Interrupt Force for irq1
    @RegisterBank(offset: 0x013c)
    public var irq1_intf: Register<IRQ1_INTF>

    @Register(bitWidth: 32)
    public struct IRQ1_INTF {
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var sm3: SM3_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var sm2: SM2_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var sm1: SM1_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var sm0: SM0_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var sm3_txnfull: SM3_TXNFULL_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var sm2_txnfull: SM2_TXNFULL_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var sm1_txnfull: SM1_TXNFULL_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var sm0_txnfull: SM0_TXNFULL_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var sm3_rxnempty: SM3_RXNEMPTY_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var sm2_rxnempty: SM2_RXNEMPTY_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var sm1_rxnempty: SM1_RXNEMPTY_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var sm0_rxnempty: SM0_RXNEMPTY_Field
    }

    /// Interrupt status after masking & forcing for irq1
    @RegisterBank(offset: 0x0140)
    public var irq1_ints: Register<IRQ1_INTS>

    @Register(bitWidth: 32)
    public struct IRQ1_INTS {
        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var sm3: SM3_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var sm2: SM2_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var sm1: SM1_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var sm0: SM0_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var sm3_txnfull: SM3_TXNFULL_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var sm2_txnfull: SM2_TXNFULL_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var sm1_txnfull: SM1_TXNFULL_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var sm0_txnfull: SM0_TXNFULL_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var sm3_rxnempty: SM3_RXNEMPTY_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var sm2_rxnempty: SM2_RXNEMPTY_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var sm1_rxnempty: SM1_RXNEMPTY_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var sm0_rxnempty: SM0_RXNEMPTY_Field
    }
}
