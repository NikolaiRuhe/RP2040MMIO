import MMIO
import MMIOExtensions

/// Single-cycle IO block
/// Provides core-local and inter-core hardware for the two processors, with single-cycle access.
@RegisterBank
public struct SIO {

    public static var `default`: Self { .init(unsafeAddress: 0xd0000000) }

    /// Processor core identifier
    /// Value is 0 when read from processor core 0, and 1 when read from processor core 1.
    @RegisterBank(offset: 0x0000)
    public var cpuid: Register<CPUID>

    @Register(bitWidth: 32)
    public struct CPUID {}

    /// Input value for GPIO pins
    @RegisterBank(offset: 0x0004)
    public var gpio_in: Register<GPIO_IN>

    @Register(bitWidth: 32)
    public struct GPIO_IN {
        /// Input value for GPIO0...29
        @ReadOnly(bits: 0..<30, as: BitField30.self)
        public var gpio_in: GPIO_IN_Field
    }

    /// Input value for QSPI pins
    @RegisterBank(offset: 0x0008)
    public var gpio_hi_in: Register<GPIO_HI_IN>

    @Register(bitWidth: 32)
    public struct GPIO_HI_IN {
        /// Input value on QSPI IO in order 0..5: SCLK, SSn, SD0, SD1, SD2, SD3
        @ReadOnly(bits: 0..<6, as: BitField6.self)
        public var gpio_hi_in: GPIO_HI_IN_Field
    }

    /// GPIO output value
    @RegisterBank(offset: 0x0010)
    public var gpio_out: Register<GPIO_OUT>

    @Register(bitWidth: 32)
    public struct GPIO_OUT {
        /// Set output level (1/0 -> high/low) for GPIO0...29.
        /// Reading back gives the last value written, NOT the input value from the pins.
        /// If core 0 and core 1 both write to GPIO_OUT simultaneously (or to a SET/CLR/XOR alias),
        /// the result is as though the write from core 0 took place first,
        /// and the write from core 1 was then applied to that intermediate result.
        @ReadWrite(bits: 0..<30, as: BitField30.self)
        public var gpio_out: GPIO_OUT_Field
    }

    /// GPIO output value set
    @RegisterBank(offset: 0x0014)
    public var gpio_out_set: Register<GPIO_OUT_SET>

    @Register(bitWidth: 32)
    public struct GPIO_OUT_SET {
        /// Perform an atomic bit-set on GPIO_OUT, i.e. `GPIO_OUT |= wdata`
        @WriteOnly(bits: 0..<30, as: BitField30.self)
        public var gpio_out_set: GPIO_OUT_SET_Field
    }

    /// GPIO output value clear
    @RegisterBank(offset: 0x0018)
    public var gpio_out_clr: Register<GPIO_OUT_CLR>

    @Register(bitWidth: 32)
    public struct GPIO_OUT_CLR {
        /// Perform an atomic bit-clear on GPIO_OUT, i.e. `GPIO_OUT &= ~wdata`
        @WriteOnly(bits: 0..<30, as: BitField30.self)
        public var gpio_out_clr: GPIO_OUT_CLR_Field
    }

    /// GPIO output value XOR
    @RegisterBank(offset: 0x001c)
    public var gpio_out_xor: Register<GPIO_OUT_XOR>

    @Register(bitWidth: 32)
    public struct GPIO_OUT_XOR {
        /// Perform an atomic bitwise XOR on GPIO_OUT, i.e. `GPIO_OUT ^= wdata`
        @WriteOnly(bits: 0..<30, as: BitField30.self)
        public var gpio_out_xor: GPIO_OUT_XOR_Field
    }

    /// GPIO output enable
    @RegisterBank(offset: 0x0020)
    public var gpio_oe: Register<GPIO_OE>

    @Register(bitWidth: 32)
    public struct GPIO_OE {
        /// Set output enable (1/0 -> output/input) for GPIO0...29.
        /// Reading back gives the last value written.
        /// If core 0 and core 1 both write to GPIO_OE simultaneously (or to a SET/CLR/XOR alias),
        /// the result is as though the write from core 0 took place first,
        /// and the write from core 1 was then applied to that intermediate result.
        @ReadWrite(bits: 0..<30, as: BitField30.self)
        public var gpio_oe: GPIO_OE_Field
    }

    /// GPIO output enable set
    @RegisterBank(offset: 0x0024)
    public var gpio_oe_set: Register<GPIO_OE_SET>

    @Register(bitWidth: 32)
    public struct GPIO_OE_SET {
        /// Perform an atomic bit-set on GPIO_OE, i.e. `GPIO_OE |= wdata`
        @WriteOnly(bits: 0..<30, as: BitField30.self)
        public var gpio_oe_set: GPIO_OE_SET_Field
    }

    /// GPIO output enable clear
    @RegisterBank(offset: 0x0028)
    public var gpio_oe_clr: Register<GPIO_OE_CLR>

