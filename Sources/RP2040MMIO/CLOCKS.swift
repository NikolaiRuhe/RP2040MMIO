import MMIO
import MMIOExtensions

@RegisterBank
public struct CLOCKS {

    public static var `default`: Self { .init(unsafeAddress: 0x40008000) }

    /// Clock control, can be changed on-the-fly (except for auxsrc)
    @RegisterBank(offset: 0x0000)
    public var CLK_GPOUT0_CTRL: Register<CLK_GPOUT0_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CLK_GPOUT0_CTRL_Descriptor {
        /// An edge on this signal shifts the phase of the output by 1 cycle of the input clock
        /// This can be done at any time
        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var NUDGE: NUDGE_Field

        /// This delays the enable signal by up to 3 cycles of the input clock
        /// This must be set before the clock is enabled to have any effect
        @ReadWrite(bits: 16..<18, as: BitField2.self)
        public var PHASE: PHASE_Field

        /// Enables duty cycle correction for odd divisors
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var DC50: DC50_Field

        /// Starts and stops the clock generator cleanly
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var ENABLE: ENABLE_Field

        /// Asynchronously kills the clock generator
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var KILL: KILL_Field

        /// Selects the auxiliary clock source, will glitch when switching
        @ReadWrite(bits: 5..<9, as: AUXSRC_Values.self)
        public var AUXSRC: AUXSRC_Field

        public enum AUXSRC_Values: UInt, BitFieldProjectable {
            case AUXSRC_clksrc_pll_sys = 0
            case AUXSRC_clksrc_gpin0 = 1
            case AUXSRC_clksrc_gpin1 = 2
            case AUXSRC_clksrc_pll_usb = 3
            case AUXSRC_rosc_clksrc = 4
            case AUXSRC_xosc_clksrc = 5
            case AUXSRC_clk_sys = 6
            case AUXSRC_clk_usb = 7
            case AUXSRC_clk_adc = 8
            case AUXSRC_clk_rtc = 9
            case AUXSRC_clk_ref = 10

            public static var bitWidth: Int { 4 }
        }
    }

    /// Clock divisor, can be changed on-the-fly
    @RegisterBank(offset: 0x0004)
    public var CLK_GPOUT0_DIV: Register<CLK_GPOUT0_DIV_Descriptor>


    @Register(bitWidth: 32)
    public struct CLK_GPOUT0_DIV_Descriptor {
        /// Integer component of the divisor, 0 -> divide by 2^16
        @ReadWrite(bits: 8..<32, as: BitField24.self)
        public var INT: INT_Field

        /// Fractional component of the divisor
        @ReadWrite(bits: 0..<8, as: BitField8.self)
        public var FRAC: FRAC_Field
    }

    /// Indicates which SRC is currently selected by the glitchless mux (one-hot).
    /// This slice does not have a glitchless mux (only the AUX_SRC field is present, not SRC) so this register is hardwired to 0x1.
    @RegisterBank(offset: 0x0008)
    public var CLK_GPOUT0_SELECTED: Register<CLK_GPOUT0_SELECTED_Descriptor>


    @Register(bitWidth: 32)
    public struct CLK_GPOUT0_SELECTED_Descriptor {}

    /// Clock control, can be changed on-the-fly (except for auxsrc)
    @RegisterBank(offset: 0x000c)
    public var CLK_GPOUT1_CTRL: Register<CLK_GPOUT1_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CLK_GPOUT1_CTRL_Descriptor {
        /// An edge on this signal shifts the phase of the output by 1 cycle of the input clock
        /// This can be done at any time
        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var NUDGE: NUDGE_Field

        /// This delays the enable signal by up to 3 cycles of the input clock
        /// This must be set before the clock is enabled to have any effect
        @ReadWrite(bits: 16..<18, as: BitField2.self)
        public var PHASE: PHASE_Field

        /// Enables duty cycle correction for odd divisors
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var DC50: DC50_Field

        /// Starts and stops the clock generator cleanly
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var ENABLE: ENABLE_Field

        /// Asynchronously kills the clock generator
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var KILL: KILL_Field

        /// Selects the auxiliary clock source, will glitch when switching
        @ReadWrite(bits: 5..<9, as: AUXSRC_Values.self)
        public var AUXSRC: AUXSRC_Field

        public enum AUXSRC_Values: UInt, BitFieldProjectable {
            case AUXSRC_clksrc_pll_sys = 0
            case AUXSRC_clksrc_gpin0 = 1
            case AUXSRC_clksrc_gpin1 = 2
            case AUXSRC_clksrc_pll_usb = 3
            case AUXSRC_rosc_clksrc = 4
            case AUXSRC_xosc_clksrc = 5
            case AUXSRC_clk_sys = 6
            case AUXSRC_clk_usb = 7
            case AUXSRC_clk_adc = 8
            case AUXSRC_clk_rtc = 9
            case AUXSRC_clk_ref = 10

            public static var bitWidth: Int { 4 }
        }
    }

    /// Clock divisor, can be changed on-the-fly
    @RegisterBank(offset: 0x0010)
    public var CLK_GPOUT1_DIV: Register<CLK_GPOUT1_DIV_Descriptor>


    @Register(bitWidth: 32)
    public struct CLK_GPOUT1_DIV_Descriptor {
        /// Integer component of the divisor, 0 -> divide by 2^16
        @ReadWrite(bits: 8..<32, as: BitField24.self)
        public var INT: INT_Field

