import MMIO
import MMIOExtensions

/// Simple PWM
@RegisterBank
public struct PWM {

    public static var `default`: Self { .init(unsafeAddress: 0x40050000) }

    /// Control and status register
    @RegisterBank(offset: 0x0000)
    public var ch0_csr: Register<CH0_CSR>

    @Register(bitWidth: 32)
    public struct CH0_CSR {
        /// Advance the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running
        /// at less than full speed (div_int + div_frac / 16 > 1)
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var ph_adv: PH_ADV_Field

        /// Retard the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running.
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var ph_ret: PH_RET_Field

        @ReadWrite(bits: 4..<6, as: DIVMODE_Values.self)
        public var divmode: DIVMODE_Field

        public enum DIVMODE_Values: UInt, BitFieldProjectable {
            /// Free-running counting at rate dictated by fractional divider
            case DIVMODE_div = 0
            /// Fractional divider operation is gated by the PWM B pin.
            case DIVMODE_level = 1
            /// Counter advances with each rising edge of the PWM B pin.
            case DIVMODE_rise = 2
            /// Counter advances with each falling edge of the PWM B pin.
            case DIVMODE_fall = 3

            public static var bitWidth: Int { 2 }
        }

        /// Invert output B
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var b_inv: B_INV_Field

        /// Invert output A
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var a_inv: A_INV_Field

        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var ph_correct: PH_CORRECT_Field

        /// Enable the PWM channel.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var en: EN_Field
    }

    /// INT and FRAC form a fixed-point fractional number.
    /// Counting rate is system clock frequency divided by this number.
    /// Fractional division uses simple 1st-order sigma-delta.
    @RegisterBank(offset: 0x0004)
    public var ch0_div: Register<CH0_DIV>

    @Register(bitWidth: 32)
    public struct CH0_DIV {
        @ReadWrite(bits: 4..<12, as: BitField8.self)
        public var int: INT_Field

        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var frac: FRAC_Field
    }

    /// Direct access to the PWM counter
    @RegisterBank(offset: 0x0008)
    public var ch0_ctr: Register<CH0_CTR>

    @Register(bitWidth: 32)
    public struct CH0_CTR {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var ch0_ctr: CH0_CTR_Field
    }

    /// Counter compare values
    @RegisterBank(offset: 0x000c)
    public var ch0_cc: Register<CH0_CC>

    @Register(bitWidth: 32)
    public struct CH0_CC {
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var b: B_Field

        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var a: A_Field
    }

    /// Counter wrap value
    @RegisterBank(offset: 0x0010)
    public var ch0_top: Register<CH0_TOP>

    @Register(bitWidth: 32)
    public struct CH0_TOP {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var ch0_top: CH0_TOP_Field
    }

    /// Control and status register
    @RegisterBank(offset: 0x0014)
    public var ch1_csr: Register<CH1_CSR>

    @Register(bitWidth: 32)
    public struct CH1_CSR {
        /// Advance the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running
        /// at less than full speed (div_int + div_frac / 16 > 1)
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var ph_adv: PH_ADV_Field

        /// Retard the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running.
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var ph_ret: PH_RET_Field

        @ReadWrite(bits: 4..<6, as: DIVMODE_Values.self)
        public var divmode: DIVMODE_Field

        public enum DIVMODE_Values: UInt, BitFieldProjectable {
            /// Free-running counting at rate dictated by fractional divider
            case DIVMODE_div = 0
            /// Fractional divider operation is gated by the PWM B pin.
            case DIVMODE_level = 1
            /// Counter advances with each rising edge of the PWM B pin.
            case DIVMODE_rise = 2
            /// Counter advances with each falling edge of the PWM B pin.
            case DIVMODE_fall = 3

            public static var bitWidth: Int { 2 }
        }

        /// Invert output B
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var b_inv: B_INV_Field

        /// Invert output A
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var a_inv: A_INV_Field

        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var ph_correct: PH_CORRECT_Field

        /// Enable the PWM channel.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var en: EN_Field
    }

    /// INT and FRAC form a fixed-point fractional number.
    /// Counting rate is system clock frequency divided by this number.
    /// Fractional division uses simple 1st-order sigma-delta.
    @RegisterBank(offset: 0x0018)
    public var ch1_div: Register<CH1_DIV>

    @Register(bitWidth: 32)
    public struct CH1_DIV {
        @ReadWrite(bits: 4..<12, as: BitField8.self)
        public var int: INT_Field

        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var frac: FRAC_Field
    }