    @Register(bitWidth: 32)
    public struct GPIO_OE_CLR {
        /// Perform an atomic bit-clear on GPIO_OE, i.e. `GPIO_OE &= ~wdata`
        @WriteOnly(bits: 0..<30, as: BitField30.self)
        public var gpio_oe_clr: GPIO_OE_CLR_Field
    }

    /// GPIO output enable XOR
    @RegisterBank(offset: 0x002c)
    public var gpio_oe_xor: Register<GPIO_OE_XOR>

    @Register(bitWidth: 32)
    public struct GPIO_OE_XOR {
        /// Perform an atomic bitwise XOR on GPIO_OE, i.e. `GPIO_OE ^= wdata`
        @WriteOnly(bits: 0..<30, as: BitField30.self)
        public var gpio_oe_xor: GPIO_OE_XOR_Field
    }

    /// QSPI output value
    @RegisterBank(offset: 0x0030)
    public var gpio_hi_out: Register<GPIO_HI_OUT>

    @Register(bitWidth: 32)
    public struct GPIO_HI_OUT {
        /// Set output level (1/0 -> high/low) for QSPI IO0...5.
        /// Reading back gives the last value written, NOT the input value from the pins.
        /// If core 0 and core 1 both write to GPIO_HI_OUT simultaneously (or to a SET/CLR/XOR alias),
        /// the result is as though the write from core 0 took place first,
        /// and the write from core 1 was then applied to that intermediate result.
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var gpio_hi_out: GPIO_HI_OUT_Field
    }

    /// QSPI output value set
    @RegisterBank(offset: 0x0034)
    public var gpio_hi_out_set: Register<GPIO_HI_OUT_SET>

    @Register(bitWidth: 32)
    public struct GPIO_HI_OUT_SET {
        /// Perform an atomic bit-set on GPIO_HI_OUT, i.e. `GPIO_HI_OUT |= wdata`
        @WriteOnly(bits: 0..<6, as: BitField6.self)
        public var gpio_hi_out_set: GPIO_HI_OUT_SET_Field
    }

    /// QSPI output value clear
    @RegisterBank(offset: 0x0038)
    public var gpio_hi_out_clr: Register<GPIO_HI_OUT_CLR>

    @Register(bitWidth: 32)
    public struct GPIO_HI_OUT_CLR {
        /// Perform an atomic bit-clear on GPIO_HI_OUT, i.e. `GPIO_HI_OUT &= ~wdata`
        @WriteOnly(bits: 0..<6, as: BitField6.self)
        public var gpio_hi_out_clr: GPIO_HI_OUT_CLR_Field
    }

    /// QSPI output value XOR
    @RegisterBank(offset: 0x003c)
    public var gpio_hi_out_xor: Register<GPIO_HI_OUT_XOR>

    @Register(bitWidth: 32)
    public struct GPIO_HI_OUT_XOR {
        /// Perform an atomic bitwise XOR on GPIO_HI_OUT, i.e. `GPIO_HI_OUT ^= wdata`
        @WriteOnly(bits: 0..<6, as: BitField6.self)
        public var gpio_hi_out_xor: GPIO_HI_OUT_XOR_Field
    }

    /// QSPI output enable
    @RegisterBank(offset: 0x0040)
    public var gpio_hi_oe: Register<GPIO_HI_OE>

    @Register(bitWidth: 32)
    public struct GPIO_HI_OE {
        /// Set output enable (1/0 -> output/input) for QSPI IO0...5.
        /// Reading back gives the last value written.
        /// If core 0 and core 1 both write to GPIO_HI_OE simultaneously (or to a SET/CLR/XOR alias),
        /// the result is as though the write from core 0 took place first,
        /// and the write from core 1 was then applied to that intermediate result.
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var gpio_hi_oe: GPIO_HI_OE_Field
    }

    /// QSPI output enable set
    @RegisterBank(offset: 0x0044)
    public var gpio_hi_oe_set: Register<GPIO_HI_OE_SET>

    @Register(bitWidth: 32)
    public struct GPIO_HI_OE_SET {
        /// Perform an atomic bit-set on GPIO_HI_OE, i.e. `GPIO_HI_OE |= wdata`
        @WriteOnly(bits: 0..<6, as: BitField6.self)
        public var gpio_hi_oe_set: GPIO_HI_OE_SET_Field
    }

    /// QSPI output enable clear
    @RegisterBank(offset: 0x0048)
    public var gpio_hi_oe_clr: Register<GPIO_HI_OE_CLR>

    @Register(bitWidth: 32)
    public struct GPIO_HI_OE_CLR {
        /// Perform an atomic bit-clear on GPIO_HI_OE, i.e. `GPIO_HI_OE &= ~wdata`
        @WriteOnly(bits: 0..<6, as: BitField6.self)
        public var gpio_hi_oe_clr: GPIO_HI_OE_CLR_Field
    }

    /// QSPI output enable XOR
    @RegisterBank(offset: 0x004c)
    public var gpio_hi_oe_xor: Register<GPIO_HI_OE_XOR>