        /// Fractional component of the divisor
        @ReadWrite(bits: 0..<8, as: BitField8.self)
        public var FRAC: FRAC_Field
    }

    /// Indicates which SRC is currently selected by the glitchless mux (one-hot).
    /// This slice does not have a glitchless mux (only the AUX_SRC field is present, not SRC) so this register is hardwired to 0x1.
    @RegisterBank(offset: 0x0014)
    public var CLK_GPOUT1_SELECTED: Register<CLK_GPOUT1_SELECTED_Descriptor>


    @Register(bitWidth: 32)
    public struct CLK_GPOUT1_SELECTED_Descriptor {}

    /// Clock control, can be changed on-the-fly (except for auxsrc)
    @RegisterBank(offset: 0x0018)
    public var CLK_GPOUT2_CTRL: Register<CLK_GPOUT2_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CLK_GPOUT2_CTRL_Descriptor {
        /// An edge on this signal shifts the phase of the output by 1 cycle of the input clock
        /// This can be done at any time
        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var NUDGE: NUDGE_Field

        /// This delays the enable signal by up to 3 cycles of the input clock
        /// This must be set before the clock is enabled to have any effect
        @ReadWrite(bits: 16..<18, as: BitField2.self)
        public var PHASE: PHASE_Field

        /// Enables duty cycle correction for odd divisors
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var DC50: DC50_Field

        /// Starts and stops the clock generator cleanly
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var ENABLE: ENABLE_Field

        /// Asynchronously kills the clock generator
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var KILL: KILL_Field

        /// Selects the auxiliary clock source, will glitch when switching
        @ReadWrite(bits: 5..<9, as: AUXSRC_Values.self)
        public var AUXSRC: AUXSRC_Field

        public enum AUXSRC_Values: UInt, BitFieldProjectable {
            case AUXSRC_clksrc_pll_sys = 0
            case AUXSRC_clksrc_gpin0 = 1
            case AUXSRC_clksrc_gpin1 = 2
            case AUXSRC_clksrc_pll_usb = 3
            case AUXSRC_rosc_clksrc_ph = 4
            case AUXSRC_xosc_clksrc = 5
            case AUXSRC_clk_sys = 6
            case AUXSRC_clk_usb = 7
            case AUXSRC_clk_adc = 8
            case AUXSRC_clk_rtc = 9
            case AUXSRC_clk_ref = 10

            public static var bitWidth: Int { 4 }
        }
    }

    /// Clock divisor, can be changed on-the-fly
    @RegisterBank(offset: 0x001c)
    public var CLK_GPOUT2_DIV: Register<CLK_GPOUT2_DIV_Descriptor>


    @Register(bitWidth: 32)
    public struct CLK_GPOUT2_DIV_Descriptor {
        /// Integer component of the divisor, 0 -> divide by 2^16
        @ReadWrite(bits: 8..<32, as: BitField24.self)
        public var INT: INT_Field

        /// Fractional component of the divisor
        @ReadWrite(bits: 0..<8, as: BitField8.self)
        public var FRAC: FRAC_Field
    }

    /// Indicates which SRC is currently selected by the glitchless mux (one-hot).
    /// This slice does not have a glitchless mux (only the AUX_SRC field is present, not SRC) so this register is hardwired to 0x1.
    @RegisterBank(offset: 0x0020)
    public var CLK_GPOUT2_SELECTED: Register<CLK_GPOUT2_SELECTED_Descriptor>


    @Register(bitWidth: 32)
    public struct CLK_GPOUT2_SELECTED_Descriptor {}

    /// Clock control, can be changed on-the-fly (except for auxsrc)
    @RegisterBank(offset: 0x0024)
    public var CLK_GPOUT3_CTRL: Register<CLK_GPOUT3_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CLK_GPOUT3_CTRL_Descriptor {
        /// An edge on this signal shifts the phase of the output by 1 cycle of the input clock
        /// This can be done at any time
        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var NUDGE: NUDGE_Field

        /// This delays the enable signal by up to 3 cycles of the input clock
        /// This must be set before the clock is enabled to have any effect
        @ReadWrite(bits: 16..<18, as: BitField2.self)
        public var PHASE: PHASE_Field

        /// Enables duty cycle correction for odd divisors
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var DC50: DC50_Field

        /// Starts and stops the clock generator cleanly
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var ENABLE: ENABLE_Field

        /// Asynchronously kills the clock generator
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var KILL: KILL_Field

        /// Selects the auxiliary clock source, will glitch when switching
        @ReadWrite(bits: 5..<9, as: AUXSRC_Values.self)
        public var AUXSRC: AUXSRC_Field

        public enum AUXSRC_Values: UInt, BitFieldProjectable {
            case AUXSRC_clksrc_pll_sys = 0
            case AUXSRC_clksrc_gpin0 = 1
            case AUXSRC_clksrc_gpin1 = 2
            case AUXSRC_clksrc_pll_usb = 3
            case AUXSRC_rosc_clksrc_ph = 4
            case AUXSRC_xosc_clksrc = 5
            case AUXSRC_clk_sys = 6
            case AUXSRC_clk_usb = 7
            case AUXSRC_clk_adc = 8
            case AUXSRC_clk_rtc = 9
            case AUXSRC_clk_ref = 10

            public static var bitWidth: Int { 4 }
        }
    }