    /// Direct access to the PWM counter
    @RegisterBank(offset: 0x001c)
    public var ch1_ctr: Register<CH1_CTR>

    @Register(bitWidth: 32)
    public struct CH1_CTR {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var ch1_ctr: CH1_CTR_Field
    }

    /// Counter compare values
    @RegisterBank(offset: 0x0020)
    public var ch1_cc: Register<CH1_CC>

    @Register(bitWidth: 32)
    public struct CH1_CC {
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var b: B_Field

        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var a: A_Field
    }

    /// Counter wrap value
    @RegisterBank(offset: 0x0024)
    public var ch1_top: Register<CH1_TOP>

    @Register(bitWidth: 32)
    public struct CH1_TOP {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var ch1_top: CH1_TOP_Field
    }

    /// Control and status register
    @RegisterBank(offset: 0x0028)
    public var ch2_csr: Register<CH2_CSR>

    @Register(bitWidth: 32)
    public struct CH2_CSR {
        /// Advance the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running
        /// at less than full speed (div_int + div_frac / 16 > 1)
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var ph_adv: PH_ADV_Field

        /// Retard the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running.
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var ph_ret: PH_RET_Field

        @ReadWrite(bits: 4..<6, as: DIVMODE_Values.self)
        public var divmode: DIVMODE_Field

        public enum DIVMODE_Values: UInt, BitFieldProjectable {
            /// Free-running counting at rate dictated by fractional divider
            case DIVMODE_div = 0
            /// Fractional divider operation is gated by the PWM B pin.
            case DIVMODE_level = 1
            /// Counter advances with each rising edge of the PWM B pin.
            case DIVMODE_rise = 2
            /// Counter advances with each falling edge of the PWM B pin.
            case DIVMODE_fall = 3

            public static var bitWidth: Int { 2 }
        }

        /// Invert output B
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var b_inv: B_INV_Field

        /// Invert output A
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var a_inv: A_INV_Field

        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var ph_correct: PH_CORRECT_Field

        /// Enable the PWM channel.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var en: EN_Field
    }

    /// INT and FRAC form a fixed-point fractional number.
    /// Counting rate is system clock frequency divided by this number.
    /// Fractional division uses simple 1st-order sigma-delta.
    @RegisterBank(offset: 0x002c)
    public var ch2_div: Register<CH2_DIV>

    @Register(bitWidth: 32)
    public struct CH2_DIV {
        @ReadWrite(bits: 4..<12, as: BitField8.self)
        public var int: INT_Field

        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var frac: FRAC_Field
    }

    /// Direct access to the PWM counter
    @RegisterBank(offset: 0x0030)
    public var ch2_ctr: Register<CH2_CTR>

    @Register(bitWidth: 32)
    public struct CH2_CTR {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var ch2_ctr: CH2_CTR_Field
    }

    /// Counter compare values
    @RegisterBank(offset: 0x0034)
    public var ch2_cc: Register<CH2_CC>

    @Register(bitWidth: 32)
    public struct CH2_CC {
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var b: B_Field

        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var a: A_Field
    }

    /// Counter wrap value
    @RegisterBank(offset: 0x0038)
    public var ch2_top: Register<CH2_TOP>

    @Register(bitWidth: 32)
    public struct CH2_TOP {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var ch2_top: CH2_TOP_Field
    }

    /// Control and status register
    @RegisterBank(offset: 0x003c)
    public var ch3_csr: Register<CH3_CSR>

    @Register(bitWidth: 32)
    public struct CH3_CSR {
        /// Advance the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running
        /// at less than full speed (div_int + div_frac / 16 > 1)
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var ph_adv: PH_ADV_Field

        /// Retard the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running.
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var ph_ret: PH_RET_Field

        @ReadWrite(bits: 4..<6, as: DIVMODE_Values.self)
        public var divmode: DIVMODE_Field

        public enum DIVMODE_Values: UInt, BitFieldProjectable {
            /// Free-running counting at rate dictated by fractional divider
            case DIVMODE_div = 0
            /// Fractional divider operation is gated by the PWM B pin.
            case DIVMODE_level = 1
            /// Counter advances with each rising edge of the PWM B pin.
            case DIVMODE_rise = 2
            /// Counter advances with each falling edge of the PWM B pin.
            case DIVMODE_fall = 3

            public static var bitWidth: Int { 2 }
        }

        /// Invert output B
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var b_inv: B_INV_Field

        /// Invert output A
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var a_inv: A_INV_Field

        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var ph_correct: PH_CORRECT_Field

        /// Enable the PWM channel.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var en: EN_Field
    }