    @Register(bitWidth: 32)
    public struct GPIO_HI_OE_XOR {
        /// Perform an atomic bitwise XOR on GPIO_HI_OE, i.e. `GPIO_HI_OE ^= wdata`
        @WriteOnly(bits: 0..<6, as: BitField6.self)
        public var gpio_hi_oe_xor: GPIO_HI_OE_XOR_Field
    }

    /// Status register for inter-core FIFOs (mailboxes).
    /// There is one FIFO in the core 0 -> core 1 direction, and one core 1 -> core 0. Both are 32 bits wide and 8 words deep.
    /// Core 0 can see the read side of the 1->0 FIFO (RX), and the write side of 0->1 FIFO (TX).
    /// Core 1 can see the read side of the 0->1 FIFO (RX), and the write side of 1->0 FIFO (TX).
    /// The SIO IRQ for each core is the logical OR of the VLD, WOF and ROE fields of its FIFO_ST register.
    @RegisterBank(offset: 0x0050)
    public var fifo_st: Register<FIFO_ST>

    @Register(bitWidth: 32)
    public struct FIFO_ST {
        /// Sticky flag indicating the RX FIFO was read when empty. This read was ignored by the FIFO.
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var roe: ROE_Field

        /// Sticky flag indicating the TX FIFO was written when full. This write was ignored by the FIFO.
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var wof: WOF_Field

        /// Value is 1 if this core's TX FIFO is not full (i.e. if FIFO_WR is ready for more data)
        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var rdy: RDY_Field

        /// Value is 1 if this core's RX FIFO is not empty (i.e. if FIFO_RD is valid)
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var vld: VLD_Field
    }

    /// Write access to this core's TX FIFO
    @RegisterBank(offset: 0x0054)
    public var fifo_wr: Register<FIFO_WR>

    @Register(bitWidth: 32)
    public struct FIFO_WR {}

    /// Read access to this core's RX FIFO
    @RegisterBank(offset: 0x0058)
    public var fifo_rd: Register<FIFO_RD>

    @Register(bitWidth: 32)
    public struct FIFO_RD {}

    /// Spinlock state
    /// A bitmap containing the state of all 32 spinlocks (1=locked).
    /// Mainly intended for debugging.
    @RegisterBank(offset: 0x005c)
    public var spinlock_st: Register<SPINLOCK_ST>

    @Register(bitWidth: 32)
    public struct SPINLOCK_ST {}

    /// Divider unsigned dividend
    /// Write to the DIVIDEND operand of the divider, i.e. the p in `p / q`.
    /// Any operand write starts a new calculation. The results appear in QUOTIENT, REMAINDER.
    /// UDIVIDEND/SDIVIDEND are aliases of the same internal register. The U alias starts an
    /// unsigned calculation, and the S alias starts a signed calculation.
    @RegisterBank(offset: 0x0060)
    public var div_udividend: Register<DIV_UDIVIDEND>

    @Register(bitWidth: 32)
    public struct DIV_UDIVIDEND {}

    /// Divider unsigned divisor
    /// Write to the DIVISOR operand of the divider, i.e. the q in `p / q`.
    /// Any operand write starts a new calculation. The results appear in QUOTIENT, REMAINDER.
    /// UDIVISOR/SDIVISOR are aliases of the same internal register. The U alias starts an
    /// unsigned calculation, and the S alias starts a signed calculation.
    @RegisterBank(offset: 0x0064)
    public var div_udivisor: Register<DIV_UDIVISOR>

    @Register(bitWidth: 32)
    public struct DIV_UDIVISOR {}

    /// Divider signed dividend
    /// The same as UDIVIDEND, but starts a signed calculation, rather than unsigned.
    @RegisterBank(offset: 0x0068)
    public var div_sdividend: Register<DIV_SDIVIDEND>

    @Register(bitWidth: 32)
    public struct DIV_SDIVIDEND {}

    /// Divider signed divisor
    /// The same as UDIVISOR, but starts a signed calculation, rather than unsigned.
    @RegisterBank(offset: 0x006c)
    public var div_sdivisor: Register<DIV_SDIVISOR>

    @Register(bitWidth: 32)
    public struct DIV_SDIVISOR {}

    /// Divider result quotient
    /// The result of `DIVIDEND / DIVISOR` (division). Contents undefined while CSR_READY is low.
    /// For signed calculations, QUOTIENT is negative when the signs of DIVIDEND and DIVISOR differ.
    /// This register can be written to directly, for context save/restore purposes. This halts any
    /// in-progress calculation and sets the CSR_READY and CSR_DIRTY flags.
    /// Reading from QUOTIENT clears the CSR_DIRTY flag, so should read results in the order
    /// REMAINDER, QUOTIENT if CSR_DIRTY is used.
    @RegisterBank(offset: 0x0070)
    public var div_quotient: Register<DIV_QUOTIENT>