    /// Clock divisor, can be changed on-the-fly
    @RegisterBank(offset: 0x0028)
    public var CLK_GPOUT3_DIV: Register<CLK_GPOUT3_DIV_Descriptor>


    @Register(bitWidth: 32)
    public struct CLK_GPOUT3_DIV_Descriptor {
        /// Integer component of the divisor, 0 -> divide by 2^16
        @ReadWrite(bits: 8..<32, as: BitField24.self)
        public var INT: INT_Field

        /// Fractional component of the divisor
        @ReadWrite(bits: 0..<8, as: BitField8.self)
        public var FRAC: FRAC_Field
    }

    /// Indicates which SRC is currently selected by the glitchless mux (one-hot).
    /// This slice does not have a glitchless mux (only the AUX_SRC field is present, not SRC) so this register is hardwired to 0x1.
    @RegisterBank(offset: 0x002c)
    public var CLK_GPOUT3_SELECTED: Register<CLK_GPOUT3_SELECTED_Descriptor>


    @Register(bitWidth: 32)
    public struct CLK_GPOUT3_SELECTED_Descriptor {}

    /// Clock control, can be changed on-the-fly (except for auxsrc)
    @RegisterBank(offset: 0x0030)
    public var CLK_REF_CTRL: Register<CLK_REF_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CLK_REF_CTRL_Descriptor {
        /// Selects the auxiliary clock source, will glitch when switching
        @ReadWrite(bits: 5..<7, as: AUXSRC_Values.self)
        public var AUXSRC: AUXSRC_Field

        public enum AUXSRC_Values: UInt, BitFieldProjectable {
            case AUXSRC_clksrc_pll_usb = 0
            case AUXSRC_clksrc_gpin0 = 1
            case AUXSRC_clksrc_gpin1 = 2

            public static var bitWidth: Int { 2 }
        }

        /// Selects the clock source glitchlessly, can be changed on-the-fly
        @ReadWrite(bits: 0..<2, as: SRC_Values.self)
        public var SRC: SRC_Field

        public enum SRC_Values: UInt, BitFieldProjectable {
            case SRC_rosc_clksrc_ph = 0
            case SRC_clksrc_clk_ref_aux = 1
            case SRC_xosc_clksrc = 2

            public static var bitWidth: Int { 2 }
        }
    }

    /// Clock divisor, can be changed on-the-fly
    @RegisterBank(offset: 0x0034)
    public var CLK_REF_DIV: Register<CLK_REF_DIV_Descriptor>


    @Register(bitWidth: 32)
    public struct CLK_REF_DIV_Descriptor {
        /// Integer component of the divisor, 0 -> divide by 2^16
        @ReadWrite(bits: 8..<10, as: BitField2.self)
        public var INT: INT_Field
    }

    /// Indicates which SRC is currently selected by the glitchless mux (one-hot).
    /// The glitchless multiplexer does not switch instantaneously (to avoid glitches), so software should poll this register to wait for the switch to complete. This register contains one decoded bit for each of the clock sources enumerated in the CTRL SRC field. At most one of these bits will be set at any time, indicating that clock is currently present at the output of the glitchless mux. Whilst switching is in progress, this register may briefly show all-0s.
    @RegisterBank(offset: 0x0038)
    public var CLK_REF_SELECTED: Register<CLK_REF_SELECTED_Descriptor>


    @Register(bitWidth: 32)
    public struct CLK_REF_SELECTED_Descriptor {}

    /// Clock control, can be changed on-the-fly (except for auxsrc)
    @RegisterBank(offset: 0x003c)
    public var CLK_SYS_CTRL: Register<CLK_SYS_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CLK_SYS_CTRL_Descriptor {
        /// Selects the auxiliary clock source, will glitch when switching
        @ReadWrite(bits: 5..<8, as: AUXSRC_Values.self)
        public var AUXSRC: AUXSRC_Field

        public enum AUXSRC_Values: UInt, BitFieldProjectable {
            case AUXSRC_clksrc_pll_sys = 0
            case AUXSRC_clksrc_pll_usb = 1
            case AUXSRC_rosc_clksrc = 2
            case AUXSRC_xosc_clksrc = 3
            case AUXSRC_clksrc_gpin0 = 4
            case AUXSRC_clksrc_gpin1 = 5

            public static var bitWidth: Int { 3 }
        }

        /// Selects the clock source glitchlessly, can be changed on-the-fly
        @ReadWrite(bits: 0..<1, as: SRC_Values.self)
        public var SRC: SRC_Field

        public enum SRC_Values: UInt, BitFieldProjectable {
            case SRC_clk_ref = 0
            case SRC_clksrc_clk_sys_aux = 1

            public static var bitWidth: Int { 1 }
        }
    }

    /// Clock divisor, can be changed on-the-fly
    @RegisterBank(offset: 0x0040)
    public var CLK_SYS_DIV: Register<CLK_SYS_DIV_Descriptor>


    @Register(bitWidth: 32)
    public struct CLK_SYS_DIV_Descriptor {
        /// Integer component of the divisor, 0 -> divide by 2^16
        @ReadWrite(bits: 8..<32, as: BitField24.self)
        public var INT: INT_Field

        /// Fractional component of the divisor
        @ReadWrite(bits: 0..<8, as: BitField8.self)
        public var FRAC: FRAC_Field
    }

