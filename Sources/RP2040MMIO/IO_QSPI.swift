import MMIO
import MMIOExtensions

@RegisterBank
public struct IO_QSPI {

    public static var `default`: Self { .init(unsafeAddress: 0x40018000) }

    /// GPIO status
    @RegisterBank(offset: 0x0000)
    public var gpio_qspi_sclk_status: Register<GPIO_QSPI_SCLK_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO_QSPI_SCLK_STATUS {
        /// interrupt to processors, after override is applied
        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var irqtoproc: IRQTOPROC_Field

        /// interrupt from pad before override is applied
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var irqfrompad: IRQFROMPAD_Field

        /// input signal to peripheral, after override is applied
        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var intoperi: INTOPERI_Field

        /// input signal from pad, before override is applied
        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var infrompad: INFROMPAD_Field

        /// output enable to pad after register override is applied
        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var oetopad: OETOPAD_Field

        /// output enable from selected peripheral, before register override is applied
        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var oefromperi: OEFROMPERI_Field

        /// output signal to pad after register override is applied
        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var outtopad: OUTTOPAD_Field

        /// output signal from selected peripheral, before register override is applied
        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var outfromperi: OUTFROMPERI_Field
    }

    /// GPIO control including function select and overrides.
    @RegisterBank(offset: 0x0004)
    public var gpio_qspi_sclk_ctrl: Register<GPIO_QSPI_SCLK_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO_QSPI_SCLK_CTRL {
        @ReadWrite(bits: 28..<30, as: IRQOVER_Values.self)
        public var irqover: IRQOVER_Field

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
        public var inover: INOVER_Field

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
        public var oeover: OEOVER_Field

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
        public var outover: OUTOVER_Field

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
        public var funcsel: FUNCSEL_Field

        public enum FUNCSEL_Values: UInt, BitFieldProjectable {
            case FUNCSEL_xip_sclk = 0
            case FUNCSEL_sio_30 = 5
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x0008)
    public var gpio_qspi_ss_status: Register<GPIO_QSPI_SS_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO_QSPI_SS_STATUS {
        /// interrupt to processors, after override is applied
        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var irqtoproc: IRQTOPROC_Field

        /// interrupt from pad before override is applied
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var irqfrompad: IRQFROMPAD_Field

        /// input signal to peripheral, after override is applied
        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var intoperi: INTOPERI_Field

        /// input signal from pad, before override is applied
        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var infrompad: INFROMPAD_Field

        /// output enable to pad after register override is applied
        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var oetopad: OETOPAD_Field

        /// output enable from selected peripheral, before register override is applied
        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var oefromperi: OEFROMPERI_Field

        /// output signal to pad after register override is applied
        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var outtopad: OUTTOPAD_Field

        /// output signal from selected peripheral, before register override is applied
        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var outfromperi: OUTFROMPERI_Field
    }

    /// GPIO control including function select and overrides.
    @RegisterBank(offset: 0x000c)
    public var gpio_qspi_ss_ctrl: Register<GPIO_QSPI_SS_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO_QSPI_SS_CTRL {
        @ReadWrite(bits: 28..<30, as: IRQOVER_Values.self)
        public var irqover: IRQOVER_Field

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
        public var inover: INOVER_Field

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
        public var oeover: OEOVER_Field

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
        public var outover: OUTOVER_Field

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
        public var funcsel: FUNCSEL_Field

        public enum FUNCSEL_Values: UInt, BitFieldProjectable {
            case FUNCSEL_xip_ss_n = 0
            case FUNCSEL_sio_31 = 5
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x0010)
    public var gpio_qspi_sd0_status: Register<GPIO_QSPI_SD0_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO_QSPI_SD0_STATUS {
        /// interrupt to processors, after override is applied
        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var irqtoproc: IRQTOPROC_Field

        /// interrupt from pad before override is applied
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var irqfrompad: IRQFROMPAD_Field

        /// input signal to peripheral, after override is applied
        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var intoperi: INTOPERI_Field

        /// input signal from pad, before override is applied
        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var infrompad: INFROMPAD_Field

        /// output enable to pad after register override is applied
        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var oetopad: OETOPAD_Field

        /// output enable from selected peripheral, before register override is applied
        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var oefromperi: OEFROMPERI_Field

        /// output signal to pad after register override is applied
        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var outtopad: OUTTOPAD_Field

        /// output signal from selected peripheral, before register override is applied
        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var outfromperi: OUTFROMPERI_Field
    }

    /// GPIO control including function select and overrides.
    @RegisterBank(offset: 0x0014)
    public var gpio_qspi_sd0_ctrl: Register<GPIO_QSPI_SD0_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO_QSPI_SD0_CTRL {
        @ReadWrite(bits: 28..<30, as: IRQOVER_Values.self)
        public var irqover: IRQOVER_Field

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
        public var inover: INOVER_Field

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
        public var oeover: OEOVER_Field

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
        public var outover: OUTOVER_Field

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
        public var funcsel: FUNCSEL_Field

        public enum FUNCSEL_Values: UInt, BitFieldProjectable {
            case FUNCSEL_xip_sd0 = 0
            case FUNCSEL_sio_32 = 5
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x0018)
    public var gpio_qspi_sd1_status: Register<GPIO_QSPI_SD1_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO_QSPI_SD1_STATUS {
        /// interrupt to processors, after override is applied
        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var irqtoproc: IRQTOPROC_Field

        /// interrupt from pad before override is applied
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var irqfrompad: IRQFROMPAD_Field

        /// input signal to peripheral, after override is applied
        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var intoperi: INTOPERI_Field

        /// input signal from pad, before override is applied
        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var infrompad: INFROMPAD_Field

        /// output enable to pad after register override is applied
        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var oetopad: OETOPAD_Field

        /// output enable from selected peripheral, before register override is applied
        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var oefromperi: OEFROMPERI_Field

        /// output signal to pad after register override is applied
        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var outtopad: OUTTOPAD_Field

        /// output signal from selected peripheral, before register override is applied
        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var outfromperi: OUTFROMPERI_Field
    }

    /// GPIO control including function select and overrides.
    @RegisterBank(offset: 0x001c)
    public var gpio_qspi_sd1_ctrl: Register<GPIO_QSPI_SD1_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO_QSPI_SD1_CTRL {
        @ReadWrite(bits: 28..<30, as: IRQOVER_Values.self)
        public var irqover: IRQOVER_Field

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
        public var inover: INOVER_Field

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
        public var oeover: OEOVER_Field

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
        public var outover: OUTOVER_Field

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
        public var funcsel: FUNCSEL_Field

        public enum FUNCSEL_Values: UInt, BitFieldProjectable {
            case FUNCSEL_xip_sd1 = 0
            case FUNCSEL_sio_33 = 5
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x0020)
    public var gpio_qspi_sd2_status: Register<GPIO_QSPI_SD2_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO_QSPI_SD2_STATUS {
        /// interrupt to processors, after override is applied
        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var irqtoproc: IRQTOPROC_Field

        /// interrupt from pad before override is applied
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var irqfrompad: IRQFROMPAD_Field

        /// input signal to peripheral, after override is applied
        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var intoperi: INTOPERI_Field

        /// input signal from pad, before override is applied
        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var infrompad: INFROMPAD_Field

        /// output enable to pad after register override is applied
        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var oetopad: OETOPAD_Field

        /// output enable from selected peripheral, before register override is applied
        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var oefromperi: OEFROMPERI_Field

        /// output signal to pad after register override is applied
        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var outtopad: OUTTOPAD_Field

        /// output signal from selected peripheral, before register override is applied
        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var outfromperi: OUTFROMPERI_Field
    }

    /// GPIO control including function select and overrides.
    @RegisterBank(offset: 0x0024)
    public var gpio_qspi_sd2_ctrl: Register<GPIO_QSPI_SD2_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO_QSPI_SD2_CTRL {
        @ReadWrite(bits: 28..<30, as: IRQOVER_Values.self)
        public var irqover: IRQOVER_Field

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
        public var inover: INOVER_Field

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
        public var oeover: OEOVER_Field

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
        public var outover: OUTOVER_Field

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
        public var funcsel: FUNCSEL_Field

        public enum FUNCSEL_Values: UInt, BitFieldProjectable {
            case FUNCSEL_xip_sd2 = 0
            case FUNCSEL_sio_34 = 5
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x0028)
    public var gpio_qspi_sd3_status: Register<GPIO_QSPI_SD3_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO_QSPI_SD3_STATUS {
        /// interrupt to processors, after override is applied
        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var irqtoproc: IRQTOPROC_Field

        /// interrupt from pad before override is applied
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var irqfrompad: IRQFROMPAD_Field

        /// input signal to peripheral, after override is applied
        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var intoperi: INTOPERI_Field

        /// input signal from pad, before override is applied
        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var infrompad: INFROMPAD_Field

        /// output enable to pad after register override is applied
        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var oetopad: OETOPAD_Field

        /// output enable from selected peripheral, before register override is applied
        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var oefromperi: OEFROMPERI_Field

        /// output signal to pad after register override is applied
        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var outtopad: OUTTOPAD_Field

        /// output signal from selected peripheral, before register override is applied
        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var outfromperi: OUTFROMPERI_Field
    }

    /// GPIO control including function select and overrides.
    @RegisterBank(offset: 0x002c)
    public var gpio_qspi_sd3_ctrl: Register<GPIO_QSPI_SD3_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO_QSPI_SD3_CTRL {
        @ReadWrite(bits: 28..<30, as: IRQOVER_Values.self)
        public var irqover: IRQOVER_Field

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
        public var inover: INOVER_Field

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
        public var oeover: OEOVER_Field

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
        public var outover: OUTOVER_Field

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
        public var funcsel: FUNCSEL_Field

        public enum FUNCSEL_Values: UInt, BitFieldProjectable {
            case FUNCSEL_xip_sd3 = 0
            case FUNCSEL_sio_35 = 5
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// Raw Interrupts
    @RegisterBank(offset: 0x0030)
    public var intr: Register<INTR>

    @Register(bitWidth: 32)
    public struct INTR {
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio_qspi_sd3_edge_high: GPIO_QSPI_SD3_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio_qspi_sd3_edge_low: GPIO_QSPI_SD3_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var gpio_qspi_sd3_level_high: GPIO_QSPI_SD3_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var gpio_qspi_sd3_level_low: GPIO_QSPI_SD3_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio_qspi_sd2_edge_high: GPIO_QSPI_SD2_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio_qspi_sd2_edge_low: GPIO_QSPI_SD2_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var gpio_qspi_sd2_level_high: GPIO_QSPI_SD2_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var gpio_qspi_sd2_level_low: GPIO_QSPI_SD2_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio_qspi_sd1_edge_high: GPIO_QSPI_SD1_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio_qspi_sd1_edge_low: GPIO_QSPI_SD1_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var gpio_qspi_sd1_level_high: GPIO_QSPI_SD1_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var gpio_qspi_sd1_level_low: GPIO_QSPI_SD1_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio_qspi_sd0_edge_high: GPIO_QSPI_SD0_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio_qspi_sd0_edge_low: GPIO_QSPI_SD0_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var gpio_qspi_sd0_level_high: GPIO_QSPI_SD0_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var gpio_qspi_sd0_level_low: GPIO_QSPI_SD0_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio_qspi_ss_edge_high: GPIO_QSPI_SS_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio_qspi_ss_edge_low: GPIO_QSPI_SS_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var gpio_qspi_ss_level_high: GPIO_QSPI_SS_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var gpio_qspi_ss_level_low: GPIO_QSPI_SS_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio_qspi_sclk_edge_high: GPIO_QSPI_SCLK_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio_qspi_sclk_edge_low: GPIO_QSPI_SCLK_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var gpio_qspi_sclk_level_high: GPIO_QSPI_SCLK_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var gpio_qspi_sclk_level_low: GPIO_QSPI_SCLK_LEVEL_LOW_Field
    }

    /// Interrupt Enable for proc0
    @RegisterBank(offset: 0x0034)
    public var proc0_inte: Register<PROC0_INTE>

    @Register(bitWidth: 32)
    public struct PROC0_INTE {
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio_qspi_sd3_edge_high: GPIO_QSPI_SD3_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio_qspi_sd3_edge_low: GPIO_QSPI_SD3_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var gpio_qspi_sd3_level_high: GPIO_QSPI_SD3_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var gpio_qspi_sd3_level_low: GPIO_QSPI_SD3_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio_qspi_sd2_edge_high: GPIO_QSPI_SD2_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio_qspi_sd2_edge_low: GPIO_QSPI_SD2_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var gpio_qspi_sd2_level_high: GPIO_QSPI_SD2_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var gpio_qspi_sd2_level_low: GPIO_QSPI_SD2_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio_qspi_sd1_edge_high: GPIO_QSPI_SD1_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio_qspi_sd1_edge_low: GPIO_QSPI_SD1_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var gpio_qspi_sd1_level_high: GPIO_QSPI_SD1_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var gpio_qspi_sd1_level_low: GPIO_QSPI_SD1_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio_qspi_sd0_edge_high: GPIO_QSPI_SD0_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio_qspi_sd0_edge_low: GPIO_QSPI_SD0_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var gpio_qspi_sd0_level_high: GPIO_QSPI_SD0_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var gpio_qspi_sd0_level_low: GPIO_QSPI_SD0_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio_qspi_ss_edge_high: GPIO_QSPI_SS_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio_qspi_ss_edge_low: GPIO_QSPI_SS_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var gpio_qspi_ss_level_high: GPIO_QSPI_SS_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var gpio_qspi_ss_level_low: GPIO_QSPI_SS_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio_qspi_sclk_edge_high: GPIO_QSPI_SCLK_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio_qspi_sclk_edge_low: GPIO_QSPI_SCLK_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var gpio_qspi_sclk_level_high: GPIO_QSPI_SCLK_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var gpio_qspi_sclk_level_low: GPIO_QSPI_SCLK_LEVEL_LOW_Field
    }

    /// Interrupt Force for proc0
    @RegisterBank(offset: 0x0038)
    public var proc0_intf: Register<PROC0_INTF>

    @Register(bitWidth: 32)
    public struct PROC0_INTF {
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio_qspi_sd3_edge_high: GPIO_QSPI_SD3_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio_qspi_sd3_edge_low: GPIO_QSPI_SD3_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var gpio_qspi_sd3_level_high: GPIO_QSPI_SD3_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var gpio_qspi_sd3_level_low: GPIO_QSPI_SD3_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio_qspi_sd2_edge_high: GPIO_QSPI_SD2_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio_qspi_sd2_edge_low: GPIO_QSPI_SD2_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var gpio_qspi_sd2_level_high: GPIO_QSPI_SD2_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var gpio_qspi_sd2_level_low: GPIO_QSPI_SD2_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio_qspi_sd1_edge_high: GPIO_QSPI_SD1_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio_qspi_sd1_edge_low: GPIO_QSPI_SD1_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var gpio_qspi_sd1_level_high: GPIO_QSPI_SD1_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var gpio_qspi_sd1_level_low: GPIO_QSPI_SD1_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio_qspi_sd0_edge_high: GPIO_QSPI_SD0_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio_qspi_sd0_edge_low: GPIO_QSPI_SD0_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var gpio_qspi_sd0_level_high: GPIO_QSPI_SD0_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var gpio_qspi_sd0_level_low: GPIO_QSPI_SD0_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio_qspi_ss_edge_high: GPIO_QSPI_SS_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio_qspi_ss_edge_low: GPIO_QSPI_SS_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var gpio_qspi_ss_level_high: GPIO_QSPI_SS_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var gpio_qspi_ss_level_low: GPIO_QSPI_SS_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio_qspi_sclk_edge_high: GPIO_QSPI_SCLK_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio_qspi_sclk_edge_low: GPIO_QSPI_SCLK_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var gpio_qspi_sclk_level_high: GPIO_QSPI_SCLK_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var gpio_qspi_sclk_level_low: GPIO_QSPI_SCLK_LEVEL_LOW_Field
    }

    /// Interrupt status after masking & forcing for proc0
    @RegisterBank(offset: 0x003c)
    public var proc0_ints: Register<PROC0_INTS>

    @Register(bitWidth: 32)
    public struct PROC0_INTS {
        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var gpio_qspi_sd3_edge_high: GPIO_QSPI_SD3_EDGE_HIGH_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var gpio_qspi_sd3_edge_low: GPIO_QSPI_SD3_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var gpio_qspi_sd3_level_high: GPIO_QSPI_SD3_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var gpio_qspi_sd3_level_low: GPIO_QSPI_SD3_LEVEL_LOW_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var gpio_qspi_sd2_edge_high: GPIO_QSPI_SD2_EDGE_HIGH_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var gpio_qspi_sd2_edge_low: GPIO_QSPI_SD2_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var gpio_qspi_sd2_level_high: GPIO_QSPI_SD2_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var gpio_qspi_sd2_level_low: GPIO_QSPI_SD2_LEVEL_LOW_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var gpio_qspi_sd1_edge_high: GPIO_QSPI_SD1_EDGE_HIGH_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var gpio_qspi_sd1_edge_low: GPIO_QSPI_SD1_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var gpio_qspi_sd1_level_high: GPIO_QSPI_SD1_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var gpio_qspi_sd1_level_low: GPIO_QSPI_SD1_LEVEL_LOW_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var gpio_qspi_sd0_edge_high: GPIO_QSPI_SD0_EDGE_HIGH_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var gpio_qspi_sd0_edge_low: GPIO_QSPI_SD0_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var gpio_qspi_sd0_level_high: GPIO_QSPI_SD0_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var gpio_qspi_sd0_level_low: GPIO_QSPI_SD0_LEVEL_LOW_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var gpio_qspi_ss_edge_high: GPIO_QSPI_SS_EDGE_HIGH_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var gpio_qspi_ss_edge_low: GPIO_QSPI_SS_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var gpio_qspi_ss_level_high: GPIO_QSPI_SS_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var gpio_qspi_ss_level_low: GPIO_QSPI_SS_LEVEL_LOW_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var gpio_qspi_sclk_edge_high: GPIO_QSPI_SCLK_EDGE_HIGH_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var gpio_qspi_sclk_edge_low: GPIO_QSPI_SCLK_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var gpio_qspi_sclk_level_high: GPIO_QSPI_SCLK_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var gpio_qspi_sclk_level_low: GPIO_QSPI_SCLK_LEVEL_LOW_Field
    }

    /// Interrupt Enable for proc1
    @RegisterBank(offset: 0x0040)
    public var proc1_inte: Register<PROC1_INTE>

    @Register(bitWidth: 32)
    public struct PROC1_INTE {
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio_qspi_sd3_edge_high: GPIO_QSPI_SD3_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio_qspi_sd3_edge_low: GPIO_QSPI_SD3_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var gpio_qspi_sd3_level_high: GPIO_QSPI_SD3_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var gpio_qspi_sd3_level_low: GPIO_QSPI_SD3_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio_qspi_sd2_edge_high: GPIO_QSPI_SD2_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio_qspi_sd2_edge_low: GPIO_QSPI_SD2_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var gpio_qspi_sd2_level_high: GPIO_QSPI_SD2_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var gpio_qspi_sd2_level_low: GPIO_QSPI_SD2_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio_qspi_sd1_edge_high: GPIO_QSPI_SD1_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio_qspi_sd1_edge_low: GPIO_QSPI_SD1_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var gpio_qspi_sd1_level_high: GPIO_QSPI_SD1_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var gpio_qspi_sd1_level_low: GPIO_QSPI_SD1_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio_qspi_sd0_edge_high: GPIO_QSPI_SD0_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio_qspi_sd0_edge_low: GPIO_QSPI_SD0_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var gpio_qspi_sd0_level_high: GPIO_QSPI_SD0_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var gpio_qspi_sd0_level_low: GPIO_QSPI_SD0_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio_qspi_ss_edge_high: GPIO_QSPI_SS_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio_qspi_ss_edge_low: GPIO_QSPI_SS_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var gpio_qspi_ss_level_high: GPIO_QSPI_SS_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var gpio_qspi_ss_level_low: GPIO_QSPI_SS_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio_qspi_sclk_edge_high: GPIO_QSPI_SCLK_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio_qspi_sclk_edge_low: GPIO_QSPI_SCLK_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var gpio_qspi_sclk_level_high: GPIO_QSPI_SCLK_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var gpio_qspi_sclk_level_low: GPIO_QSPI_SCLK_LEVEL_LOW_Field
    }

    /// Interrupt Force for proc1
    @RegisterBank(offset: 0x0044)
    public var proc1_intf: Register<PROC1_INTF>

    @Register(bitWidth: 32)
    public struct PROC1_INTF {
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio_qspi_sd3_edge_high: GPIO_QSPI_SD3_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio_qspi_sd3_edge_low: GPIO_QSPI_SD3_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var gpio_qspi_sd3_level_high: GPIO_QSPI_SD3_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var gpio_qspi_sd3_level_low: GPIO_QSPI_SD3_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio_qspi_sd2_edge_high: GPIO_QSPI_SD2_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio_qspi_sd2_edge_low: GPIO_QSPI_SD2_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var gpio_qspi_sd2_level_high: GPIO_QSPI_SD2_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var gpio_qspi_sd2_level_low: GPIO_QSPI_SD2_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio_qspi_sd1_edge_high: GPIO_QSPI_SD1_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio_qspi_sd1_edge_low: GPIO_QSPI_SD1_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var gpio_qspi_sd1_level_high: GPIO_QSPI_SD1_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var gpio_qspi_sd1_level_low: GPIO_QSPI_SD1_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio_qspi_sd0_edge_high: GPIO_QSPI_SD0_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio_qspi_sd0_edge_low: GPIO_QSPI_SD0_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var gpio_qspi_sd0_level_high: GPIO_QSPI_SD0_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var gpio_qspi_sd0_level_low: GPIO_QSPI_SD0_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio_qspi_ss_edge_high: GPIO_QSPI_SS_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio_qspi_ss_edge_low: GPIO_QSPI_SS_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var gpio_qspi_ss_level_high: GPIO_QSPI_SS_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var gpio_qspi_ss_level_low: GPIO_QSPI_SS_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio_qspi_sclk_edge_high: GPIO_QSPI_SCLK_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio_qspi_sclk_edge_low: GPIO_QSPI_SCLK_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var gpio_qspi_sclk_level_high: GPIO_QSPI_SCLK_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var gpio_qspi_sclk_level_low: GPIO_QSPI_SCLK_LEVEL_LOW_Field
    }

    /// Interrupt status after masking & forcing for proc1
    @RegisterBank(offset: 0x0048)
    public var proc1_ints: Register<PROC1_INTS>

    @Register(bitWidth: 32)
    public struct PROC1_INTS {
        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var gpio_qspi_sd3_edge_high: GPIO_QSPI_SD3_EDGE_HIGH_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var gpio_qspi_sd3_edge_low: GPIO_QSPI_SD3_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var gpio_qspi_sd3_level_high: GPIO_QSPI_SD3_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var gpio_qspi_sd3_level_low: GPIO_QSPI_SD3_LEVEL_LOW_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var gpio_qspi_sd2_edge_high: GPIO_QSPI_SD2_EDGE_HIGH_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var gpio_qspi_sd2_edge_low: GPIO_QSPI_SD2_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var gpio_qspi_sd2_level_high: GPIO_QSPI_SD2_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var gpio_qspi_sd2_level_low: GPIO_QSPI_SD2_LEVEL_LOW_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var gpio_qspi_sd1_edge_high: GPIO_QSPI_SD1_EDGE_HIGH_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var gpio_qspi_sd1_edge_low: GPIO_QSPI_SD1_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var gpio_qspi_sd1_level_high: GPIO_QSPI_SD1_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var gpio_qspi_sd1_level_low: GPIO_QSPI_SD1_LEVEL_LOW_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var gpio_qspi_sd0_edge_high: GPIO_QSPI_SD0_EDGE_HIGH_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var gpio_qspi_sd0_edge_low: GPIO_QSPI_SD0_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var gpio_qspi_sd0_level_high: GPIO_QSPI_SD0_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var gpio_qspi_sd0_level_low: GPIO_QSPI_SD0_LEVEL_LOW_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var gpio_qspi_ss_edge_high: GPIO_QSPI_SS_EDGE_HIGH_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var gpio_qspi_ss_edge_low: GPIO_QSPI_SS_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var gpio_qspi_ss_level_high: GPIO_QSPI_SS_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var gpio_qspi_ss_level_low: GPIO_QSPI_SS_LEVEL_LOW_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var gpio_qspi_sclk_edge_high: GPIO_QSPI_SCLK_EDGE_HIGH_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var gpio_qspi_sclk_edge_low: GPIO_QSPI_SCLK_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var gpio_qspi_sclk_level_high: GPIO_QSPI_SCLK_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var gpio_qspi_sclk_level_low: GPIO_QSPI_SCLK_LEVEL_LOW_Field
    }

    /// Interrupt Enable for dormant_wake
    @RegisterBank(offset: 0x004c)
    public var dormant_wake_inte: Register<DORMANT_WAKE_INTE>

    @Register(bitWidth: 32)
    public struct DORMANT_WAKE_INTE {
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio_qspi_sd3_edge_high: GPIO_QSPI_SD3_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio_qspi_sd3_edge_low: GPIO_QSPI_SD3_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var gpio_qspi_sd3_level_high: GPIO_QSPI_SD3_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var gpio_qspi_sd3_level_low: GPIO_QSPI_SD3_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio_qspi_sd2_edge_high: GPIO_QSPI_SD2_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio_qspi_sd2_edge_low: GPIO_QSPI_SD2_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var gpio_qspi_sd2_level_high: GPIO_QSPI_SD2_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var gpio_qspi_sd2_level_low: GPIO_QSPI_SD2_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio_qspi_sd1_edge_high: GPIO_QSPI_SD1_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio_qspi_sd1_edge_low: GPIO_QSPI_SD1_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var gpio_qspi_sd1_level_high: GPIO_QSPI_SD1_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var gpio_qspi_sd1_level_low: GPIO_QSPI_SD1_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio_qspi_sd0_edge_high: GPIO_QSPI_SD0_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio_qspi_sd0_edge_low: GPIO_QSPI_SD0_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var gpio_qspi_sd0_level_high: GPIO_QSPI_SD0_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var gpio_qspi_sd0_level_low: GPIO_QSPI_SD0_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio_qspi_ss_edge_high: GPIO_QSPI_SS_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio_qspi_ss_edge_low: GPIO_QSPI_SS_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var gpio_qspi_ss_level_high: GPIO_QSPI_SS_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var gpio_qspi_ss_level_low: GPIO_QSPI_SS_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio_qspi_sclk_edge_high: GPIO_QSPI_SCLK_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio_qspi_sclk_edge_low: GPIO_QSPI_SCLK_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var gpio_qspi_sclk_level_high: GPIO_QSPI_SCLK_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var gpio_qspi_sclk_level_low: GPIO_QSPI_SCLK_LEVEL_LOW_Field
    }

    /// Interrupt Force for dormant_wake
    @RegisterBank(offset: 0x0050)
    public var dormant_wake_intf: Register<DORMANT_WAKE_INTF>

    @Register(bitWidth: 32)
    public struct DORMANT_WAKE_INTF {
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio_qspi_sd3_edge_high: GPIO_QSPI_SD3_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio_qspi_sd3_edge_low: GPIO_QSPI_SD3_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var gpio_qspi_sd3_level_high: GPIO_QSPI_SD3_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var gpio_qspi_sd3_level_low: GPIO_QSPI_SD3_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio_qspi_sd2_edge_high: GPIO_QSPI_SD2_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio_qspi_sd2_edge_low: GPIO_QSPI_SD2_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var gpio_qspi_sd2_level_high: GPIO_QSPI_SD2_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var gpio_qspi_sd2_level_low: GPIO_QSPI_SD2_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio_qspi_sd1_edge_high: GPIO_QSPI_SD1_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio_qspi_sd1_edge_low: GPIO_QSPI_SD1_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var gpio_qspi_sd1_level_high: GPIO_QSPI_SD1_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var gpio_qspi_sd1_level_low: GPIO_QSPI_SD1_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio_qspi_sd0_edge_high: GPIO_QSPI_SD0_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio_qspi_sd0_edge_low: GPIO_QSPI_SD0_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var gpio_qspi_sd0_level_high: GPIO_QSPI_SD0_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var gpio_qspi_sd0_level_low: GPIO_QSPI_SD0_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio_qspi_ss_edge_high: GPIO_QSPI_SS_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio_qspi_ss_edge_low: GPIO_QSPI_SS_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var gpio_qspi_ss_level_high: GPIO_QSPI_SS_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var gpio_qspi_ss_level_low: GPIO_QSPI_SS_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio_qspi_sclk_edge_high: GPIO_QSPI_SCLK_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio_qspi_sclk_edge_low: GPIO_QSPI_SCLK_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var gpio_qspi_sclk_level_high: GPIO_QSPI_SCLK_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var gpio_qspi_sclk_level_low: GPIO_QSPI_SCLK_LEVEL_LOW_Field
    }

    /// Interrupt status after masking & forcing for dormant_wake
    @RegisterBank(offset: 0x0054)
    public var dormant_wake_ints: Register<DORMANT_WAKE_INTS>

    @Register(bitWidth: 32)
    public struct DORMANT_WAKE_INTS {
        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var gpio_qspi_sd3_edge_high: GPIO_QSPI_SD3_EDGE_HIGH_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var gpio_qspi_sd3_edge_low: GPIO_QSPI_SD3_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var gpio_qspi_sd3_level_high: GPIO_QSPI_SD3_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var gpio_qspi_sd3_level_low: GPIO_QSPI_SD3_LEVEL_LOW_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var gpio_qspi_sd2_edge_high: GPIO_QSPI_SD2_EDGE_HIGH_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var gpio_qspi_sd2_edge_low: GPIO_QSPI_SD2_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var gpio_qspi_sd2_level_high: GPIO_QSPI_SD2_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var gpio_qspi_sd2_level_low: GPIO_QSPI_SD2_LEVEL_LOW_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var gpio_qspi_sd1_edge_high: GPIO_QSPI_SD1_EDGE_HIGH_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var gpio_qspi_sd1_edge_low: GPIO_QSPI_SD1_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var gpio_qspi_sd1_level_high: GPIO_QSPI_SD1_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var gpio_qspi_sd1_level_low: GPIO_QSPI_SD1_LEVEL_LOW_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var gpio_qspi_sd0_edge_high: GPIO_QSPI_SD0_EDGE_HIGH_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var gpio_qspi_sd0_edge_low: GPIO_QSPI_SD0_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var gpio_qspi_sd0_level_high: GPIO_QSPI_SD0_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var gpio_qspi_sd0_level_low: GPIO_QSPI_SD0_LEVEL_LOW_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var gpio_qspi_ss_edge_high: GPIO_QSPI_SS_EDGE_HIGH_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var gpio_qspi_ss_edge_low: GPIO_QSPI_SS_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var gpio_qspi_ss_level_high: GPIO_QSPI_SS_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var gpio_qspi_ss_level_low: GPIO_QSPI_SS_LEVEL_LOW_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var gpio_qspi_sclk_edge_high: GPIO_QSPI_SCLK_EDGE_HIGH_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var gpio_qspi_sclk_edge_low: GPIO_QSPI_SCLK_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var gpio_qspi_sclk_level_high: GPIO_QSPI_SCLK_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var gpio_qspi_sclk_level_low: GPIO_QSPI_SCLK_LEVEL_LOW_Field
    }
}