    @Register(bitWidth: 32)
    public struct DIV_QUOTIENT {}

    /// Divider result remainder
    /// The result of `DIVIDEND % DIVISOR` (modulo). Contents undefined while CSR_READY is low.
    /// For signed calculations, REMAINDER is negative only when DIVIDEND is negative.
    /// This register can be written to directly, for context save/restore purposes. This halts any
    /// in-progress calculation and sets the CSR_READY and CSR_DIRTY flags.
    @RegisterBank(offset: 0x0074)
    public var div_remainder: Register<DIV_REMAINDER>

    @Register(bitWidth: 32)
    public struct DIV_REMAINDER {}

    /// Control and status register for divider.
    @RegisterBank(offset: 0x0078)
    public var div_csr: Register<DIV_CSR>

    @Register(bitWidth: 32)
    public struct DIV_CSR {
        /// Changes to 1 when any register is written, and back to 0 when QUOTIENT is read.
        /// Software can use this flag to make save/restore more efficient (skip if not DIRTY).
        /// If the flag is used in this way, it's recommended to either read QUOTIENT only,
        /// or REMAINDER and then QUOTIENT, to prevent data loss on context switch.
        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var dirty: DIRTY_Field

        /// Reads as 0 when a calculation is in progress, 1 otherwise.
        /// Writing an operand (xDIVIDEND, xDIVISOR) will immediately start a new calculation, no
        /// matter if one is already in progress.
        /// Writing to a result register will immediately terminate any in-progress calculation
        /// and set the READY and DIRTY flags.
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var ready: READY_Field
    }

    /// Read/write access to accumulator 0
    @RegisterBank(offset: 0x0080)
    public var interp0_accum0: Register<INTERP0_ACCUM0>

    @Register(bitWidth: 32)
    public struct INTERP0_ACCUM0 {}

    /// Read/write access to accumulator 1
    @RegisterBank(offset: 0x0084)
    public var interp0_accum1: Register<INTERP0_ACCUM1>

    @Register(bitWidth: 32)
    public struct INTERP0_ACCUM1 {}

    /// Read/write access to BASE0 register.
    @RegisterBank(offset: 0x0088)
    public var interp0_base0: Register<INTERP0_BASE0>

    @Register(bitWidth: 32)
    public struct INTERP0_BASE0 {}

    /// Read/write access to BASE1 register.
    @RegisterBank(offset: 0x008c)
    public var interp0_base1: Register<INTERP0_BASE1>

    @Register(bitWidth: 32)
    public struct INTERP0_BASE1 {}

    /// Read/write access to BASE2 register.
    @RegisterBank(offset: 0x0090)
    public var interp0_base2: Register<INTERP0_BASE2>

    @Register(bitWidth: 32)
    public struct INTERP0_BASE2 {}

    /// Read LANE0 result, and simultaneously write lane results to both accumulators (POP).
    @RegisterBank(offset: 0x0094)
    public var interp0_pop_lane0: Register<INTERP0_POP_LANE0>

    @Register(bitWidth: 32)
    public struct INTERP0_POP_LANE0 {}

    /// Read LANE1 result, and simultaneously write lane results to both accumulators (POP).
    @RegisterBank(offset: 0x0098)
    public var interp0_pop_lane1: Register<INTERP0_POP_LANE1>

    @Register(bitWidth: 32)
    public struct INTERP0_POP_LANE1 {}

    /// Read FULL result, and simultaneously write lane results to both accumulators (POP).
    @RegisterBank(offset: 0x009c)
    public var interp0_pop_full: Register<INTERP0_POP_FULL>

    @Register(bitWidth: 32)
    public struct INTERP0_POP_FULL {}

    /// Read LANE0 result, without altering any internal state (PEEK).
    @RegisterBank(offset: 0x00a0)
    public var interp0_peek_lane0: Register<INTERP0_PEEK_LANE0>

    @Register(bitWidth: 32)
    public struct INTERP0_PEEK_LANE0 {}

    /// Read LANE1 result, without altering any internal state (PEEK).
    @RegisterBank(offset: 0x00a4)
    public var interp0_peek_lane1: Register<INTERP0_PEEK_LANE1>

    @Register(bitWidth: 32)
    public struct INTERP0_PEEK_LANE1 {}

    /// Read FULL result, without altering any internal state (PEEK).
    @RegisterBank(offset: 0x00a8)
    public var interp0_peek_full: Register<INTERP0_PEEK_FULL>

    @Register(bitWidth: 32)
    public struct INTERP0_PEEK_FULL {}

    /// Control register for lane 0
    @RegisterBank(offset: 0x00ac)
    public var interp0_ctrl_lane0: Register<INTERP0_CTRL_LANE0>

    @Register(bitWidth: 32)
    public struct INTERP0_CTRL_LANE0 {
        /// Set if either OVERF0 or OVERF1 is set.
        @ReadOnly(bits: 25..<26, as: Bool.self)
        public var overf: OVERF_Field