    /// Indicates which SRC is currently selected by the glitchless mux (one-hot).
    /// The glitchless multiplexer does not switch instantaneously (to avoid glitches), so software should poll this register to wait for the switch to complete. This register contains one decoded bit for each of the clock sources enumerated in the CTRL SRC field. At most one of these bits will be set at any time, indicating that clock is currently present at the output of the glitchless mux. Whilst switching is in progress, this register may briefly show all-0s.
    @RegisterBank(offset: 0x0044)
    public var CLK_SYS_SELECTED: Register<CLK_SYS_SELECTED_Descriptor>


    @Register(bitWidth: 32)
    public struct CLK_SYS_SELECTED_Descriptor {}

    /// Clock control, can be changed on-the-fly (except for auxsrc)
    @RegisterBank(offset: 0x0048)
    public var CLK_PERI_CTRL: Register<CLK_PERI_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CLK_PERI_CTRL_Descriptor {
        /// Starts and stops the clock generator cleanly
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var ENABLE: ENABLE_Field

        /// Asynchronously kills the clock generator
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var KILL: KILL_Field

        /// Selects the auxiliary clock source, will glitch when switching
        @ReadWrite(bits: 5..<8, as: AUXSRC_Values.self)
        public var AUXSRC: AUXSRC_Field

        public enum AUXSRC_Values: UInt, BitFieldProjectable {
            case AUXSRC_clk_sys = 0
            case AUXSRC_clksrc_pll_sys = 1
            case AUXSRC_clksrc_pll_usb = 2
            case AUXSRC_rosc_clksrc_ph = 3
            case AUXSRC_xosc_clksrc = 4
            case AUXSRC_clksrc_gpin0 = 5
            case AUXSRC_clksrc_gpin1 = 6

            public static var bitWidth: Int { 3 }
        }
    }

    /// Indicates which SRC is currently selected by the glitchless mux (one-hot).
    /// This slice does not have a glitchless mux (only the AUX_SRC field is present, not SRC) so this register is hardwired to 0x1.
    @RegisterBank(offset: 0x0050)
    public var CLK_PERI_SELECTED: Register<CLK_PERI_SELECTED_Descriptor>


    @Register(bitWidth: 32)
    public struct CLK_PERI_SELECTED_Descriptor {}

    /// Clock control, can be changed on-the-fly (except for auxsrc)
    @RegisterBank(offset: 0x0054)
    public var CLK_USB_CTRL: Register<CLK_USB_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CLK_USB_CTRL_Descriptor {
        /// An edge on this signal shifts the phase of the output by 1 cycle of the input clock
        /// This can be done at any time
        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var NUDGE: NUDGE_Field

        /// This delays the enable signal by up to 3 cycles of the input clock
        /// This must be set before the clock is enabled to have any effect
        @ReadWrite(bits: 16..<18, as: BitField2.self)
        public var PHASE: PHASE_Field

        /// Starts and stops the clock generator cleanly
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var ENABLE: ENABLE_Field

        /// Asynchronously kills the clock generator
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var KILL: KILL_Field

        /// Selects the auxiliary clock source, will glitch when switching
        @ReadWrite(bits: 5..<8, as: AUXSRC_Values.self)
        public var AUXSRC: AUXSRC_Field

        public enum AUXSRC_Values: UInt, BitFieldProjectable {
            case AUXSRC_clksrc_pll_usb = 0
            case AUXSRC_clksrc_pll_sys = 1
            case AUXSRC_rosc_clksrc_ph = 2
            case AUXSRC_xosc_clksrc = 3
            case AUXSRC_clksrc_gpin0 = 4
            case AUXSRC_clksrc_gpin1 = 5

            public static var bitWidth: Int { 3 }
        }
    }

    /// Clock divisor, can be changed on-the-fly
    @RegisterBank(offset: 0x0058)
    public var CLK_USB_DIV: Register<CLK_USB_DIV_Descriptor>


    @Register(bitWidth: 32)
    public struct CLK_USB_DIV_Descriptor {
        /// Integer component of the divisor, 0 -> divide by 2^16
        @ReadWrite(bits: 8..<10, as: BitField2.self)
        public var INT: INT_Field
    }

    /// Indicates which SRC is currently selected by the glitchless mux (one-hot).
    /// This slice does not have a glitchless mux (only the AUX_SRC field is present, not SRC) so this register is hardwired to 0x1.
    @RegisterBank(offset: 0x005c)
    public var CLK_USB_SELECTED: Register<CLK_USB_SELECTED_Descriptor>


    @Register(bitWidth: 32)
    public struct CLK_USB_SELECTED_Descriptor {}

