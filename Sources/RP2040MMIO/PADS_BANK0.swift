import MMIO
import MMIOExtensions

@RegisterBank
public struct PADS_BANK0 {

    public static var `default`: Self { .init(unsafeAddress: 0x4001c000) }

    /// Voltage select. Per bank control
    @RegisterBank(offset: 0x0000)
    public var VOLTAGE_SELECT: Register<VOLTAGE_SELECT_Descriptor>


    @Register(bitWidth: 32)
    public struct VOLTAGE_SELECT_Descriptor {
        @ReadWrite(bits: 0..<1, as: VOLTAGE_SELECT_Values.self)
        public var VOLTAGE_SELECT: VOLTAGE_SELECT_Field

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
    public var GPIO0: Register<GPIO0_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO0_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x0008)
    public var GPIO1: Register<GPIO1_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO1_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x000c)
    public var GPIO2: Register<GPIO2_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO2_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x0010)
    public var GPIO3: Register<GPIO3_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO3_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x0014)
    public var GPIO4: Register<GPIO4_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO4_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x0018)
    public var GPIO5: Register<GPIO5_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO5_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x001c)
    public var GPIO6: Register<GPIO6_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO6_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x0020)
    public var GPIO7: Register<GPIO7_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO7_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x0024)
    public var GPIO8: Register<GPIO8_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO8_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x0028)
    public var GPIO9: Register<GPIO9_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO9_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x002c)
    public var GPIO10: Register<GPIO10_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO10_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x0030)
    public var GPIO11: Register<GPIO11_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO11_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x0034)
    public var GPIO12: Register<GPIO12_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO12_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x0038)
    public var GPIO13: Register<GPIO13_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO13_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x003c)
    public var GPIO14: Register<GPIO14_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO14_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x0040)
    public var GPIO15: Register<GPIO15_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO15_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x0044)
    public var GPIO16: Register<GPIO16_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO16_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x0048)
    public var GPIO17: Register<GPIO17_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO17_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x004c)
    public var GPIO18: Register<GPIO18_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO18_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x0050)
    public var GPIO19: Register<GPIO19_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO19_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x0054)
    public var GPIO20: Register<GPIO20_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO20_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x0058)
    public var GPIO21: Register<GPIO21_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO21_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x005c)
    public var GPIO22: Register<GPIO22_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO22_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x0060)
    public var GPIO23: Register<GPIO23_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO23_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x0064)
    public var GPIO24: Register<GPIO24_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO24_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x0068)
    public var GPIO25: Register<GPIO25_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO25_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x006c)
    public var GPIO26: Register<GPIO26_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO26_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x0070)
    public var GPIO27: Register<GPIO27_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO27_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x0074)
    public var GPIO28: Register<GPIO28_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO28_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x0078)
    public var GPIO29: Register<GPIO29_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO29_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x007c)
    public var SWCLK: Register<SWCLK_Descriptor>


    @Register(bitWidth: 32)
    public struct SWCLK_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }

    /// Pad control register
    @RegisterBank(offset: 0x0080)
    public var SWD: Register<SWD_Descriptor>


    @Register(bitWidth: 32)
    public struct SWD_Descriptor {
        /// Output disable. Has priority over output enable from peripherals
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var OD: OD_Field

        /// Input enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var IE: IE_Field

        /// Drive strength.
        @ReadWrite(bits: 4..<6, as: DRIVE_Values.self)
        public var DRIVE: DRIVE_Field

        public enum DRIVE_Values: UInt, BitFieldProjectable {
            case DRIVE_2mA = 0
            case DRIVE_4mA = 1
            case DRIVE_8mA = 2
            case DRIVE_12mA = 3

            public static var bitWidth: Int { 2 }
        }

        /// Pull up enable
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PUE: PUE_Field

        /// Pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PDE: PDE_Field

        /// Enable schmitt trigger
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SCHMITT: SCHMITT_Field

        /// Slew rate control. 1 = Fast, 0 = Slow
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SLEWFAST: SLEWFAST_Field
    }
}