        /// Indicates if any masked-off MSBs in ACCUM1 are set.
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var overf1: OVERF1_Field

        /// Indicates if any masked-off MSBs in ACCUM0 are set.
        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var overf0: OVERF0_Field

        /// Only present on INTERP0 on each core. If BLEND mode is enabled:
        /// - LANE1 result is a linear interpolation between BASE0 and BASE1, controlled
        /// by the 8 LSBs of lane 1 shift and mask value (a fractional number between
        /// 0 and 255/256ths)
        /// - LANE0 result does not have BASE0 added (yields only the 8 LSBs of lane 1 shift+mask value)
        /// - FULL result does not have lane 1 shift+mask value added (BASE2 + lane 0 shift+mask)
        /// LANE1 SIGNED flag controls whether the interpolation is signed or unsigned.
        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var blend: BLEND_Field

        /// ORed into bits 29:28 of the lane result presented to the processor on the bus.
        /// No effect on the internal 32-bit datapath. Handy for using a lane to generate sequence
        /// of pointers into flash or SRAM.
        @ReadWrite(bits: 19..<21, as: BitField2.self)
        public var force_msb: FORCE_MSB_Field

        /// If 1, mask + shift is bypassed for LANE0 result. This does not affect FULL result.
        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var add_raw: ADD_RAW_Field

        /// If 1, feed the opposite lane's result into this lane's accumulator on POP.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var cross_result: CROSS_RESULT_Field

        /// If 1, feed the opposite lane's accumulator into this lane's shift + mask hardware.
        /// Takes effect even if ADD_RAW is set (the CROSS_INPUT mux is before the shift+mask bypass)
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var cross_input: CROSS_INPUT_Field

        /// If SIGNED is set, the shifted and masked accumulator value is sign-extended to 32 bits
        /// before adding to BASE0, and LANE0 PEEK/POP appear extended to 32 bits when read by processor.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var signed: SIGNED_Field

        /// The most-significant bit allowed to pass by the mask (inclusive)
        /// Setting MSB < LSB may cause chip to turn inside-out
        @ReadWrite(bits: 10..<15, as: BitField5.self)
        public var mask_msb: MASK_MSB_Field

        /// The least-significant bit allowed to pass by the mask (inclusive)
        @ReadWrite(bits: 5..<10, as: BitField5.self)
        public var mask_lsb: MASK_LSB_Field

        /// Logical right-shift applied to accumulator before masking
        @ReadWrite(bits: 0..<5, as: BitField5.self)
        public var shift: SHIFT_Field
    }

    /// Control register for lane 1
    @RegisterBank(offset: 0x00b0)
    public var interp0_ctrl_lane1: Register<INTERP0_CTRL_LANE1>

    @Register(bitWidth: 32)
    public struct INTERP0_CTRL_LANE1 {
        /// ORed into bits 29:28 of the lane result presented to the processor on the bus.
        /// No effect on the internal 32-bit datapath. Handy for using a lane to generate sequence
        /// of pointers into flash or SRAM.
        @ReadWrite(bits: 19..<21, as: BitField2.self)
        public var force_msb: FORCE_MSB_Field

        /// If 1, mask + shift is bypassed for LANE1 result. This does not affect FULL result.
        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var add_raw: ADD_RAW_Field

        /// If 1, feed the opposite lane's result into this lane's accumulator on POP.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var cross_result: CROSS_RESULT_Field

        /// If 1, feed the opposite lane's accumulator into this lane's shift + mask hardware.
        /// Takes effect even if ADD_RAW is set (the CROSS_INPUT mux is before the shift+mask bypass)
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var cross_input: CROSS_INPUT_Field

        /// If SIGNED is set, the shifted and masked accumulator value is sign-extended to 32 bits
        /// before adding to BASE1, and LANE1 PEEK/POP appear extended to 32 bits when read by processor.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var signed: SIGNED_Field

        /// The most-significant bit allowed to pass by the mask (inclusive)
        /// Setting MSB < LSB may cause chip to turn inside-out
        @ReadWrite(bits: 10..<15, as: BitField5.self)
        public var mask_msb: MASK_MSB_Field

        /// The least-significant bit allowed to pass by the mask (inclusive)
        @ReadWrite(bits: 5..<10, as: BitField5.self)
        public var mask_lsb: MASK_LSB_Field

        /// Logical right-shift applied to accumulator before masking
        @ReadWrite(bits: 0..<5, as: BitField5.self)
        public var shift: SHIFT_Field
    }

    /// Values written here are atomically added to ACCUM0
    /// Reading yields lane 0's raw shift and mask value (BASE0 not added).
    @RegisterBank(offset: 0x00b4)
    public var interp0_accum0_add: Register<INTERP0_ACCUM0_ADD>

    @Register(bitWidth: 32)
    public struct INTERP0_ACCUM0_ADD {
        @ReadWrite(bits: 0..<24, as: BitField24.self)
        public var interp0_accum0_add: INTERP0_ACCUM0_ADD_Field
    }

