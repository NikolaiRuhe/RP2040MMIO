import MMIO
import MMIOExtensions

@RegisterBank
public struct PADS_BANK0 {

    public static var `default`: Self { .init(unsafeAddress: 0x4001c000) }

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
    public var gpio0: Register<GPIO0>

    @Register(bitWidth: 32)
    public struct GPIO0 {
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
    public var gpio1: Register<GPIO1>

    @Register(bitWidth: 32)
    public struct GPIO1 {
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
    public var gpio2: Register<GPIO2>

    @Register(bitWidth: 32)
    public struct GPIO2 {
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
    public var gpio3: Register<GPIO3>

    @Register(bitWidth: 32)
    public struct GPIO3 {
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
    public var gpio4: Register<GPIO4>

    @Register(bitWidth: 32)
    public struct GPIO4 {
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
    public var gpio5: Register<GPIO5>

    @Register(bitWidth: 32)
    public struct GPIO5 {
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
    @RegisterBank(offset: 0x001c)
    public var gpio6: Register<GPIO6>

    @Register(bitWidth: 32)
    public struct GPIO6 {
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
    @RegisterBank(offset: 0x0020)
    public var gpio7: Register<GPIO7>

    @Register(bitWidth: 32)
    public struct GPIO7 {
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
    @RegisterBank(offset: 0x0024)
    public var gpio8: Register<GPIO8>

    @Register(bitWidth: 32)
    public struct GPIO8 {
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
    @RegisterBank(offset: 0x0028)
    public var gpio9: Register<GPIO9>

    @Register(bitWidth: 32)
    public struct GPIO9 {
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
    @RegisterBank(offset: 0x002c)
    public var gpio10: Register<GPIO10>

    @Register(bitWidth: 32)
    public struct GPIO10 {
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
    @RegisterBank(offset: 0x0030)
    public var gpio11: Register<GPIO11>

    @Register(bitWidth: 32)
    public struct GPIO11 {
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
    @RegisterBank(offset: 0x0034)
    public var gpio12: Register<GPIO12>

    @Register(bitWidth: 32)
    public struct GPIO12 {
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
    @RegisterBank(offset: 0x0038)
    public var gpio13: Register<GPIO13>

    @Register(bitWidth: 32)
    public struct GPIO13 {
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
    @RegisterBank(offset: 0x003c)
    public var gpio14: Register<GPIO14>

    @Register(bitWidth: 32)
    public struct GPIO14 {
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
    @RegisterBank(offset: 0x0040)
    public var gpio15: Register<GPIO15>

    @Register(bitWidth: 32)
    public struct GPIO15 {
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
    @RegisterBank(offset: 0x0044)
    public var gpio16: Register<GPIO16>

    @Register(bitWidth: 32)
    public struct GPIO16 {
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
    @RegisterBank(offset: 0x0048)
    public var gpio17: Register<GPIO17>

    @Register(bitWidth: 32)
    public struct GPIO17 {
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
    @RegisterBank(offset: 0x004c)
    public var gpio18: Register<GPIO18>

    @Register(bitWidth: 32)
    public struct GPIO18 {
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
    @RegisterBank(offset: 0x0050)
    public var gpio19: Register<GPIO19>

    @Register(bitWidth: 32)
    public struct GPIO19 {
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
    @RegisterBank(offset: 0x0054)
    public var gpio20: Register<GPIO20>

    @Register(bitWidth: 32)
    public struct GPIO20 {
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
    @RegisterBank(offset: 0x0058)
    public var gpio21: Register<GPIO21>

    @Register(bitWidth: 32)
    public struct GPIO21 {
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
    @RegisterBank(offset: 0x005c)
    public var gpio22: Register<GPIO22>

    @Register(bitWidth: 32)
    public struct GPIO22 {
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
    @RegisterBank(offset: 0x0060)
    public var gpio23: Register<GPIO23>

    @Register(bitWidth: 32)
    public struct GPIO23 {
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
    @RegisterBank(offset: 0x0064)
    public var gpio24: Register<GPIO24>

    @Register(bitWidth: 32)
    public struct GPIO24 {
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
    @RegisterBank(offset: 0x0068)
    public var gpio25: Register<GPIO25>

    @Register(bitWidth: 32)
    public struct GPIO25 {
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
    @RegisterBank(offset: 0x006c)
    public var gpio26: Register<GPIO26>

    @Register(bitWidth: 32)
    public struct GPIO26 {
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
    @RegisterBank(offset: 0x0070)
    public var gpio27: Register<GPIO27>

    @Register(bitWidth: 32)
    public struct GPIO27 {
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
    @RegisterBank(offset: 0x0074)
    public var gpio28: Register<GPIO28>

    @Register(bitWidth: 32)
    public struct GPIO28 {
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
    @RegisterBank(offset: 0x0078)
    public var gpio29: Register<GPIO29>

    @Register(bitWidth: 32)
    public struct GPIO29 {
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
    @RegisterBank(offset: 0x007c)
    public var swclk: Register<SWCLK>

    @Register(bitWidth: 32)
    public struct SWCLK {
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
    @RegisterBank(offset: 0x0080)
    public var swd: Register<SWD>

    @Register(bitWidth: 32)
    public struct SWD {
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
