import MMIO
import MMIOExtensions

/// Simple PWM
@RegisterBank
public struct PWM {

    public static var `default`: Self { .init(unsafeAddress: 0x40050000) }

    /// Control and status register
    @RegisterBank(offset: 0x0000)
    public var CH0_CSR: Register<CH0_CSR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH0_CSR_Descriptor {
        /// Advance the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running
        /// at less than full speed (div_int + div_frac / 16 > 1)
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var PH_ADV: PH_ADV_Field

        /// Retard the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running.
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var PH_RET: PH_RET_Field

        @ReadWrite(bits: 4..<6, as: DIVMODE_Values.self)
        public var DIVMODE: DIVMODE_Field

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
        public var B_INV: B_INV_Field

        /// Invert output A
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var A_INV: A_INV_Field

        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var PH_CORRECT: PH_CORRECT_Field

        /// Enable the PWM channel.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var EN: EN_Field
    }

    /// INT and FRAC form a fixed-point fractional number.
    /// Counting rate is system clock frequency divided by this number.
    /// Fractional division uses simple 1st-order sigma-delta.
    @RegisterBank(offset: 0x0004)
    public var CH0_DIV: Register<CH0_DIV_Descriptor>


    @Register(bitWidth: 32)
    public struct CH0_DIV_Descriptor {
        @ReadWrite(bits: 4..<12, as: BitField8.self)
        public var INT: INT_Field

        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var FRAC: FRAC_Field
    }

    /// Direct access to the PWM counter
    @RegisterBank(offset: 0x0008)
    public var CH0_CTR: Register<CH0_CTR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH0_CTR_Descriptor {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var CH0_CTR: CH0_CTR_Field
    }

    /// Counter compare values
    @RegisterBank(offset: 0x000c)
    public var CH0_CC: Register<CH0_CC_Descriptor>


    @Register(bitWidth: 32)
    public struct CH0_CC_Descriptor {
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var B: B_Field

        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var A: A_Field
    }

    /// Counter wrap value
    @RegisterBank(offset: 0x0010)
    public var CH0_TOP: Register<CH0_TOP_Descriptor>


    @Register(bitWidth: 32)
    public struct CH0_TOP_Descriptor {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var CH0_TOP: CH0_TOP_Field
    }

    /// Control and status register
    @RegisterBank(offset: 0x0014)
    public var CH1_CSR: Register<CH1_CSR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH1_CSR_Descriptor {
        /// Advance the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running
        /// at less than full speed (div_int + div_frac / 16 > 1)
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var PH_ADV: PH_ADV_Field

        /// Retard the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running.
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var PH_RET: PH_RET_Field

        @ReadWrite(bits: 4..<6, as: DIVMODE_Values.self)
        public var DIVMODE: DIVMODE_Field

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
        public var B_INV: B_INV_Field

        /// Invert output A
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var A_INV: A_INV_Field

        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var PH_CORRECT: PH_CORRECT_Field

        /// Enable the PWM channel.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var EN: EN_Field
    }

    /// INT and FRAC form a fixed-point fractional number.
    /// Counting rate is system clock frequency divided by this number.
    /// Fractional division uses simple 1st-order sigma-delta.
    @RegisterBank(offset: 0x0018)
    public var CH1_DIV: Register<CH1_DIV_Descriptor>


    @Register(bitWidth: 32)
    public struct CH1_DIV_Descriptor {
        @ReadWrite(bits: 4..<12, as: BitField8.self)
        public var INT: INT_Field

        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var FRAC: FRAC_Field
    }

    /// Direct access to the PWM counter
    @RegisterBank(offset: 0x001c)
    public var CH1_CTR: Register<CH1_CTR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH1_CTR_Descriptor {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var CH1_CTR: CH1_CTR_Field
    }

    /// Counter compare values
    @RegisterBank(offset: 0x0020)
    public var CH1_CC: Register<CH1_CC_Descriptor>