    /// Values written here are atomically added to ACCUM1
    /// Reading yields lane 1's raw shift and mask value (BASE1 not added).
    @RegisterBank(offset: 0x00b8)
    public var interp0_accum1_add: Register<INTERP0_ACCUM1_ADD>

    @Register(bitWidth: 32)
    public struct INTERP0_ACCUM1_ADD {
        @ReadWrite(bits: 0..<24, as: BitField24.self)
        public var interp0_accum1_add: INTERP0_ACCUM1_ADD_Field
    }

    /// On write, the lower 16 bits go to BASE0, upper bits to BASE1 simultaneously.
    /// Each half is sign-extended to 32 bits if that lane's SIGNED flag is set.
    @RegisterBank(offset: 0x00bc)
    public var interp0_base_1and0: Register<INTERP0_BASE_1AND0>

    @Register(bitWidth: 32)
    public struct INTERP0_BASE_1AND0 {}

    /// Read/write access to accumulator 0
    @RegisterBank(offset: 0x00c0)
    public var interp1_accum0: Register<INTERP1_ACCUM0>

    @Register(bitWidth: 32)
    public struct INTERP1_ACCUM0 {}

    /// Read/write access to accumulator 1
    @RegisterBank(offset: 0x00c4)
    public var interp1_accum1: Register<INTERP1_ACCUM1>

    @Register(bitWidth: 32)
    public struct INTERP1_ACCUM1 {}

    /// Read/write access to BASE0 register.
    @RegisterBank(offset: 0x00c8)
    public var interp1_base0: Register<INTERP1_BASE0>

    @Register(bitWidth: 32)
    public struct INTERP1_BASE0 {}

    /// Read/write access to BASE1 register.
    @RegisterBank(offset: 0x00cc)
    public var interp1_base1: Register<INTERP1_BASE1>

    @Register(bitWidth: 32)
    public struct INTERP1_BASE1 {}

    /// Read/write access to BASE2 register.
    @RegisterBank(offset: 0x00d0)
    public var interp1_base2: Register<INTERP1_BASE2>

    @Register(bitWidth: 32)
    public struct INTERP1_BASE2 {}

    /// Read LANE0 result, and simultaneously write lane results to both accumulators (POP).
    @RegisterBank(offset: 0x00d4)
    public var interp1_pop_lane0: Register<INTERP1_POP_LANE0>

    @Register(bitWidth: 32)
    public struct INTERP1_POP_LANE0 {}

    /// Read LANE1 result, and simultaneously write lane results to both accumulators (POP).
    @RegisterBank(offset: 0x00d8)
    public var interp1_pop_lane1: Register<INTERP1_POP_LANE1>

    @Register(bitWidth: 32)
    public struct INTERP1_POP_LANE1 {}

    /// Read FULL result, and simultaneously write lane results to both accumulators (POP).
    @RegisterBank(offset: 0x00dc)
    public var interp1_pop_full: Register<INTERP1_POP_FULL>

    @Register(bitWidth: 32)
    public struct INTERP1_POP_FULL {}

    /// Read LANE0 result, without altering any internal state (PEEK).
    @RegisterBank(offset: 0x00e0)
    public var interp1_peek_lane0: Register<INTERP1_PEEK_LANE0>

    @Register(bitWidth: 32)
    public struct INTERP1_PEEK_LANE0 {}

    /// Read LANE1 result, without altering any internal state (PEEK).
    @RegisterBank(offset: 0x00e4)
    public var interp1_peek_lane1: Register<INTERP1_PEEK_LANE1>

    @Register(bitWidth: 32)
    public struct INTERP1_PEEK_LANE1 {}

    /// Read FULL result, without altering any internal state (PEEK).
    @RegisterBank(offset: 0x00e8)
    public var interp1_peek_full: Register<INTERP1_PEEK_FULL>

    @Register(bitWidth: 32)
    public struct INTERP1_PEEK_FULL {}

    /// Control register for lane 0
    @RegisterBank(offset: 0x00ec)
    public var interp1_ctrl_lane0: Register<INTERP1_CTRL_LANE0>

    @Register(bitWidth: 32)
    public struct INTERP1_CTRL_LANE0 {
        /// Set if either OVERF0 or OVERF1 is set.
        @ReadOnly(bits: 25..<26, as: Bool.self)
        public var overf: OVERF_Field

        /// Indicates if any masked-off MSBs in ACCUM1 are set.
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var overf1: OVERF1_Field

        /// Indicates if any masked-off MSBs in ACCUM0 are set.
        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var overf0: OVERF0_Field

        /// Only present on INTERP1 on each core. If CLAMP mode is enabled:
        /// - LANE0 result is shifted and masked ACCUM0, clamped by a lower bound of
        /// BASE0 and an upper bound of BASE1.
        /// - Signedness of these comparisons is determined by LANE0_CTRL_SIGNED
        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var clamp: CLAMP_Field