    /// INT and FRAC form a fixed-point fractional number.
    /// Counting rate is system clock frequency divided by this number.
    /// Fractional division uses simple 1st-order sigma-delta.
    @RegisterBank(offset: 0x0040)
    public var ch3_div: Register<CH3_DIV>

    @Register(bitWidth: 32)
    public struct CH3_DIV {
        @ReadWrite(bits: 4..<12, as: BitField8.self)
        public var int: INT_Field

        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var frac: FRAC_Field
    }

    /// Direct access to the PWM counter
    @RegisterBank(offset: 0x0044)
    public var ch3_ctr: Register<CH3_CTR>

    @Register(bitWidth: 32)
    public struct CH3_CTR {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var ch3_ctr: CH3_CTR_Field
    }

    /// Counter compare values
    @RegisterBank(offset: 0x0048)
    public var ch3_cc: Register<CH3_CC>

    @Register(bitWidth: 32)
    public struct CH3_CC {
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var b: B_Field

        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var a: A_Field
    }

    /// Counter wrap value
    @RegisterBank(offset: 0x004c)
    public var ch3_top: Register<CH3_TOP>

    @Register(bitWidth: 32)
    public struct CH3_TOP {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var ch3_top: CH3_TOP_Field
    }

    /// Control and status register
    @RegisterBank(offset: 0x0050)
    public var ch4_csr: Register<CH4_CSR>

    @Register(bitWidth: 32)
    public struct CH4_CSR {
        /// Advance the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running
        /// at less than full speed (div_int + div_frac / 16 > 1)
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var ph_adv: PH_ADV_Field

        /// Retard the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running.
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var ph_ret: PH_RET_Field

        @ReadWrite(bits: 4..<6, as: DIVMODE_Values.self)
        public var divmode: DIVMODE_Field

        public enum DIVMODE_Values: UInt, BitFieldProjectable {
            /// Free-running counting at rate dictated by fractional divider
            case DIVMODE_div = 0
            /// Fractional divider operation is gated by the PWM B pin.
            case DIVMODE_level = 1
            /// Counter advances with each rising edge of the PWM B pin.
            case DIVMODE_rise = 2
            /// Counter advances with each falling edge of the PWM B pin.
            case DIVMODE_fall = 3

            public static var bitWidth: Int { 2 }
        }

        /// Invert output B
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var b_inv: B_INV_Field

        /// Invert output A
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var a_inv: A_INV_Field

        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var ph_correct: PH_CORRECT_Field

        /// Enable the PWM channel.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var en: EN_Field
    }

    /// INT and FRAC form a fixed-point fractional number.
    /// Counting rate is system clock frequency divided by this number.
    /// Fractional division uses simple 1st-order sigma-delta.
    @RegisterBank(offset: 0x0054)
    public var ch4_div: Register<CH4_DIV>

    @Register(bitWidth: 32)
    public struct CH4_DIV {
        @ReadWrite(bits: 4..<12, as: BitField8.self)
        public var int: INT_Field

        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var frac: FRAC_Field
    }

    /// Direct access to the PWM counter
    @RegisterBank(offset: 0x0058)
    public var ch4_ctr: Register<CH4_CTR>

    @Register(bitWidth: 32)
    public struct CH4_CTR {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var ch4_ctr: CH4_CTR_Field
    }

    /// Counter compare values
    @RegisterBank(offset: 0x005c)
    public var ch4_cc: Register<CH4_CC>

    @Register(bitWidth: 32)
    public struct CH4_CC {
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var b: B_Field

        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var a: A_Field
    }

    /// Counter wrap value
    @RegisterBank(offset: 0x0060)
    public var ch4_top: Register<CH4_TOP>

    @Register(bitWidth: 32)
    public struct CH4_TOP {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var ch4_top: CH4_TOP_Field
    }

    /// Control and status register
    @RegisterBank(offset: 0x0064)
    public var ch5_csr: Register<CH5_CSR>

    @Register(bitWidth: 32)
    public struct CH5_CSR {
        /// Advance the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running
        /// at less than full speed (div_int + div_frac / 16 > 1)
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var ph_adv: PH_ADV_Field

        /// Retard the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running.
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var ph_ret: PH_RET_Field

        @ReadWrite(bits: 4..<6, as: DIVMODE_Values.self)
        public var divmode: DIVMODE_Field