    @Register(bitWidth: 32)
    public struct CH1_CC_Descriptor {
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var B: B_Field

        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var A: A_Field
    }

    /// Counter wrap value
    @RegisterBank(offset: 0x0024)
    public var CH1_TOP: Register<CH1_TOP_Descriptor>


    @Register(bitWidth: 32)
    public struct CH1_TOP_Descriptor {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var CH1_TOP: CH1_TOP_Field
    }

    /// Control and status register
    @RegisterBank(offset: 0x0028)
    public var CH2_CSR: Register<CH2_CSR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH2_CSR_Descriptor {
        /// Advance the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running
        /// at less than full speed (div_int + div_frac / 16 > 1)
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var PH_ADV: PH_ADV_Field

        /// Retard the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running.
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var PH_RET: PH_RET_Field

        @ReadWrite(bits: 4..<6, as: DIVMODE_Values.self)
        public var DIVMODE: DIVMODE_Field

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
        public var B_INV: B_INV_Field

        /// Invert output A
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var A_INV: A_INV_Field

        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var PH_CORRECT: PH_CORRECT_Field

        /// Enable the PWM channel.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var EN: EN_Field
    }

    /// INT and FRAC form a fixed-point fractional number.
    /// Counting rate is system clock frequency divided by this number.
    /// Fractional division uses simple 1st-order sigma-delta.
    @RegisterBank(offset: 0x002c)
    public var CH2_DIV: Register<CH2_DIV_Descriptor>


    @Register(bitWidth: 32)
    public struct CH2_DIV_Descriptor {
        @ReadWrite(bits: 4..<12, as: BitField8.self)
        public var INT: INT_Field

        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var FRAC: FRAC_Field
    }

    /// Direct access to the PWM counter
    @RegisterBank(offset: 0x0030)
    public var CH2_CTR: Register<CH2_CTR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH2_CTR_Descriptor {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var CH2_CTR: CH2_CTR_Field
    }

    /// Counter compare values
    @RegisterBank(offset: 0x0034)
    public var CH2_CC: Register<CH2_CC_Descriptor>


    @Register(bitWidth: 32)
    public struct CH2_CC_Descriptor {
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var B: B_Field

        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var A: A_Field
    }

    /// Counter wrap value
    @RegisterBank(offset: 0x0038)
    public var CH2_TOP: Register<CH2_TOP_Descriptor>


    @Register(bitWidth: 32)
    public struct CH2_TOP_Descriptor {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var CH2_TOP: CH2_TOP_Field
    }

    /// Control and status register
    @RegisterBank(offset: 0x003c)
    public var CH3_CSR: Register<CH3_CSR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH3_CSR_Descriptor {
        /// Advance the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running
        /// at less than full speed (div_int + div_frac / 16 > 1)
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var PH_ADV: PH_ADV_Field

        /// Retard the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running.
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var PH_RET: PH_RET_Field

        @ReadWrite(bits: 4..<6, as: DIVMODE_Values.self)
        public var DIVMODE: DIVMODE_Field

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
        public var B_INV: B_INV_Field

        /// Invert output A
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var A_INV: A_INV_Field

        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var PH_CORRECT: PH_CORRECT_Field

        /// Enable the PWM channel.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var EN: EN_Field
    }

    /// INT and FRAC form a fixed-point fractional number.
    /// Counting rate is system clock frequency divided by this number.
    /// Fractional division uses simple 1st-order sigma-delta.
    @RegisterBank(offset: 0x0040)
    public var CH3_DIV: Register<CH3_DIV_Descriptor>


    @Register(bitWidth: 32)
    public struct CH3_DIV_Descriptor {
        @ReadWrite(bits: 4..<12, as: BitField8.self)
        public var INT: INT_Field

        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var FRAC: FRAC_Field
    }

