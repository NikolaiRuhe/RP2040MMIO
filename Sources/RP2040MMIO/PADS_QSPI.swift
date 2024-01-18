import MMIO
import MMIOExtensions

@RegisterBank
public struct PADS_QSPI {

    public static var `default`: Self { .init(unsafeAddress: 0x40020000) }

    /// Voltage select. Per bank control
    @RegisterBank(offset: 0x0000)
    public var voltage_select: Register<VOLTAGE_SELECT>

    @Register(bitWidth: 32)
    public struct VOLTAGE_SELECT {
        @ReadWrite(bits: 0..<1, as: VOLTAGE_SELECT_Values.self)
        public var voltage_select: VOLTAGE_SELECT_Field

        public enum VOLTAGE_SELECT_Values: UInt, BitFieldProjectable {
            /// Set voltage to 3.3V (DVDD >= 2V5)
            case VOLTAGE_SELECT_3v3 = 0
            /// Set voltage to 1.8V (DVDD <= 1V8)
            case VOLTAGE_SELECT_1v8 = 1

            public static var bitWidth: Int { 1 }
        }
    }

    /// Pad control register
    @RegisterBank(offset: 0x0004)
    public var gpio_qspi_sclk: Register<GPIO_QSPI_SCLK>

    @Register(bitWidth: 32)
    public struct GPIO_QSPI_SCLK {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var od: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var ie: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var drive: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var pue: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var pde: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var schmitt: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var slewfast: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x0008)
    public var gpio_qspi_sd0: Register<GPIO_QSPI_SD0>

    @Register(bitWidth: 32)
    public struct GPIO_QSPI_SD0 {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var od: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var ie: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var drive: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var pue: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var pde: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var schmitt: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var slewfast: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x000c)
    public var gpio_qspi_sd1: Register<GPIO_QSPI_SD1>

    @Register(bitWidth: 32)
    public struct GPIO_QSPI_SD1 {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var od: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var ie: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var drive: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var pue: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var pde: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var schmitt: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var slewfast: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x0010)
    public var gpio_qspi_sd2: Register<GPIO_QSPI_SD2>

    @Register(bitWidth: 32)
    public struct GPIO_QSPI_SD2 {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var od: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var ie: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var drive: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var pue: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var pde: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var schmitt: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var slewfast: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x0014)
    public var gpio_qspi_sd3: Register<GPIO_QSPI_SD3>

    @Register(bitWidth: 32)
    public struct GPIO_QSPI_SD3 {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var od: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var ie: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var drive: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var pue: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var pde: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var schmitt: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var slewfast: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x0018)
    public var gpio_qspi_ss: Register<GPIO_QSPI_SS>

    @Register(bitWidth: 32)
    public struct GPIO_QSPI_SS {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var od: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var ie: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var drive: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var pue: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var pde: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var schmitt: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var slewfast: SLEWFAST_Field
    }
}