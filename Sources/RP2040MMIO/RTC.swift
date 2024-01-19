import MMIO
import MMIOExtensions

/// Register block to control RTC
@RegisterBank
public struct RTC {

    public static var `default`: Self { .init(unsafeAddress: 0x4005c000) }

    /// Divider minus 1 for the 1 second counter. Safe to change the value when RTC is not enabled.
    @RegisterBank(offset: 0x0000)
    public var CLKDIV_M1: Register<CLKDIV_M1_Descriptor>


    @Register(bitWidth: 32)
    public struct CLKDIV_M1_Descriptor {
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var CLKDIV_M1: CLKDIV_M1_Field
    }

    /// RTC setup register 0
    @RegisterBank(offset: 0x0004)
    public var SETUP_0: Register<SETUP_0_Descriptor>


    @Register(bitWidth: 32)
    public struct SETUP_0_Descriptor {
        /// Year
        @ReadWrite(bits: 12..<24, as: BitField12.self)
        public var YEAR: YEAR_Field

        /// Month (1..12)
        @ReadWrite(bits: 8..<12, as: BitField4.self)
        public var MONTH: MONTH_Field

        /// Day of the month (1..31)
        @ReadWrite(bits: 0..<5, as: BitField5.self)
        public var DAY: DAY_Field
    }

    /// RTC setup register 1
    @RegisterBank(offset: 0x0008)
    public var SETUP_1: Register<SETUP_1_Descriptor>


    @Register(bitWidth: 32)
    public struct SETUP_1_Descriptor {
        /// Day of the week: 1-Monday...0-Sunday ISO 8601 mod 7
        @ReadWrite(bits: 24..<27, as: BitField3.self)
        public var DOTW: DOTW_Field

        /// Hours
        @ReadWrite(bits: 16..<21, as: BitField5.self)
        public var HOUR: HOUR_Field

        /// Minutes
        @ReadWrite(bits: 8..<14, as: BitField6.self)
        public var MIN: MIN_Field

        /// Seconds
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var SEC: SEC_Field
    }

    /// RTC Control and status
    @RegisterBank(offset: 0x000c)
    public var CTRL: Register<CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CTRL_Descriptor {
        /// If set, leapyear is forced off.
        /// Useful for years divisible by 100 but not by 400
        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var FORCE_NOTLEAPYEAR: FORCE_NOTLEAPYEAR_Field

        /// Load RTC
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var LOAD: LOAD_Field

        /// RTC enabled (running)
        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var RTC_ACTIVE: RTC_ACTIVE_Field

        /// Enable RTC
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var RTC_ENABLE: RTC_ENABLE_Field
    }

    /// Interrupt setup register 0
    @RegisterBank(offset: 0x0010)
    public var IRQ_SETUP_0: Register<IRQ_SETUP_0_Descriptor>


    @Register(bitWidth: 32)
    public struct IRQ_SETUP_0_Descriptor {
        @ReadOnly(bits: 29..<30, as: Bool.self)
        public var MATCH_ACTIVE: MATCH_ACTIVE_Field

        /// Global match enable. Don't change any other value while this one is enabled
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var MATCH_ENA: MATCH_ENA_Field

        /// Enable year matching
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var YEAR_ENA: YEAR_ENA_Field

        /// Enable month matching
        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var MONTH_ENA: MONTH_ENA_Field

        /// Enable day matching
        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var DAY_ENA: DAY_ENA_Field

        /// Year
        @ReadWrite(bits: 12..<24, as: BitField12.self)
        public var YEAR: YEAR_Field

        /// Month (1..12)
        @ReadWrite(bits: 8..<12, as: BitField4.self)
        public var MONTH: MONTH_Field

        /// Day of the month (1..31)
        @ReadWrite(bits: 0..<5, as: BitField5.self)
        public var DAY: DAY_Field
    }

    /// Interrupt setup register 1
    @RegisterBank(offset: 0x0014)
    public var IRQ_SETUP_1: Register<IRQ_SETUP_1_Descriptor>


    @Register(bitWidth: 32)
    public struct IRQ_SETUP_1_Descriptor {
        /// Enable day of the week matching
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var DOTW_ENA: DOTW_ENA_Field

        /// Enable hour matching
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var HOUR_ENA: HOUR_ENA_Field

        /// Enable minute matching
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var MIN_ENA: MIN_ENA_Field

        /// Enable second matching
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var SEC_ENA: SEC_ENA_Field

        /// Day of the week
        @ReadWrite(bits: 24..<27, as: BitField3.self)
        public var DOTW: DOTW_Field

        /// Hours
        @ReadWrite(bits: 16..<21, as: BitField5.self)
        public var HOUR: HOUR_Field

        /// Minutes
        @ReadWrite(bits: 8..<14, as: BitField6.self)
        public var MIN: MIN_Field

        /// Seconds
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var SEC: SEC_Field
    }

    /// RTC register 1.
    @RegisterBank(offset: 0x0018)
    public var RTC_1: Register<RTC_1_Descriptor>


    @Register(bitWidth: 32)
    public struct RTC_1_Descriptor {
        /// Year
        @ReadOnly(bits: 12..<24, as: BitField12.self)
        public var YEAR: YEAR_Field

        /// Month (1..12)
        @ReadOnly(bits: 8..<12, as: BitField4.self)
        public var MONTH: MONTH_Field

        /// Day of the month (1..31)
        @ReadOnly(bits: 0..<5, as: BitField5.self)
        public var DAY: DAY_Field
    }

    /// RTC register 0
    /// Read this before RTC 1!
    @RegisterBank(offset: 0x001c)
    public var RTC_0: Register<RTC_0_Descriptor>


    @Register(bitWidth: 32)
    public struct RTC_0_Descriptor {
        /// Day of the week
        @ReadOnly(bits: 24..<27, as: BitField3.self)
        public var DOTW: DOTW_Field

        /// Hours
        @ReadOnly(bits: 16..<21, as: BitField5.self)
        public var HOUR: HOUR_Field

        /// Minutes
        @ReadOnly(bits: 8..<14, as: BitField6.self)
        public var MIN: MIN_Field

        /// Seconds
        @ReadOnly(bits: 0..<6, as: BitField6.self)
        public var SEC: SEC_Field
    }

    /// Raw Interrupts
    @RegisterBank(offset: 0x0020)
    public var INTR: Register<INTR_Descriptor>


    @Register(bitWidth: 32)
    public struct INTR_Descriptor {
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var RTC: RTC_Field
    }

    /// Interrupt Enable
    @RegisterBank(offset: 0x0024)
    public var INTE: Register<INTE_Descriptor>


    @Register(bitWidth: 32)
    public struct INTE_Descriptor {
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var RTC: RTC_Field
    }

    /// Interrupt Force
    @RegisterBank(offset: 0x0028)
    public var INTF: Register<INTF_Descriptor>


    @Register(bitWidth: 32)
    public struct INTF_Descriptor {
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var RTC: RTC_Field
    }

    /// Interrupt status after masking & forcing
    @RegisterBank(offset: 0x002c)
    public var INTS: Register<INTS_Descriptor>


    @Register(bitWidth: 32)
    public struct INTS_Descriptor {
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var RTC: RTC_Field
    }
}
