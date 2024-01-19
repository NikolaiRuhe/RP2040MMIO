import MMIO
import MMIOExtensions

@RegisterBank
public struct PLL_USB {

    public static var `default`: Self { .init(unsafeAddress: 0x4002c000) }

    /// Control and Status
    /// GENERAL CONSTRAINTS:
    /// Reference clock frequency min=5MHz, max=800MHz
    /// Feedback divider min=16, max=320
    /// VCO frequency min=750MHz, max=1600MHz
    @RegisterBank(offset: 0x0000)
    public var CS: Register<CS_Descriptor>


    @Register(bitWidth: 32)
    public struct CS_Descriptor {
        /// PLL is locked
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var LOCK: LOCK_Field

        /// Passes the reference clock to the output instead of the divided VCO. The VCO continues to run so the user can switch between the reference clock and the divided VCO but the output will glitch when doing so.
        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var BYPASS: BYPASS_Field

        /// Divides the PLL input reference clock.
        /// Behaviour is undefined for div=0.
        /// PLL output will be unpredictable during refdiv changes, wait for lock=1 before using it.
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var REFDIV: REFDIV_Field
    }

    /// Controls the PLL power modes.
    @RegisterBank(offset: 0x0004)
    public var PWR: Register<PWR_Descriptor>


    @Register(bitWidth: 32)
    public struct PWR_Descriptor {
        /// PLL VCO powerdown
        /// To save power set high when PLL output not required or bypass=1.
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var VCOPD: VCOPD_Field

        /// PLL post divider powerdown
        /// To save power set high when PLL output not required or bypass=1.
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var POSTDIVPD: POSTDIVPD_Field

        /// PLL DSM powerdown
        /// Nothing is achieved by setting this low.
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var DSMPD: DSMPD_Field

        /// PLL powerdown
        /// To save power set high when PLL output not required.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var PD: PD_Field
    }

    /// Feedback divisor
    /// (note: this PLL does not support fractional division)
    @RegisterBank(offset: 0x0008)
    public var FBDIV_INT: Register<FBDIV_INT_Descriptor>


    @Register(bitWidth: 32)
    public struct FBDIV_INT_Descriptor {
        /// see ctrl reg description for constraints
        @ReadWrite(bits: 0..<12, as: BitField12.self)
        public var FBDIV_INT: FBDIV_INT_Field
    }

    /// Controls the PLL post dividers for the primary output
    /// (note: this PLL does not have a secondary output)
    /// the primary output is driven from VCO divided by postdiv1*postdiv2
    @RegisterBank(offset: 0x000c)
    public var PRIM: Register<PRIM_Descriptor>


    @Register(bitWidth: 32)
    public struct PRIM_Descriptor {
        /// divide by 1-7
        @ReadWrite(bits: 16..<19, as: BitField3.self)
        public var POSTDIV1: POSTDIV1_Field

        /// divide by 1-7
        @ReadWrite(bits: 12..<15, as: BitField3.self)
        public var POSTDIV2: POSTDIV2_Field
    }
}