        /// ORed into bits 29:28 of the lane result presented to the processor on the bus.
        /// No effect on the internal 32-bit datapath. Handy for using a lane to generate sequence
        /// of pointers into flash or SRAM.
        @ReadWrite(bits: 19..<21, as: BitField2.self)
        public var force_msb: FORCE_MSB_Field

        /// If 1, mask + shift is bypassed for LANE0 result. This does not affect FULL result.
        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var add_raw: ADD_RAW_Field

        /// If 1, feed the opposite lane's result into this lane's accumulator on POP.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var cross_result: CROSS_RESULT_Field

        /// If 1, feed the opposite lane's accumulator into this lane's shift + mask hardware.
        /// Takes effect even if ADD_RAW is set (the CROSS_INPUT mux is before the shift+mask bypass)
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var cross_input: CROSS_INPUT_Field

        /// If SIGNED is set, the shifted and masked accumulator value is sign-extended to 32 bits
        /// before adding to BASE0, and LANE0 PEEK/POP appear extended to 32 bits when read by processor.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var signed: SIGNED_Field

        /// The most-significant bit allowed to pass by the mask (inclusive)
        /// Setting MSB < LSB may cause chip to turn inside-out
        @ReadWrite(bits: 10..<15, as: BitField5.self)
        public var mask_msb: MASK_MSB_Field

        /// The least-significant bit allowed to pass by the mask (inclusive)
        @ReadWrite(bits: 5..<10, as: BitField5.self)
        public var mask_lsb: MASK_LSB_Field

        /// Logical right-shift applied to accumulator before masking
        @ReadWrite(bits: 0..<5, as: BitField5.self)
        public var shift: SHIFT_Field
    }

    /// Control register for lane 1
    @RegisterBank(offset: 0x00f0)
    public var interp1_ctrl_lane1: Register<INTERP1_CTRL_LANE1>

    @Register(bitWidth: 32)
    public struct INTERP1_CTRL_LANE1 {
        /// ORed into bits 29:28 of the lane result presented to the processor on the bus.
        /// No effect on the internal 32-bit datapath. Handy for using a lane to generate sequence
        /// of pointers into flash or SRAM.
        @ReadWrite(bits: 19..<21, as: BitField2.self)
        public var force_msb: FORCE_MSB_Field

        /// If 1, mask + shift is bypassed for LANE1 result. This does not affect FULL result.
        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var add_raw: ADD_RAW_Field

        /// If 1, feed the opposite lane's result into this lane's accumulator on POP.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var cross_result: CROSS_RESULT_Field

        /// If 1, feed the opposite lane's accumulator into this lane's shift + mask hardware.
        /// Takes effect even if ADD_RAW is set (the CROSS_INPUT mux is before the shift+mask bypass)
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var cross_input: CROSS_INPUT_Field

        /// If SIGNED is set, the shifted and masked accumulator value is sign-extended to 32 bits
        /// before adding to BASE1, and LANE1 PEEK/POP appear extended to 32 bits when read by processor.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var signed: SIGNED_Field

        /// The most-significant bit allowed to pass by the mask (inclusive)
        /// Setting MSB < LSB may cause chip to turn inside-out
        @ReadWrite(bits: 10..<15, as: BitField5.self)
        public var mask_msb: MASK_MSB_Field

        /// The least-significant bit allowed to pass by the mask (inclusive)
        @ReadWrite(bits: 5..<10, as: BitField5.self)
        public var mask_lsb: MASK_LSB_Field

        /// Logical right-shift applied to accumulator before masking
        @ReadWrite(bits: 0..<5, as: BitField5.self)
        public var shift: SHIFT_Field
    }

    /// Values written here are atomically added to ACCUM0
    /// Reading yields lane 0's raw shift and mask value (BASE0 not added).
    @RegisterBank(offset: 0x00f4)
    public var interp1_accum0_add: Register<INTERP1_ACCUM0_ADD>

    @Register(bitWidth: 32)
    public struct INTERP1_ACCUM0_ADD {
        @ReadWrite(bits: 0..<24, as: BitField24.self)
        public var interp1_accum0_add: INTERP1_ACCUM0_ADD_Field
    }

    /// Values written here are atomically added to ACCUM1
    /// Reading yields lane 1's raw shift and mask value (BASE1 not added).
    @RegisterBank(offset: 0x00f8)
    public var interp1_accum1_add: Register<INTERP1_ACCUM1_ADD>

    @Register(bitWidth: 32)
    public struct INTERP1_ACCUM1_ADD {
        @ReadWrite(bits: 0..<24, as: BitField24.self)
        public var interp1_accum1_add: INTERP1_ACCUM1_ADD_Field
    }

    /// On write, the lower 16 bits go to BASE0, upper bits to BASE1 simultaneously.
    /// Each half is sign-extended to 32 bits if that lane's SIGNED flag is set.
    @RegisterBank(offset: 0x00fc)
    public var interp1_base_1and0: Register<INTERP1_BASE_1AND0>