    /// Clock control, can be changed on-the-fly (except for auxsrc)
    @RegisterBank(offset: 0x0060)
    public var CLK_ADC_CTRL: Register<CLK_ADC_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CLK_ADC_CTRL_Descriptor {
        /// An edge on this signal shifts the phase of the output by 1 cycle of the input clock
        /// This can be done at any time
        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var NUDGE: NUDGE_Field

        /// This delays the enable signal by up to 3 cycles of the input clock
        /// This must be set before the clock is enabled to have any effect
        @ReadWrite(bits: 16..<18, as: BitField2.self)
        public var PHASE: PHASE_Field

        /// Starts and stops the clock generator cleanly
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var ENABLE: ENABLE_Field

        /// Asynchronously kills the clock generator
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var KILL: KILL_Field

        /// Selects the auxiliary clock source, will glitch when switching
        @ReadWrite(bits: 5..<8, as: AUXSRC_Values.self)
        public var AUXSRC: AUXSRC_Field

        public enum AUXSRC_Values: UInt, BitFieldProjectable {
            case AUXSRC_clksrc_pll_usb = 0
            case AUXSRC_clksrc_pll_sys = 1
            case AUXSRC_rosc_clksrc_ph = 2
            case AUXSRC_xosc_clksrc = 3
            case AUXSRC_clksrc_gpin0 = 4
            case AUXSRC_clksrc_gpin1 = 5

            public static var bitWidth: Int { 3 }
        }
    }

    /// Clock divisor, can be changed on-the-fly
    @RegisterBank(offset: 0x0064)
    public var CLK_ADC_DIV: Register<CLK_ADC_DIV_Descriptor>


    @Register(bitWidth: 32)
    public struct CLK_ADC_DIV_Descriptor {
        /// Integer component of the divisor, 0 -> divide by 2^16
        @ReadWrite(bits: 8..<10, as: BitField2.self)
        public var INT: INT_Field
    }

    /// Indicates which SRC is currently selected by the glitchless mux (one-hot).
    /// This slice does not have a glitchless mux (only the AUX_SRC field is present, not SRC) so this register is hardwired to 0x1.
    @RegisterBank(offset: 0x0068)
    public var CLK_ADC_SELECTED: Register<CLK_ADC_SELECTED_Descriptor>


    @Register(bitWidth: 32)
    public struct CLK_ADC_SELECTED_Descriptor {}

    /// Clock control, can be changed on-the-fly (except for auxsrc)
    @RegisterBank(offset: 0x006c)
    public var CLK_RTC_CTRL: Register<CLK_RTC_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CLK_RTC_CTRL_Descriptor {
        /// An edge on this signal shifts the phase of the output by 1 cycle of the input clock
        /// This can be done at any time
        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var NUDGE: NUDGE_Field

        /// This delays the enable signal by up to 3 cycles of the input clock
        /// This must be set before the clock is enabled to have any effect
        @ReadWrite(bits: 16..<18, as: BitField2.self)
        public var PHASE: PHASE_Field

        /// Starts and stops the clock generator cleanly
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var ENABLE: ENABLE_Field

        /// Asynchronously kills the clock generator
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var KILL: KILL_Field

        /// Selects the auxiliary clock source, will glitch when switching
        @ReadWrite(bits: 5..<8, as: AUXSRC_Values.self)
        public var AUXSRC: AUXSRC_Field

        public enum AUXSRC_Values: UInt, BitFieldProjectable {
            case AUXSRC_clksrc_pll_usb = 0
            case AUXSRC_clksrc_pll_sys = 1
            case AUXSRC_rosc_clksrc_ph = 2
            case AUXSRC_xosc_clksrc = 3
            case AUXSRC_clksrc_gpin0 = 4
            case AUXSRC_clksrc_gpin1 = 5

            public static var bitWidth: Int { 3 }
        }
    }

    /// Clock divisor, can be changed on-the-fly
    @RegisterBank(offset: 0x0070)
    public var CLK_RTC_DIV: Register<CLK_RTC_DIV_Descriptor>


    @Register(bitWidth: 32)
    public struct CLK_RTC_DIV_Descriptor {
        /// Integer component of the divisor, 0 -> divide by 2^16
        @ReadWrite(bits: 8..<32, as: BitField24.self)
        public var INT: INT_Field

        /// Fractional component of the divisor
        @ReadWrite(bits: 0..<8, as: BitField8.self)
        public var FRAC: FRAC_Field
    }

    /// Indicates which SRC is currently selected by the glitchless mux (one-hot).
    /// This slice does not have a glitchless mux (only the AUX_SRC field is present, not SRC) so this register is hardwired to 0x1.
    @RegisterBank(offset: 0x0074)
    public var CLK_RTC_SELECTED: Register<CLK_RTC_SELECTED_Descriptor>


    @Register(bitWidth: 32)
    public struct CLK_RTC_SELECTED_Descriptor {}

    @RegisterBank(offset: 0x0078)
    public var CLK_SYS_RESUS_CTRL: Register<CLK_SYS_RESUS_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CLK_SYS_RESUS_CTRL_Descriptor {
        /// For clearing the resus after the fault that triggered it has been corrected
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var CLEAR: CLEAR_Field

        /// Force a resus, for test purposes only
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var FRCE: FRCE_Field

        /// Enable resus
        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var ENABLE: ENABLE_Field

        /// This is expressed as a number of clk_ref cycles
        /// and must be >= 2x clk_ref_freq/min_clk_tst_freq
        @ReadWrite(bits: 0..<8, as: BitField8.self)
        public var TIMEOUT: TIMEOUT_Field
    }

    @RegisterBank(offset: 0x007c)
    public var CLK_SYS_RESUS_STATUS: Register<CLK_SYS_RESUS_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct CLK_SYS_RESUS_STATUS_Descriptor {
        /// Clock has been resuscitated, correct the error then send ctrl_clear=1
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var RESUSSED: RESUSSED_Field
    }

    /// Reference clock frequency in kHz
    @RegisterBank(offset: 0x0080)
    public var FC0_REF_KHZ: Register<FC0_REF_KHZ_Descriptor>