        public enum DIVMODE_Values: UInt, BitFieldProjectable {
            /// Free-running counting at rate dictated by fractional divider
            case DIVMODE_div = 0
            /// Fractional divider operation is gated by the PWM B pin.
            case DIVMODE_level = 1
            /// Counter advances with each rising edge of the PWM B pin.
            case DIVMODE_rise = 2
            /// Counter advances with each falling edge of the PWM B pin.
            case DIVMODE_fall = 3

            public static var bitWidth: Int { 2 }
        }

        /// Invert output B
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var b_inv: B_INV_Field

        /// Invert output A
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var a_inv: A_INV_Field

        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var ph_correct: PH_CORRECT_Field

        /// Enable the PWM channel.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var en: EN_Field
    }

    /// INT and FRAC form a fixed-point fractional number.
    /// Counting rate is system clock frequency divided by this number.
    /// Fractional division uses simple 1st-order sigma-delta.
    @RegisterBank(offset: 0x0068)
    public var ch5_div: Register<CH5_DIV>

    @Register(bitWidth: 32)
    public struct CH5_DIV {
        @ReadWrite(bits: 4..<12, as: BitField8.self)
        public var int: INT_Field

        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var frac: FRAC_Field
    }

    /// Direct access to the PWM counter
    @RegisterBank(offset: 0x006c)
    public var ch5_ctr: Register<CH5_CTR>

    @Register(bitWidth: 32)
    public struct CH5_CTR {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var ch5_ctr: CH5_CTR_Field
    }

    /// Counter compare values
    @RegisterBank(offset: 0x0070)
    public var ch5_cc: Register<CH5_CC>

    @Register(bitWidth: 32)
    public struct CH5_CC {
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var b: B_Field

        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var a: A_Field
    }

    /// Counter wrap value
    @RegisterBank(offset: 0x0074)
    public var ch5_top: Register<CH5_TOP>

    @Register(bitWidth: 32)
    public struct CH5_TOP {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var ch5_top: CH5_TOP_Field
    }

    /// Control and status register
    @RegisterBank(offset: 0x0078)
    public var ch6_csr: Register<CH6_CSR>

    @Register(bitWidth: 32)
    public struct CH6_CSR {
        /// Advance the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running
        /// at less than full speed (div_int + div_frac / 16 > 1)
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var ph_adv: PH_ADV_Field

        /// Retard the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running.
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var ph_ret: PH_RET_Field

        @ReadWrite(bits: 4..<6, as: DIVMODE_Values.self)
        public var divmode: DIVMODE_Field

        public enum DIVMODE_Values: UInt, BitFieldProjectable {
            /// Free-running counting at rate dictated by fractional divider
            case DIVMODE_div = 0
            /// Fractional divider operation is gated by the PWM B pin.
            case DIVMODE_level = 1
            /// Counter advances with each rising edge of the PWM B pin.
            case DIVMODE_rise = 2
            /// Counter advances with each falling edge of the PWM B pin.
            case DIVMODE_fall = 3

            public static var bitWidth: Int { 2 }
        }

        /// Invert output B
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var b_inv: B_INV_Field

        /// Invert output A
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var a_inv: A_INV_Field

        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var ph_correct: PH_CORRECT_Field

        /// Enable the PWM channel.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var en: EN_Field
    }

    /// INT and FRAC form a fixed-point fractional number.
    /// Counting rate is system clock frequency divided by this number.
    /// Fractional division uses simple 1st-order sigma-delta.
    @RegisterBank(offset: 0x007c)
    public var ch6_div: Register<CH6_DIV>

    @Register(bitWidth: 32)
    public struct CH6_DIV {
        @ReadWrite(bits: 4..<12, as: BitField8.self)
        public var int: INT_Field

        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var frac: FRAC_Field
    }

    /// Direct access to the PWM counter
    @RegisterBank(offset: 0x0080)
    public var ch6_ctr: Register<CH6_CTR>

    @Register(bitWidth: 32)
    public struct CH6_CTR {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var ch6_ctr: CH6_CTR_Field
    }

    /// Counter compare values
    @RegisterBank(offset: 0x0084)
    public var ch6_cc: Register<CH6_CC>

    @Register(bitWidth: 32)
    public struct CH6_CC {
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var b: B_Field

        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var a: A_Field
    }

    /// Counter wrap value
    @RegisterBank(offset: 0x0088)
    public var ch6_top: Register<CH6_TOP>

    @Register(bitWidth: 32)
    public struct CH6_TOP {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var ch6_top: CH6_TOP_Field
    }

    /// Control and status register
    @RegisterBank(offset: 0x008c)
    public var ch7_csr: Register<CH7_CSR>