    /// Direct access to the PWM counter
    @RegisterBank(offset: 0x0044)
    public var CH3_CTR: Register<CH3_CTR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH3_CTR_Descriptor {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var CH3_CTR: CH3_CTR_Field
    }

    /// Counter compare values
    @RegisterBank(offset: 0x0048)
    public var CH3_CC: Register<CH3_CC_Descriptor>


    @Register(bitWidth: 32)
    public struct CH3_CC_Descriptor {
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var B: B_Field

        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var A: A_Field
    }

    /// Counter wrap value
    @RegisterBank(offset: 0x004c)
    public var CH3_TOP: Register<CH3_TOP_Descriptor>


    @Register(bitWidth: 32)
    public struct CH3_TOP_Descriptor {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var CH3_TOP: CH3_TOP_Field
    }

    /// Control and status register
    @RegisterBank(offset: 0x0050)
    public var CH4_CSR: Register<CH4_CSR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH4_CSR_Descriptor {
        /// Advance the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running
        /// at less than full speed (div_int + div_frac / 16 > 1)
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var PH_ADV: PH_ADV_Field

        /// Retard the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running.
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var PH_RET: PH_RET_Field

        @ReadWrite(bits: 4..<6, as: DIVMODE_Values.self)
        public var DIVMODE: DIVMODE_Field

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
        public var B_INV: B_INV_Field

        /// Invert output A
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var A_INV: A_INV_Field

        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var PH_CORRECT: PH_CORRECT_Field

        /// Enable the PWM channel.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var EN: EN_Field
    }

    /// INT and FRAC form a fixed-point fractional number.
    /// Counting rate is system clock frequency divided by this number.
    /// Fractional division uses simple 1st-order sigma-delta.
    @RegisterBank(offset: 0x0054)
    public var CH4_DIV: Register<CH4_DIV_Descriptor>


    @Register(bitWidth: 32)
    public struct CH4_DIV_Descriptor {
        @ReadWrite(bits: 4..<12, as: BitField8.self)
        public var INT: INT_Field

        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var FRAC: FRAC_Field
    }

    /// Direct access to the PWM counter
    @RegisterBank(offset: 0x0058)
    public var CH4_CTR: Register<CH4_CTR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH4_CTR_Descriptor {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var CH4_CTR: CH4_CTR_Field
    }

    /// Counter compare values
    @RegisterBank(offset: 0x005c)
    public var CH4_CC: Register<CH4_CC_Descriptor>


    @Register(bitWidth: 32)
    public struct CH4_CC_Descriptor {
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var B: B_Field

        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var A: A_Field
    }

    /// Counter wrap value
    @RegisterBank(offset: 0x0060)
    public var CH4_TOP: Register<CH4_TOP_Descriptor>


    @Register(bitWidth: 32)
    public struct CH4_TOP_Descriptor {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var CH4_TOP: CH4_TOP_Field
    }

    /// Control and status register
    @RegisterBank(offset: 0x0064)
    public var CH5_CSR: Register<CH5_CSR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH5_CSR_Descriptor {
        /// Advance the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running
        /// at less than full speed (div_int + div_frac / 16 > 1)
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var PH_ADV: PH_ADV_Field

        /// Retard the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running.
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var PH_RET: PH_RET_Field

        @ReadWrite(bits: 4..<6, as: DIVMODE_Values.self)
        public var DIVMODE: DIVMODE_Field

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
        public var B_INV: B_INV_Field

        /// Invert output A
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var A_INV: A_INV_Field

        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var PH_CORRECT: PH_CORRECT_Field

        /// Enable the PWM channel.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var EN: EN_Field
    }

    /// INT and FRAC form a fixed-point fractional number.
    /// Counting rate is system clock frequency divided by this number.
    /// Fractional division uses simple 1st-order sigma-delta.
    @RegisterBank(offset: 0x0068)
    public var CH5_DIV: Register<CH5_DIV_Descriptor>