    @Register(bitWidth: 32)
    public struct FC0_REF_KHZ_Descriptor {
        @ReadWrite(bits: 0..<20, as: BitField20.self)
        public var FC0_REF_KHZ: FC0_REF_KHZ_Field
    }

    /// Minimum pass frequency in kHz. This is optional. Set to 0 if you are not using the pass/fail flags
    @RegisterBank(offset: 0x0084)
    public var FC0_MIN_KHZ: Register<FC0_MIN_KHZ_Descriptor>


    @Register(bitWidth: 32)
    public struct FC0_MIN_KHZ_Descriptor {
        @ReadWrite(bits: 0..<25, as: BitField25.self)
        public var FC0_MIN_KHZ: FC0_MIN_KHZ_Field
    }

    /// Maximum pass frequency in kHz. This is optional. Set to 0x1ffffff if you are not using the pass/fail flags
    @RegisterBank(offset: 0x0088)
    public var FC0_MAX_KHZ: Register<FC0_MAX_KHZ_Descriptor>


    @Register(bitWidth: 32)
    public struct FC0_MAX_KHZ_Descriptor {
        @ReadWrite(bits: 0..<25, as: BitField25.self)
        public var FC0_MAX_KHZ: FC0_MAX_KHZ_Field
    }

    /// Delays the start of frequency counting to allow the mux to settle
    /// Delay is measured in multiples of the reference clock period
    @RegisterBank(offset: 0x008c)
    public var FC0_DELAY: Register<FC0_DELAY_Descriptor>


    @Register(bitWidth: 32)
    public struct FC0_DELAY_Descriptor {
        @ReadWrite(bits: 0..<3, as: BitField3.self)
        public var FC0_DELAY: FC0_DELAY_Field
    }

    /// The test interval is 0.98us * 2**interval, but let's call it 1us * 2**interval
    /// The default gives a test interval of 250us
    @RegisterBank(offset: 0x0090)
    public var FC0_INTERVAL: Register<FC0_INTERVAL_Descriptor>


    @Register(bitWidth: 32)
    public struct FC0_INTERVAL_Descriptor {
        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var FC0_INTERVAL: FC0_INTERVAL_Field
    }

    /// Clock sent to frequency counter, set to 0 when not required
    /// Writing to this register initiates the frequency count
    @RegisterBank(offset: 0x0094)
    public var FC0_SRC: Register<FC0_SRC_Descriptor>


    @Register(bitWidth: 32)
    public struct FC0_SRC_Descriptor {
        @ReadWrite(bits: 0..<8, as: FC0_SRC_Values.self)
        public var FC0_SRC: FC0_SRC_Field

        public enum FC0_SRC_Values: UInt, BitFieldProjectable {
            case FC0_SRC_NULL = 0
            case FC0_SRC_pll_sys_clksrc_primary = 1
            case FC0_SRC_pll_usb_clksrc_primary = 2
            case FC0_SRC_rosc_clksrc = 3
            case FC0_SRC_rosc_clksrc_ph = 4
            case FC0_SRC_xosc_clksrc = 5
            case FC0_SRC_clksrc_gpin0 = 6
            case FC0_SRC_clksrc_gpin1 = 7
            case FC0_SRC_clk_ref = 8
            case FC0_SRC_clk_sys = 9
            case FC0_SRC_clk_peri = 10
            case FC0_SRC_clk_usb = 11
            case FC0_SRC_clk_adc = 12
            case FC0_SRC_clk_rtc = 13

            public static var bitWidth: Int { 8 }
        }
    }

    /// Frequency counter status
    @RegisterBank(offset: 0x0098)
    public var FC0_STATUS: Register<FC0_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct FC0_STATUS_Descriptor {
        /// Test clock stopped during test
        @ReadOnly(bits: 28..<29, as: Bool.self)
        public var DIED: DIED_Field

        /// Test clock faster than expected, only valid when status_done=1
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var FAST: FAST_Field

        /// Test clock slower than expected, only valid when status_done=1
        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var SLOW: SLOW_Field

        /// Test failed
        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var FAIL: FAIL_Field

        /// Waiting for test clock to start
        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var WAITING: WAITING_Field

        /// Test running
        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var RUNNING: RUNNING_Field

        /// Test complete
        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var DONE: DONE_Field

        /// Test passed
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var PASS: PASS_Field
    }

    /// Result of frequency measurement, only valid when status_done=1
    @RegisterBank(offset: 0x009c)
    public var FC0_RESULT: Register<FC0_RESULT_Descriptor>


    @Register(bitWidth: 32)
    public struct FC0_RESULT_Descriptor {
        @ReadOnly(bits: 5..<30, as: BitField25.self)
        public var KHZ: KHZ_Field

        @ReadOnly(bits: 0..<5, as: BitField5.self)
        public var FRAC: FRAC_Field
    }

    /// enable clock in wake mode
    @RegisterBank(offset: 0x00a0)
    public var WAKE_EN0: Register<WAKE_EN0_Descriptor>