    @Register(bitWidth: 32)
    public struct CH7_CSR {
        /// Advance the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running
        /// at less than full speed (div_int + div_frac / 16 > 1)
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var ph_adv: PH_ADV_Field

        /// Retard the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running.
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var ph_ret: PH_RET_Field

        @ReadWrite(bits: 4..<6, as: DIVMODE_Values.self)
        public var divmode: DIVMODE_Field

        public enum DIVMODE_Values: UInt, BitFieldProjectable {
            /// Free-running counting at rate dictated by fractional divider
            case DIVMODE_div = 0
            /// Fractional divider operation is gated by the PWM B pin.
            case DIVMODE_level = 1
            /// Counter advances with each rising edge of the PWM B pin.
            case DIVMODE_rise = 2
            /// Counter advances with each falling edge of the PWM B pin.
            case DIVMODE_fall = 3

            public static var bitWidth: Int { 2 }
        }

        /// Invert output B
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var b_inv: B_INV_Field

        /// Invert output A
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var a_inv: A_INV_Field

        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var ph_correct: PH_CORRECT_Field

        /// Enable the PWM channel.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var en: EN_Field
    }

    /// INT and FRAC form a fixed-point fractional number.
    /// Counting rate is system clock frequency divided by this number.
    /// Fractional division uses simple 1st-order sigma-delta.
    @RegisterBank(offset: 0x0090)
    public var ch7_div: Register<CH7_DIV>

    @Register(bitWidth: 32)
    public struct CH7_DIV {
        @ReadWrite(bits: 4..<12, as: BitField8.self)
        public var int: INT_Field

        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var frac: FRAC_Field
    }

    /// Direct access to the PWM counter
    @RegisterBank(offset: 0x0094)
    public var ch7_ctr: Register<CH7_CTR>

    @Register(bitWidth: 32)
    public struct CH7_CTR {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var ch7_ctr: CH7_CTR_Field
    }

    /// Counter compare values
    @RegisterBank(offset: 0x0098)
    public var ch7_cc: Register<CH7_CC>

    @Register(bitWidth: 32)
    public struct CH7_CC {
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var b: B_Field

        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var a: A_Field
    }

    /// Counter wrap value
    @RegisterBank(offset: 0x009c)
    public var ch7_top: Register<CH7_TOP>

    @Register(bitWidth: 32)
    public struct CH7_TOP {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var ch7_top: CH7_TOP_Field
    }

    /// This register aliases the CSR_EN bits for all channels.
    /// Writing to this register allows multiple channels to be enabled
    /// or disabled simultaneously, so they can run in perfect sync.
    /// For each channel, there is only one physical EN register bit,
    /// which can be accessed through here or CHx_CSR.
    @RegisterBank(offset: 0x00a0)
    public var en: Register<EN>

    @Register(bitWidth: 32)
    public struct EN {
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var ch7: CH7_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var ch6: CH6_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var ch5: CH5_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var ch4: CH4_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var ch3: CH3_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var ch2: CH2_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var ch1: CH1_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var ch0: CH0_Field
    }

    /// Raw Interrupts
    @RegisterBank(offset: 0x00a4)
    public var intr: Register<INTR>

    @Register(bitWidth: 32)
    public struct INTR {
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var ch7: CH7_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var ch6: CH6_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var ch5: CH5_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var ch4: CH4_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var ch3: CH3_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var ch2: CH2_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var ch1: CH1_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var ch0: CH0_Field
    }

    /// Interrupt Enable
    @RegisterBank(offset: 0x00a8)
    public var inte: Register<INTE>

    @Register(bitWidth: 32)
    public struct INTE {
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var ch7: CH7_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var ch6: CH6_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var ch5: CH5_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var ch4: CH4_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var ch3: CH3_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var ch2: CH2_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var ch1: CH1_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var ch0: CH0_Field
    }

    /// Interrupt Force
    @RegisterBank(offset: 0x00ac)
    public var intf: Register<INTF>

    @Register(bitWidth: 32)
    public struct INTF {
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var ch7: CH7_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var ch6: CH6_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var ch5: CH5_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var ch4: CH4_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var ch3: CH3_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var ch2: CH2_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var ch1: CH1_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var ch0: CH0_Field
    }

    /// Interrupt status after masking & forcing
    @RegisterBank(offset: 0x00b0)
    public var ints: Register<INTS>

    @Register(bitWidth: 32)
    public struct INTS {
        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var ch7: CH7_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var ch6: CH6_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var ch5: CH5_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var ch4: CH4_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var ch3: CH3_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var ch2: CH2_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var ch1: CH1_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var ch0: CH0_Field
    }
}