    @Register(bitWidth: 32)
    public struct CH5_DIV_Descriptor {
        @ReadWrite(bits: 4..<12, as: BitField8.self)
        public var INT: INT_Field

        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var FRAC: FRAC_Field
    }

    /// Direct access to the PWM counter
    @RegisterBank(offset: 0x006c)
    public var CH5_CTR: Register<CH5_CTR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH5_CTR_Descriptor {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var CH5_CTR: CH5_CTR_Field
    }

    /// Counter compare values
    @RegisterBank(offset: 0x0070)
    public var CH5_CC: Register<CH5_CC_Descriptor>


    @Register(bitWidth: 32)
    public struct CH5_CC_Descriptor {
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var B: B_Field

        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var A: A_Field
    }

    /// Counter wrap value
    @RegisterBank(offset: 0x0074)
    public var CH5_TOP: Register<CH5_TOP_Descriptor>


    @Register(bitWidth: 32)
    public struct CH5_TOP_Descriptor {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var CH5_TOP: CH5_TOP_Field
    }

    /// Control and status register
    @RegisterBank(offset: 0x0078)
    public var CH6_CSR: Register<CH6_CSR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH6_CSR_Descriptor {
        /// Advance the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running
        /// at less than full speed (div_int + div_frac / 16 > 1)
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var PH_ADV: PH_ADV_Field

        /// Retard the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running.
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var PH_RET: PH_RET_Field

        @ReadWrite(bits: 4..<6, as: DIVMODE_Values.self)
        public var DIVMODE: DIVMODE_Field

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
        public var B_INV: B_INV_Field

        /// Invert output A
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var A_INV: A_INV_Field

        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var PH_CORRECT: PH_CORRECT_Field

        /// Enable the PWM channel.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var EN: EN_Field
    }

    /// INT and FRAC form a fixed-point fractional number.
    /// Counting rate is system clock frequency divided by this number.
    /// Fractional division uses simple 1st-order sigma-delta.
    @RegisterBank(offset: 0x007c)
    public var CH6_DIV: Register<CH6_DIV_Descriptor>


    @Register(bitWidth: 32)
    public struct CH6_DIV_Descriptor {
        @ReadWrite(bits: 4..<12, as: BitField8.self)
        public var INT: INT_Field

        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var FRAC: FRAC_Field
    }

    /// Direct access to the PWM counter
    @RegisterBank(offset: 0x0080)
    public var CH6_CTR: Register<CH6_CTR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH6_CTR_Descriptor {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var CH6_CTR: CH6_CTR_Field
    }

    /// Counter compare values
    @RegisterBank(offset: 0x0084)
    public var CH6_CC: Register<CH6_CC_Descriptor>


    @Register(bitWidth: 32)
    public struct CH6_CC_Descriptor {
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var B: B_Field

        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var A: A_Field
    }

    /// Counter wrap value
    @RegisterBank(offset: 0x0088)
    public var CH6_TOP: Register<CH6_TOP_Descriptor>


    @Register(bitWidth: 32)
    public struct CH6_TOP_Descriptor {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var CH6_TOP: CH6_TOP_Field
    }

    /// Control and status register
    @RegisterBank(offset: 0x008c)
    public var CH7_CSR: Register<CH7_CSR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH7_CSR_Descriptor {
        /// Advance the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running
        /// at less than full speed (div_int + div_frac / 16 > 1)
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var PH_ADV: PH_ADV_Field

        /// Retard the phase of the counter by 1 count, while it is running.
        /// Self-clearing. Write a 1, and poll until low. Counter must be running.
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var PH_RET: PH_RET_Field

        @ReadWrite(bits: 4..<6, as: DIVMODE_Values.self)
        public var DIVMODE: DIVMODE_Field

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
        public var B_INV: B_INV_Field

        /// Invert output A
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var A_INV: A_INV_Field

        /// 1: Enable phase-correct modulation. 0: Trailing-edge
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var PH_CORRECT: PH_CORRECT_Field

        /// Enable the PWM channel.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var EN: EN_Field
    }