    @Register(bitWidth: 32)
    public struct WAKE_EN0_Descriptor {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var clk_sys_sram3: clk_sys_sram3_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var clk_sys_sram2: clk_sys_sram2_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var clk_sys_sram1: clk_sys_sram1_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var clk_sys_sram0: clk_sys_sram0_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var clk_sys_spi1: clk_sys_spi1_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var clk_peri_spi1: clk_peri_spi1_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var clk_sys_spi0: clk_sys_spi0_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var clk_peri_spi0: clk_peri_spi0_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var clk_sys_sio: clk_sys_sio_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var clk_sys_rtc: clk_sys_rtc_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var clk_rtc_rtc: clk_rtc_rtc_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var clk_sys_rosc: clk_sys_rosc_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var clk_sys_rom: clk_sys_rom_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var clk_sys_resets: clk_sys_resets_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var clk_sys_pwm: clk_sys_pwm_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var clk_sys_psm: clk_sys_psm_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var clk_sys_pll_usb: clk_sys_pll_usb_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var clk_sys_pll_sys: clk_sys_pll_sys_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var clk_sys_pio1: clk_sys_pio1_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var clk_sys_pio0: clk_sys_pio0_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var clk_sys_pads: clk_sys_pads_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var clk_sys_vreg_and_chip_reset: clk_sys_vreg_and_chip_reset_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var clk_sys_jtag: clk_sys_jtag_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var clk_sys_io: clk_sys_io_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var clk_sys_i2c1: clk_sys_i2c1_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var clk_sys_i2c0: clk_sys_i2c0_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var clk_sys_dma: clk_sys_dma_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var clk_sys_busfabric: clk_sys_busfabric_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var clk_sys_busctrl: clk_sys_busctrl_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var clk_sys_adc: clk_sys_adc_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var clk_adc_adc: clk_adc_adc_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var clk_sys_clocks: clk_sys_clocks_Field
    }

    /// enable clock in wake mode
    @RegisterBank(offset: 0x00a4)
    public var WAKE_EN1: Register<WAKE_EN1_Descriptor>


    @Register(bitWidth: 32)
    public struct WAKE_EN1_Descriptor {
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var clk_sys_xosc: clk_sys_xosc_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var clk_sys_xip: clk_sys_xip_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var clk_sys_watchdog: clk_sys_watchdog_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var clk_usb_usbctrl: clk_usb_usbctrl_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var clk_sys_usbctrl: clk_sys_usbctrl_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var clk_sys_uart1: clk_sys_uart1_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var clk_peri_uart1: clk_peri_uart1_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var clk_sys_uart0: clk_sys_uart0_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var clk_peri_uart0: clk_peri_uart0_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var clk_sys_timer: clk_sys_timer_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var clk_sys_tbman: clk_sys_tbman_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var clk_sys_sysinfo: clk_sys_sysinfo_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var clk_sys_syscfg: clk_sys_syscfg_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var clk_sys_sram5: clk_sys_sram5_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var clk_sys_sram4: clk_sys_sram4_Field
    }

    /// enable clock in sleep mode
    @RegisterBank(offset: 0x00a8)
    public var SLEEP_EN0: Register<SLEEP_EN0_Descriptor>


    @Register(bitWidth: 32)
    public struct SLEEP_EN0_Descriptor {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var clk_sys_sram3: clk_sys_sram3_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var clk_sys_sram2: clk_sys_sram2_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var clk_sys_sram1: clk_sys_sram1_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var clk_sys_sram0: clk_sys_sram0_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var clk_sys_spi1: clk_sys_spi1_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var clk_peri_spi1: clk_peri_spi1_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var clk_sys_spi0: clk_sys_spi0_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var clk_peri_spi0: clk_peri_spi0_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var clk_sys_sio: clk_sys_sio_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var clk_sys_rtc: clk_sys_rtc_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var clk_rtc_rtc: clk_rtc_rtc_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var clk_sys_rosc: clk_sys_rosc_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var clk_sys_rom: clk_sys_rom_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var clk_sys_resets: clk_sys_resets_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var clk_sys_pwm: clk_sys_pwm_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var clk_sys_psm: clk_sys_psm_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var clk_sys_pll_usb: clk_sys_pll_usb_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var clk_sys_pll_sys: clk_sys_pll_sys_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var clk_sys_pio1: clk_sys_pio1_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var clk_sys_pio0: clk_sys_pio0_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var clk_sys_pads: clk_sys_pads_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var clk_sys_vreg_and_chip_reset: clk_sys_vreg_and_chip_reset_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var clk_sys_jtag: clk_sys_jtag_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var clk_sys_io: clk_sys_io_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var clk_sys_i2c1: clk_sys_i2c1_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var clk_sys_i2c0: clk_sys_i2c0_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var clk_sys_dma: clk_sys_dma_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var clk_sys_busfabric: clk_sys_busfabric_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var clk_sys_busctrl: clk_sys_busctrl_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var clk_sys_adc: clk_sys_adc_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var clk_adc_adc: clk_adc_adc_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var clk_sys_clocks: clk_sys_clocks_Field
    }

    /// enable clock in sleep mode
    @RegisterBank(offset: 0x00ac)
    public var SLEEP_EN1: Register<SLEEP_EN1_Descriptor>


