import MMIO
import MMIOExtensions

@RegisterBank
public struct IO_QSPI {

    public static var `default`: Self { .init(unsafeAddress: 0x40018000) }

    /// GPIO status
    @RegisterBank(offset: 0x0000)
    public var GPIO_QSPI_SCLK_STATUS: Register<GPIO_QSPI_SCLK_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO_QSPI_SCLK_STATUS_Descriptor {
        /// interrupt to processors, after override is applied
        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var IRQTOPROC: IRQTOPROC_Field

        /// interrupt from pad before override is applied
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var IRQFROMPAD: IRQFROMPAD_Field

        /// input signal to peripheral, after override is applied
        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var INTOPERI: INTOPERI_Field

        /// input signal from pad, before override is applied
        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var INFROMPAD: INFROMPAD_Field

        /// output enable to pad after register override is applied
        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var OETOPAD: OETOPAD_Field

        /// output enable from selected peripheral, before register override is applied
        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var OEFROMPERI: OEFROMPERI_Field

        /// output signal to pad after register override is applied
        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var OUTTOPAD: OUTTOPAD_Field

        /// output signal from selected peripheral, before register override is applied
        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var OUTFROMPERI: OUTFROMPERI_Field
    }

    /// GPIO control including function select and overrides.
    @RegisterBank(offset: 0x0004)
    public var GPIO_QSPI_SCLK_CTRL: Register<GPIO_QSPI_SCLK_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO_QSPI_SCLK_CTRL_Descriptor {
        @ReadWrite(bits: 28..<30, as: IRQOVER_Values.self)
        public var IRQOVER: IRQOVER_Field

        public enum IRQOVER_Values: UInt, BitFieldProjectable {
            /// don't invert the interrupt
            case IRQOVER_NORMAL = 0
            /// invert the interrupt
            case IRQOVER_INVERT = 1
            /// drive interrupt low
            case IRQOVER_LOW = 2
            /// drive interrupt high
            case IRQOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }

        @ReadWrite(bits: 16..<18, as: INOVER_Values.self)
        public var INOVER: INOVER_Field

        public enum INOVER_Values: UInt, BitFieldProjectable {
            /// don't invert the peri input
            case INOVER_NORMAL = 0
            /// invert the peri input
            case INOVER_INVERT = 1
            /// drive peri input low
            case INOVER_LOW = 2
            /// drive peri input high
            case INOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }

        @ReadWrite(bits: 12..<14, as: OEOVER_Values.self)
        public var OEOVER: OEOVER_Field

        public enum OEOVER_Values: UInt, BitFieldProjectable {
            /// drive output enable from peripheral signal selected by funcsel
            case OEOVER_NORMAL = 0
            /// drive output enable from inverse of peripheral signal selected by funcsel
            case OEOVER_INVERT = 1
            /// disable output
            case OEOVER_DISABLE = 2
            /// enable output
            case OEOVER_ENABLE = 3

            public static var bitWidth: Int { 2 }
        }

        @ReadWrite(bits: 8..<10, as: OUTOVER_Values.self)
        public var OUTOVER: OUTOVER_Field

        public enum OUTOVER_Values: UInt, BitFieldProjectable {
            /// drive output from peripheral signal selected by funcsel
            case OUTOVER_NORMAL = 0
            /// drive output from inverse of peripheral signal selected by funcsel
            case OUTOVER_INVERT = 1
            /// drive output low
            case OUTOVER_LOW = 2
            /// drive output high
            case OUTOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }

        /// 0-31 -> selects pin function according to the gpio table
        /// 31 == NULL
        @ReadWrite(bits: 0..<5, as: FUNCSEL_Values.self)
        public var FUNCSEL: FUNCSEL_Field

        public enum FUNCSEL_Values: UInt, BitFieldProjectable {
            case FUNCSEL_xip_sclk = 0
            case FUNCSEL_sio_30 = 5
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x0008)
    public var GPIO_QSPI_SS_STATUS: Register<GPIO_QSPI_SS_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO_QSPI_SS_STATUS_Descriptor {
        /// interrupt to processors, after override is applied
        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var IRQTOPROC: IRQTOPROC_Field

        /// interrupt from pad before override is applied
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var IRQFROMPAD: IRQFROMPAD_Field

        /// input signal to peripheral, after override is applied
        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var INTOPERI: INTOPERI_Field

        /// input signal from pad, before override is applied
        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var INFROMPAD: INFROMPAD_Field

        /// output enable to pad after register override is applied
        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var OETOPAD: OETOPAD_Field

        /// output enable from selected peripheral, before register override is applied
        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var OEFROMPERI: OEFROMPERI_Field

        /// output signal to pad after register override is applied
        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var OUTTOPAD: OUTTOPAD_Field

        /// output signal from selected peripheral, before register override is applied
        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var OUTFROMPERI: OUTFROMPERI_Field
    }

    /// GPIO control including function select and overrides.
    @RegisterBank(offset: 0x000c)
    public var GPIO_QSPI_SS_CTRL: Register<GPIO_QSPI_SS_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO_QSPI_SS_CTRL_Descriptor {
        @ReadWrite(bits: 28..<30, as: IRQOVER_Values.self)
        public var IRQOVER: IRQOVER_Field

        public enum IRQOVER_Values: UInt, BitFieldProjectable {
            /// don't invert the interrupt
            case IRQOVER_NORMAL = 0
            /// invert the interrupt
            case IRQOVER_INVERT = 1
            /// drive interrupt low
            case IRQOVER_LOW = 2
            /// drive interrupt high
            case IRQOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }

        @ReadWrite(bits: 16..<18, as: INOVER_Values.self)
        public var INOVER: INOVER_Field

        public enum INOVER_Values: UInt, BitFieldProjectable {
            /// don't invert the peri input
            case INOVER_NORMAL = 0
            /// invert the peri input
            case INOVER_INVERT = 1
            /// drive peri input low
            case INOVER_LOW = 2
            /// drive peri input high
            case INOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }

        @ReadWrite(bits: 12..<14, as: OEOVER_Values.self)
        public var OEOVER: OEOVER_Field

        public enum OEOVER_Values: UInt, BitFieldProjectable {
            /// drive output enable from peripheral signal selected by funcsel
            case OEOVER_NORMAL = 0
            /// drive output enable from inverse of peripheral signal selected by funcsel
            case OEOVER_INVERT = 1
            /// disable output
            case OEOVER_DISABLE = 2
            /// enable output
            case OEOVER_ENABLE = 3

            public static var bitWidth: Int { 2 }
        }

        @ReadWrite(bits: 8..<10, as: OUTOVER_Values.self)
        public var OUTOVER: OUTOVER_Field

        public enum OUTOVER_Values: UInt, BitFieldProjectable {
            /// drive output from peripheral signal selected by funcsel
            case OUTOVER_NORMAL = 0
            /// drive output from inverse of peripheral signal selected by funcsel
            case OUTOVER_INVERT = 1
            /// drive output low
            case OUTOVER_LOW = 2
            /// drive output high
            case OUTOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }

        /// 0-31 -> selects pin function according to the gpio table
        /// 31 == NULL
        @ReadWrite(bits: 0..<5, as: FUNCSEL_Values.self)
        public var FUNCSEL: FUNCSEL_Field

        public enum FUNCSEL_Values: UInt, BitFieldProjectable {
            case FUNCSEL_xip_ss_n = 0
            case FUNCSEL_sio_31 = 5
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x0010)
    public var GPIO_QSPI_SD0_STATUS: Register<GPIO_QSPI_SD0_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO_QSPI_SD0_STATUS_Descriptor {
        /// interrupt to processors, after override is applied
        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var IRQTOPROC: IRQTOPROC_Field

        /// interrupt from pad before override is applied
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var IRQFROMPAD: IRQFROMPAD_Field

        /// input signal to peripheral, after override is applied
        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var INTOPERI: INTOPERI_Field

        /// input signal from pad, before override is applied
        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var INFROMPAD: INFROMPAD_Field

        /// output enable to pad after register override is applied
        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var OETOPAD: OETOPAD_Field

        /// output enable from selected peripheral, before register override is applied
        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var OEFROMPERI: OEFROMPERI_Field

        /// output signal to pad after register override is applied
        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var OUTTOPAD: OUTTOPAD_Field

        /// output signal from selected peripheral, before register override is applied
        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var OUTFROMPERI: OUTFROMPERI_Field
    }

    /// GPIO control including function select and overrides.
    @RegisterBank(offset: 0x0014)
    public var GPIO_QSPI_SD0_CTRL: Register<GPIO_QSPI_SD0_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO_QSPI_SD0_CTRL_Descriptor {
        @ReadWrite(bits: 28..<30, as: IRQOVER_Values.self)
        public var IRQOVER: IRQOVER_Field

        public enum IRQOVER_Values: UInt, BitFieldProjectable {
            /// don't invert the interrupt
            case IRQOVER_NORMAL = 0
            /// invert the interrupt
            case IRQOVER_INVERT = 1
            /// drive interrupt low
            case IRQOVER_LOW = 2
            /// drive interrupt high
            case IRQOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }

        @ReadWrite(bits: 16..<18, as: INOVER_Values.self)
        public var INOVER: INOVER_Field

        public enum INOVER_Values: UInt, BitFieldProjectable {
            /// don't invert the peri input
            case INOVER_NORMAL = 0
            /// invert the peri input
            case INOVER_INVERT = 1
            /// drive peri input low
            case INOVER_LOW = 2
            /// drive peri input high
            case INOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }

        @ReadWrite(bits: 12..<14, as: OEOVER_Values.self)
        public var OEOVER: OEOVER_Field

        public enum OEOVER_Values: UInt, BitFieldProjectable {
            /// drive output enable from peripheral signal selected by funcsel
            case OEOVER_NORMAL = 0
            /// drive output enable from inverse of peripheral signal selected by funcsel
            case OEOVER_INVERT = 1
            /// disable output
            case OEOVER_DISABLE = 2
            /// enable output
            case OEOVER_ENABLE = 3

            public static var bitWidth: Int { 2 }
        }

        @ReadWrite(bits: 8..<10, as: OUTOVER_Values.self)
        public var OUTOVER: OUTOVER_Field

        public enum OUTOVER_Values: UInt, BitFieldProjectable {
            /// drive output from peripheral signal selected by funcsel
            case OUTOVER_NORMAL = 0
            /// drive output from inverse of peripheral signal selected by funcsel
            case OUTOVER_INVERT = 1
            /// drive output low
            case OUTOVER_LOW = 2
            /// drive output high
            case OUTOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }

        /// 0-31 -> selects pin function according to the gpio table
        /// 31 == NULL
        @ReadWrite(bits: 0..<5, as: FUNCSEL_Values.self)
        public var FUNCSEL: FUNCSEL_Field

        public enum FUNCSEL_Values: UInt, BitFieldProjectable {
            case FUNCSEL_xip_sd0 = 0
            case FUNCSEL_sio_32 = 5
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x0018)
    public var GPIO_QSPI_SD1_STATUS: Register<GPIO_QSPI_SD1_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO_QSPI_SD1_STATUS_Descriptor {
        /// interrupt to processors, after override is applied
        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var IRQTOPROC: IRQTOPROC_Field

        /// interrupt from pad before override is applied
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var IRQFROMPAD: IRQFROMPAD_Field

        /// input signal to peripheral, after override is applied
        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var INTOPERI: INTOPERI_Field

        /// input signal from pad, before override is applied
        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var INFROMPAD: INFROMPAD_Field

        /// output enable to pad after register override is applied
        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var OETOPAD: OETOPAD_Field

        /// output enable from selected peripheral, before register override is applied
        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var OEFROMPERI: OEFROMPERI_Field

        /// output signal to pad after register override is applied
        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var OUTTOPAD: OUTTOPAD_Field

        /// output signal from selected peripheral, before register override is applied
        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var OUTFROMPERI: OUTFROMPERI_Field
    }

    /// GPIO control including function select and overrides.
    @RegisterBank(offset: 0x001c)
    public var GPIO_QSPI_SD1_CTRL: Register<GPIO_QSPI_SD1_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO_QSPI_SD1_CTRL_Descriptor {
        @ReadWrite(bits: 28..<30, as: IRQOVER_Values.self)
        public var IRQOVER: IRQOVER_Field

        public enum IRQOVER_Values: UInt, BitFieldProjectable {
            /// don't invert the interrupt
            case IRQOVER_NORMAL = 0
            /// invert the interrupt
            case IRQOVER_INVERT = 1
            /// drive interrupt low
            case IRQOVER_LOW = 2
            /// drive interrupt high
            case IRQOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }

        @ReadWrite(bits: 16..<18, as: INOVER_Values.self)
        public var INOVER: INOVER_Field

        public enum INOVER_Values: UInt, BitFieldProjectable {
            /// don't invert the peri input
            case INOVER_NORMAL = 0
            /// invert the peri input
            case INOVER_INVERT = 1
            /// drive peri input low
            case INOVER_LOW = 2
            /// drive peri input high
            case INOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }

        @ReadWrite(bits: 12..<14, as: OEOVER_Values.self)
        public var OEOVER: OEOVER_Field

        public enum OEOVER_Values: UInt, BitFieldProjectable {
            /// drive output enable from peripheral signal selected by funcsel
            case OEOVER_NORMAL = 0
            /// drive output enable from inverse of peripheral signal selected by funcsel
            case OEOVER_INVERT = 1
            /// disable output
            case OEOVER_DISABLE = 2
            /// enable output
            case OEOVER_ENABLE = 3

            public static var bitWidth: Int { 2 }
        }

        @ReadWrite(bits: 8..<10, as: OUTOVER_Values.self)
        public var OUTOVER: OUTOVER_Field

        public enum OUTOVER_Values: UInt, BitFieldProjectable {
            /// drive output from peripheral signal selected by funcsel
            case OUTOVER_NORMAL = 0
            /// drive output from inverse of peripheral signal selected by funcsel
            case OUTOVER_INVERT = 1
            /// drive output low
            case OUTOVER_LOW = 2
            /// drive output high
            case OUTOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }

        /// 0-31 -> selects pin function according to the gpio table
        /// 31 == NULL
        @ReadWrite(bits: 0..<5, as: FUNCSEL_Values.self)
        public var FUNCSEL: FUNCSEL_Field

        public enum FUNCSEL_Values: UInt, BitFieldProjectable {
            case FUNCSEL_xip_sd1 = 0
            case FUNCSEL_sio_33 = 5
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x0020)
    public var GPIO_QSPI_SD2_STATUS: Register<GPIO_QSPI_SD2_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO_QSPI_SD2_STATUS_Descriptor {
        /// interrupt to processors, after override is applied
        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var IRQTOPROC: IRQTOPROC_Field

        /// interrupt from pad before override is applied
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var IRQFROMPAD: IRQFROMPAD_Field

        /// input signal to peripheral, after override is applied
        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var INTOPERI: INTOPERI_Field

        /// input signal from pad, before override is applied
        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var INFROMPAD: INFROMPAD_Field

        /// output enable to pad after register override is applied
        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var OETOPAD: OETOPAD_Field

        /// output enable from selected peripheral, before register override is applied
        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var OEFROMPERI: OEFROMPERI_Field

        /// output signal to pad after register override is applied
        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var OUTTOPAD: OUTTOPAD_Field

        /// output signal from selected peripheral, before register override is applied
        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var OUTFROMPERI: OUTFROMPERI_Field
    }

    /// GPIO control including function select and overrides.
    @RegisterBank(offset: 0x0024)
    public var GPIO_QSPI_SD2_CTRL: Register<GPIO_QSPI_SD2_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO_QSPI_SD2_CTRL_Descriptor {
        @ReadWrite(bits: 28..<30, as: IRQOVER_Values.self)
        public var IRQOVER: IRQOVER_Field

        public enum IRQOVER_Values: UInt, BitFieldProjectable {
            /// don't invert the interrupt
            case IRQOVER_NORMAL = 0
            /// invert the interrupt
            case IRQOVER_INVERT = 1
            /// drive interrupt low
            case IRQOVER_LOW = 2
            /// drive interrupt high
            case IRQOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }

        @ReadWrite(bits: 16..<18, as: INOVER_Values.self)
        public var INOVER: INOVER_Field

        public enum INOVER_Values: UInt, BitFieldProjectable {
            /// don't invert the peri input
            case INOVER_NORMAL = 0
            /// invert the peri input
            case INOVER_INVERT = 1
            /// drive peri input low
            case INOVER_LOW = 2
            /// drive peri input high
            case INOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }

        @ReadWrite(bits: 12..<14, as: OEOVER_Values.self)
        public var OEOVER: OEOVER_Field

        public enum OEOVER_Values: UInt, BitFieldProjectable {
            /// drive output enable from peripheral signal selected by funcsel
            case OEOVER_NORMAL = 0
            /// drive output enable from inverse of peripheral signal selected by funcsel
            case OEOVER_INVERT = 1
            /// disable output
            case OEOVER_DISABLE = 2
            /// enable output
            case OEOVER_ENABLE = 3

            public static var bitWidth: Int { 2 }
        }

        @ReadWrite(bits: 8..<10, as: OUTOVER_Values.self)
        public var OUTOVER: OUTOVER_Field

        public enum OUTOVER_Values: UInt, BitFieldProjectable {
            /// drive output from peripheral signal selected by funcsel
            case OUTOVER_NORMAL = 0
            /// drive output from inverse of peripheral signal selected by funcsel
            case OUTOVER_INVERT = 1
            /// drive output low
            case OUTOVER_LOW = 2
            /// drive output high
            case OUTOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }

        /// 0-31 -> selects pin function according to the gpio table
        /// 31 == NULL
        @ReadWrite(bits: 0..<5, as: FUNCSEL_Values.self)
        public var FUNCSEL: FUNCSEL_Field

        public enum FUNCSEL_Values: UInt, BitFieldProjectable {
            case FUNCSEL_xip_sd2 = 0
            case FUNCSEL_sio_34 = 5
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x0028)
    public var GPIO_QSPI_SD3_STATUS: Register<GPIO_QSPI_SD3_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO_QSPI_SD3_STATUS_Descriptor {
        /// interrupt to processors, after override is applied
        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var IRQTOPROC: IRQTOPROC_Field

        /// interrupt from pad before override is applied
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var IRQFROMPAD: IRQFROMPAD_Field

        /// input signal to peripheral, after override is applied
        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var INTOPERI: INTOPERI_Field

        /// input signal from pad, before override is applied
        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var INFROMPAD: INFROMPAD_Field

        /// output enable to pad after register override is applied
        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var OETOPAD: OETOPAD_Field

        /// output enable from selected peripheral, before register override is applied
        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var OEFROMPERI: OEFROMPERI_Field

        /// output signal to pad after register override is applied
        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var OUTTOPAD: OUTTOPAD_Field

        /// output signal from selected peripheral, before register override is applied
        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var OUTFROMPERI: OUTFROMPERI_Field
    }

    /// GPIO control including function select and overrides.
    @RegisterBank(offset: 0x002c)
    public var GPIO_QSPI_SD3_CTRL: Register<GPIO_QSPI_SD3_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO_QSPI_SD3_CTRL_Descriptor {
        @ReadWrite(bits: 28..<30, as: IRQOVER_Values.self)
        public var IRQOVER: IRQOVER_Field

        public enum IRQOVER_Values: UInt, BitFieldProjectable {
            /// don't invert the interrupt
            case IRQOVER_NORMAL = 0
            /// invert the interrupt
            case IRQOVER_INVERT = 1
            /// drive interrupt low
            case IRQOVER_LOW = 2
            /// drive interrupt high
            case IRQOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }

        @ReadWrite(bits: 16..<18, as: INOVER_Values.self)
        public var INOVER: INOVER_Field

        public enum INOVER_Values: UInt, BitFieldProjectable {
            /// don't invert the peri input
            case INOVER_NORMAL = 0
            /// invert the peri input
            case INOVER_INVERT = 1
            /// drive peri input low
            case INOVER_LOW = 2
            /// drive peri input high
            case INOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }

        @ReadWrite(bits: 12..<14, as: OEOVER_Values.self)
        public var OEOVER: OEOVER_Field

        public enum OEOVER_Values: UInt, BitFieldProjectable {
            /// drive output enable from peripheral signal selected by funcsel
            case OEOVER_NORMAL = 0
            /// drive output enable from inverse of peripheral signal selected by funcsel
            case OEOVER_INVERT = 1
            /// disable output
            case OEOVER_DISABLE = 2
            /// enable output
            case OEOVER_ENABLE = 3

            public static var bitWidth: Int { 2 }
        }

        @ReadWrite(bits: 8..<10, as: OUTOVER_Values.self)
        public var OUTOVER: OUTOVER_Field

        public enum OUTOVER_Values: UInt, BitFieldProjectable {
            /// drive output from peripheral signal selected by funcsel
            case OUTOVER_NORMAL = 0
            /// drive output from inverse of peripheral signal selected by funcsel
            case OUTOVER_INVERT = 1
            /// drive output low
            case OUTOVER_LOW = 2
            /// drive output high
            case OUTOVER_HIGH = 3

            public static var bitWidth: Int { 2 }
        }

        /// 0-31 -> selects pin function according to the gpio table
        /// 31 == NULL
        @ReadWrite(bits: 0..<5, as: FUNCSEL_Values.self)
        public var FUNCSEL: FUNCSEL_Field

        public enum FUNCSEL_Values: UInt, BitFieldProjectable {
            case FUNCSEL_xip_sd3 = 0
            case FUNCSEL_sio_35 = 5
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// Raw Interrupts
    @RegisterBank(offset: 0x0030)
    public var INTR: Register<INTR_Descriptor>


    @Register(bitWidth: 32)
    public struct INTR_Descriptor {
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO_QSPI_SD3_EDGE_HIGH: GPIO_QSPI_SD3_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO_QSPI_SD3_EDGE_LOW: GPIO_QSPI_SD3_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var GPIO_QSPI_SD3_LEVEL_HIGH: GPIO_QSPI_SD3_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var GPIO_QSPI_SD3_LEVEL_LOW: GPIO_QSPI_SD3_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO_QSPI_SD2_EDGE_HIGH: GPIO_QSPI_SD2_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO_QSPI_SD2_EDGE_LOW: GPIO_QSPI_SD2_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var GPIO_QSPI_SD2_LEVEL_HIGH: GPIO_QSPI_SD2_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var GPIO_QSPI_SD2_LEVEL_LOW: GPIO_QSPI_SD2_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO_QSPI_SD1_EDGE_HIGH: GPIO_QSPI_SD1_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO_QSPI_SD1_EDGE_LOW: GPIO_QSPI_SD1_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var GPIO_QSPI_SD1_LEVEL_HIGH: GPIO_QSPI_SD1_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var GPIO_QSPI_SD1_LEVEL_LOW: GPIO_QSPI_SD1_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO_QSPI_SD0_EDGE_HIGH: GPIO_QSPI_SD0_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO_QSPI_SD0_EDGE_LOW: GPIO_QSPI_SD0_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var GPIO_QSPI_SD0_LEVEL_HIGH: GPIO_QSPI_SD0_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var GPIO_QSPI_SD0_LEVEL_LOW: GPIO_QSPI_SD0_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO_QSPI_SS_EDGE_HIGH: GPIO_QSPI_SS_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO_QSPI_SS_EDGE_LOW: GPIO_QSPI_SS_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var GPIO_QSPI_SS_LEVEL_HIGH: GPIO_QSPI_SS_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var GPIO_QSPI_SS_LEVEL_LOW: GPIO_QSPI_SS_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO_QSPI_SCLK_EDGE_HIGH: GPIO_QSPI_SCLK_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO_QSPI_SCLK_EDGE_LOW: GPIO_QSPI_SCLK_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var GPIO_QSPI_SCLK_LEVEL_HIGH: GPIO_QSPI_SCLK_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var GPIO_QSPI_SCLK_LEVEL_LOW: GPIO_QSPI_SCLK_LEVEL_LOW_Field
    }

    /// Interrupt Enable for proc0
    @RegisterBank(offset: 0x0034)
    public var PROC0_INTE: Register<PROC0_INTE_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC0_INTE_Descriptor {
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO_QSPI_SD3_EDGE_HIGH: GPIO_QSPI_SD3_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO_QSPI_SD3_EDGE_LOW: GPIO_QSPI_SD3_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var GPIO_QSPI_SD3_LEVEL_HIGH: GPIO_QSPI_SD3_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var GPIO_QSPI_SD3_LEVEL_LOW: GPIO_QSPI_SD3_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO_QSPI_SD2_EDGE_HIGH: GPIO_QSPI_SD2_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO_QSPI_SD2_EDGE_LOW: GPIO_QSPI_SD2_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var GPIO_QSPI_SD2_LEVEL_HIGH: GPIO_QSPI_SD2_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var GPIO_QSPI_SD2_LEVEL_LOW: GPIO_QSPI_SD2_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO_QSPI_SD1_EDGE_HIGH: GPIO_QSPI_SD1_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO_QSPI_SD1_EDGE_LOW: GPIO_QSPI_SD1_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var GPIO_QSPI_SD1_LEVEL_HIGH: GPIO_QSPI_SD1_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var GPIO_QSPI_SD1_LEVEL_LOW: GPIO_QSPI_SD1_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO_QSPI_SD0_EDGE_HIGH: GPIO_QSPI_SD0_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO_QSPI_SD0_EDGE_LOW: GPIO_QSPI_SD0_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var GPIO_QSPI_SD0_LEVEL_HIGH: GPIO_QSPI_SD0_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var GPIO_QSPI_SD0_LEVEL_LOW: GPIO_QSPI_SD0_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO_QSPI_SS_EDGE_HIGH: GPIO_QSPI_SS_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO_QSPI_SS_EDGE_LOW: GPIO_QSPI_SS_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var GPIO_QSPI_SS_LEVEL_HIGH: GPIO_QSPI_SS_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var GPIO_QSPI_SS_LEVEL_LOW: GPIO_QSPI_SS_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO_QSPI_SCLK_EDGE_HIGH: GPIO_QSPI_SCLK_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO_QSPI_SCLK_EDGE_LOW: GPIO_QSPI_SCLK_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var GPIO_QSPI_SCLK_LEVEL_HIGH: GPIO_QSPI_SCLK_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var GPIO_QSPI_SCLK_LEVEL_LOW: GPIO_QSPI_SCLK_LEVEL_LOW_Field
    }

    /// Interrupt Force for proc0
    @RegisterBank(offset: 0x0038)
    public var PROC0_INTF: Register<PROC0_INTF_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC0_INTF_Descriptor {
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO_QSPI_SD3_EDGE_HIGH: GPIO_QSPI_SD3_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO_QSPI_SD3_EDGE_LOW: GPIO_QSPI_SD3_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var GPIO_QSPI_SD3_LEVEL_HIGH: GPIO_QSPI_SD3_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var GPIO_QSPI_SD3_LEVEL_LOW: GPIO_QSPI_SD3_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO_QSPI_SD2_EDGE_HIGH: GPIO_QSPI_SD2_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO_QSPI_SD2_EDGE_LOW: GPIO_QSPI_SD2_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var GPIO_QSPI_SD2_LEVEL_HIGH: GPIO_QSPI_SD2_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var GPIO_QSPI_SD2_LEVEL_LOW: GPIO_QSPI_SD2_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO_QSPI_SD1_EDGE_HIGH: GPIO_QSPI_SD1_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO_QSPI_SD1_EDGE_LOW: GPIO_QSPI_SD1_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var GPIO_QSPI_SD1_LEVEL_HIGH: GPIO_QSPI_SD1_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var GPIO_QSPI_SD1_LEVEL_LOW: GPIO_QSPI_SD1_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO_QSPI_SD0_EDGE_HIGH: GPIO_QSPI_SD0_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO_QSPI_SD0_EDGE_LOW: GPIO_QSPI_SD0_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var GPIO_QSPI_SD0_LEVEL_HIGH: GPIO_QSPI_SD0_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var GPIO_QSPI_SD0_LEVEL_LOW: GPIO_QSPI_SD0_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO_QSPI_SS_EDGE_HIGH: GPIO_QSPI_SS_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO_QSPI_SS_EDGE_LOW: GPIO_QSPI_SS_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var GPIO_QSPI_SS_LEVEL_HIGH: GPIO_QSPI_SS_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var GPIO_QSPI_SS_LEVEL_LOW: GPIO_QSPI_SS_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO_QSPI_SCLK_EDGE_HIGH: GPIO_QSPI_SCLK_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO_QSPI_SCLK_EDGE_LOW: GPIO_QSPI_SCLK_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var GPIO_QSPI_SCLK_LEVEL_HIGH: GPIO_QSPI_SCLK_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var GPIO_QSPI_SCLK_LEVEL_LOW: GPIO_QSPI_SCLK_LEVEL_LOW_Field
    }

    /// Interrupt status after masking & forcing for proc0
    @RegisterBank(offset: 0x003c)
    public var PROC0_INTS: Register<PROC0_INTS_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC0_INTS_Descriptor {
        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var GPIO_QSPI_SD3_EDGE_HIGH: GPIO_QSPI_SD3_EDGE_HIGH_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var GPIO_QSPI_SD3_EDGE_LOW: GPIO_QSPI_SD3_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var GPIO_QSPI_SD3_LEVEL_HIGH: GPIO_QSPI_SD3_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var GPIO_QSPI_SD3_LEVEL_LOW: GPIO_QSPI_SD3_LEVEL_LOW_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var GPIO_QSPI_SD2_EDGE_HIGH: GPIO_QSPI_SD2_EDGE_HIGH_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var GPIO_QSPI_SD2_EDGE_LOW: GPIO_QSPI_SD2_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var GPIO_QSPI_SD2_LEVEL_HIGH: GPIO_QSPI_SD2_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var GPIO_QSPI_SD2_LEVEL_LOW: GPIO_QSPI_SD2_LEVEL_LOW_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var GPIO_QSPI_SD1_EDGE_HIGH: GPIO_QSPI_SD1_EDGE_HIGH_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var GPIO_QSPI_SD1_EDGE_LOW: GPIO_QSPI_SD1_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var GPIO_QSPI_SD1_LEVEL_HIGH: GPIO_QSPI_SD1_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var GPIO_QSPI_SD1_LEVEL_LOW: GPIO_QSPI_SD1_LEVEL_LOW_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var GPIO_QSPI_SD0_EDGE_HIGH: GPIO_QSPI_SD0_EDGE_HIGH_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var GPIO_QSPI_SD0_EDGE_LOW: GPIO_QSPI_SD0_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var GPIO_QSPI_SD0_LEVEL_HIGH: GPIO_QSPI_SD0_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var GPIO_QSPI_SD0_LEVEL_LOW: GPIO_QSPI_SD0_LEVEL_LOW_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var GPIO_QSPI_SS_EDGE_HIGH: GPIO_QSPI_SS_EDGE_HIGH_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var GPIO_QSPI_SS_EDGE_LOW: GPIO_QSPI_SS_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var GPIO_QSPI_SS_LEVEL_HIGH: GPIO_QSPI_SS_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var GPIO_QSPI_SS_LEVEL_LOW: GPIO_QSPI_SS_LEVEL_LOW_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var GPIO_QSPI_SCLK_EDGE_HIGH: GPIO_QSPI_SCLK_EDGE_HIGH_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var GPIO_QSPI_SCLK_EDGE_LOW: GPIO_QSPI_SCLK_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var GPIO_QSPI_SCLK_LEVEL_HIGH: GPIO_QSPI_SCLK_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var GPIO_QSPI_SCLK_LEVEL_LOW: GPIO_QSPI_SCLK_LEVEL_LOW_Field
    }

    /// Interrupt Enable for proc1
    @RegisterBank(offset: 0x0040)
    public var PROC1_INTE: Register<PROC1_INTE_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC1_INTE_Descriptor {
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO_QSPI_SD3_EDGE_HIGH: GPIO_QSPI_SD3_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO_QSPI_SD3_EDGE_LOW: GPIO_QSPI_SD3_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var GPIO_QSPI_SD3_LEVEL_HIGH: GPIO_QSPI_SD3_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var GPIO_QSPI_SD3_LEVEL_LOW: GPIO_QSPI_SD3_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO_QSPI_SD2_EDGE_HIGH: GPIO_QSPI_SD2_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO_QSPI_SD2_EDGE_LOW: GPIO_QSPI_SD2_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var GPIO_QSPI_SD2_LEVEL_HIGH: GPIO_QSPI_SD2_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var GPIO_QSPI_SD2_LEVEL_LOW: GPIO_QSPI_SD2_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO_QSPI_SD1_EDGE_HIGH: GPIO_QSPI_SD1_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO_QSPI_SD1_EDGE_LOW: GPIO_QSPI_SD1_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var GPIO_QSPI_SD1_LEVEL_HIGH: GPIO_QSPI_SD1_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var GPIO_QSPI_SD1_LEVEL_LOW: GPIO_QSPI_SD1_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO_QSPI_SD0_EDGE_HIGH: GPIO_QSPI_SD0_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO_QSPI_SD0_EDGE_LOW: GPIO_QSPI_SD0_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var GPIO_QSPI_SD0_LEVEL_HIGH: GPIO_QSPI_SD0_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var GPIO_QSPI_SD0_LEVEL_LOW: GPIO_QSPI_SD0_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO_QSPI_SS_EDGE_HIGH: GPIO_QSPI_SS_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO_QSPI_SS_EDGE_LOW: GPIO_QSPI_SS_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var GPIO_QSPI_SS_LEVEL_HIGH: GPIO_QSPI_SS_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var GPIO_QSPI_SS_LEVEL_LOW: GPIO_QSPI_SS_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO_QSPI_SCLK_EDGE_HIGH: GPIO_QSPI_SCLK_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO_QSPI_SCLK_EDGE_LOW: GPIO_QSPI_SCLK_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var GPIO_QSPI_SCLK_LEVEL_HIGH: GPIO_QSPI_SCLK_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var GPIO_QSPI_SCLK_LEVEL_LOW: GPIO_QSPI_SCLK_LEVEL_LOW_Field
    }

    /// Interrupt Force for proc1
    @RegisterBank(offset: 0x0044)
    public var PROC1_INTF: Register<PROC1_INTF_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC1_INTF_Descriptor {
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO_QSPI_SD3_EDGE_HIGH: GPIO_QSPI_SD3_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO_QSPI_SD3_EDGE_LOW: GPIO_QSPI_SD3_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var GPIO_QSPI_SD3_LEVEL_HIGH: GPIO_QSPI_SD3_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var GPIO_QSPI_SD3_LEVEL_LOW: GPIO_QSPI_SD3_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO_QSPI_SD2_EDGE_HIGH: GPIO_QSPI_SD2_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO_QSPI_SD2_EDGE_LOW: GPIO_QSPI_SD2_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var GPIO_QSPI_SD2_LEVEL_HIGH: GPIO_QSPI_SD2_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var GPIO_QSPI_SD2_LEVEL_LOW: GPIO_QSPI_SD2_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO_QSPI_SD1_EDGE_HIGH: GPIO_QSPI_SD1_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO_QSPI_SD1_EDGE_LOW: GPIO_QSPI_SD1_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var GPIO_QSPI_SD1_LEVEL_HIGH: GPIO_QSPI_SD1_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var GPIO_QSPI_SD1_LEVEL_LOW: GPIO_QSPI_SD1_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO_QSPI_SD0_EDGE_HIGH: GPIO_QSPI_SD0_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO_QSPI_SD0_EDGE_LOW: GPIO_QSPI_SD0_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var GPIO_QSPI_SD0_LEVEL_HIGH: GPIO_QSPI_SD0_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var GPIO_QSPI_SD0_LEVEL_LOW: GPIO_QSPI_SD0_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO_QSPI_SS_EDGE_HIGH: GPIO_QSPI_SS_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO_QSPI_SS_EDGE_LOW: GPIO_QSPI_SS_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var GPIO_QSPI_SS_LEVEL_HIGH: GPIO_QSPI_SS_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var GPIO_QSPI_SS_LEVEL_LOW: GPIO_QSPI_SS_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO_QSPI_SCLK_EDGE_HIGH: GPIO_QSPI_SCLK_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO_QSPI_SCLK_EDGE_LOW: GPIO_QSPI_SCLK_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var GPIO_QSPI_SCLK_LEVEL_HIGH: GPIO_QSPI_SCLK_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var GPIO_QSPI_SCLK_LEVEL_LOW: GPIO_QSPI_SCLK_LEVEL_LOW_Field
    }

    /// Interrupt status after masking & forcing for proc1
    @RegisterBank(offset: 0x0048)
    public var PROC1_INTS: Register<PROC1_INTS_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC1_INTS_Descriptor {
        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var GPIO_QSPI_SD3_EDGE_HIGH: GPIO_QSPI_SD3_EDGE_HIGH_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var GPIO_QSPI_SD3_EDGE_LOW: GPIO_QSPI_SD3_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var GPIO_QSPI_SD3_LEVEL_HIGH: GPIO_QSPI_SD3_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var GPIO_QSPI_SD3_LEVEL_LOW: GPIO_QSPI_SD3_LEVEL_LOW_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var GPIO_QSPI_SD2_EDGE_HIGH: GPIO_QSPI_SD2_EDGE_HIGH_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var GPIO_QSPI_SD2_EDGE_LOW: GPIO_QSPI_SD2_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var GPIO_QSPI_SD2_LEVEL_HIGH: GPIO_QSPI_SD2_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var GPIO_QSPI_SD2_LEVEL_LOW: GPIO_QSPI_SD2_LEVEL_LOW_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var GPIO_QSPI_SD1_EDGE_HIGH: GPIO_QSPI_SD1_EDGE_HIGH_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var GPIO_QSPI_SD1_EDGE_LOW: GPIO_QSPI_SD1_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var GPIO_QSPI_SD1_LEVEL_HIGH: GPIO_QSPI_SD1_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var GPIO_QSPI_SD1_LEVEL_LOW: GPIO_QSPI_SD1_LEVEL_LOW_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var GPIO_QSPI_SD0_EDGE_HIGH: GPIO_QSPI_SD0_EDGE_HIGH_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var GPIO_QSPI_SD0_EDGE_LOW: GPIO_QSPI_SD0_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var GPIO_QSPI_SD0_LEVEL_HIGH: GPIO_QSPI_SD0_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var GPIO_QSPI_SD0_LEVEL_LOW: GPIO_QSPI_SD0_LEVEL_LOW_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var GPIO_QSPI_SS_EDGE_HIGH: GPIO_QSPI_SS_EDGE_HIGH_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var GPIO_QSPI_SS_EDGE_LOW: GPIO_QSPI_SS_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var GPIO_QSPI_SS_LEVEL_HIGH: GPIO_QSPI_SS_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var GPIO_QSPI_SS_LEVEL_LOW: GPIO_QSPI_SS_LEVEL_LOW_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var GPIO_QSPI_SCLK_EDGE_HIGH: GPIO_QSPI_SCLK_EDGE_HIGH_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var GPIO_QSPI_SCLK_EDGE_LOW: GPIO_QSPI_SCLK_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var GPIO_QSPI_SCLK_LEVEL_HIGH: GPIO_QSPI_SCLK_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var GPIO_QSPI_SCLK_LEVEL_LOW: GPIO_QSPI_SCLK_LEVEL_LOW_Field
    }

    /// Interrupt Enable for dormant_wake
    @RegisterBank(offset: 0x004c)
    public var DORMANT_WAKE_INTE: Register<DORMANT_WAKE_INTE_Descriptor>


    @Register(bitWidth: 32)
    public struct DORMANT_WAKE_INTE_Descriptor {
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO_QSPI_SD3_EDGE_HIGH: GPIO_QSPI_SD3_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO_QSPI_SD3_EDGE_LOW: GPIO_QSPI_SD3_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var GPIO_QSPI_SD3_LEVEL_HIGH: GPIO_QSPI_SD3_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var GPIO_QSPI_SD3_LEVEL_LOW: GPIO_QSPI_SD3_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO_QSPI_SD2_EDGE_HIGH: GPIO_QSPI_SD2_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO_QSPI_SD2_EDGE_LOW: GPIO_QSPI_SD2_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var GPIO_QSPI_SD2_LEVEL_HIGH: GPIO_QSPI_SD2_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var GPIO_QSPI_SD2_LEVEL_LOW: GPIO_QSPI_SD2_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO_QSPI_SD1_EDGE_HIGH: GPIO_QSPI_SD1_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO_QSPI_SD1_EDGE_LOW: GPIO_QSPI_SD1_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var GPIO_QSPI_SD1_LEVEL_HIGH: GPIO_QSPI_SD1_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var GPIO_QSPI_SD1_LEVEL_LOW: GPIO_QSPI_SD1_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO_QSPI_SD0_EDGE_HIGH: GPIO_QSPI_SD0_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO_QSPI_SD0_EDGE_LOW: GPIO_QSPI_SD0_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var GPIO_QSPI_SD0_LEVEL_HIGH: GPIO_QSPI_SD0_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var GPIO_QSPI_SD0_LEVEL_LOW: GPIO_QSPI_SD0_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO_QSPI_SS_EDGE_HIGH: GPIO_QSPI_SS_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO_QSPI_SS_EDGE_LOW: GPIO_QSPI_SS_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var GPIO_QSPI_SS_LEVEL_HIGH: GPIO_QSPI_SS_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var GPIO_QSPI_SS_LEVEL_LOW: GPIO_QSPI_SS_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO_QSPI_SCLK_EDGE_HIGH: GPIO_QSPI_SCLK_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO_QSPI_SCLK_EDGE_LOW: GPIO_QSPI_SCLK_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var GPIO_QSPI_SCLK_LEVEL_HIGH: GPIO_QSPI_SCLK_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var GPIO_QSPI_SCLK_LEVEL_LOW: GPIO_QSPI_SCLK_LEVEL_LOW_Field
    }

    /// Interrupt Force for dormant_wake
    @RegisterBank(offset: 0x0050)
    public var DORMANT_WAKE_INTF: Register<DORMANT_WAKE_INTF_Descriptor>


    @Register(bitWidth: 32)
    public struct DORMANT_WAKE_INTF_Descriptor {
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO_QSPI_SD3_EDGE_HIGH: GPIO_QSPI_SD3_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO_QSPI_SD3_EDGE_LOW: GPIO_QSPI_SD3_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var GPIO_QSPI_SD3_LEVEL_HIGH: GPIO_QSPI_SD3_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var GPIO_QSPI_SD3_LEVEL_LOW: GPIO_QSPI_SD3_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO_QSPI_SD2_EDGE_HIGH: GPIO_QSPI_SD2_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO_QSPI_SD2_EDGE_LOW: GPIO_QSPI_SD2_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var GPIO_QSPI_SD2_LEVEL_HIGH: GPIO_QSPI_SD2_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var GPIO_QSPI_SD2_LEVEL_LOW: GPIO_QSPI_SD2_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO_QSPI_SD1_EDGE_HIGH: GPIO_QSPI_SD1_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO_QSPI_SD1_EDGE_LOW: GPIO_QSPI_SD1_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var GPIO_QSPI_SD1_LEVEL_HIGH: GPIO_QSPI_SD1_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var GPIO_QSPI_SD1_LEVEL_LOW: GPIO_QSPI_SD1_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO_QSPI_SD0_EDGE_HIGH: GPIO_QSPI_SD0_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO_QSPI_SD0_EDGE_LOW: GPIO_QSPI_SD0_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var GPIO_QSPI_SD0_LEVEL_HIGH: GPIO_QSPI_SD0_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var GPIO_QSPI_SD0_LEVEL_LOW: GPIO_QSPI_SD0_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO_QSPI_SS_EDGE_HIGH: GPIO_QSPI_SS_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO_QSPI_SS_EDGE_LOW: GPIO_QSPI_SS_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var GPIO_QSPI_SS_LEVEL_HIGH: GPIO_QSPI_SS_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var GPIO_QSPI_SS_LEVEL_LOW: GPIO_QSPI_SS_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO_QSPI_SCLK_EDGE_HIGH: GPIO_QSPI_SCLK_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO_QSPI_SCLK_EDGE_LOW: GPIO_QSPI_SCLK_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var GPIO_QSPI_SCLK_LEVEL_HIGH: GPIO_QSPI_SCLK_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var GPIO_QSPI_SCLK_LEVEL_LOW: GPIO_QSPI_SCLK_LEVEL_LOW_Field
    }

    /// Interrupt status after masking & forcing for dormant_wake
    @RegisterBank(offset: 0x0054)
    public var DORMANT_WAKE_INTS: Register<DORMANT_WAKE_INTS_Descriptor>


    @Register(bitWidth: 32)
    public struct DORMANT_WAKE_INTS_Descriptor {
        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var GPIO_QSPI_SD3_EDGE_HIGH: GPIO_QSPI_SD3_EDGE_HIGH_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var GPIO_QSPI_SD3_EDGE_LOW: GPIO_QSPI_SD3_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var GPIO_QSPI_SD3_LEVEL_HIGH: GPIO_QSPI_SD3_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var GPIO_QSPI_SD3_LEVEL_LOW: GPIO_QSPI_SD3_LEVEL_LOW_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var GPIO_QSPI_SD2_EDGE_HIGH: GPIO_QSPI_SD2_EDGE_HIGH_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var GPIO_QSPI_SD2_EDGE_LOW: GPIO_QSPI_SD2_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var GPIO_QSPI_SD2_LEVEL_HIGH: GPIO_QSPI_SD2_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var GPIO_QSPI_SD2_LEVEL_LOW: GPIO_QSPI_SD2_LEVEL_LOW_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var GPIO_QSPI_SD1_EDGE_HIGH: GPIO_QSPI_SD1_EDGE_HIGH_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var GPIO_QSPI_SD1_EDGE_LOW: GPIO_QSPI_SD1_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var GPIO_QSPI_SD1_LEVEL_HIGH: GPIO_QSPI_SD1_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var GPIO_QSPI_SD1_LEVEL_LOW: GPIO_QSPI_SD1_LEVEL_LOW_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var GPIO_QSPI_SD0_EDGE_HIGH: GPIO_QSPI_SD0_EDGE_HIGH_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var GPIO_QSPI_SD0_EDGE_LOW: GPIO_QSPI_SD0_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var GPIO_QSPI_SD0_LEVEL_HIGH: GPIO_QSPI_SD0_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var GPIO_QSPI_SD0_LEVEL_LOW: GPIO_QSPI_SD0_LEVEL_LOW_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var GPIO_QSPI_SS_EDGE_HIGH: GPIO_QSPI_SS_EDGE_HIGH_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var GPIO_QSPI_SS_EDGE_LOW: GPIO_QSPI_SS_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var GPIO_QSPI_SS_LEVEL_HIGH: GPIO_QSPI_SS_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var GPIO_QSPI_SS_LEVEL_LOW: GPIO_QSPI_SS_LEVEL_LOW_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var GPIO_QSPI_SCLK_EDGE_HIGH: GPIO_QSPI_SCLK_EDGE_HIGH_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var GPIO_QSPI_SCLK_EDGE_LOW: GPIO_QSPI_SCLK_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var GPIO_QSPI_SCLK_LEVEL_HIGH: GPIO_QSPI_SCLK_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var GPIO_QSPI_SCLK_LEVEL_LOW: GPIO_QSPI_SCLK_LEVEL_LOW_Field
    }
}