    /// INT and FRAC form a fixed-point fractional number.
    /// Counting rate is system clock frequency divided by this number.
    /// Fractional division uses simple 1st-order sigma-delta.
    @RegisterBank(offset: 0x0090)
    public var CH7_DIV: Register<CH7_DIV_Descriptor>


    @Register(bitWidth: 32)
    public struct CH7_DIV_Descriptor {
        @ReadWrite(bits: 4..<12, as: BitField8.self)
        public var INT: INT_Field

        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var FRAC: FRAC_Field
    }

    /// Direct access to the PWM counter
    @RegisterBank(offset: 0x0094)
    public var CH7_CTR: Register<CH7_CTR_Descriptor>


    @Register(bitWidth: 32)
    public struct CH7_CTR_Descriptor {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var CH7_CTR: CH7_CTR_Field
    }

    /// Counter compare values
    @RegisterBank(offset: 0x0098)
    public var CH7_CC: Register<CH7_CC_Descriptor>


    @Register(bitWidth: 32)
    public struct CH7_CC_Descriptor {
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var B: B_Field

        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var A: A_Field
    }

    /// Counter wrap value
    @RegisterBank(offset: 0x009c)
    public var CH7_TOP: Register<CH7_TOP_Descriptor>


    @Register(bitWidth: 32)
    public struct CH7_TOP_Descriptor {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var CH7_TOP: CH7_TOP_Field
    }

    /// This register aliases the CSR_EN bits for all channels.
    /// Writing to this register allows multiple channels to be enabled
    /// or disabled simultaneously, so they can run in perfect sync.
    /// For each channel, there is only one physical EN register bit,
    /// which can be accessed through here or CHx_CSR.
    @RegisterBank(offset: 0x00a0)
    public var EN: Register<EN_Descriptor>


    @Register(bitWidth: 32)
    public struct EN_Descriptor {
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var CH7: CH7_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var CH6: CH6_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var CH5: CH5_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var CH4: CH4_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var CH3: CH3_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var CH2: CH2_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var CH1: CH1_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var CH0: CH0_Field
    }

    /// Raw Interrupts
    @RegisterBank(offset: 0x00a4)
    public var INTR: Register<INTR_Descriptor>


    @Register(bitWidth: 32)
    public struct INTR_Descriptor {
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var CH7: CH7_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var CH6: CH6_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var CH5: CH5_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var CH4: CH4_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var CH3: CH3_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var CH2: CH2_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var CH1: CH1_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var CH0: CH0_Field
    }

    /// Interrupt Enable
    @RegisterBank(offset: 0x00a8)
    public var INTE: Register<INTE_Descriptor>


    @Register(bitWidth: 32)
    public struct INTE_Descriptor {
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var CH7: CH7_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var CH6: CH6_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var CH5: CH5_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var CH4: CH4_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var CH3: CH3_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var CH2: CH2_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var CH1: CH1_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var CH0: CH0_Field
    }

    /// Interrupt Force
    @RegisterBank(offset: 0x00ac)
    public var INTF: Register<INTF_Descriptor>


    @Register(bitWidth: 32)
    public struct INTF_Descriptor {
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var CH7: CH7_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var CH6: CH6_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var CH5: CH5_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var CH4: CH4_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var CH3: CH3_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var CH2: CH2_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var CH1: CH1_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var CH0: CH0_Field
    }

    /// Interrupt status after masking & forcing
    @RegisterBank(offset: 0x00b0)
    public var INTS: Register<INTS_Descriptor>


    @Register(bitWidth: 32)
    public struct INTS_Descriptor {
        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var CH7: CH7_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var CH6: CH6_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var CH5: CH5_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var CH4: CH4_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var CH3: CH3_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var CH2: CH2_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var CH1: CH1_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var CH0: CH0_Field
    }
}