    @Register(bitWidth: 32)
    public struct SLEEP_EN1_Descriptor {
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var clk_sys_xosc: clk_sys_xosc_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var clk_sys_xip: clk_sys_xip_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var clk_sys_watchdog: clk_sys_watchdog_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var clk_usb_usbctrl: clk_usb_usbctrl_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var clk_sys_usbctrl: clk_sys_usbctrl_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var clk_sys_uart1: clk_sys_uart1_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var clk_peri_uart1: clk_peri_uart1_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var clk_sys_uart0: clk_sys_uart0_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var clk_peri_uart0: clk_peri_uart0_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var clk_sys_timer: clk_sys_timer_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var clk_sys_tbman: clk_sys_tbman_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var clk_sys_sysinfo: clk_sys_sysinfo_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var clk_sys_syscfg: clk_sys_syscfg_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var clk_sys_sram5: clk_sys_sram5_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var clk_sys_sram4: clk_sys_sram4_Field
    }

    /// indicates the state of the clock enable
    @RegisterBank(offset: 0x00b0)
    public var ENABLED0: Register<ENABLED0_Descriptor>


    @Register(bitWidth: 32)
    public struct ENABLED0_Descriptor {
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var clk_sys_sram3: clk_sys_sram3_Field

        @ReadOnly(bits: 30..<31, as: Bool.self)
        public var clk_sys_sram2: clk_sys_sram2_Field

        @ReadOnly(bits: 29..<30, as: Bool.self)
        public var clk_sys_sram1: clk_sys_sram1_Field

        @ReadOnly(bits: 28..<29, as: Bool.self)
        public var clk_sys_sram0: clk_sys_sram0_Field

        @ReadOnly(bits: 27..<28, as: Bool.self)
        public var clk_sys_spi1: clk_sys_spi1_Field

        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var clk_peri_spi1: clk_peri_spi1_Field

        @ReadOnly(bits: 25..<26, as: Bool.self)
        public var clk_sys_spi0: clk_sys_spi0_Field

        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var clk_peri_spi0: clk_peri_spi0_Field

        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var clk_sys_sio: clk_sys_sio_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var clk_sys_rtc: clk_sys_rtc_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var clk_rtc_rtc: clk_rtc_rtc_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var clk_sys_rosc: clk_sys_rosc_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var clk_sys_rom: clk_sys_rom_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var clk_sys_resets: clk_sys_resets_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var clk_sys_pwm: clk_sys_pwm_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var clk_sys_psm: clk_sys_psm_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var clk_sys_pll_usb: clk_sys_pll_usb_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var clk_sys_pll_sys: clk_sys_pll_sys_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var clk_sys_pio1: clk_sys_pio1_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var clk_sys_pio0: clk_sys_pio0_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var clk_sys_pads: clk_sys_pads_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var clk_sys_vreg_and_chip_reset: clk_sys_vreg_and_chip_reset_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var clk_sys_jtag: clk_sys_jtag_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var clk_sys_io: clk_sys_io_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var clk_sys_i2c1: clk_sys_i2c1_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var clk_sys_i2c0: clk_sys_i2c0_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var clk_sys_dma: clk_sys_dma_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var clk_sys_busfabric: clk_sys_busfabric_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var clk_sys_busctrl: clk_sys_busctrl_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var clk_sys_adc: clk_sys_adc_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var clk_adc_adc: clk_adc_adc_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var clk_sys_clocks: clk_sys_clocks_Field
    }

    /// indicates the state of the clock enable
    @RegisterBank(offset: 0x00b4)
    public var ENABLED1: Register<ENABLED1_Descriptor>


    @Register(bitWidth: 32)
    public struct ENABLED1_Descriptor {
        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var clk_sys_xosc: clk_sys_xosc_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var clk_sys_xip: clk_sys_xip_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var clk_sys_watchdog: clk_sys_watchdog_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var clk_usb_usbctrl: clk_usb_usbctrl_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var clk_sys_usbctrl: clk_sys_usbctrl_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var clk_sys_uart1: clk_sys_uart1_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var clk_peri_uart1: clk_peri_uart1_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var clk_sys_uart0: clk_sys_uart0_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var clk_peri_uart0: clk_peri_uart0_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var clk_sys_timer: clk_sys_timer_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var clk_sys_tbman: clk_sys_tbman_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var clk_sys_sysinfo: clk_sys_sysinfo_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var clk_sys_syscfg: clk_sys_syscfg_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var clk_sys_sram5: clk_sys_sram5_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var clk_sys_sram4: clk_sys_sram4_Field
    }

    /// Raw Interrupts
    @RegisterBank(offset: 0x00b8)
    public var INTR: Register<INTR_Descriptor>


    @Register(bitWidth: 32)
    public struct INTR_Descriptor {
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var CLK_SYS_RESUS: CLK_SYS_RESUS_Field
    }

    /// Interrupt Enable
    @RegisterBank(offset: 0x00bc)
    public var INTE: Register<INTE_Descriptor>


    @Register(bitWidth: 32)
    public struct INTE_Descriptor {
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var CLK_SYS_RESUS: CLK_SYS_RESUS_Field
    }

    /// Interrupt Force
    @RegisterBank(offset: 0x00c0)
    public var INTF: Register<INTF_Descriptor>


    @Register(bitWidth: 32)
    public struct INTF_Descriptor {
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var CLK_SYS_RESUS: CLK_SYS_RESUS_Field
    }

    /// Interrupt status after masking & forcing
    @RegisterBank(offset: 0x00c4)
    public var INTS: Register<INTS_Descriptor>


    @Register(bitWidth: 32)
    public struct INTS_Descriptor {
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var CLK_SYS_RESUS: CLK_SYS_RESUS_Field
    }
}