    @Register(bitWidth: 32)
    public struct INTERP1_BASE_1AND0 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x0100)
    public var spinlock0: Register<SPINLOCK0>

    @Register(bitWidth: 32)
    public struct SPINLOCK0 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x0104)
    public var spinlock1: Register<SPINLOCK1>

    @Register(bitWidth: 32)
    public struct SPINLOCK1 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x0108)
    public var spinlock2: Register<SPINLOCK2>

    @Register(bitWidth: 32)
    public struct SPINLOCK2 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x010c)
    public var spinlock3: Register<SPINLOCK3>

    @Register(bitWidth: 32)
    public struct SPINLOCK3 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x0110)
    public var spinlock4: Register<SPINLOCK4>

    @Register(bitWidth: 32)
    public struct SPINLOCK4 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x0114)
    public var spinlock5: Register<SPINLOCK5>

    @Register(bitWidth: 32)
    public struct SPINLOCK5 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x0118)
    public var spinlock6: Register<SPINLOCK6>

    @Register(bitWidth: 32)
    public struct SPINLOCK6 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x011c)
    public var spinlock7: Register<SPINLOCK7>

    @Register(bitWidth: 32)
    public struct SPINLOCK7 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x0120)
    public var spinlock8: Register<SPINLOCK8>

    @Register(bitWidth: 32)
    public struct SPINLOCK8 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x0124)
    public var spinlock9: Register<SPINLOCK9>

    @Register(bitWidth: 32)
    public struct SPINLOCK9 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x0128)
    public var spinlock10: Register<SPINLOCK10>

    @Register(bitWidth: 32)
    public struct SPINLOCK10 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x012c)
    public var spinlock11: Register<SPINLOCK11>

    @Register(bitWidth: 32)
    public struct SPINLOCK11 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x0130)
    public var spinlock12: Register<SPINLOCK12>

    @Register(bitWidth: 32)
    public struct SPINLOCK12 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x0134)
    public var spinlock13: Register<SPINLOCK13>

    @Register(bitWidth: 32)
    public struct SPINLOCK13 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x0138)
    public var spinlock14: Register<SPINLOCK14>

    @Register(bitWidth: 32)
    public struct SPINLOCK14 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x013c)
    public var spinlock15: Register<SPINLOCK15>

    @Register(bitWidth: 32)
    public struct SPINLOCK15 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x0140)
    public var spinlock16: Register<SPINLOCK16>

    @Register(bitWidth: 32)
    public struct SPINLOCK16 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x0144)
    public var spinlock17: Register<SPINLOCK17>

    @Register(bitWidth: 32)
    public struct SPINLOCK17 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x0148)
    public var spinlock18: Register<SPINLOCK18>

    @Register(bitWidth: 32)
    public struct SPINLOCK18 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x014c)
    public var spinlock19: Register<SPINLOCK19>

    @Register(bitWidth: 32)
    public struct SPINLOCK19 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x0150)
    public var spinlock20: Register<SPINLOCK20>

    @Register(bitWidth: 32)
    public struct SPINLOCK20 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x0154)
    public var spinlock21: Register<SPINLOCK21>

    @Register(bitWidth: 32)
    public struct SPINLOCK21 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x0158)
    public var spinlock22: Register<SPINLOCK22>

    @Register(bitWidth: 32)
    public struct SPINLOCK22 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x015c)
    public var spinlock23: Register<SPINLOCK23>

    @Register(bitWidth: 32)
    public struct SPINLOCK23 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x0160)
    public var spinlock24: Register<SPINLOCK24>

    @Register(bitWidth: 32)
    public struct SPINLOCK24 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x0164)
    public var spinlock25: Register<SPINLOCK25>

    @Register(bitWidth: 32)
    public struct SPINLOCK25 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x0168)
    public var spinlock26: Register<SPINLOCK26>

    @Register(bitWidth: 32)
    public struct SPINLOCK26 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x016c)
    public var spinlock27: Register<SPINLOCK27>

    @Register(bitWidth: 32)
    public struct SPINLOCK27 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x0170)
    public var spinlock28: Register<SPINLOCK28>

    @Register(bitWidth: 32)
    public struct SPINLOCK28 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x0174)
    public var spinlock29: Register<SPINLOCK29>

    @Register(bitWidth: 32)
    public struct SPINLOCK29 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x0178)
    public var spinlock30: Register<SPINLOCK30>

    @Register(bitWidth: 32)
    public struct SPINLOCK30 {}

    /// Reading from a spinlock address will:
    /// - Return 0 if lock is already locked
    /// - Otherwise return nonzero, and simultaneously claim the lock
    /// Writing (any value) releases the lock.
    /// If core 0 and core 1 attempt to claim the same lock simultaneously, core 0 wins.
    /// The value returned on success is 0x1 << lock number.
    @RegisterBank(offset: 0x017c)
    public var spinlock31: Register<SPINLOCK31>

    @Register(bitWidth: 32)
    public struct SPINLOCK31 {}
}
