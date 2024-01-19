import MMIO
import MMIOExtensions

@RegisterBank
public struct IO_BANK0 {

    public static var `default`: Self { .init(unsafeAddress: 0x40014000) }

    /// GPIO status
    @RegisterBank(offset: 0x0000)
    public var GPIO0_STATUS: Register<GPIO0_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO0_STATUS_Descriptor {
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
    public var GPIO0_CTRL: Register<GPIO0_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO0_CTRL_Descriptor {
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
            case FUNCSEL_jtag_tck = 0
            case FUNCSEL_spi0_rx = 1
            case FUNCSEL_uart0_tx = 2
            case FUNCSEL_i2c0_sda = 3
            case FUNCSEL_pwm_a_0 = 4
            case FUNCSEL_sio_0 = 5
            case FUNCSEL_pio0_0 = 6
            case FUNCSEL_pio1_0 = 7
            case FUNCSEL_usb_muxing_overcurr_detect = 9
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x0008)
    public var GPIO1_STATUS: Register<GPIO1_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO1_STATUS_Descriptor {
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
    public var GPIO1_CTRL: Register<GPIO1_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO1_CTRL_Descriptor {
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
            case FUNCSEL_jtag_tms = 0
            case FUNCSEL_spi0_ss_n = 1
            case FUNCSEL_uart0_rx = 2
            case FUNCSEL_i2c0_scl = 3
            case FUNCSEL_pwm_b_0 = 4
            case FUNCSEL_sio_1 = 5
            case FUNCSEL_pio0_1 = 6
            case FUNCSEL_pio1_1 = 7
            case FUNCSEL_usb_muxing_vbus_detect = 9
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x0010)
    public var GPIO2_STATUS: Register<GPIO2_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO2_STATUS_Descriptor {
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
    public var GPIO2_CTRL: Register<GPIO2_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO2_CTRL_Descriptor {
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
            case FUNCSEL_jtag_tdi = 0
            case FUNCSEL_spi0_sclk = 1
            case FUNCSEL_uart0_cts = 2
            case FUNCSEL_i2c1_sda = 3
            case FUNCSEL_pwm_a_1 = 4
            case FUNCSEL_sio_2 = 5
            case FUNCSEL_pio0_2 = 6
            case FUNCSEL_pio1_2 = 7
            case FUNCSEL_usb_muxing_vbus_en = 9
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x0018)
    public var GPIO3_STATUS: Register<GPIO3_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO3_STATUS_Descriptor {
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
    public var GPIO3_CTRL: Register<GPIO3_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO3_CTRL_Descriptor {
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
            case FUNCSEL_jtag_tdo = 0
            case FUNCSEL_spi0_tx = 1
            case FUNCSEL_uart0_rts = 2
            case FUNCSEL_i2c1_scl = 3
            case FUNCSEL_pwm_b_1 = 4
            case FUNCSEL_sio_3 = 5
            case FUNCSEL_pio0_3 = 6
            case FUNCSEL_pio1_3 = 7
            case FUNCSEL_usb_muxing_overcurr_detect = 9
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x0020)
    public var GPIO4_STATUS: Register<GPIO4_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO4_STATUS_Descriptor {
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
    public var GPIO4_CTRL: Register<GPIO4_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO4_CTRL_Descriptor {
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
            case FUNCSEL_spi0_rx = 1
            case FUNCSEL_uart1_tx = 2
            case FUNCSEL_i2c0_sda = 3
            case FUNCSEL_pwm_a_2 = 4
            case FUNCSEL_sio_4 = 5
            case FUNCSEL_pio0_4 = 6
            case FUNCSEL_pio1_4 = 7
            case FUNCSEL_usb_muxing_vbus_detect = 9
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x0028)
    public var GPIO5_STATUS: Register<GPIO5_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO5_STATUS_Descriptor {
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
    public var GPIO5_CTRL: Register<GPIO5_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO5_CTRL_Descriptor {
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
            case FUNCSEL_spi0_ss_n = 1
            case FUNCSEL_uart1_rx = 2
            case FUNCSEL_i2c0_scl = 3
            case FUNCSEL_pwm_b_2 = 4
            case FUNCSEL_sio_5 = 5
            case FUNCSEL_pio0_5 = 6
            case FUNCSEL_pio1_5 = 7
            case FUNCSEL_usb_muxing_vbus_en = 9
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x0030)
    public var GPIO6_STATUS: Register<GPIO6_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO6_STATUS_Descriptor {
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
    @RegisterBank(offset: 0x0034)
    public var GPIO6_CTRL: Register<GPIO6_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO6_CTRL_Descriptor {
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
            case FUNCSEL_spi0_sclk = 1
            case FUNCSEL_uart1_cts = 2
            case FUNCSEL_i2c1_sda = 3
            case FUNCSEL_pwm_a_3 = 4
            case FUNCSEL_sio_6 = 5
            case FUNCSEL_pio0_6 = 6
            case FUNCSEL_pio1_6 = 7
            case FUNCSEL_usb_muxing_extphy_softcon = 8
            case FUNCSEL_usb_muxing_overcurr_detect = 9
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x0038)
    public var GPIO7_STATUS: Register<GPIO7_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO7_STATUS_Descriptor {
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
    @RegisterBank(offset: 0x003c)
    public var GPIO7_CTRL: Register<GPIO7_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO7_CTRL_Descriptor {
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
            case FUNCSEL_spi0_tx = 1
            case FUNCSEL_uart1_rts = 2
            case FUNCSEL_i2c1_scl = 3
            case FUNCSEL_pwm_b_3 = 4
            case FUNCSEL_sio_7 = 5
            case FUNCSEL_pio0_7 = 6
            case FUNCSEL_pio1_7 = 7
            case FUNCSEL_usb_muxing_extphy_oe_n = 8
            case FUNCSEL_usb_muxing_vbus_detect = 9
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x0040)
    public var GPIO8_STATUS: Register<GPIO8_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO8_STATUS_Descriptor {
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
    @RegisterBank(offset: 0x0044)
    public var GPIO8_CTRL: Register<GPIO8_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO8_CTRL_Descriptor {
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
            case FUNCSEL_spi1_rx = 1
            case FUNCSEL_uart1_tx = 2
            case FUNCSEL_i2c0_sda = 3
            case FUNCSEL_pwm_a_4 = 4
            case FUNCSEL_sio_8 = 5
            case FUNCSEL_pio0_8 = 6
            case FUNCSEL_pio1_8 = 7
            case FUNCSEL_usb_muxing_extphy_rcv = 8
            case FUNCSEL_usb_muxing_vbus_en = 9
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x0048)
    public var GPIO9_STATUS: Register<GPIO9_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO9_STATUS_Descriptor {
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
    @RegisterBank(offset: 0x004c)
    public var GPIO9_CTRL: Register<GPIO9_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO9_CTRL_Descriptor {
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
            case FUNCSEL_spi1_ss_n = 1
            case FUNCSEL_uart1_rx = 2
            case FUNCSEL_i2c0_scl = 3
            case FUNCSEL_pwm_b_4 = 4
            case FUNCSEL_sio_9 = 5
            case FUNCSEL_pio0_9 = 6
            case FUNCSEL_pio1_9 = 7
            case FUNCSEL_usb_muxing_extphy_vp = 8
            case FUNCSEL_usb_muxing_overcurr_detect = 9
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x0050)
    public var GPIO10_STATUS: Register<GPIO10_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO10_STATUS_Descriptor {
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
    @RegisterBank(offset: 0x0054)
    public var GPIO10_CTRL: Register<GPIO10_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO10_CTRL_Descriptor {
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
            case FUNCSEL_spi1_sclk = 1
            case FUNCSEL_uart1_cts = 2
            case FUNCSEL_i2c1_sda = 3
            case FUNCSEL_pwm_a_5 = 4
            case FUNCSEL_sio_10 = 5
            case FUNCSEL_pio0_10 = 6
            case FUNCSEL_pio1_10 = 7
            case FUNCSEL_usb_muxing_extphy_vm = 8
            case FUNCSEL_usb_muxing_vbus_detect = 9
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x0058)
    public var GPIO11_STATUS: Register<GPIO11_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO11_STATUS_Descriptor {
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
    @RegisterBank(offset: 0x005c)
    public var GPIO11_CTRL: Register<GPIO11_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO11_CTRL_Descriptor {
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
            case FUNCSEL_spi1_tx = 1
            case FUNCSEL_uart1_rts = 2
            case FUNCSEL_i2c1_scl = 3
            case FUNCSEL_pwm_b_5 = 4
            case FUNCSEL_sio_11 = 5
            case FUNCSEL_pio0_11 = 6
            case FUNCSEL_pio1_11 = 7
            case FUNCSEL_usb_muxing_extphy_suspnd = 8
            case FUNCSEL_usb_muxing_vbus_en = 9
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x0060)
    public var GPIO12_STATUS: Register<GPIO12_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO12_STATUS_Descriptor {
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
    @RegisterBank(offset: 0x0064)
    public var GPIO12_CTRL: Register<GPIO12_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO12_CTRL_Descriptor {
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
            case FUNCSEL_spi1_rx = 1
            case FUNCSEL_uart0_tx = 2
            case FUNCSEL_i2c0_sda = 3
            case FUNCSEL_pwm_a_6 = 4
            case FUNCSEL_sio_12 = 5
            case FUNCSEL_pio0_12 = 6
            case FUNCSEL_pio1_12 = 7
            case FUNCSEL_usb_muxing_extphy_speed = 8
            case FUNCSEL_usb_muxing_overcurr_detect = 9
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x0068)
    public var GPIO13_STATUS: Register<GPIO13_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO13_STATUS_Descriptor {
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
    @RegisterBank(offset: 0x006c)
    public var GPIO13_CTRL: Register<GPIO13_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO13_CTRL_Descriptor {
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
            case FUNCSEL_spi1_ss_n = 1
            case FUNCSEL_uart0_rx = 2
            case FUNCSEL_i2c0_scl = 3
            case FUNCSEL_pwm_b_6 = 4
            case FUNCSEL_sio_13 = 5
            case FUNCSEL_pio0_13 = 6
            case FUNCSEL_pio1_13 = 7
            case FUNCSEL_usb_muxing_extphy_vpo = 8
            case FUNCSEL_usb_muxing_vbus_detect = 9
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x0070)
    public var GPIO14_STATUS: Register<GPIO14_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO14_STATUS_Descriptor {
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
    @RegisterBank(offset: 0x0074)
    public var GPIO14_CTRL: Register<GPIO14_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO14_CTRL_Descriptor {
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
            case FUNCSEL_spi1_sclk = 1
            case FUNCSEL_uart0_cts = 2
            case FUNCSEL_i2c1_sda = 3
            case FUNCSEL_pwm_a_7 = 4
            case FUNCSEL_sio_14 = 5
            case FUNCSEL_pio0_14 = 6
            case FUNCSEL_pio1_14 = 7
            case FUNCSEL_usb_muxing_extphy_vmo = 8
            case FUNCSEL_usb_muxing_vbus_en = 9
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x0078)
    public var GPIO15_STATUS: Register<GPIO15_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO15_STATUS_Descriptor {
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
    @RegisterBank(offset: 0x007c)
    public var GPIO15_CTRL: Register<GPIO15_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO15_CTRL_Descriptor {
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
            case FUNCSEL_spi1_tx = 1
            case FUNCSEL_uart0_rts = 2
            case FUNCSEL_i2c1_scl = 3
            case FUNCSEL_pwm_b_7 = 4
            case FUNCSEL_sio_15 = 5
            case FUNCSEL_pio0_15 = 6
            case FUNCSEL_pio1_15 = 7
            case FUNCSEL_usb_muxing_digital_dp = 8
            case FUNCSEL_usb_muxing_overcurr_detect = 9
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x0080)
    public var GPIO16_STATUS: Register<GPIO16_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO16_STATUS_Descriptor {
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
    @RegisterBank(offset: 0x0084)
    public var GPIO16_CTRL: Register<GPIO16_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO16_CTRL_Descriptor {
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
            case FUNCSEL_spi0_rx = 1
            case FUNCSEL_uart0_tx = 2
            case FUNCSEL_i2c0_sda = 3
            case FUNCSEL_pwm_a_0 = 4
            case FUNCSEL_sio_16 = 5
            case FUNCSEL_pio0_16 = 6
            case FUNCSEL_pio1_16 = 7
            case FUNCSEL_usb_muxing_digital_dm = 8
            case FUNCSEL_usb_muxing_vbus_detect = 9
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x0088)
    public var GPIO17_STATUS: Register<GPIO17_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO17_STATUS_Descriptor {
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
    @RegisterBank(offset: 0x008c)
    public var GPIO17_CTRL: Register<GPIO17_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO17_CTRL_Descriptor {
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
            case FUNCSEL_spi0_ss_n = 1
            case FUNCSEL_uart0_rx = 2
            case FUNCSEL_i2c0_scl = 3
            case FUNCSEL_pwm_b_0 = 4
            case FUNCSEL_sio_17 = 5
            case FUNCSEL_pio0_17 = 6
            case FUNCSEL_pio1_17 = 7
            case FUNCSEL_usb_muxing_vbus_en = 9
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x0090)
    public var GPIO18_STATUS: Register<GPIO18_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO18_STATUS_Descriptor {
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
    @RegisterBank(offset: 0x0094)
    public var GPIO18_CTRL: Register<GPIO18_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO18_CTRL_Descriptor {
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
            case FUNCSEL_spi0_sclk = 1
            case FUNCSEL_uart0_cts = 2
            case FUNCSEL_i2c1_sda = 3
            case FUNCSEL_pwm_a_1 = 4
            case FUNCSEL_sio_18 = 5
            case FUNCSEL_pio0_18 = 6
            case FUNCSEL_pio1_18 = 7
            case FUNCSEL_usb_muxing_overcurr_detect = 9
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x0098)
    public var GPIO19_STATUS: Register<GPIO19_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO19_STATUS_Descriptor {
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
    @RegisterBank(offset: 0x009c)
    public var GPIO19_CTRL: Register<GPIO19_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO19_CTRL_Descriptor {
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
            case FUNCSEL_spi0_tx = 1
            case FUNCSEL_uart0_rts = 2
            case FUNCSEL_i2c1_scl = 3
            case FUNCSEL_pwm_b_1 = 4
            case FUNCSEL_sio_19 = 5
            case FUNCSEL_pio0_19 = 6
            case FUNCSEL_pio1_19 = 7
            case FUNCSEL_usb_muxing_vbus_detect = 9
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x00a0)
    public var GPIO20_STATUS: Register<GPIO20_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO20_STATUS_Descriptor {
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
    @RegisterBank(offset: 0x00a4)
    public var GPIO20_CTRL: Register<GPIO20_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO20_CTRL_Descriptor {
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
            case FUNCSEL_spi0_rx = 1
            case FUNCSEL_uart1_tx = 2
            case FUNCSEL_i2c0_sda = 3
            case FUNCSEL_pwm_a_2 = 4
            case FUNCSEL_sio_20 = 5
            case FUNCSEL_pio0_20 = 6
            case FUNCSEL_pio1_20 = 7
            case FUNCSEL_clocks_gpin_0 = 8
            case FUNCSEL_usb_muxing_vbus_en = 9
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x00a8)
    public var GPIO21_STATUS: Register<GPIO21_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO21_STATUS_Descriptor {
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
    @RegisterBank(offset: 0x00ac)
    public var GPIO21_CTRL: Register<GPIO21_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO21_CTRL_Descriptor {
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
            case FUNCSEL_spi0_ss_n = 1
            case FUNCSEL_uart1_rx = 2
            case FUNCSEL_i2c0_scl = 3
            case FUNCSEL_pwm_b_2 = 4
            case FUNCSEL_sio_21 = 5
            case FUNCSEL_pio0_21 = 6
            case FUNCSEL_pio1_21 = 7
            case FUNCSEL_clocks_gpout_0 = 8
            case FUNCSEL_usb_muxing_overcurr_detect = 9
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x00b0)
    public var GPIO22_STATUS: Register<GPIO22_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO22_STATUS_Descriptor {
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
    @RegisterBank(offset: 0x00b4)
    public var GPIO22_CTRL: Register<GPIO22_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO22_CTRL_Descriptor {
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
            case FUNCSEL_spi0_sclk = 1
            case FUNCSEL_uart1_cts = 2
            case FUNCSEL_i2c1_sda = 3
            case FUNCSEL_pwm_a_3 = 4
            case FUNCSEL_sio_22 = 5
            case FUNCSEL_pio0_22 = 6
            case FUNCSEL_pio1_22 = 7
            case FUNCSEL_clocks_gpin_1 = 8
            case FUNCSEL_usb_muxing_vbus_detect = 9
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x00b8)
    public var GPIO23_STATUS: Register<GPIO23_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO23_STATUS_Descriptor {
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
    @RegisterBank(offset: 0x00bc)
    public var GPIO23_CTRL: Register<GPIO23_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO23_CTRL_Descriptor {
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
            case FUNCSEL_spi0_tx = 1
            case FUNCSEL_uart1_rts = 2
            case FUNCSEL_i2c1_scl = 3
            case FUNCSEL_pwm_b_3 = 4
            case FUNCSEL_sio_23 = 5
            case FUNCSEL_pio0_23 = 6
            case FUNCSEL_pio1_23 = 7
            case FUNCSEL_clocks_gpout_1 = 8
            case FUNCSEL_usb_muxing_vbus_en = 9
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x00c0)
    public var GPIO24_STATUS: Register<GPIO24_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO24_STATUS_Descriptor {
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
    @RegisterBank(offset: 0x00c4)
    public var GPIO24_CTRL: Register<GPIO24_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO24_CTRL_Descriptor {
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
            case FUNCSEL_spi1_rx = 1
            case FUNCSEL_uart1_tx = 2
            case FUNCSEL_i2c0_sda = 3
            case FUNCSEL_pwm_a_4 = 4
            case FUNCSEL_sio_24 = 5
            case FUNCSEL_pio0_24 = 6
            case FUNCSEL_pio1_24 = 7
            case FUNCSEL_clocks_gpout_2 = 8
            case FUNCSEL_usb_muxing_overcurr_detect = 9
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x00c8)
    public var GPIO25_STATUS: Register<GPIO25_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO25_STATUS_Descriptor {
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
    @RegisterBank(offset: 0x00cc)
    public var GPIO25_CTRL: Register<GPIO25_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO25_CTRL_Descriptor {
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
            case FUNCSEL_spi1_ss_n = 1
            case FUNCSEL_uart1_rx = 2
            case FUNCSEL_i2c0_scl = 3
            case FUNCSEL_pwm_b_4 = 4
            case FUNCSEL_sio_25 = 5
            case FUNCSEL_pio0_25 = 6
            case FUNCSEL_pio1_25 = 7
            case FUNCSEL_clocks_gpout_3 = 8
            case FUNCSEL_usb_muxing_vbus_detect = 9
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x00d0)
    public var GPIO26_STATUS: Register<GPIO26_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO26_STATUS_Descriptor {
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
    @RegisterBank(offset: 0x00d4)
    public var GPIO26_CTRL: Register<GPIO26_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO26_CTRL_Descriptor {
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
            case FUNCSEL_spi1_sclk = 1
            case FUNCSEL_uart1_cts = 2
            case FUNCSEL_i2c1_sda = 3
            case FUNCSEL_pwm_a_5 = 4
            case FUNCSEL_sio_26 = 5
            case FUNCSEL_pio0_26 = 6
            case FUNCSEL_pio1_26 = 7
            case FUNCSEL_usb_muxing_vbus_en = 9
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x00d8)
    public var GPIO27_STATUS: Register<GPIO27_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO27_STATUS_Descriptor {
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
    @RegisterBank(offset: 0x00dc)
    public var GPIO27_CTRL: Register<GPIO27_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO27_CTRL_Descriptor {
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
            case FUNCSEL_spi1_tx = 1
            case FUNCSEL_uart1_rts = 2
            case FUNCSEL_i2c1_scl = 3
            case FUNCSEL_pwm_b_5 = 4
            case FUNCSEL_sio_27 = 5
            case FUNCSEL_pio0_27 = 6
            case FUNCSEL_pio1_27 = 7
            case FUNCSEL_usb_muxing_overcurr_detect = 9
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x00e0)
    public var GPIO28_STATUS: Register<GPIO28_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO28_STATUS_Descriptor {
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
    @RegisterBank(offset: 0x00e4)
    public var GPIO28_CTRL: Register<GPIO28_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO28_CTRL_Descriptor {
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
            case FUNCSEL_spi1_rx = 1
            case FUNCSEL_uart0_tx = 2
            case FUNCSEL_i2c0_sda = 3
            case FUNCSEL_pwm_a_6 = 4
            case FUNCSEL_sio_28 = 5
            case FUNCSEL_pio0_28 = 6
            case FUNCSEL_pio1_28 = 7
            case FUNCSEL_usb_muxing_vbus_detect = 9
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// GPIO status
    @RegisterBank(offset: 0x00e8)
    public var GPIO29_STATUS: Register<GPIO29_STATUS_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO29_STATUS_Descriptor {
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
    @RegisterBank(offset: 0x00ec)
    public var GPIO29_CTRL: Register<GPIO29_CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct GPIO29_CTRL_Descriptor {
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
            case FUNCSEL_spi1_ss_n = 1
            case FUNCSEL_uart0_rx = 2
            case FUNCSEL_i2c0_scl = 3
            case FUNCSEL_pwm_b_6 = 4
            case FUNCSEL_sio_29 = 5
            case FUNCSEL_pio0_29 = 6
            case FUNCSEL_pio1_29 = 7
            case FUNCSEL_usb_muxing_vbus_en = 9
            case FUNCSEL_null = 31

            public static var bitWidth: Int { 5 }
        }
    }

    /// Raw Interrupts
    @RegisterBank(offset: 0x00f0)
    public var INTR0: Register<INTR0_Descriptor>


    @Register(bitWidth: 32)
    public struct INTR0_Descriptor {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var GPIO7_EDGE_HIGH: GPIO7_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var GPIO7_EDGE_LOW: GPIO7_EDGE_LOW_Field

        @ReadOnly(bits: 29..<30, as: Bool.self)
        public var GPIO7_LEVEL_HIGH: GPIO7_LEVEL_HIGH_Field

        @ReadOnly(bits: 28..<29, as: Bool.self)
        public var GPIO7_LEVEL_LOW: GPIO7_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var GPIO6_EDGE_HIGH: GPIO6_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var GPIO6_EDGE_LOW: GPIO6_EDGE_LOW_Field

        @ReadOnly(bits: 25..<26, as: Bool.self)
        public var GPIO6_LEVEL_HIGH: GPIO6_LEVEL_HIGH_Field

        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var GPIO6_LEVEL_LOW: GPIO6_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO5_EDGE_HIGH: GPIO5_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO5_EDGE_LOW: GPIO5_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var GPIO5_LEVEL_HIGH: GPIO5_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var GPIO5_LEVEL_LOW: GPIO5_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO4_EDGE_HIGH: GPIO4_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO4_EDGE_LOW: GPIO4_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var GPIO4_LEVEL_HIGH: GPIO4_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var GPIO4_LEVEL_LOW: GPIO4_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO3_EDGE_HIGH: GPIO3_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO3_EDGE_LOW: GPIO3_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var GPIO3_LEVEL_HIGH: GPIO3_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var GPIO3_LEVEL_LOW: GPIO3_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO2_EDGE_HIGH: GPIO2_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO2_EDGE_LOW: GPIO2_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var GPIO2_LEVEL_HIGH: GPIO2_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var GPIO2_LEVEL_LOW: GPIO2_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO1_EDGE_HIGH: GPIO1_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO1_EDGE_LOW: GPIO1_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var GPIO1_LEVEL_HIGH: GPIO1_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var GPIO1_LEVEL_LOW: GPIO1_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO0_EDGE_HIGH: GPIO0_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO0_EDGE_LOW: GPIO0_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var GPIO0_LEVEL_HIGH: GPIO0_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var GPIO0_LEVEL_LOW: GPIO0_LEVEL_LOW_Field
    }

    /// Raw Interrupts
    @RegisterBank(offset: 0x00f4)
    public var INTR1: Register<INTR1_Descriptor>


    @Register(bitWidth: 32)
    public struct INTR1_Descriptor {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var GPIO15_EDGE_HIGH: GPIO15_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var GPIO15_EDGE_LOW: GPIO15_EDGE_LOW_Field

        @ReadOnly(bits: 29..<30, as: Bool.self)
        public var GPIO15_LEVEL_HIGH: GPIO15_LEVEL_HIGH_Field

        @ReadOnly(bits: 28..<29, as: Bool.self)
        public var GPIO15_LEVEL_LOW: GPIO15_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var GPIO14_EDGE_HIGH: GPIO14_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var GPIO14_EDGE_LOW: GPIO14_EDGE_LOW_Field

        @ReadOnly(bits: 25..<26, as: Bool.self)
        public var GPIO14_LEVEL_HIGH: GPIO14_LEVEL_HIGH_Field

        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var GPIO14_LEVEL_LOW: GPIO14_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO13_EDGE_HIGH: GPIO13_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO13_EDGE_LOW: GPIO13_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var GPIO13_LEVEL_HIGH: GPIO13_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var GPIO13_LEVEL_LOW: GPIO13_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO12_EDGE_HIGH: GPIO12_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO12_EDGE_LOW: GPIO12_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var GPIO12_LEVEL_HIGH: GPIO12_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var GPIO12_LEVEL_LOW: GPIO12_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO11_EDGE_HIGH: GPIO11_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO11_EDGE_LOW: GPIO11_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var GPIO11_LEVEL_HIGH: GPIO11_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var GPIO11_LEVEL_LOW: GPIO11_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO10_EDGE_HIGH: GPIO10_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO10_EDGE_LOW: GPIO10_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var GPIO10_LEVEL_HIGH: GPIO10_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var GPIO10_LEVEL_LOW: GPIO10_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO9_EDGE_HIGH: GPIO9_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO9_EDGE_LOW: GPIO9_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var GPIO9_LEVEL_HIGH: GPIO9_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var GPIO9_LEVEL_LOW: GPIO9_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO8_EDGE_HIGH: GPIO8_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO8_EDGE_LOW: GPIO8_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var GPIO8_LEVEL_HIGH: GPIO8_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var GPIO8_LEVEL_LOW: GPIO8_LEVEL_LOW_Field
    }

    /// Raw Interrupts
    @RegisterBank(offset: 0x00f8)
    public var INTR2: Register<INTR2_Descriptor>


    @Register(bitWidth: 32)
    public struct INTR2_Descriptor {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var GPIO23_EDGE_HIGH: GPIO23_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var GPIO23_EDGE_LOW: GPIO23_EDGE_LOW_Field

        @ReadOnly(bits: 29..<30, as: Bool.self)
        public var GPIO23_LEVEL_HIGH: GPIO23_LEVEL_HIGH_Field

        @ReadOnly(bits: 28..<29, as: Bool.self)
        public var GPIO23_LEVEL_LOW: GPIO23_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var GPIO22_EDGE_HIGH: GPIO22_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var GPIO22_EDGE_LOW: GPIO22_EDGE_LOW_Field

        @ReadOnly(bits: 25..<26, as: Bool.self)
        public var GPIO22_LEVEL_HIGH: GPIO22_LEVEL_HIGH_Field

        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var GPIO22_LEVEL_LOW: GPIO22_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO21_EDGE_HIGH: GPIO21_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO21_EDGE_LOW: GPIO21_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var GPIO21_LEVEL_HIGH: GPIO21_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var GPIO21_LEVEL_LOW: GPIO21_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO20_EDGE_HIGH: GPIO20_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO20_EDGE_LOW: GPIO20_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var GPIO20_LEVEL_HIGH: GPIO20_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var GPIO20_LEVEL_LOW: GPIO20_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO19_EDGE_HIGH: GPIO19_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO19_EDGE_LOW: GPIO19_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var GPIO19_LEVEL_HIGH: GPIO19_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var GPIO19_LEVEL_LOW: GPIO19_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO18_EDGE_HIGH: GPIO18_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO18_EDGE_LOW: GPIO18_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var GPIO18_LEVEL_HIGH: GPIO18_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var GPIO18_LEVEL_LOW: GPIO18_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO17_EDGE_HIGH: GPIO17_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO17_EDGE_LOW: GPIO17_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var GPIO17_LEVEL_HIGH: GPIO17_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var GPIO17_LEVEL_LOW: GPIO17_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO16_EDGE_HIGH: GPIO16_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO16_EDGE_LOW: GPIO16_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var GPIO16_LEVEL_HIGH: GPIO16_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var GPIO16_LEVEL_LOW: GPIO16_LEVEL_LOW_Field
    }

    /// Raw Interrupts
    @RegisterBank(offset: 0x00fc)
    public var INTR3: Register<INTR3_Descriptor>


    @Register(bitWidth: 32)
    public struct INTR3_Descriptor {
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO29_EDGE_HIGH: GPIO29_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO29_EDGE_LOW: GPIO29_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var GPIO29_LEVEL_HIGH: GPIO29_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var GPIO29_LEVEL_LOW: GPIO29_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO28_EDGE_HIGH: GPIO28_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO28_EDGE_LOW: GPIO28_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var GPIO28_LEVEL_HIGH: GPIO28_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var GPIO28_LEVEL_LOW: GPIO28_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO27_EDGE_HIGH: GPIO27_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO27_EDGE_LOW: GPIO27_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var GPIO27_LEVEL_HIGH: GPIO27_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var GPIO27_LEVEL_LOW: GPIO27_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO26_EDGE_HIGH: GPIO26_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO26_EDGE_LOW: GPIO26_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var GPIO26_LEVEL_HIGH: GPIO26_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var GPIO26_LEVEL_LOW: GPIO26_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO25_EDGE_HIGH: GPIO25_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO25_EDGE_LOW: GPIO25_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var GPIO25_LEVEL_HIGH: GPIO25_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var GPIO25_LEVEL_LOW: GPIO25_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO24_EDGE_HIGH: GPIO24_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO24_EDGE_LOW: GPIO24_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var GPIO24_LEVEL_HIGH: GPIO24_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var GPIO24_LEVEL_LOW: GPIO24_LEVEL_LOW_Field
    }

    /// Interrupt Enable for proc0
    @RegisterBank(offset: 0x0100)
    public var PROC0_INTE0: Register<PROC0_INTE0_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC0_INTE0_Descriptor {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var GPIO7_EDGE_HIGH: GPIO7_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var GPIO7_EDGE_LOW: GPIO7_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var GPIO7_LEVEL_HIGH: GPIO7_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var GPIO7_LEVEL_LOW: GPIO7_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var GPIO6_EDGE_HIGH: GPIO6_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var GPIO6_EDGE_LOW: GPIO6_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var GPIO6_LEVEL_HIGH: GPIO6_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var GPIO6_LEVEL_LOW: GPIO6_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO5_EDGE_HIGH: GPIO5_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO5_EDGE_LOW: GPIO5_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var GPIO5_LEVEL_HIGH: GPIO5_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var GPIO5_LEVEL_LOW: GPIO5_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO4_EDGE_HIGH: GPIO4_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO4_EDGE_LOW: GPIO4_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var GPIO4_LEVEL_HIGH: GPIO4_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var GPIO4_LEVEL_LOW: GPIO4_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO3_EDGE_HIGH: GPIO3_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO3_EDGE_LOW: GPIO3_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var GPIO3_LEVEL_HIGH: GPIO3_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var GPIO3_LEVEL_LOW: GPIO3_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO2_EDGE_HIGH: GPIO2_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO2_EDGE_LOW: GPIO2_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var GPIO2_LEVEL_HIGH: GPIO2_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var GPIO2_LEVEL_LOW: GPIO2_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO1_EDGE_HIGH: GPIO1_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO1_EDGE_LOW: GPIO1_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var GPIO1_LEVEL_HIGH: GPIO1_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var GPIO1_LEVEL_LOW: GPIO1_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO0_EDGE_HIGH: GPIO0_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO0_EDGE_LOW: GPIO0_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var GPIO0_LEVEL_HIGH: GPIO0_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var GPIO0_LEVEL_LOW: GPIO0_LEVEL_LOW_Field
    }

    /// Interrupt Enable for proc0
    @RegisterBank(offset: 0x0104)
    public var PROC0_INTE1: Register<PROC0_INTE1_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC0_INTE1_Descriptor {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var GPIO15_EDGE_HIGH: GPIO15_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var GPIO15_EDGE_LOW: GPIO15_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var GPIO15_LEVEL_HIGH: GPIO15_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var GPIO15_LEVEL_LOW: GPIO15_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var GPIO14_EDGE_HIGH: GPIO14_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var GPIO14_EDGE_LOW: GPIO14_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var GPIO14_LEVEL_HIGH: GPIO14_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var GPIO14_LEVEL_LOW: GPIO14_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO13_EDGE_HIGH: GPIO13_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO13_EDGE_LOW: GPIO13_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var GPIO13_LEVEL_HIGH: GPIO13_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var GPIO13_LEVEL_LOW: GPIO13_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO12_EDGE_HIGH: GPIO12_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO12_EDGE_LOW: GPIO12_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var GPIO12_LEVEL_HIGH: GPIO12_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var GPIO12_LEVEL_LOW: GPIO12_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO11_EDGE_HIGH: GPIO11_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO11_EDGE_LOW: GPIO11_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var GPIO11_LEVEL_HIGH: GPIO11_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var GPIO11_LEVEL_LOW: GPIO11_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO10_EDGE_HIGH: GPIO10_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO10_EDGE_LOW: GPIO10_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var GPIO10_LEVEL_HIGH: GPIO10_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var GPIO10_LEVEL_LOW: GPIO10_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO9_EDGE_HIGH: GPIO9_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO9_EDGE_LOW: GPIO9_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var GPIO9_LEVEL_HIGH: GPIO9_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var GPIO9_LEVEL_LOW: GPIO9_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO8_EDGE_HIGH: GPIO8_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO8_EDGE_LOW: GPIO8_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var GPIO8_LEVEL_HIGH: GPIO8_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var GPIO8_LEVEL_LOW: GPIO8_LEVEL_LOW_Field
    }

    /// Interrupt Enable for proc0
    @RegisterBank(offset: 0x0108)
    public var PROC0_INTE2: Register<PROC0_INTE2_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC0_INTE2_Descriptor {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var GPIO23_EDGE_HIGH: GPIO23_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var GPIO23_EDGE_LOW: GPIO23_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var GPIO23_LEVEL_HIGH: GPIO23_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var GPIO23_LEVEL_LOW: GPIO23_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var GPIO22_EDGE_HIGH: GPIO22_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var GPIO22_EDGE_LOW: GPIO22_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var GPIO22_LEVEL_HIGH: GPIO22_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var GPIO22_LEVEL_LOW: GPIO22_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO21_EDGE_HIGH: GPIO21_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO21_EDGE_LOW: GPIO21_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var GPIO21_LEVEL_HIGH: GPIO21_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var GPIO21_LEVEL_LOW: GPIO21_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO20_EDGE_HIGH: GPIO20_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO20_EDGE_LOW: GPIO20_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var GPIO20_LEVEL_HIGH: GPIO20_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var GPIO20_LEVEL_LOW: GPIO20_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO19_EDGE_HIGH: GPIO19_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO19_EDGE_LOW: GPIO19_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var GPIO19_LEVEL_HIGH: GPIO19_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var GPIO19_LEVEL_LOW: GPIO19_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO18_EDGE_HIGH: GPIO18_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO18_EDGE_LOW: GPIO18_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var GPIO18_LEVEL_HIGH: GPIO18_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var GPIO18_LEVEL_LOW: GPIO18_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO17_EDGE_HIGH: GPIO17_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO17_EDGE_LOW: GPIO17_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var GPIO17_LEVEL_HIGH: GPIO17_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var GPIO17_LEVEL_LOW: GPIO17_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO16_EDGE_HIGH: GPIO16_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO16_EDGE_LOW: GPIO16_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var GPIO16_LEVEL_HIGH: GPIO16_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var GPIO16_LEVEL_LOW: GPIO16_LEVEL_LOW_Field
    }

    /// Interrupt Enable for proc0
    @RegisterBank(offset: 0x010c)
    public var PROC0_INTE3: Register<PROC0_INTE3_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC0_INTE3_Descriptor {
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO29_EDGE_HIGH: GPIO29_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO29_EDGE_LOW: GPIO29_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var GPIO29_LEVEL_HIGH: GPIO29_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var GPIO29_LEVEL_LOW: GPIO29_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO28_EDGE_HIGH: GPIO28_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO28_EDGE_LOW: GPIO28_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var GPIO28_LEVEL_HIGH: GPIO28_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var GPIO28_LEVEL_LOW: GPIO28_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO27_EDGE_HIGH: GPIO27_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO27_EDGE_LOW: GPIO27_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var GPIO27_LEVEL_HIGH: GPIO27_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var GPIO27_LEVEL_LOW: GPIO27_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO26_EDGE_HIGH: GPIO26_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO26_EDGE_LOW: GPIO26_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var GPIO26_LEVEL_HIGH: GPIO26_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var GPIO26_LEVEL_LOW: GPIO26_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO25_EDGE_HIGH: GPIO25_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO25_EDGE_LOW: GPIO25_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var GPIO25_LEVEL_HIGH: GPIO25_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var GPIO25_LEVEL_LOW: GPIO25_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO24_EDGE_HIGH: GPIO24_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO24_EDGE_LOW: GPIO24_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var GPIO24_LEVEL_HIGH: GPIO24_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var GPIO24_LEVEL_LOW: GPIO24_LEVEL_LOW_Field
    }

    /// Interrupt Force for proc0
    @RegisterBank(offset: 0x0110)
    public var PROC0_INTF0: Register<PROC0_INTF0_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC0_INTF0_Descriptor {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var GPIO7_EDGE_HIGH: GPIO7_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var GPIO7_EDGE_LOW: GPIO7_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var GPIO7_LEVEL_HIGH: GPIO7_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var GPIO7_LEVEL_LOW: GPIO7_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var GPIO6_EDGE_HIGH: GPIO6_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var GPIO6_EDGE_LOW: GPIO6_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var GPIO6_LEVEL_HIGH: GPIO6_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var GPIO6_LEVEL_LOW: GPIO6_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO5_EDGE_HIGH: GPIO5_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO5_EDGE_LOW: GPIO5_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var GPIO5_LEVEL_HIGH: GPIO5_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var GPIO5_LEVEL_LOW: GPIO5_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO4_EDGE_HIGH: GPIO4_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO4_EDGE_LOW: GPIO4_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var GPIO4_LEVEL_HIGH: GPIO4_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var GPIO4_LEVEL_LOW: GPIO4_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO3_EDGE_HIGH: GPIO3_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO3_EDGE_LOW: GPIO3_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var GPIO3_LEVEL_HIGH: GPIO3_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var GPIO3_LEVEL_LOW: GPIO3_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO2_EDGE_HIGH: GPIO2_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO2_EDGE_LOW: GPIO2_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var GPIO2_LEVEL_HIGH: GPIO2_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var GPIO2_LEVEL_LOW: GPIO2_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO1_EDGE_HIGH: GPIO1_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO1_EDGE_LOW: GPIO1_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var GPIO1_LEVEL_HIGH: GPIO1_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var GPIO1_LEVEL_LOW: GPIO1_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO0_EDGE_HIGH: GPIO0_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO0_EDGE_LOW: GPIO0_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var GPIO0_LEVEL_HIGH: GPIO0_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var GPIO0_LEVEL_LOW: GPIO0_LEVEL_LOW_Field
    }

    /// Interrupt Force for proc0
    @RegisterBank(offset: 0x0114)
    public var PROC0_INTF1: Register<PROC0_INTF1_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC0_INTF1_Descriptor {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var GPIO15_EDGE_HIGH: GPIO15_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var GPIO15_EDGE_LOW: GPIO15_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var GPIO15_LEVEL_HIGH: GPIO15_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var GPIO15_LEVEL_LOW: GPIO15_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var GPIO14_EDGE_HIGH: GPIO14_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var GPIO14_EDGE_LOW: GPIO14_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var GPIO14_LEVEL_HIGH: GPIO14_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var GPIO14_LEVEL_LOW: GPIO14_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO13_EDGE_HIGH: GPIO13_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO13_EDGE_LOW: GPIO13_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var GPIO13_LEVEL_HIGH: GPIO13_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var GPIO13_LEVEL_LOW: GPIO13_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO12_EDGE_HIGH: GPIO12_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO12_EDGE_LOW: GPIO12_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var GPIO12_LEVEL_HIGH: GPIO12_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var GPIO12_LEVEL_LOW: GPIO12_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO11_EDGE_HIGH: GPIO11_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO11_EDGE_LOW: GPIO11_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var GPIO11_LEVEL_HIGH: GPIO11_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var GPIO11_LEVEL_LOW: GPIO11_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO10_EDGE_HIGH: GPIO10_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO10_EDGE_LOW: GPIO10_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var GPIO10_LEVEL_HIGH: GPIO10_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var GPIO10_LEVEL_LOW: GPIO10_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO9_EDGE_HIGH: GPIO9_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO9_EDGE_LOW: GPIO9_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var GPIO9_LEVEL_HIGH: GPIO9_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var GPIO9_LEVEL_LOW: GPIO9_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO8_EDGE_HIGH: GPIO8_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO8_EDGE_LOW: GPIO8_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var GPIO8_LEVEL_HIGH: GPIO8_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var GPIO8_LEVEL_LOW: GPIO8_LEVEL_LOW_Field
    }

    /// Interrupt Force for proc0
    @RegisterBank(offset: 0x0118)
    public var PROC0_INTF2: Register<PROC0_INTF2_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC0_INTF2_Descriptor {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var GPIO23_EDGE_HIGH: GPIO23_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var GPIO23_EDGE_LOW: GPIO23_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var GPIO23_LEVEL_HIGH: GPIO23_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var GPIO23_LEVEL_LOW: GPIO23_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var GPIO22_EDGE_HIGH: GPIO22_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var GPIO22_EDGE_LOW: GPIO22_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var GPIO22_LEVEL_HIGH: GPIO22_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var GPIO22_LEVEL_LOW: GPIO22_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO21_EDGE_HIGH: GPIO21_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO21_EDGE_LOW: GPIO21_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var GPIO21_LEVEL_HIGH: GPIO21_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var GPIO21_LEVEL_LOW: GPIO21_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO20_EDGE_HIGH: GPIO20_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO20_EDGE_LOW: GPIO20_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var GPIO20_LEVEL_HIGH: GPIO20_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var GPIO20_LEVEL_LOW: GPIO20_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO19_EDGE_HIGH: GPIO19_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO19_EDGE_LOW: GPIO19_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var GPIO19_LEVEL_HIGH: GPIO19_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var GPIO19_LEVEL_LOW: GPIO19_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO18_EDGE_HIGH: GPIO18_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO18_EDGE_LOW: GPIO18_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var GPIO18_LEVEL_HIGH: GPIO18_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var GPIO18_LEVEL_LOW: GPIO18_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO17_EDGE_HIGH: GPIO17_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO17_EDGE_LOW: GPIO17_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var GPIO17_LEVEL_HIGH: GPIO17_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var GPIO17_LEVEL_LOW: GPIO17_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO16_EDGE_HIGH: GPIO16_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO16_EDGE_LOW: GPIO16_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var GPIO16_LEVEL_HIGH: GPIO16_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var GPIO16_LEVEL_LOW: GPIO16_LEVEL_LOW_Field
    }

    /// Interrupt Force for proc0
    @RegisterBank(offset: 0x011c)
    public var PROC0_INTF3: Register<PROC0_INTF3_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC0_INTF3_Descriptor {
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO29_EDGE_HIGH: GPIO29_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO29_EDGE_LOW: GPIO29_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var GPIO29_LEVEL_HIGH: GPIO29_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var GPIO29_LEVEL_LOW: GPIO29_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO28_EDGE_HIGH: GPIO28_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO28_EDGE_LOW: GPIO28_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var GPIO28_LEVEL_HIGH: GPIO28_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var GPIO28_LEVEL_LOW: GPIO28_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO27_EDGE_HIGH: GPIO27_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO27_EDGE_LOW: GPIO27_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var GPIO27_LEVEL_HIGH: GPIO27_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var GPIO27_LEVEL_LOW: GPIO27_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO26_EDGE_HIGH: GPIO26_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO26_EDGE_LOW: GPIO26_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var GPIO26_LEVEL_HIGH: GPIO26_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var GPIO26_LEVEL_LOW: GPIO26_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO25_EDGE_HIGH: GPIO25_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO25_EDGE_LOW: GPIO25_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var GPIO25_LEVEL_HIGH: GPIO25_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var GPIO25_LEVEL_LOW: GPIO25_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO24_EDGE_HIGH: GPIO24_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO24_EDGE_LOW: GPIO24_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var GPIO24_LEVEL_HIGH: GPIO24_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var GPIO24_LEVEL_LOW: GPIO24_LEVEL_LOW_Field
    }

    /// Interrupt status after masking & forcing for proc0
    @RegisterBank(offset: 0x0120)
    public var PROC0_INTS0: Register<PROC0_INTS0_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC0_INTS0_Descriptor {
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var GPIO7_EDGE_HIGH: GPIO7_EDGE_HIGH_Field

        @ReadOnly(bits: 30..<31, as: Bool.self)
        public var GPIO7_EDGE_LOW: GPIO7_EDGE_LOW_Field

        @ReadOnly(bits: 29..<30, as: Bool.self)
        public var GPIO7_LEVEL_HIGH: GPIO7_LEVEL_HIGH_Field

        @ReadOnly(bits: 28..<29, as: Bool.self)
        public var GPIO7_LEVEL_LOW: GPIO7_LEVEL_LOW_Field

        @ReadOnly(bits: 27..<28, as: Bool.self)
        public var GPIO6_EDGE_HIGH: GPIO6_EDGE_HIGH_Field

        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var GPIO6_EDGE_LOW: GPIO6_EDGE_LOW_Field

        @ReadOnly(bits: 25..<26, as: Bool.self)
        public var GPIO6_LEVEL_HIGH: GPIO6_LEVEL_HIGH_Field

        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var GPIO6_LEVEL_LOW: GPIO6_LEVEL_LOW_Field

        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var GPIO5_EDGE_HIGH: GPIO5_EDGE_HIGH_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var GPIO5_EDGE_LOW: GPIO5_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var GPIO5_LEVEL_HIGH: GPIO5_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var GPIO5_LEVEL_LOW: GPIO5_LEVEL_LOW_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var GPIO4_EDGE_HIGH: GPIO4_EDGE_HIGH_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var GPIO4_EDGE_LOW: GPIO4_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var GPIO4_LEVEL_HIGH: GPIO4_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var GPIO4_LEVEL_LOW: GPIO4_LEVEL_LOW_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var GPIO3_EDGE_HIGH: GPIO3_EDGE_HIGH_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var GPIO3_EDGE_LOW: GPIO3_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var GPIO3_LEVEL_HIGH: GPIO3_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var GPIO3_LEVEL_LOW: GPIO3_LEVEL_LOW_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var GPIO2_EDGE_HIGH: GPIO2_EDGE_HIGH_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var GPIO2_EDGE_LOW: GPIO2_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var GPIO2_LEVEL_HIGH: GPIO2_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var GPIO2_LEVEL_LOW: GPIO2_LEVEL_LOW_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var GPIO1_EDGE_HIGH: GPIO1_EDGE_HIGH_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var GPIO1_EDGE_LOW: GPIO1_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var GPIO1_LEVEL_HIGH: GPIO1_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var GPIO1_LEVEL_LOW: GPIO1_LEVEL_LOW_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var GPIO0_EDGE_HIGH: GPIO0_EDGE_HIGH_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var GPIO0_EDGE_LOW: GPIO0_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var GPIO0_LEVEL_HIGH: GPIO0_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var GPIO0_LEVEL_LOW: GPIO0_LEVEL_LOW_Field
    }

    /// Interrupt status after masking & forcing for proc0
    @RegisterBank(offset: 0x0124)
    public var PROC0_INTS1: Register<PROC0_INTS1_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC0_INTS1_Descriptor {
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var GPIO15_EDGE_HIGH: GPIO15_EDGE_HIGH_Field

        @ReadOnly(bits: 30..<31, as: Bool.self)
        public var GPIO15_EDGE_LOW: GPIO15_EDGE_LOW_Field

        @ReadOnly(bits: 29..<30, as: Bool.self)
        public var GPIO15_LEVEL_HIGH: GPIO15_LEVEL_HIGH_Field

        @ReadOnly(bits: 28..<29, as: Bool.self)
        public var GPIO15_LEVEL_LOW: GPIO15_LEVEL_LOW_Field

        @ReadOnly(bits: 27..<28, as: Bool.self)
        public var GPIO14_EDGE_HIGH: GPIO14_EDGE_HIGH_Field

        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var GPIO14_EDGE_LOW: GPIO14_EDGE_LOW_Field

        @ReadOnly(bits: 25..<26, as: Bool.self)
        public var GPIO14_LEVEL_HIGH: GPIO14_LEVEL_HIGH_Field

        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var GPIO14_LEVEL_LOW: GPIO14_LEVEL_LOW_Field

        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var GPIO13_EDGE_HIGH: GPIO13_EDGE_HIGH_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var GPIO13_EDGE_LOW: GPIO13_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var GPIO13_LEVEL_HIGH: GPIO13_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var GPIO13_LEVEL_LOW: GPIO13_LEVEL_LOW_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var GPIO12_EDGE_HIGH: GPIO12_EDGE_HIGH_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var GPIO12_EDGE_LOW: GPIO12_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var GPIO12_LEVEL_HIGH: GPIO12_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var GPIO12_LEVEL_LOW: GPIO12_LEVEL_LOW_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var GPIO11_EDGE_HIGH: GPIO11_EDGE_HIGH_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var GPIO11_EDGE_LOW: GPIO11_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var GPIO11_LEVEL_HIGH: GPIO11_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var GPIO11_LEVEL_LOW: GPIO11_LEVEL_LOW_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var GPIO10_EDGE_HIGH: GPIO10_EDGE_HIGH_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var GPIO10_EDGE_LOW: GPIO10_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var GPIO10_LEVEL_HIGH: GPIO10_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var GPIO10_LEVEL_LOW: GPIO10_LEVEL_LOW_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var GPIO9_EDGE_HIGH: GPIO9_EDGE_HIGH_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var GPIO9_EDGE_LOW: GPIO9_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var GPIO9_LEVEL_HIGH: GPIO9_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var GPIO9_LEVEL_LOW: GPIO9_LEVEL_LOW_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var GPIO8_EDGE_HIGH: GPIO8_EDGE_HIGH_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var GPIO8_EDGE_LOW: GPIO8_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var GPIO8_LEVEL_HIGH: GPIO8_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var GPIO8_LEVEL_LOW: GPIO8_LEVEL_LOW_Field
    }

    /// Interrupt status after masking & forcing for proc0
    @RegisterBank(offset: 0x0128)
    public var PROC0_INTS2: Register<PROC0_INTS2_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC0_INTS2_Descriptor {
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var GPIO23_EDGE_HIGH: GPIO23_EDGE_HIGH_Field

        @ReadOnly(bits: 30..<31, as: Bool.self)
        public var GPIO23_EDGE_LOW: GPIO23_EDGE_LOW_Field

        @ReadOnly(bits: 29..<30, as: Bool.self)
        public var GPIO23_LEVEL_HIGH: GPIO23_LEVEL_HIGH_Field

        @ReadOnly(bits: 28..<29, as: Bool.self)
        public var GPIO23_LEVEL_LOW: GPIO23_LEVEL_LOW_Field

        @ReadOnly(bits: 27..<28, as: Bool.self)
        public var GPIO22_EDGE_HIGH: GPIO22_EDGE_HIGH_Field

        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var GPIO22_EDGE_LOW: GPIO22_EDGE_LOW_Field

        @ReadOnly(bits: 25..<26, as: Bool.self)
        public var GPIO22_LEVEL_HIGH: GPIO22_LEVEL_HIGH_Field

        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var GPIO22_LEVEL_LOW: GPIO22_LEVEL_LOW_Field

        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var GPIO21_EDGE_HIGH: GPIO21_EDGE_HIGH_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var GPIO21_EDGE_LOW: GPIO21_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var GPIO21_LEVEL_HIGH: GPIO21_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var GPIO21_LEVEL_LOW: GPIO21_LEVEL_LOW_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var GPIO20_EDGE_HIGH: GPIO20_EDGE_HIGH_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var GPIO20_EDGE_LOW: GPIO20_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var GPIO20_LEVEL_HIGH: GPIO20_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var GPIO20_LEVEL_LOW: GPIO20_LEVEL_LOW_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var GPIO19_EDGE_HIGH: GPIO19_EDGE_HIGH_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var GPIO19_EDGE_LOW: GPIO19_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var GPIO19_LEVEL_HIGH: GPIO19_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var GPIO19_LEVEL_LOW: GPIO19_LEVEL_LOW_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var GPIO18_EDGE_HIGH: GPIO18_EDGE_HIGH_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var GPIO18_EDGE_LOW: GPIO18_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var GPIO18_LEVEL_HIGH: GPIO18_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var GPIO18_LEVEL_LOW: GPIO18_LEVEL_LOW_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var GPIO17_EDGE_HIGH: GPIO17_EDGE_HIGH_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var GPIO17_EDGE_LOW: GPIO17_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var GPIO17_LEVEL_HIGH: GPIO17_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var GPIO17_LEVEL_LOW: GPIO17_LEVEL_LOW_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var GPIO16_EDGE_HIGH: GPIO16_EDGE_HIGH_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var GPIO16_EDGE_LOW: GPIO16_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var GPIO16_LEVEL_HIGH: GPIO16_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var GPIO16_LEVEL_LOW: GPIO16_LEVEL_LOW_Field
    }

    /// Interrupt status after masking & forcing for proc0
    @RegisterBank(offset: 0x012c)
    public var PROC0_INTS3: Register<PROC0_INTS3_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC0_INTS3_Descriptor {
        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var GPIO29_EDGE_HIGH: GPIO29_EDGE_HIGH_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var GPIO29_EDGE_LOW: GPIO29_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var GPIO29_LEVEL_HIGH: GPIO29_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var GPIO29_LEVEL_LOW: GPIO29_LEVEL_LOW_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var GPIO28_EDGE_HIGH: GPIO28_EDGE_HIGH_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var GPIO28_EDGE_LOW: GPIO28_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var GPIO28_LEVEL_HIGH: GPIO28_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var GPIO28_LEVEL_LOW: GPIO28_LEVEL_LOW_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var GPIO27_EDGE_HIGH: GPIO27_EDGE_HIGH_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var GPIO27_EDGE_LOW: GPIO27_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var GPIO27_LEVEL_HIGH: GPIO27_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var GPIO27_LEVEL_LOW: GPIO27_LEVEL_LOW_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var GPIO26_EDGE_HIGH: GPIO26_EDGE_HIGH_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var GPIO26_EDGE_LOW: GPIO26_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var GPIO26_LEVEL_HIGH: GPIO26_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var GPIO26_LEVEL_LOW: GPIO26_LEVEL_LOW_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var GPIO25_EDGE_HIGH: GPIO25_EDGE_HIGH_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var GPIO25_EDGE_LOW: GPIO25_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var GPIO25_LEVEL_HIGH: GPIO25_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var GPIO25_LEVEL_LOW: GPIO25_LEVEL_LOW_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var GPIO24_EDGE_HIGH: GPIO24_EDGE_HIGH_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var GPIO24_EDGE_LOW: GPIO24_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var GPIO24_LEVEL_HIGH: GPIO24_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var GPIO24_LEVEL_LOW: GPIO24_LEVEL_LOW_Field
    }

    /// Interrupt Enable for proc1
    @RegisterBank(offset: 0x0130)
    public var PROC1_INTE0: Register<PROC1_INTE0_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC1_INTE0_Descriptor {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var GPIO7_EDGE_HIGH: GPIO7_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var GPIO7_EDGE_LOW: GPIO7_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var GPIO7_LEVEL_HIGH: GPIO7_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var GPIO7_LEVEL_LOW: GPIO7_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var GPIO6_EDGE_HIGH: GPIO6_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var GPIO6_EDGE_LOW: GPIO6_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var GPIO6_LEVEL_HIGH: GPIO6_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var GPIO6_LEVEL_LOW: GPIO6_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO5_EDGE_HIGH: GPIO5_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO5_EDGE_LOW: GPIO5_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var GPIO5_LEVEL_HIGH: GPIO5_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var GPIO5_LEVEL_LOW: GPIO5_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO4_EDGE_HIGH: GPIO4_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO4_EDGE_LOW: GPIO4_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var GPIO4_LEVEL_HIGH: GPIO4_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var GPIO4_LEVEL_LOW: GPIO4_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO3_EDGE_HIGH: GPIO3_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO3_EDGE_LOW: GPIO3_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var GPIO3_LEVEL_HIGH: GPIO3_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var GPIO3_LEVEL_LOW: GPIO3_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO2_EDGE_HIGH: GPIO2_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO2_EDGE_LOW: GPIO2_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var GPIO2_LEVEL_HIGH: GPIO2_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var GPIO2_LEVEL_LOW: GPIO2_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO1_EDGE_HIGH: GPIO1_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO1_EDGE_LOW: GPIO1_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var GPIO1_LEVEL_HIGH: GPIO1_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var GPIO1_LEVEL_LOW: GPIO1_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO0_EDGE_HIGH: GPIO0_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO0_EDGE_LOW: GPIO0_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var GPIO0_LEVEL_HIGH: GPIO0_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var GPIO0_LEVEL_LOW: GPIO0_LEVEL_LOW_Field
    }

    /// Interrupt Enable for proc1
    @RegisterBank(offset: 0x0134)
    public var PROC1_INTE1: Register<PROC1_INTE1_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC1_INTE1_Descriptor {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var GPIO15_EDGE_HIGH: GPIO15_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var GPIO15_EDGE_LOW: GPIO15_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var GPIO15_LEVEL_HIGH: GPIO15_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var GPIO15_LEVEL_LOW: GPIO15_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var GPIO14_EDGE_HIGH: GPIO14_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var GPIO14_EDGE_LOW: GPIO14_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var GPIO14_LEVEL_HIGH: GPIO14_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var GPIO14_LEVEL_LOW: GPIO14_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO13_EDGE_HIGH: GPIO13_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO13_EDGE_LOW: GPIO13_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var GPIO13_LEVEL_HIGH: GPIO13_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var GPIO13_LEVEL_LOW: GPIO13_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO12_EDGE_HIGH: GPIO12_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO12_EDGE_LOW: GPIO12_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var GPIO12_LEVEL_HIGH: GPIO12_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var GPIO12_LEVEL_LOW: GPIO12_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO11_EDGE_HIGH: GPIO11_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO11_EDGE_LOW: GPIO11_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var GPIO11_LEVEL_HIGH: GPIO11_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var GPIO11_LEVEL_LOW: GPIO11_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO10_EDGE_HIGH: GPIO10_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO10_EDGE_LOW: GPIO10_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var GPIO10_LEVEL_HIGH: GPIO10_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var GPIO10_LEVEL_LOW: GPIO10_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO9_EDGE_HIGH: GPIO9_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO9_EDGE_LOW: GPIO9_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var GPIO9_LEVEL_HIGH: GPIO9_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var GPIO9_LEVEL_LOW: GPIO9_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO8_EDGE_HIGH: GPIO8_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO8_EDGE_LOW: GPIO8_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var GPIO8_LEVEL_HIGH: GPIO8_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var GPIO8_LEVEL_LOW: GPIO8_LEVEL_LOW_Field
    }

    /// Interrupt Enable for proc1
    @RegisterBank(offset: 0x0138)
    public var PROC1_INTE2: Register<PROC1_INTE2_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC1_INTE2_Descriptor {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var GPIO23_EDGE_HIGH: GPIO23_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var GPIO23_EDGE_LOW: GPIO23_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var GPIO23_LEVEL_HIGH: GPIO23_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var GPIO23_LEVEL_LOW: GPIO23_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var GPIO22_EDGE_HIGH: GPIO22_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var GPIO22_EDGE_LOW: GPIO22_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var GPIO22_LEVEL_HIGH: GPIO22_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var GPIO22_LEVEL_LOW: GPIO22_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO21_EDGE_HIGH: GPIO21_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO21_EDGE_LOW: GPIO21_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var GPIO21_LEVEL_HIGH: GPIO21_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var GPIO21_LEVEL_LOW: GPIO21_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO20_EDGE_HIGH: GPIO20_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO20_EDGE_LOW: GPIO20_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var GPIO20_LEVEL_HIGH: GPIO20_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var GPIO20_LEVEL_LOW: GPIO20_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO19_EDGE_HIGH: GPIO19_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO19_EDGE_LOW: GPIO19_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var GPIO19_LEVEL_HIGH: GPIO19_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var GPIO19_LEVEL_LOW: GPIO19_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO18_EDGE_HIGH: GPIO18_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO18_EDGE_LOW: GPIO18_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var GPIO18_LEVEL_HIGH: GPIO18_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var GPIO18_LEVEL_LOW: GPIO18_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO17_EDGE_HIGH: GPIO17_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO17_EDGE_LOW: GPIO17_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var GPIO17_LEVEL_HIGH: GPIO17_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var GPIO17_LEVEL_LOW: GPIO17_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO16_EDGE_HIGH: GPIO16_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO16_EDGE_LOW: GPIO16_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var GPIO16_LEVEL_HIGH: GPIO16_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var GPIO16_LEVEL_LOW: GPIO16_LEVEL_LOW_Field
    }

    /// Interrupt Enable for proc1
    @RegisterBank(offset: 0x013c)
    public var PROC1_INTE3: Register<PROC1_INTE3_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC1_INTE3_Descriptor {
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO29_EDGE_HIGH: GPIO29_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO29_EDGE_LOW: GPIO29_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var GPIO29_LEVEL_HIGH: GPIO29_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var GPIO29_LEVEL_LOW: GPIO29_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO28_EDGE_HIGH: GPIO28_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO28_EDGE_LOW: GPIO28_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var GPIO28_LEVEL_HIGH: GPIO28_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var GPIO28_LEVEL_LOW: GPIO28_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO27_EDGE_HIGH: GPIO27_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO27_EDGE_LOW: GPIO27_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var GPIO27_LEVEL_HIGH: GPIO27_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var GPIO27_LEVEL_LOW: GPIO27_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO26_EDGE_HIGH: GPIO26_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO26_EDGE_LOW: GPIO26_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var GPIO26_LEVEL_HIGH: GPIO26_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var GPIO26_LEVEL_LOW: GPIO26_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO25_EDGE_HIGH: GPIO25_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO25_EDGE_LOW: GPIO25_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var GPIO25_LEVEL_HIGH: GPIO25_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var GPIO25_LEVEL_LOW: GPIO25_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO24_EDGE_HIGH: GPIO24_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO24_EDGE_LOW: GPIO24_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var GPIO24_LEVEL_HIGH: GPIO24_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var GPIO24_LEVEL_LOW: GPIO24_LEVEL_LOW_Field
    }

    /// Interrupt Force for proc1
    @RegisterBank(offset: 0x0140)
    public var PROC1_INTF0: Register<PROC1_INTF0_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC1_INTF0_Descriptor {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var GPIO7_EDGE_HIGH: GPIO7_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var GPIO7_EDGE_LOW: GPIO7_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var GPIO7_LEVEL_HIGH: GPIO7_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var GPIO7_LEVEL_LOW: GPIO7_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var GPIO6_EDGE_HIGH: GPIO6_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var GPIO6_EDGE_LOW: GPIO6_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var GPIO6_LEVEL_HIGH: GPIO6_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var GPIO6_LEVEL_LOW: GPIO6_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO5_EDGE_HIGH: GPIO5_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO5_EDGE_LOW: GPIO5_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var GPIO5_LEVEL_HIGH: GPIO5_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var GPIO5_LEVEL_LOW: GPIO5_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO4_EDGE_HIGH: GPIO4_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO4_EDGE_LOW: GPIO4_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var GPIO4_LEVEL_HIGH: GPIO4_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var GPIO4_LEVEL_LOW: GPIO4_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO3_EDGE_HIGH: GPIO3_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO3_EDGE_LOW: GPIO3_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var GPIO3_LEVEL_HIGH: GPIO3_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var GPIO3_LEVEL_LOW: GPIO3_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO2_EDGE_HIGH: GPIO2_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO2_EDGE_LOW: GPIO2_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var GPIO2_LEVEL_HIGH: GPIO2_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var GPIO2_LEVEL_LOW: GPIO2_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO1_EDGE_HIGH: GPIO1_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO1_EDGE_LOW: GPIO1_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var GPIO1_LEVEL_HIGH: GPIO1_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var GPIO1_LEVEL_LOW: GPIO1_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO0_EDGE_HIGH: GPIO0_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO0_EDGE_LOW: GPIO0_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var GPIO0_LEVEL_HIGH: GPIO0_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var GPIO0_LEVEL_LOW: GPIO0_LEVEL_LOW_Field
    }

    /// Interrupt Force for proc1
    @RegisterBank(offset: 0x0144)
    public var PROC1_INTF1: Register<PROC1_INTF1_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC1_INTF1_Descriptor {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var GPIO15_EDGE_HIGH: GPIO15_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var GPIO15_EDGE_LOW: GPIO15_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var GPIO15_LEVEL_HIGH: GPIO15_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var GPIO15_LEVEL_LOW: GPIO15_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var GPIO14_EDGE_HIGH: GPIO14_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var GPIO14_EDGE_LOW: GPIO14_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var GPIO14_LEVEL_HIGH: GPIO14_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var GPIO14_LEVEL_LOW: GPIO14_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO13_EDGE_HIGH: GPIO13_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO13_EDGE_LOW: GPIO13_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var GPIO13_LEVEL_HIGH: GPIO13_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var GPIO13_LEVEL_LOW: GPIO13_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO12_EDGE_HIGH: GPIO12_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO12_EDGE_LOW: GPIO12_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var GPIO12_LEVEL_HIGH: GPIO12_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var GPIO12_LEVEL_LOW: GPIO12_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO11_EDGE_HIGH: GPIO11_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO11_EDGE_LOW: GPIO11_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var GPIO11_LEVEL_HIGH: GPIO11_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var GPIO11_LEVEL_LOW: GPIO11_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO10_EDGE_HIGH: GPIO10_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO10_EDGE_LOW: GPIO10_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var GPIO10_LEVEL_HIGH: GPIO10_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var GPIO10_LEVEL_LOW: GPIO10_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO9_EDGE_HIGH: GPIO9_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO9_EDGE_LOW: GPIO9_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var GPIO9_LEVEL_HIGH: GPIO9_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var GPIO9_LEVEL_LOW: GPIO9_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO8_EDGE_HIGH: GPIO8_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO8_EDGE_LOW: GPIO8_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var GPIO8_LEVEL_HIGH: GPIO8_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var GPIO8_LEVEL_LOW: GPIO8_LEVEL_LOW_Field
    }

    /// Interrupt Force for proc1
    @RegisterBank(offset: 0x0148)
    public var PROC1_INTF2: Register<PROC1_INTF2_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC1_INTF2_Descriptor {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var GPIO23_EDGE_HIGH: GPIO23_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var GPIO23_EDGE_LOW: GPIO23_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var GPIO23_LEVEL_HIGH: GPIO23_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var GPIO23_LEVEL_LOW: GPIO23_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var GPIO22_EDGE_HIGH: GPIO22_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var GPIO22_EDGE_LOW: GPIO22_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var GPIO22_LEVEL_HIGH: GPIO22_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var GPIO22_LEVEL_LOW: GPIO22_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO21_EDGE_HIGH: GPIO21_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO21_EDGE_LOW: GPIO21_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var GPIO21_LEVEL_HIGH: GPIO21_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var GPIO21_LEVEL_LOW: GPIO21_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO20_EDGE_HIGH: GPIO20_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO20_EDGE_LOW: GPIO20_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var GPIO20_LEVEL_HIGH: GPIO20_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var GPIO20_LEVEL_LOW: GPIO20_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO19_EDGE_HIGH: GPIO19_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO19_EDGE_LOW: GPIO19_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var GPIO19_LEVEL_HIGH: GPIO19_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var GPIO19_LEVEL_LOW: GPIO19_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO18_EDGE_HIGH: GPIO18_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO18_EDGE_LOW: GPIO18_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var GPIO18_LEVEL_HIGH: GPIO18_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var GPIO18_LEVEL_LOW: GPIO18_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO17_EDGE_HIGH: GPIO17_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO17_EDGE_LOW: GPIO17_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var GPIO17_LEVEL_HIGH: GPIO17_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var GPIO17_LEVEL_LOW: GPIO17_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO16_EDGE_HIGH: GPIO16_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO16_EDGE_LOW: GPIO16_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var GPIO16_LEVEL_HIGH: GPIO16_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var GPIO16_LEVEL_LOW: GPIO16_LEVEL_LOW_Field
    }

    /// Interrupt Force for proc1
    @RegisterBank(offset: 0x014c)
    public var PROC1_INTF3: Register<PROC1_INTF3_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC1_INTF3_Descriptor {
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO29_EDGE_HIGH: GPIO29_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO29_EDGE_LOW: GPIO29_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var GPIO29_LEVEL_HIGH: GPIO29_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var GPIO29_LEVEL_LOW: GPIO29_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO28_EDGE_HIGH: GPIO28_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO28_EDGE_LOW: GPIO28_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var GPIO28_LEVEL_HIGH: GPIO28_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var GPIO28_LEVEL_LOW: GPIO28_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO27_EDGE_HIGH: GPIO27_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO27_EDGE_LOW: GPIO27_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var GPIO27_LEVEL_HIGH: GPIO27_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var GPIO27_LEVEL_LOW: GPIO27_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO26_EDGE_HIGH: GPIO26_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO26_EDGE_LOW: GPIO26_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var GPIO26_LEVEL_HIGH: GPIO26_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var GPIO26_LEVEL_LOW: GPIO26_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO25_EDGE_HIGH: GPIO25_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO25_EDGE_LOW: GPIO25_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var GPIO25_LEVEL_HIGH: GPIO25_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var GPIO25_LEVEL_LOW: GPIO25_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO24_EDGE_HIGH: GPIO24_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO24_EDGE_LOW: GPIO24_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var GPIO24_LEVEL_HIGH: GPIO24_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var GPIO24_LEVEL_LOW: GPIO24_LEVEL_LOW_Field
    }

    /// Interrupt status after masking & forcing for proc1
    @RegisterBank(offset: 0x0150)
    public var PROC1_INTS0: Register<PROC1_INTS0_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC1_INTS0_Descriptor {
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var GPIO7_EDGE_HIGH: GPIO7_EDGE_HIGH_Field

        @ReadOnly(bits: 30..<31, as: Bool.self)
        public var GPIO7_EDGE_LOW: GPIO7_EDGE_LOW_Field

        @ReadOnly(bits: 29..<30, as: Bool.self)
        public var GPIO7_LEVEL_HIGH: GPIO7_LEVEL_HIGH_Field

        @ReadOnly(bits: 28..<29, as: Bool.self)
        public var GPIO7_LEVEL_LOW: GPIO7_LEVEL_LOW_Field

        @ReadOnly(bits: 27..<28, as: Bool.self)
        public var GPIO6_EDGE_HIGH: GPIO6_EDGE_HIGH_Field

        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var GPIO6_EDGE_LOW: GPIO6_EDGE_LOW_Field

        @ReadOnly(bits: 25..<26, as: Bool.self)
        public var GPIO6_LEVEL_HIGH: GPIO6_LEVEL_HIGH_Field

        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var GPIO6_LEVEL_LOW: GPIO6_LEVEL_LOW_Field

        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var GPIO5_EDGE_HIGH: GPIO5_EDGE_HIGH_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var GPIO5_EDGE_LOW: GPIO5_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var GPIO5_LEVEL_HIGH: GPIO5_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var GPIO5_LEVEL_LOW: GPIO5_LEVEL_LOW_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var GPIO4_EDGE_HIGH: GPIO4_EDGE_HIGH_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var GPIO4_EDGE_LOW: GPIO4_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var GPIO4_LEVEL_HIGH: GPIO4_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var GPIO4_LEVEL_LOW: GPIO4_LEVEL_LOW_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var GPIO3_EDGE_HIGH: GPIO3_EDGE_HIGH_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var GPIO3_EDGE_LOW: GPIO3_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var GPIO3_LEVEL_HIGH: GPIO3_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var GPIO3_LEVEL_LOW: GPIO3_LEVEL_LOW_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var GPIO2_EDGE_HIGH: GPIO2_EDGE_HIGH_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var GPIO2_EDGE_LOW: GPIO2_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var GPIO2_LEVEL_HIGH: GPIO2_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var GPIO2_LEVEL_LOW: GPIO2_LEVEL_LOW_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var GPIO1_EDGE_HIGH: GPIO1_EDGE_HIGH_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var GPIO1_EDGE_LOW: GPIO1_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var GPIO1_LEVEL_HIGH: GPIO1_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var GPIO1_LEVEL_LOW: GPIO1_LEVEL_LOW_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var GPIO0_EDGE_HIGH: GPIO0_EDGE_HIGH_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var GPIO0_EDGE_LOW: GPIO0_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var GPIO0_LEVEL_HIGH: GPIO0_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var GPIO0_LEVEL_LOW: GPIO0_LEVEL_LOW_Field
    }

    /// Interrupt status after masking & forcing for proc1
    @RegisterBank(offset: 0x0154)
    public var PROC1_INTS1: Register<PROC1_INTS1_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC1_INTS1_Descriptor {
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var GPIO15_EDGE_HIGH: GPIO15_EDGE_HIGH_Field

        @ReadOnly(bits: 30..<31, as: Bool.self)
        public var GPIO15_EDGE_LOW: GPIO15_EDGE_LOW_Field

        @ReadOnly(bits: 29..<30, as: Bool.self)
        public var GPIO15_LEVEL_HIGH: GPIO15_LEVEL_HIGH_Field

        @ReadOnly(bits: 28..<29, as: Bool.self)
        public var GPIO15_LEVEL_LOW: GPIO15_LEVEL_LOW_Field

        @ReadOnly(bits: 27..<28, as: Bool.self)
        public var GPIO14_EDGE_HIGH: GPIO14_EDGE_HIGH_Field

        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var GPIO14_EDGE_LOW: GPIO14_EDGE_LOW_Field

        @ReadOnly(bits: 25..<26, as: Bool.self)
        public var GPIO14_LEVEL_HIGH: GPIO14_LEVEL_HIGH_Field

        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var GPIO14_LEVEL_LOW: GPIO14_LEVEL_LOW_Field

        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var GPIO13_EDGE_HIGH: GPIO13_EDGE_HIGH_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var GPIO13_EDGE_LOW: GPIO13_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var GPIO13_LEVEL_HIGH: GPIO13_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var GPIO13_LEVEL_LOW: GPIO13_LEVEL_LOW_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var GPIO12_EDGE_HIGH: GPIO12_EDGE_HIGH_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var GPIO12_EDGE_LOW: GPIO12_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var GPIO12_LEVEL_HIGH: GPIO12_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var GPIO12_LEVEL_LOW: GPIO12_LEVEL_LOW_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var GPIO11_EDGE_HIGH: GPIO11_EDGE_HIGH_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var GPIO11_EDGE_LOW: GPIO11_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var GPIO11_LEVEL_HIGH: GPIO11_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var GPIO11_LEVEL_LOW: GPIO11_LEVEL_LOW_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var GPIO10_EDGE_HIGH: GPIO10_EDGE_HIGH_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var GPIO10_EDGE_LOW: GPIO10_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var GPIO10_LEVEL_HIGH: GPIO10_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var GPIO10_LEVEL_LOW: GPIO10_LEVEL_LOW_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var GPIO9_EDGE_HIGH: GPIO9_EDGE_HIGH_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var GPIO9_EDGE_LOW: GPIO9_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var GPIO9_LEVEL_HIGH: GPIO9_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var GPIO9_LEVEL_LOW: GPIO9_LEVEL_LOW_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var GPIO8_EDGE_HIGH: GPIO8_EDGE_HIGH_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var GPIO8_EDGE_LOW: GPIO8_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var GPIO8_LEVEL_HIGH: GPIO8_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var GPIO8_LEVEL_LOW: GPIO8_LEVEL_LOW_Field
    }

    /// Interrupt status after masking & forcing for proc1
    @RegisterBank(offset: 0x0158)
    public var PROC1_INTS2: Register<PROC1_INTS2_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC1_INTS2_Descriptor {
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var GPIO23_EDGE_HIGH: GPIO23_EDGE_HIGH_Field

        @ReadOnly(bits: 30..<31, as: Bool.self)
        public var GPIO23_EDGE_LOW: GPIO23_EDGE_LOW_Field

        @ReadOnly(bits: 29..<30, as: Bool.self)
        public var GPIO23_LEVEL_HIGH: GPIO23_LEVEL_HIGH_Field

        @ReadOnly(bits: 28..<29, as: Bool.self)
        public var GPIO23_LEVEL_LOW: GPIO23_LEVEL_LOW_Field

        @ReadOnly(bits: 27..<28, as: Bool.self)
        public var GPIO22_EDGE_HIGH: GPIO22_EDGE_HIGH_Field

        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var GPIO22_EDGE_LOW: GPIO22_EDGE_LOW_Field

        @ReadOnly(bits: 25..<26, as: Bool.self)
        public var GPIO22_LEVEL_HIGH: GPIO22_LEVEL_HIGH_Field

        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var GPIO22_LEVEL_LOW: GPIO22_LEVEL_LOW_Field

        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var GPIO21_EDGE_HIGH: GPIO21_EDGE_HIGH_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var GPIO21_EDGE_LOW: GPIO21_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var GPIO21_LEVEL_HIGH: GPIO21_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var GPIO21_LEVEL_LOW: GPIO21_LEVEL_LOW_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var GPIO20_EDGE_HIGH: GPIO20_EDGE_HIGH_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var GPIO20_EDGE_LOW: GPIO20_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var GPIO20_LEVEL_HIGH: GPIO20_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var GPIO20_LEVEL_LOW: GPIO20_LEVEL_LOW_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var GPIO19_EDGE_HIGH: GPIO19_EDGE_HIGH_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var GPIO19_EDGE_LOW: GPIO19_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var GPIO19_LEVEL_HIGH: GPIO19_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var GPIO19_LEVEL_LOW: GPIO19_LEVEL_LOW_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var GPIO18_EDGE_HIGH: GPIO18_EDGE_HIGH_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var GPIO18_EDGE_LOW: GPIO18_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var GPIO18_LEVEL_HIGH: GPIO18_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var GPIO18_LEVEL_LOW: GPIO18_LEVEL_LOW_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var GPIO17_EDGE_HIGH: GPIO17_EDGE_HIGH_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var GPIO17_EDGE_LOW: GPIO17_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var GPIO17_LEVEL_HIGH: GPIO17_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var GPIO17_LEVEL_LOW: GPIO17_LEVEL_LOW_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var GPIO16_EDGE_HIGH: GPIO16_EDGE_HIGH_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var GPIO16_EDGE_LOW: GPIO16_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var GPIO16_LEVEL_HIGH: GPIO16_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var GPIO16_LEVEL_LOW: GPIO16_LEVEL_LOW_Field
    }

    /// Interrupt status after masking & forcing for proc1
    @RegisterBank(offset: 0x015c)
    public var PROC1_INTS3: Register<PROC1_INTS3_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC1_INTS3_Descriptor {
        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var GPIO29_EDGE_HIGH: GPIO29_EDGE_HIGH_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var GPIO29_EDGE_LOW: GPIO29_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var GPIO29_LEVEL_HIGH: GPIO29_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var GPIO29_LEVEL_LOW: GPIO29_LEVEL_LOW_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var GPIO28_EDGE_HIGH: GPIO28_EDGE_HIGH_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var GPIO28_EDGE_LOW: GPIO28_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var GPIO28_LEVEL_HIGH: GPIO28_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var GPIO28_LEVEL_LOW: GPIO28_LEVEL_LOW_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var GPIO27_EDGE_HIGH: GPIO27_EDGE_HIGH_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var GPIO27_EDGE_LOW: GPIO27_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var GPIO27_LEVEL_HIGH: GPIO27_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var GPIO27_LEVEL_LOW: GPIO27_LEVEL_LOW_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var GPIO26_EDGE_HIGH: GPIO26_EDGE_HIGH_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var GPIO26_EDGE_LOW: GPIO26_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var GPIO26_LEVEL_HIGH: GPIO26_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var GPIO26_LEVEL_LOW: GPIO26_LEVEL_LOW_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var GPIO25_EDGE_HIGH: GPIO25_EDGE_HIGH_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var GPIO25_EDGE_LOW: GPIO25_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var GPIO25_LEVEL_HIGH: GPIO25_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var GPIO25_LEVEL_LOW: GPIO25_LEVEL_LOW_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var GPIO24_EDGE_HIGH: GPIO24_EDGE_HIGH_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var GPIO24_EDGE_LOW: GPIO24_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var GPIO24_LEVEL_HIGH: GPIO24_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var GPIO24_LEVEL_LOW: GPIO24_LEVEL_LOW_Field
    }

    /// Interrupt Enable for dormant_wake
    @RegisterBank(offset: 0x0160)
    public var DORMANT_WAKE_INTE0: Register<DORMANT_WAKE_INTE0_Descriptor>


    @Register(bitWidth: 32)
    public struct DORMANT_WAKE_INTE0_Descriptor {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var GPIO7_EDGE_HIGH: GPIO7_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var GPIO7_EDGE_LOW: GPIO7_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var GPIO7_LEVEL_HIGH: GPIO7_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var GPIO7_LEVEL_LOW: GPIO7_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var GPIO6_EDGE_HIGH: GPIO6_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var GPIO6_EDGE_LOW: GPIO6_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var GPIO6_LEVEL_HIGH: GPIO6_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var GPIO6_LEVEL_LOW: GPIO6_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO5_EDGE_HIGH: GPIO5_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO5_EDGE_LOW: GPIO5_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var GPIO5_LEVEL_HIGH: GPIO5_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var GPIO5_LEVEL_LOW: GPIO5_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO4_EDGE_HIGH: GPIO4_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO4_EDGE_LOW: GPIO4_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var GPIO4_LEVEL_HIGH: GPIO4_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var GPIO4_LEVEL_LOW: GPIO4_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO3_EDGE_HIGH: GPIO3_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO3_EDGE_LOW: GPIO3_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var GPIO3_LEVEL_HIGH: GPIO3_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var GPIO3_LEVEL_LOW: GPIO3_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO2_EDGE_HIGH: GPIO2_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO2_EDGE_LOW: GPIO2_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var GPIO2_LEVEL_HIGH: GPIO2_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var GPIO2_LEVEL_LOW: GPIO2_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO1_EDGE_HIGH: GPIO1_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO1_EDGE_LOW: GPIO1_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var GPIO1_LEVEL_HIGH: GPIO1_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var GPIO1_LEVEL_LOW: GPIO1_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO0_EDGE_HIGH: GPIO0_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO0_EDGE_LOW: GPIO0_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var GPIO0_LEVEL_HIGH: GPIO0_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var GPIO0_LEVEL_LOW: GPIO0_LEVEL_LOW_Field
    }

    /// Interrupt Enable for dormant_wake
    @RegisterBank(offset: 0x0164)
    public var DORMANT_WAKE_INTE1: Register<DORMANT_WAKE_INTE1_Descriptor>


    @Register(bitWidth: 32)
    public struct DORMANT_WAKE_INTE1_Descriptor {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var GPIO15_EDGE_HIGH: GPIO15_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var GPIO15_EDGE_LOW: GPIO15_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var GPIO15_LEVEL_HIGH: GPIO15_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var GPIO15_LEVEL_LOW: GPIO15_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var GPIO14_EDGE_HIGH: GPIO14_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var GPIO14_EDGE_LOW: GPIO14_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var GPIO14_LEVEL_HIGH: GPIO14_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var GPIO14_LEVEL_LOW: GPIO14_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO13_EDGE_HIGH: GPIO13_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO13_EDGE_LOW: GPIO13_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var GPIO13_LEVEL_HIGH: GPIO13_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var GPIO13_LEVEL_LOW: GPIO13_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO12_EDGE_HIGH: GPIO12_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO12_EDGE_LOW: GPIO12_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var GPIO12_LEVEL_HIGH: GPIO12_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var GPIO12_LEVEL_LOW: GPIO12_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO11_EDGE_HIGH: GPIO11_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO11_EDGE_LOW: GPIO11_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var GPIO11_LEVEL_HIGH: GPIO11_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var GPIO11_LEVEL_LOW: GPIO11_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO10_EDGE_HIGH: GPIO10_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO10_EDGE_LOW: GPIO10_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var GPIO10_LEVEL_HIGH: GPIO10_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var GPIO10_LEVEL_LOW: GPIO10_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO9_EDGE_HIGH: GPIO9_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO9_EDGE_LOW: GPIO9_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var GPIO9_LEVEL_HIGH: GPIO9_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var GPIO9_LEVEL_LOW: GPIO9_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO8_EDGE_HIGH: GPIO8_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO8_EDGE_LOW: GPIO8_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var GPIO8_LEVEL_HIGH: GPIO8_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var GPIO8_LEVEL_LOW: GPIO8_LEVEL_LOW_Field
    }

    /// Interrupt Enable for dormant_wake
    @RegisterBank(offset: 0x0168)
    public var DORMANT_WAKE_INTE2: Register<DORMANT_WAKE_INTE2_Descriptor>


    @Register(bitWidth: 32)
    public struct DORMANT_WAKE_INTE2_Descriptor {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var GPIO23_EDGE_HIGH: GPIO23_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var GPIO23_EDGE_LOW: GPIO23_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var GPIO23_LEVEL_HIGH: GPIO23_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var GPIO23_LEVEL_LOW: GPIO23_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var GPIO22_EDGE_HIGH: GPIO22_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var GPIO22_EDGE_LOW: GPIO22_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var GPIO22_LEVEL_HIGH: GPIO22_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var GPIO22_LEVEL_LOW: GPIO22_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO21_EDGE_HIGH: GPIO21_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO21_EDGE_LOW: GPIO21_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var GPIO21_LEVEL_HIGH: GPIO21_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var GPIO21_LEVEL_LOW: GPIO21_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO20_EDGE_HIGH: GPIO20_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO20_EDGE_LOW: GPIO20_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var GPIO20_LEVEL_HIGH: GPIO20_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var GPIO20_LEVEL_LOW: GPIO20_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO19_EDGE_HIGH: GPIO19_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO19_EDGE_LOW: GPIO19_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var GPIO19_LEVEL_HIGH: GPIO19_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var GPIO19_LEVEL_LOW: GPIO19_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO18_EDGE_HIGH: GPIO18_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO18_EDGE_LOW: GPIO18_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var GPIO18_LEVEL_HIGH: GPIO18_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var GPIO18_LEVEL_LOW: GPIO18_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO17_EDGE_HIGH: GPIO17_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO17_EDGE_LOW: GPIO17_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var GPIO17_LEVEL_HIGH: GPIO17_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var GPIO17_LEVEL_LOW: GPIO17_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO16_EDGE_HIGH: GPIO16_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO16_EDGE_LOW: GPIO16_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var GPIO16_LEVEL_HIGH: GPIO16_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var GPIO16_LEVEL_LOW: GPIO16_LEVEL_LOW_Field
    }

    /// Interrupt Enable for dormant_wake
    @RegisterBank(offset: 0x016c)
    public var DORMANT_WAKE_INTE3: Register<DORMANT_WAKE_INTE3_Descriptor>


    @Register(bitWidth: 32)
    public struct DORMANT_WAKE_INTE3_Descriptor {
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO29_EDGE_HIGH: GPIO29_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO29_EDGE_LOW: GPIO29_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var GPIO29_LEVEL_HIGH: GPIO29_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var GPIO29_LEVEL_LOW: GPIO29_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO28_EDGE_HIGH: GPIO28_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO28_EDGE_LOW: GPIO28_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var GPIO28_LEVEL_HIGH: GPIO28_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var GPIO28_LEVEL_LOW: GPIO28_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO27_EDGE_HIGH: GPIO27_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO27_EDGE_LOW: GPIO27_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var GPIO27_LEVEL_HIGH: GPIO27_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var GPIO27_LEVEL_LOW: GPIO27_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO26_EDGE_HIGH: GPIO26_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO26_EDGE_LOW: GPIO26_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var GPIO26_LEVEL_HIGH: GPIO26_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var GPIO26_LEVEL_LOW: GPIO26_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO25_EDGE_HIGH: GPIO25_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO25_EDGE_LOW: GPIO25_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var GPIO25_LEVEL_HIGH: GPIO25_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var GPIO25_LEVEL_LOW: GPIO25_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO24_EDGE_HIGH: GPIO24_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO24_EDGE_LOW: GPIO24_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var GPIO24_LEVEL_HIGH: GPIO24_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var GPIO24_LEVEL_LOW: GPIO24_LEVEL_LOW_Field
    }

    /// Interrupt Force for dormant_wake
    @RegisterBank(offset: 0x0170)
    public var DORMANT_WAKE_INTF0: Register<DORMANT_WAKE_INTF0_Descriptor>


    @Register(bitWidth: 32)
    public struct DORMANT_WAKE_INTF0_Descriptor {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var GPIO7_EDGE_HIGH: GPIO7_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var GPIO7_EDGE_LOW: GPIO7_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var GPIO7_LEVEL_HIGH: GPIO7_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var GPIO7_LEVEL_LOW: GPIO7_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var GPIO6_EDGE_HIGH: GPIO6_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var GPIO6_EDGE_LOW: GPIO6_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var GPIO6_LEVEL_HIGH: GPIO6_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var GPIO6_LEVEL_LOW: GPIO6_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO5_EDGE_HIGH: GPIO5_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO5_EDGE_LOW: GPIO5_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var GPIO5_LEVEL_HIGH: GPIO5_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var GPIO5_LEVEL_LOW: GPIO5_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO4_EDGE_HIGH: GPIO4_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO4_EDGE_LOW: GPIO4_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var GPIO4_LEVEL_HIGH: GPIO4_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var GPIO4_LEVEL_LOW: GPIO4_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO3_EDGE_HIGH: GPIO3_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO3_EDGE_LOW: GPIO3_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var GPIO3_LEVEL_HIGH: GPIO3_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var GPIO3_LEVEL_LOW: GPIO3_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO2_EDGE_HIGH: GPIO2_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO2_EDGE_LOW: GPIO2_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var GPIO2_LEVEL_HIGH: GPIO2_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var GPIO2_LEVEL_LOW: GPIO2_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO1_EDGE_HIGH: GPIO1_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO1_EDGE_LOW: GPIO1_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var GPIO1_LEVEL_HIGH: GPIO1_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var GPIO1_LEVEL_LOW: GPIO1_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO0_EDGE_HIGH: GPIO0_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO0_EDGE_LOW: GPIO0_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var GPIO0_LEVEL_HIGH: GPIO0_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var GPIO0_LEVEL_LOW: GPIO0_LEVEL_LOW_Field
    }

    /// Interrupt Force for dormant_wake
    @RegisterBank(offset: 0x0174)
    public var DORMANT_WAKE_INTF1: Register<DORMANT_WAKE_INTF1_Descriptor>


    @Register(bitWidth: 32)
    public struct DORMANT_WAKE_INTF1_Descriptor {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var GPIO15_EDGE_HIGH: GPIO15_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var GPIO15_EDGE_LOW: GPIO15_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var GPIO15_LEVEL_HIGH: GPIO15_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var GPIO15_LEVEL_LOW: GPIO15_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var GPIO14_EDGE_HIGH: GPIO14_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var GPIO14_EDGE_LOW: GPIO14_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var GPIO14_LEVEL_HIGH: GPIO14_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var GPIO14_LEVEL_LOW: GPIO14_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO13_EDGE_HIGH: GPIO13_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO13_EDGE_LOW: GPIO13_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var GPIO13_LEVEL_HIGH: GPIO13_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var GPIO13_LEVEL_LOW: GPIO13_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO12_EDGE_HIGH: GPIO12_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO12_EDGE_LOW: GPIO12_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var GPIO12_LEVEL_HIGH: GPIO12_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var GPIO12_LEVEL_LOW: GPIO12_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO11_EDGE_HIGH: GPIO11_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO11_EDGE_LOW: GPIO11_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var GPIO11_LEVEL_HIGH: GPIO11_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var GPIO11_LEVEL_LOW: GPIO11_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO10_EDGE_HIGH: GPIO10_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO10_EDGE_LOW: GPIO10_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var GPIO10_LEVEL_HIGH: GPIO10_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var GPIO10_LEVEL_LOW: GPIO10_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO9_EDGE_HIGH: GPIO9_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO9_EDGE_LOW: GPIO9_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var GPIO9_LEVEL_HIGH: GPIO9_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var GPIO9_LEVEL_LOW: GPIO9_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO8_EDGE_HIGH: GPIO8_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO8_EDGE_LOW: GPIO8_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var GPIO8_LEVEL_HIGH: GPIO8_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var GPIO8_LEVEL_LOW: GPIO8_LEVEL_LOW_Field
    }

    /// Interrupt Force for dormant_wake
    @RegisterBank(offset: 0x0178)
    public var DORMANT_WAKE_INTF2: Register<DORMANT_WAKE_INTF2_Descriptor>


    @Register(bitWidth: 32)
    public struct DORMANT_WAKE_INTF2_Descriptor {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var GPIO23_EDGE_HIGH: GPIO23_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var GPIO23_EDGE_LOW: GPIO23_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var GPIO23_LEVEL_HIGH: GPIO23_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var GPIO23_LEVEL_LOW: GPIO23_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var GPIO22_EDGE_HIGH: GPIO22_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var GPIO22_EDGE_LOW: GPIO22_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var GPIO22_LEVEL_HIGH: GPIO22_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var GPIO22_LEVEL_LOW: GPIO22_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO21_EDGE_HIGH: GPIO21_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO21_EDGE_LOW: GPIO21_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var GPIO21_LEVEL_HIGH: GPIO21_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var GPIO21_LEVEL_LOW: GPIO21_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO20_EDGE_HIGH: GPIO20_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO20_EDGE_LOW: GPIO20_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var GPIO20_LEVEL_HIGH: GPIO20_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var GPIO20_LEVEL_LOW: GPIO20_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO19_EDGE_HIGH: GPIO19_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO19_EDGE_LOW: GPIO19_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var GPIO19_LEVEL_HIGH: GPIO19_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var GPIO19_LEVEL_LOW: GPIO19_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO18_EDGE_HIGH: GPIO18_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO18_EDGE_LOW: GPIO18_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var GPIO18_LEVEL_HIGH: GPIO18_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var GPIO18_LEVEL_LOW: GPIO18_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO17_EDGE_HIGH: GPIO17_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO17_EDGE_LOW: GPIO17_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var GPIO17_LEVEL_HIGH: GPIO17_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var GPIO17_LEVEL_LOW: GPIO17_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO16_EDGE_HIGH: GPIO16_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO16_EDGE_LOW: GPIO16_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var GPIO16_LEVEL_HIGH: GPIO16_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var GPIO16_LEVEL_LOW: GPIO16_LEVEL_LOW_Field
    }

    /// Interrupt Force for dormant_wake
    @RegisterBank(offset: 0x017c)
    public var DORMANT_WAKE_INTF3: Register<DORMANT_WAKE_INTF3_Descriptor>


    @Register(bitWidth: 32)
    public struct DORMANT_WAKE_INTF3_Descriptor {
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var GPIO29_EDGE_HIGH: GPIO29_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var GPIO29_EDGE_LOW: GPIO29_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var GPIO29_LEVEL_HIGH: GPIO29_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var GPIO29_LEVEL_LOW: GPIO29_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var GPIO28_EDGE_HIGH: GPIO28_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var GPIO28_EDGE_LOW: GPIO28_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var GPIO28_LEVEL_HIGH: GPIO28_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var GPIO28_LEVEL_LOW: GPIO28_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var GPIO27_EDGE_HIGH: GPIO27_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var GPIO27_EDGE_LOW: GPIO27_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var GPIO27_LEVEL_HIGH: GPIO27_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var GPIO27_LEVEL_LOW: GPIO27_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var GPIO26_EDGE_HIGH: GPIO26_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var GPIO26_EDGE_LOW: GPIO26_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var GPIO26_LEVEL_HIGH: GPIO26_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var GPIO26_LEVEL_LOW: GPIO26_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var GPIO25_EDGE_HIGH: GPIO25_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var GPIO25_EDGE_LOW: GPIO25_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var GPIO25_LEVEL_HIGH: GPIO25_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var GPIO25_LEVEL_LOW: GPIO25_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var GPIO24_EDGE_HIGH: GPIO24_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var GPIO24_EDGE_LOW: GPIO24_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var GPIO24_LEVEL_HIGH: GPIO24_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var GPIO24_LEVEL_LOW: GPIO24_LEVEL_LOW_Field
    }

    /// Interrupt status after masking & forcing for dormant_wake
    @RegisterBank(offset: 0x0180)
    public var DORMANT_WAKE_INTS0: Register<DORMANT_WAKE_INTS0_Descriptor>


    @Register(bitWidth: 32)
    public struct DORMANT_WAKE_INTS0_Descriptor {
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var GPIO7_EDGE_HIGH: GPIO7_EDGE_HIGH_Field

        @ReadOnly(bits: 30..<31, as: Bool.self)
        public var GPIO7_EDGE_LOW: GPIO7_EDGE_LOW_Field

        @ReadOnly(bits: 29..<30, as: Bool.self)
        public var GPIO7_LEVEL_HIGH: GPIO7_LEVEL_HIGH_Field

        @ReadOnly(bits: 28..<29, as: Bool.self)
        public var GPIO7_LEVEL_LOW: GPIO7_LEVEL_LOW_Field

        @ReadOnly(bits: 27..<28, as: Bool.self)
        public var GPIO6_EDGE_HIGH: GPIO6_EDGE_HIGH_Field

        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var GPIO6_EDGE_LOW: GPIO6_EDGE_LOW_Field

        @ReadOnly(bits: 25..<26, as: Bool.self)
        public var GPIO6_LEVEL_HIGH: GPIO6_LEVEL_HIGH_Field

        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var GPIO6_LEVEL_LOW: GPIO6_LEVEL_LOW_Field

        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var GPIO5_EDGE_HIGH: GPIO5_EDGE_HIGH_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var GPIO5_EDGE_LOW: GPIO5_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var GPIO5_LEVEL_HIGH: GPIO5_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var GPIO5_LEVEL_LOW: GPIO5_LEVEL_LOW_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var GPIO4_EDGE_HIGH: GPIO4_EDGE_HIGH_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var GPIO4_EDGE_LOW: GPIO4_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var GPIO4_LEVEL_HIGH: GPIO4_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var GPIO4_LEVEL_LOW: GPIO4_LEVEL_LOW_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var GPIO3_EDGE_HIGH: GPIO3_EDGE_HIGH_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var GPIO3_EDGE_LOW: GPIO3_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var GPIO3_LEVEL_HIGH: GPIO3_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var GPIO3_LEVEL_LOW: GPIO3_LEVEL_LOW_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var GPIO2_EDGE_HIGH: GPIO2_EDGE_HIGH_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var GPIO2_EDGE_LOW: GPIO2_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var GPIO2_LEVEL_HIGH: GPIO2_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var GPIO2_LEVEL_LOW: GPIO2_LEVEL_LOW_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var GPIO1_EDGE_HIGH: GPIO1_EDGE_HIGH_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var GPIO1_EDGE_LOW: GPIO1_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var GPIO1_LEVEL_HIGH: GPIO1_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var GPIO1_LEVEL_LOW: GPIO1_LEVEL_LOW_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var GPIO0_EDGE_HIGH: GPIO0_EDGE_HIGH_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var GPIO0_EDGE_LOW: GPIO0_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var GPIO0_LEVEL_HIGH: GPIO0_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var GPIO0_LEVEL_LOW: GPIO0_LEVEL_LOW_Field
    }

    /// Interrupt status after masking & forcing for dormant_wake
    @RegisterBank(offset: 0x0184)
    public var DORMANT_WAKE_INTS1: Register<DORMANT_WAKE_INTS1_Descriptor>


    @Register(bitWidth: 32)
    public struct DORMANT_WAKE_INTS1_Descriptor {
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var GPIO15_EDGE_HIGH: GPIO15_EDGE_HIGH_Field

        @ReadOnly(bits: 30..<31, as: Bool.self)
        public var GPIO15_EDGE_LOW: GPIO15_EDGE_LOW_Field

        @ReadOnly(bits: 29..<30, as: Bool.self)
        public var GPIO15_LEVEL_HIGH: GPIO15_LEVEL_HIGH_Field

        @ReadOnly(bits: 28..<29, as: Bool.self)
        public var GPIO15_LEVEL_LOW: GPIO15_LEVEL_LOW_Field

        @ReadOnly(bits: 27..<28, as: Bool.self)
        public var GPIO14_EDGE_HIGH: GPIO14_EDGE_HIGH_Field

        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var GPIO14_EDGE_LOW: GPIO14_EDGE_LOW_Field

        @ReadOnly(bits: 25..<26, as: Bool.self)
        public var GPIO14_LEVEL_HIGH: GPIO14_LEVEL_HIGH_Field

        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var GPIO14_LEVEL_LOW: GPIO14_LEVEL_LOW_Field

        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var GPIO13_EDGE_HIGH: GPIO13_EDGE_HIGH_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var GPIO13_EDGE_LOW: GPIO13_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var GPIO13_LEVEL_HIGH: GPIO13_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var GPIO13_LEVEL_LOW: GPIO13_LEVEL_LOW_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var GPIO12_EDGE_HIGH: GPIO12_EDGE_HIGH_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var GPIO12_EDGE_LOW: GPIO12_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var GPIO12_LEVEL_HIGH: GPIO12_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var GPIO12_LEVEL_LOW: GPIO12_LEVEL_LOW_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var GPIO11_EDGE_HIGH: GPIO11_EDGE_HIGH_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var GPIO11_EDGE_LOW: GPIO11_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var GPIO11_LEVEL_HIGH: GPIO11_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var GPIO11_LEVEL_LOW: GPIO11_LEVEL_LOW_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var GPIO10_EDGE_HIGH: GPIO10_EDGE_HIGH_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var GPIO10_EDGE_LOW: GPIO10_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var GPIO10_LEVEL_HIGH: GPIO10_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var GPIO10_LEVEL_LOW: GPIO10_LEVEL_LOW_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var GPIO9_EDGE_HIGH: GPIO9_EDGE_HIGH_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var GPIO9_EDGE_LOW: GPIO9_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var GPIO9_LEVEL_HIGH: GPIO9_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var GPIO9_LEVEL_LOW: GPIO9_LEVEL_LOW_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var GPIO8_EDGE_HIGH: GPIO8_EDGE_HIGH_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var GPIO8_EDGE_LOW: GPIO8_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var GPIO8_LEVEL_HIGH: GPIO8_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var GPIO8_LEVEL_LOW: GPIO8_LEVEL_LOW_Field
    }

    /// Interrupt status after masking & forcing for dormant_wake
    @RegisterBank(offset: 0x0188)
    public var DORMANT_WAKE_INTS2: Register<DORMANT_WAKE_INTS2_Descriptor>


    @Register(bitWidth: 32)
    public struct DORMANT_WAKE_INTS2_Descriptor {
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var GPIO23_EDGE_HIGH: GPIO23_EDGE_HIGH_Field

        @ReadOnly(bits: 30..<31, as: Bool.self)
        public var GPIO23_EDGE_LOW: GPIO23_EDGE_LOW_Field

        @ReadOnly(bits: 29..<30, as: Bool.self)
        public var GPIO23_LEVEL_HIGH: GPIO23_LEVEL_HIGH_Field

        @ReadOnly(bits: 28..<29, as: Bool.self)
        public var GPIO23_LEVEL_LOW: GPIO23_LEVEL_LOW_Field

        @ReadOnly(bits: 27..<28, as: Bool.self)
        public var GPIO22_EDGE_HIGH: GPIO22_EDGE_HIGH_Field

        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var GPIO22_EDGE_LOW: GPIO22_EDGE_LOW_Field

        @ReadOnly(bits: 25..<26, as: Bool.self)
        public var GPIO22_LEVEL_HIGH: GPIO22_LEVEL_HIGH_Field

        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var GPIO22_LEVEL_LOW: GPIO22_LEVEL_LOW_Field

        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var GPIO21_EDGE_HIGH: GPIO21_EDGE_HIGH_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var GPIO21_EDGE_LOW: GPIO21_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var GPIO21_LEVEL_HIGH: GPIO21_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var GPIO21_LEVEL_LOW: GPIO21_LEVEL_LOW_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var GPIO20_EDGE_HIGH: GPIO20_EDGE_HIGH_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var GPIO20_EDGE_LOW: GPIO20_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var GPIO20_LEVEL_HIGH: GPIO20_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var GPIO20_LEVEL_LOW: GPIO20_LEVEL_LOW_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var GPIO19_EDGE_HIGH: GPIO19_EDGE_HIGH_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var GPIO19_EDGE_LOW: GPIO19_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var GPIO19_LEVEL_HIGH: GPIO19_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var GPIO19_LEVEL_LOW: GPIO19_LEVEL_LOW_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var GPIO18_EDGE_HIGH: GPIO18_EDGE_HIGH_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var GPIO18_EDGE_LOW: GPIO18_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var GPIO18_LEVEL_HIGH: GPIO18_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var GPIO18_LEVEL_LOW: GPIO18_LEVEL_LOW_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var GPIO17_EDGE_HIGH: GPIO17_EDGE_HIGH_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var GPIO17_EDGE_LOW: GPIO17_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var GPIO17_LEVEL_HIGH: GPIO17_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var GPIO17_LEVEL_LOW: GPIO17_LEVEL_LOW_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var GPIO16_EDGE_HIGH: GPIO16_EDGE_HIGH_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var GPIO16_EDGE_LOW: GPIO16_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var GPIO16_LEVEL_HIGH: GPIO16_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var GPIO16_LEVEL_LOW: GPIO16_LEVEL_LOW_Field
    }

    /// Interrupt status after masking & forcing for dormant_wake
    @RegisterBank(offset: 0x018c)
    public var DORMANT_WAKE_INTS3: Register<DORMANT_WAKE_INTS3_Descriptor>


    @Register(bitWidth: 32)
    public struct DORMANT_WAKE_INTS3_Descriptor {
        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var GPIO29_EDGE_HIGH: GPIO29_EDGE_HIGH_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var GPIO29_EDGE_LOW: GPIO29_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var GPIO29_LEVEL_HIGH: GPIO29_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var GPIO29_LEVEL_LOW: GPIO29_LEVEL_LOW_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var GPIO28_EDGE_HIGH: GPIO28_EDGE_HIGH_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var GPIO28_EDGE_LOW: GPIO28_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var GPIO28_LEVEL_HIGH: GPIO28_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var GPIO28_LEVEL_LOW: GPIO28_LEVEL_LOW_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var GPIO27_EDGE_HIGH: GPIO27_EDGE_HIGH_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var GPIO27_EDGE_LOW: GPIO27_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var GPIO27_LEVEL_HIGH: GPIO27_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var GPIO27_LEVEL_LOW: GPIO27_LEVEL_LOW_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var GPIO26_EDGE_HIGH: GPIO26_EDGE_HIGH_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var GPIO26_EDGE_LOW: GPIO26_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var GPIO26_LEVEL_HIGH: GPIO26_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var GPIO26_LEVEL_LOW: GPIO26_LEVEL_LOW_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var GPIO25_EDGE_HIGH: GPIO25_EDGE_HIGH_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var GPIO25_EDGE_LOW: GPIO25_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var GPIO25_LEVEL_HIGH: GPIO25_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var GPIO25_LEVEL_LOW: GPIO25_LEVEL_LOW_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var GPIO24_EDGE_HIGH: GPIO24_EDGE_HIGH_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var GPIO24_EDGE_LOW: GPIO24_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var GPIO24_LEVEL_HIGH: GPIO24_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var GPIO24_LEVEL_LOW: GPIO24_LEVEL_LOW_Field
    }
}
