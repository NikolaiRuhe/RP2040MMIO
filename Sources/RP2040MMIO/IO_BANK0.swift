import MMIO
import MMIOExtensions

@RegisterBank
public struct IO_BANK0 {

    public static var `default`: Self { .init(unsafeAddress: 0x40014000) }

    /// GPIO status
    @RegisterBank(offset: 0x0000)
    public var gpio0_status: Register<GPIO0_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO0_STATUS {
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
    public var gpio0_ctrl: Register<GPIO0_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO0_CTRL {
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
    public var gpio1_status: Register<GPIO1_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO1_STATUS {
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
    public var gpio1_ctrl: Register<GPIO1_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO1_CTRL {
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
    public var gpio2_status: Register<GPIO2_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO2_STATUS {
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
    public var gpio2_ctrl: Register<GPIO2_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO2_CTRL {
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
    public var gpio3_status: Register<GPIO3_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO3_STATUS {
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
    public var gpio3_ctrl: Register<GPIO3_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO3_CTRL {
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
    public var gpio4_status: Register<GPIO4_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO4_STATUS {
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
    public var gpio4_ctrl: Register<GPIO4_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO4_CTRL {
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
    public var gpio5_status: Register<GPIO5_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO5_STATUS {
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
    public var gpio5_ctrl: Register<GPIO5_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO5_CTRL {
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
    public var gpio6_status: Register<GPIO6_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO6_STATUS {
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
    @RegisterBank(offset: 0x0034)
    public var gpio6_ctrl: Register<GPIO6_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO6_CTRL {
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
    public var gpio7_status: Register<GPIO7_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO7_STATUS {
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
    @RegisterBank(offset: 0x003c)
    public var gpio7_ctrl: Register<GPIO7_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO7_CTRL {
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
    public var gpio8_status: Register<GPIO8_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO8_STATUS {
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
    @RegisterBank(offset: 0x0044)
    public var gpio8_ctrl: Register<GPIO8_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO8_CTRL {
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
    public var gpio9_status: Register<GPIO9_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO9_STATUS {
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
    @RegisterBank(offset: 0x004c)
    public var gpio9_ctrl: Register<GPIO9_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO9_CTRL {
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
    public var gpio10_status: Register<GPIO10_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO10_STATUS {
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
    @RegisterBank(offset: 0x0054)
    public var gpio10_ctrl: Register<GPIO10_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO10_CTRL {
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
    public var gpio11_status: Register<GPIO11_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO11_STATUS {
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
    @RegisterBank(offset: 0x005c)
    public var gpio11_ctrl: Register<GPIO11_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO11_CTRL {
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
    public var gpio12_status: Register<GPIO12_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO12_STATUS {
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
    @RegisterBank(offset: 0x0064)
    public var gpio12_ctrl: Register<GPIO12_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO12_CTRL {
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
    public var gpio13_status: Register<GPIO13_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO13_STATUS {
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
    @RegisterBank(offset: 0x006c)
    public var gpio13_ctrl: Register<GPIO13_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO13_CTRL {
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
    public var gpio14_status: Register<GPIO14_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO14_STATUS {
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
    @RegisterBank(offset: 0x0074)
    public var gpio14_ctrl: Register<GPIO14_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO14_CTRL {
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
    public var gpio15_status: Register<GPIO15_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO15_STATUS {
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
    @RegisterBank(offset: 0x007c)
    public var gpio15_ctrl: Register<GPIO15_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO15_CTRL {
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
    public var gpio16_status: Register<GPIO16_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO16_STATUS {
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
    @RegisterBank(offset: 0x0084)
    public var gpio16_ctrl: Register<GPIO16_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO16_CTRL {
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
    public var gpio17_status: Register<GPIO17_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO17_STATUS {
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
    @RegisterBank(offset: 0x008c)
    public var gpio17_ctrl: Register<GPIO17_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO17_CTRL {
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
    public var gpio18_status: Register<GPIO18_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO18_STATUS {
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
    @RegisterBank(offset: 0x0094)
    public var gpio18_ctrl: Register<GPIO18_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO18_CTRL {
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
    public var gpio19_status: Register<GPIO19_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO19_STATUS {
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
    @RegisterBank(offset: 0x009c)
    public var gpio19_ctrl: Register<GPIO19_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO19_CTRL {
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
    public var gpio20_status: Register<GPIO20_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO20_STATUS {
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
    @RegisterBank(offset: 0x00a4)
    public var gpio20_ctrl: Register<GPIO20_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO20_CTRL {
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
    public var gpio21_status: Register<GPIO21_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO21_STATUS {
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
    @RegisterBank(offset: 0x00ac)
    public var gpio21_ctrl: Register<GPIO21_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO21_CTRL {
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
    public var gpio22_status: Register<GPIO22_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO22_STATUS {
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
    @RegisterBank(offset: 0x00b4)
    public var gpio22_ctrl: Register<GPIO22_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO22_CTRL {
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
    public var gpio23_status: Register<GPIO23_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO23_STATUS {
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
    @RegisterBank(offset: 0x00bc)
    public var gpio23_ctrl: Register<GPIO23_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO23_CTRL {
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
    public var gpio24_status: Register<GPIO24_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO24_STATUS {
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
    @RegisterBank(offset: 0x00c4)
    public var gpio24_ctrl: Register<GPIO24_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO24_CTRL {
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
    public var gpio25_status: Register<GPIO25_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO25_STATUS {
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
    @RegisterBank(offset: 0x00cc)
    public var gpio25_ctrl: Register<GPIO25_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO25_CTRL {
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
    public var gpio26_status: Register<GPIO26_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO26_STATUS {
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
    @RegisterBank(offset: 0x00d4)
    public var gpio26_ctrl: Register<GPIO26_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO26_CTRL {
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
    public var gpio27_status: Register<GPIO27_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO27_STATUS {
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
    @RegisterBank(offset: 0x00dc)
    public var gpio27_ctrl: Register<GPIO27_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO27_CTRL {
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
    public var gpio28_status: Register<GPIO28_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO28_STATUS {
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
    @RegisterBank(offset: 0x00e4)
    public var gpio28_ctrl: Register<GPIO28_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO28_CTRL {
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
    public var gpio29_status: Register<GPIO29_STATUS>

    @Register(bitWidth: 32)
    public struct GPIO29_STATUS {
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
    @RegisterBank(offset: 0x00ec)
    public var gpio29_ctrl: Register<GPIO29_CTRL>

    @Register(bitWidth: 32)
    public struct GPIO29_CTRL {
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
    public var intr0: Register<INTR0>

    @Register(bitWidth: 32)
    public struct INTR0 {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var gpio7_edge_high: GPIO7_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var gpio7_edge_low: GPIO7_EDGE_LOW_Field

        @ReadOnly(bits: 29..<30, as: Bool.self)
        public var gpio7_level_high: GPIO7_LEVEL_HIGH_Field

        @ReadOnly(bits: 28..<29, as: Bool.self)
        public var gpio7_level_low: GPIO7_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var gpio6_edge_high: GPIO6_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var gpio6_edge_low: GPIO6_EDGE_LOW_Field

        @ReadOnly(bits: 25..<26, as: Bool.self)
        public var gpio6_level_high: GPIO6_LEVEL_HIGH_Field

        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var gpio6_level_low: GPIO6_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio5_edge_high: GPIO5_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio5_edge_low: GPIO5_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var gpio5_level_high: GPIO5_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var gpio5_level_low: GPIO5_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio4_edge_high: GPIO4_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio4_edge_low: GPIO4_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var gpio4_level_high: GPIO4_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var gpio4_level_low: GPIO4_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio3_edge_high: GPIO3_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio3_edge_low: GPIO3_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var gpio3_level_high: GPIO3_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var gpio3_level_low: GPIO3_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio2_edge_high: GPIO2_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio2_edge_low: GPIO2_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var gpio2_level_high: GPIO2_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var gpio2_level_low: GPIO2_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio1_edge_high: GPIO1_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio1_edge_low: GPIO1_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var gpio1_level_high: GPIO1_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var gpio1_level_low: GPIO1_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio0_edge_high: GPIO0_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio0_edge_low: GPIO0_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var gpio0_level_high: GPIO0_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var gpio0_level_low: GPIO0_LEVEL_LOW_Field
    }

    /// Raw Interrupts
    @RegisterBank(offset: 0x00f4)
    public var intr1: Register<INTR1>

    @Register(bitWidth: 32)
    public struct INTR1 {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var gpio15_edge_high: GPIO15_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var gpio15_edge_low: GPIO15_EDGE_LOW_Field

        @ReadOnly(bits: 29..<30, as: Bool.self)
        public var gpio15_level_high: GPIO15_LEVEL_HIGH_Field

        @ReadOnly(bits: 28..<29, as: Bool.self)
        public var gpio15_level_low: GPIO15_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var gpio14_edge_high: GPIO14_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var gpio14_edge_low: GPIO14_EDGE_LOW_Field

        @ReadOnly(bits: 25..<26, as: Bool.self)
        public var gpio14_level_high: GPIO14_LEVEL_HIGH_Field

        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var gpio14_level_low: GPIO14_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio13_edge_high: GPIO13_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio13_edge_low: GPIO13_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var gpio13_level_high: GPIO13_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var gpio13_level_low: GPIO13_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio12_edge_high: GPIO12_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio12_edge_low: GPIO12_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var gpio12_level_high: GPIO12_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var gpio12_level_low: GPIO12_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio11_edge_high: GPIO11_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio11_edge_low: GPIO11_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var gpio11_level_high: GPIO11_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var gpio11_level_low: GPIO11_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio10_edge_high: GPIO10_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio10_edge_low: GPIO10_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var gpio10_level_high: GPIO10_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var gpio10_level_low: GPIO10_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio9_edge_high: GPIO9_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio9_edge_low: GPIO9_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var gpio9_level_high: GPIO9_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var gpio9_level_low: GPIO9_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio8_edge_high: GPIO8_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio8_edge_low: GPIO8_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var gpio8_level_high: GPIO8_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var gpio8_level_low: GPIO8_LEVEL_LOW_Field
    }

    /// Raw Interrupts
    @RegisterBank(offset: 0x00f8)
    public var intr2: Register<INTR2>

    @Register(bitWidth: 32)
    public struct INTR2 {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var gpio23_edge_high: GPIO23_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var gpio23_edge_low: GPIO23_EDGE_LOW_Field

        @ReadOnly(bits: 29..<30, as: Bool.self)
        public var gpio23_level_high: GPIO23_LEVEL_HIGH_Field

        @ReadOnly(bits: 28..<29, as: Bool.self)
        public var gpio23_level_low: GPIO23_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var gpio22_edge_high: GPIO22_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var gpio22_edge_low: GPIO22_EDGE_LOW_Field

        @ReadOnly(bits: 25..<26, as: Bool.self)
        public var gpio22_level_high: GPIO22_LEVEL_HIGH_Field

        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var gpio22_level_low: GPIO22_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio21_edge_high: GPIO21_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio21_edge_low: GPIO21_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var gpio21_level_high: GPIO21_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var gpio21_level_low: GPIO21_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio20_edge_high: GPIO20_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio20_edge_low: GPIO20_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var gpio20_level_high: GPIO20_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var gpio20_level_low: GPIO20_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio19_edge_high: GPIO19_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio19_edge_low: GPIO19_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var gpio19_level_high: GPIO19_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var gpio19_level_low: GPIO19_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio18_edge_high: GPIO18_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio18_edge_low: GPIO18_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var gpio18_level_high: GPIO18_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var gpio18_level_low: GPIO18_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio17_edge_high: GPIO17_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio17_edge_low: GPIO17_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var gpio17_level_high: GPIO17_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var gpio17_level_low: GPIO17_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio16_edge_high: GPIO16_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio16_edge_low: GPIO16_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var gpio16_level_high: GPIO16_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var gpio16_level_low: GPIO16_LEVEL_LOW_Field
    }

    /// Raw Interrupts
    @RegisterBank(offset: 0x00fc)
    public var intr3: Register<INTR3>

    @Register(bitWidth: 32)
    public struct INTR3 {
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio29_edge_high: GPIO29_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio29_edge_low: GPIO29_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var gpio29_level_high: GPIO29_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var gpio29_level_low: GPIO29_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio28_edge_high: GPIO28_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio28_edge_low: GPIO28_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var gpio28_level_high: GPIO28_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var gpio28_level_low: GPIO28_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio27_edge_high: GPIO27_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio27_edge_low: GPIO27_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var gpio27_level_high: GPIO27_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var gpio27_level_low: GPIO27_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio26_edge_high: GPIO26_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio26_edge_low: GPIO26_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var gpio26_level_high: GPIO26_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var gpio26_level_low: GPIO26_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio25_edge_high: GPIO25_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio25_edge_low: GPIO25_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var gpio25_level_high: GPIO25_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var gpio25_level_low: GPIO25_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio24_edge_high: GPIO24_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio24_edge_low: GPIO24_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var gpio24_level_high: GPIO24_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var gpio24_level_low: GPIO24_LEVEL_LOW_Field
    }

    /// Interrupt Enable for proc0
    @RegisterBank(offset: 0x0100)
    public var proc0_inte0: Register<PROC0_INTE0>

    @Register(bitWidth: 32)
    public struct PROC0_INTE0 {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var gpio7_edge_high: GPIO7_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var gpio7_edge_low: GPIO7_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var gpio7_level_high: GPIO7_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var gpio7_level_low: GPIO7_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var gpio6_edge_high: GPIO6_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var gpio6_edge_low: GPIO6_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var gpio6_level_high: GPIO6_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var gpio6_level_low: GPIO6_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio5_edge_high: GPIO5_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio5_edge_low: GPIO5_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var gpio5_level_high: GPIO5_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var gpio5_level_low: GPIO5_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio4_edge_high: GPIO4_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio4_edge_low: GPIO4_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var gpio4_level_high: GPIO4_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var gpio4_level_low: GPIO4_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio3_edge_high: GPIO3_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio3_edge_low: GPIO3_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var gpio3_level_high: GPIO3_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var gpio3_level_low: GPIO3_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio2_edge_high: GPIO2_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio2_edge_low: GPIO2_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var gpio2_level_high: GPIO2_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var gpio2_level_low: GPIO2_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio1_edge_high: GPIO1_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio1_edge_low: GPIO1_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var gpio1_level_high: GPIO1_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var gpio1_level_low: GPIO1_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio0_edge_high: GPIO0_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio0_edge_low: GPIO0_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var gpio0_level_high: GPIO0_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var gpio0_level_low: GPIO0_LEVEL_LOW_Field
    }

    /// Interrupt Enable for proc0
    @RegisterBank(offset: 0x0104)
    public var proc0_inte1: Register<PROC0_INTE1>

    @Register(bitWidth: 32)
    public struct PROC0_INTE1 {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var gpio15_edge_high: GPIO15_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var gpio15_edge_low: GPIO15_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var gpio15_level_high: GPIO15_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var gpio15_level_low: GPIO15_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var gpio14_edge_high: GPIO14_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var gpio14_edge_low: GPIO14_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var gpio14_level_high: GPIO14_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var gpio14_level_low: GPIO14_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio13_edge_high: GPIO13_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio13_edge_low: GPIO13_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var gpio13_level_high: GPIO13_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var gpio13_level_low: GPIO13_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio12_edge_high: GPIO12_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio12_edge_low: GPIO12_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var gpio12_level_high: GPIO12_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var gpio12_level_low: GPIO12_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio11_edge_high: GPIO11_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio11_edge_low: GPIO11_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var gpio11_level_high: GPIO11_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var gpio11_level_low: GPIO11_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio10_edge_high: GPIO10_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio10_edge_low: GPIO10_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var gpio10_level_high: GPIO10_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var gpio10_level_low: GPIO10_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio9_edge_high: GPIO9_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio9_edge_low: GPIO9_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var gpio9_level_high: GPIO9_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var gpio9_level_low: GPIO9_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio8_edge_high: GPIO8_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio8_edge_low: GPIO8_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var gpio8_level_high: GPIO8_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var gpio8_level_low: GPIO8_LEVEL_LOW_Field
    }

    /// Interrupt Enable for proc0
    @RegisterBank(offset: 0x0108)
    public var proc0_inte2: Register<PROC0_INTE2>

    @Register(bitWidth: 32)
    public struct PROC0_INTE2 {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var gpio23_edge_high: GPIO23_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var gpio23_edge_low: GPIO23_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var gpio23_level_high: GPIO23_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var gpio23_level_low: GPIO23_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var gpio22_edge_high: GPIO22_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var gpio22_edge_low: GPIO22_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var gpio22_level_high: GPIO22_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var gpio22_level_low: GPIO22_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio21_edge_high: GPIO21_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio21_edge_low: GPIO21_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var gpio21_level_high: GPIO21_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var gpio21_level_low: GPIO21_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio20_edge_high: GPIO20_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio20_edge_low: GPIO20_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var gpio20_level_high: GPIO20_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var gpio20_level_low: GPIO20_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio19_edge_high: GPIO19_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio19_edge_low: GPIO19_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var gpio19_level_high: GPIO19_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var gpio19_level_low: GPIO19_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio18_edge_high: GPIO18_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio18_edge_low: GPIO18_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var gpio18_level_high: GPIO18_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var gpio18_level_low: GPIO18_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio17_edge_high: GPIO17_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio17_edge_low: GPIO17_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var gpio17_level_high: GPIO17_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var gpio17_level_low: GPIO17_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio16_edge_high: GPIO16_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio16_edge_low: GPIO16_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var gpio16_level_high: GPIO16_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var gpio16_level_low: GPIO16_LEVEL_LOW_Field
    }

    /// Interrupt Enable for proc0
    @RegisterBank(offset: 0x010c)
    public var proc0_inte3: Register<PROC0_INTE3>

    @Register(bitWidth: 32)
    public struct PROC0_INTE3 {
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio29_edge_high: GPIO29_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio29_edge_low: GPIO29_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var gpio29_level_high: GPIO29_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var gpio29_level_low: GPIO29_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio28_edge_high: GPIO28_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio28_edge_low: GPIO28_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var gpio28_level_high: GPIO28_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var gpio28_level_low: GPIO28_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio27_edge_high: GPIO27_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio27_edge_low: GPIO27_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var gpio27_level_high: GPIO27_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var gpio27_level_low: GPIO27_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio26_edge_high: GPIO26_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio26_edge_low: GPIO26_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var gpio26_level_high: GPIO26_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var gpio26_level_low: GPIO26_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio25_edge_high: GPIO25_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio25_edge_low: GPIO25_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var gpio25_level_high: GPIO25_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var gpio25_level_low: GPIO25_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio24_edge_high: GPIO24_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio24_edge_low: GPIO24_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var gpio24_level_high: GPIO24_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var gpio24_level_low: GPIO24_LEVEL_LOW_Field
    }

    /// Interrupt Force for proc0
    @RegisterBank(offset: 0x0110)
    public var proc0_intf0: Register<PROC0_INTF0>

    @Register(bitWidth: 32)
    public struct PROC0_INTF0 {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var gpio7_edge_high: GPIO7_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var gpio7_edge_low: GPIO7_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var gpio7_level_high: GPIO7_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var gpio7_level_low: GPIO7_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var gpio6_edge_high: GPIO6_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var gpio6_edge_low: GPIO6_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var gpio6_level_high: GPIO6_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var gpio6_level_low: GPIO6_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio5_edge_high: GPIO5_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio5_edge_low: GPIO5_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var gpio5_level_high: GPIO5_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var gpio5_level_low: GPIO5_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio4_edge_high: GPIO4_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio4_edge_low: GPIO4_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var gpio4_level_high: GPIO4_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var gpio4_level_low: GPIO4_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio3_edge_high: GPIO3_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio3_edge_low: GPIO3_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var gpio3_level_high: GPIO3_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var gpio3_level_low: GPIO3_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio2_edge_high: GPIO2_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio2_edge_low: GPIO2_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var gpio2_level_high: GPIO2_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var gpio2_level_low: GPIO2_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio1_edge_high: GPIO1_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio1_edge_low: GPIO1_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var gpio1_level_high: GPIO1_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var gpio1_level_low: GPIO1_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio0_edge_high: GPIO0_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio0_edge_low: GPIO0_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var gpio0_level_high: GPIO0_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var gpio0_level_low: GPIO0_LEVEL_LOW_Field
    }

    /// Interrupt Force for proc0
    @RegisterBank(offset: 0x0114)
    public var proc0_intf1: Register<PROC0_INTF1>

    @Register(bitWidth: 32)
    public struct PROC0_INTF1 {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var gpio15_edge_high: GPIO15_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var gpio15_edge_low: GPIO15_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var gpio15_level_high: GPIO15_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var gpio15_level_low: GPIO15_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var gpio14_edge_high: GPIO14_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var gpio14_edge_low: GPIO14_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var gpio14_level_high: GPIO14_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var gpio14_level_low: GPIO14_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio13_edge_high: GPIO13_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio13_edge_low: GPIO13_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var gpio13_level_high: GPIO13_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var gpio13_level_low: GPIO13_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio12_edge_high: GPIO12_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio12_edge_low: GPIO12_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var gpio12_level_high: GPIO12_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var gpio12_level_low: GPIO12_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio11_edge_high: GPIO11_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio11_edge_low: GPIO11_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var gpio11_level_high: GPIO11_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var gpio11_level_low: GPIO11_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio10_edge_high: GPIO10_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio10_edge_low: GPIO10_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var gpio10_level_high: GPIO10_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var gpio10_level_low: GPIO10_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio9_edge_high: GPIO9_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio9_edge_low: GPIO9_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var gpio9_level_high: GPIO9_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var gpio9_level_low: GPIO9_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio8_edge_high: GPIO8_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio8_edge_low: GPIO8_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var gpio8_level_high: GPIO8_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var gpio8_level_low: GPIO8_LEVEL_LOW_Field
    }

    /// Interrupt Force for proc0
    @RegisterBank(offset: 0x0118)
    public var proc0_intf2: Register<PROC0_INTF2>

    @Register(bitWidth: 32)
    public struct PROC0_INTF2 {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var gpio23_edge_high: GPIO23_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var gpio23_edge_low: GPIO23_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var gpio23_level_high: GPIO23_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var gpio23_level_low: GPIO23_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var gpio22_edge_high: GPIO22_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var gpio22_edge_low: GPIO22_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var gpio22_level_high: GPIO22_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var gpio22_level_low: GPIO22_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio21_edge_high: GPIO21_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio21_edge_low: GPIO21_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var gpio21_level_high: GPIO21_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var gpio21_level_low: GPIO21_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio20_edge_high: GPIO20_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio20_edge_low: GPIO20_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var gpio20_level_high: GPIO20_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var gpio20_level_low: GPIO20_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio19_edge_high: GPIO19_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio19_edge_low: GPIO19_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var gpio19_level_high: GPIO19_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var gpio19_level_low: GPIO19_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio18_edge_high: GPIO18_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio18_edge_low: GPIO18_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var gpio18_level_high: GPIO18_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var gpio18_level_low: GPIO18_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio17_edge_high: GPIO17_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio17_edge_low: GPIO17_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var gpio17_level_high: GPIO17_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var gpio17_level_low: GPIO17_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio16_edge_high: GPIO16_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio16_edge_low: GPIO16_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var gpio16_level_high: GPIO16_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var gpio16_level_low: GPIO16_LEVEL_LOW_Field
    }

    /// Interrupt Force for proc0
    @RegisterBank(offset: 0x011c)
    public var proc0_intf3: Register<PROC0_INTF3>

    @Register(bitWidth: 32)
    public struct PROC0_INTF3 {
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio29_edge_high: GPIO29_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio29_edge_low: GPIO29_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var gpio29_level_high: GPIO29_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var gpio29_level_low: GPIO29_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio28_edge_high: GPIO28_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio28_edge_low: GPIO28_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var gpio28_level_high: GPIO28_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var gpio28_level_low: GPIO28_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio27_edge_high: GPIO27_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio27_edge_low: GPIO27_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var gpio27_level_high: GPIO27_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var gpio27_level_low: GPIO27_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio26_edge_high: GPIO26_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio26_edge_low: GPIO26_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var gpio26_level_high: GPIO26_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var gpio26_level_low: GPIO26_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio25_edge_high: GPIO25_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio25_edge_low: GPIO25_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var gpio25_level_high: GPIO25_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var gpio25_level_low: GPIO25_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio24_edge_high: GPIO24_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio24_edge_low: GPIO24_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var gpio24_level_high: GPIO24_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var gpio24_level_low: GPIO24_LEVEL_LOW_Field
    }

    /// Interrupt status after masking & forcing for proc0
    @RegisterBank(offset: 0x0120)
    public var proc0_ints0: Register<PROC0_INTS0>

    @Register(bitWidth: 32)
    public struct PROC0_INTS0 {
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var gpio7_edge_high: GPIO7_EDGE_HIGH_Field

        @ReadOnly(bits: 30..<31, as: Bool.self)
        public var gpio7_edge_low: GPIO7_EDGE_LOW_Field

        @ReadOnly(bits: 29..<30, as: Bool.self)
        public var gpio7_level_high: GPIO7_LEVEL_HIGH_Field

        @ReadOnly(bits: 28..<29, as: Bool.self)
        public var gpio7_level_low: GPIO7_LEVEL_LOW_Field

        @ReadOnly(bits: 27..<28, as: Bool.self)
        public var gpio6_edge_high: GPIO6_EDGE_HIGH_Field

        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var gpio6_edge_low: GPIO6_EDGE_LOW_Field

        @ReadOnly(bits: 25..<26, as: Bool.self)
        public var gpio6_level_high: GPIO6_LEVEL_HIGH_Field

        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var gpio6_level_low: GPIO6_LEVEL_LOW_Field

        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var gpio5_edge_high: GPIO5_EDGE_HIGH_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var gpio5_edge_low: GPIO5_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var gpio5_level_high: GPIO5_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var gpio5_level_low: GPIO5_LEVEL_LOW_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var gpio4_edge_high: GPIO4_EDGE_HIGH_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var gpio4_edge_low: GPIO4_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var gpio4_level_high: GPIO4_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var gpio4_level_low: GPIO4_LEVEL_LOW_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var gpio3_edge_high: GPIO3_EDGE_HIGH_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var gpio3_edge_low: GPIO3_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var gpio3_level_high: GPIO3_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var gpio3_level_low: GPIO3_LEVEL_LOW_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var gpio2_edge_high: GPIO2_EDGE_HIGH_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var gpio2_edge_low: GPIO2_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var gpio2_level_high: GPIO2_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var gpio2_level_low: GPIO2_LEVEL_LOW_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var gpio1_edge_high: GPIO1_EDGE_HIGH_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var gpio1_edge_low: GPIO1_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var gpio1_level_high: GPIO1_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var gpio1_level_low: GPIO1_LEVEL_LOW_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var gpio0_edge_high: GPIO0_EDGE_HIGH_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var gpio0_edge_low: GPIO0_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var gpio0_level_high: GPIO0_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var gpio0_level_low: GPIO0_LEVEL_LOW_Field
    }

    /// Interrupt status after masking & forcing for proc0
    @RegisterBank(offset: 0x0124)
    public var proc0_ints1: Register<PROC0_INTS1>

    @Register(bitWidth: 32)
    public struct PROC0_INTS1 {
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var gpio15_edge_high: GPIO15_EDGE_HIGH_Field

        @ReadOnly(bits: 30..<31, as: Bool.self)
        public var gpio15_edge_low: GPIO15_EDGE_LOW_Field

        @ReadOnly(bits: 29..<30, as: Bool.self)
        public var gpio15_level_high: GPIO15_LEVEL_HIGH_Field

        @ReadOnly(bits: 28..<29, as: Bool.self)
        public var gpio15_level_low: GPIO15_LEVEL_LOW_Field

        @ReadOnly(bits: 27..<28, as: Bool.self)
        public var gpio14_edge_high: GPIO14_EDGE_HIGH_Field

        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var gpio14_edge_low: GPIO14_EDGE_LOW_Field

        @ReadOnly(bits: 25..<26, as: Bool.self)
        public var gpio14_level_high: GPIO14_LEVEL_HIGH_Field

        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var gpio14_level_low: GPIO14_LEVEL_LOW_Field

        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var gpio13_edge_high: GPIO13_EDGE_HIGH_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var gpio13_edge_low: GPIO13_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var gpio13_level_high: GPIO13_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var gpio13_level_low: GPIO13_LEVEL_LOW_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var gpio12_edge_high: GPIO12_EDGE_HIGH_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var gpio12_edge_low: GPIO12_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var gpio12_level_high: GPIO12_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var gpio12_level_low: GPIO12_LEVEL_LOW_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var gpio11_edge_high: GPIO11_EDGE_HIGH_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var gpio11_edge_low: GPIO11_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var gpio11_level_high: GPIO11_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var gpio11_level_low: GPIO11_LEVEL_LOW_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var gpio10_edge_high: GPIO10_EDGE_HIGH_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var gpio10_edge_low: GPIO10_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var gpio10_level_high: GPIO10_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var gpio10_level_low: GPIO10_LEVEL_LOW_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var gpio9_edge_high: GPIO9_EDGE_HIGH_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var gpio9_edge_low: GPIO9_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var gpio9_level_high: GPIO9_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var gpio9_level_low: GPIO9_LEVEL_LOW_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var gpio8_edge_high: GPIO8_EDGE_HIGH_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var gpio8_edge_low: GPIO8_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var gpio8_level_high: GPIO8_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var gpio8_level_low: GPIO8_LEVEL_LOW_Field
    }

    /// Interrupt status after masking & forcing for proc0
    @RegisterBank(offset: 0x0128)
    public var proc0_ints2: Register<PROC0_INTS2>

    @Register(bitWidth: 32)
    public struct PROC0_INTS2 {
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var gpio23_edge_high: GPIO23_EDGE_HIGH_Field

        @ReadOnly(bits: 30..<31, as: Bool.self)
        public var gpio23_edge_low: GPIO23_EDGE_LOW_Field

        @ReadOnly(bits: 29..<30, as: Bool.self)
        public var gpio23_level_high: GPIO23_LEVEL_HIGH_Field

        @ReadOnly(bits: 28..<29, as: Bool.self)
        public var gpio23_level_low: GPIO23_LEVEL_LOW_Field

        @ReadOnly(bits: 27..<28, as: Bool.self)
        public var gpio22_edge_high: GPIO22_EDGE_HIGH_Field

        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var gpio22_edge_low: GPIO22_EDGE_LOW_Field

        @ReadOnly(bits: 25..<26, as: Bool.self)
        public var gpio22_level_high: GPIO22_LEVEL_HIGH_Field

        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var gpio22_level_low: GPIO22_LEVEL_LOW_Field

        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var gpio21_edge_high: GPIO21_EDGE_HIGH_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var gpio21_edge_low: GPIO21_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var gpio21_level_high: GPIO21_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var gpio21_level_low: GPIO21_LEVEL_LOW_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var gpio20_edge_high: GPIO20_EDGE_HIGH_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var gpio20_edge_low: GPIO20_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var gpio20_level_high: GPIO20_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var gpio20_level_low: GPIO20_LEVEL_LOW_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var gpio19_edge_high: GPIO19_EDGE_HIGH_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var gpio19_edge_low: GPIO19_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var gpio19_level_high: GPIO19_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var gpio19_level_low: GPIO19_LEVEL_LOW_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var gpio18_edge_high: GPIO18_EDGE_HIGH_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var gpio18_edge_low: GPIO18_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var gpio18_level_high: GPIO18_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var gpio18_level_low: GPIO18_LEVEL_LOW_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var gpio17_edge_high: GPIO17_EDGE_HIGH_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var gpio17_edge_low: GPIO17_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var gpio17_level_high: GPIO17_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var gpio17_level_low: GPIO17_LEVEL_LOW_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var gpio16_edge_high: GPIO16_EDGE_HIGH_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var gpio16_edge_low: GPIO16_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var gpio16_level_high: GPIO16_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var gpio16_level_low: GPIO16_LEVEL_LOW_Field
    }

    /// Interrupt status after masking & forcing for proc0
    @RegisterBank(offset: 0x012c)
    public var proc0_ints3: Register<PROC0_INTS3>

    @Register(bitWidth: 32)
    public struct PROC0_INTS3 {
        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var gpio29_edge_high: GPIO29_EDGE_HIGH_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var gpio29_edge_low: GPIO29_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var gpio29_level_high: GPIO29_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var gpio29_level_low: GPIO29_LEVEL_LOW_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var gpio28_edge_high: GPIO28_EDGE_HIGH_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var gpio28_edge_low: GPIO28_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var gpio28_level_high: GPIO28_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var gpio28_level_low: GPIO28_LEVEL_LOW_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var gpio27_edge_high: GPIO27_EDGE_HIGH_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var gpio27_edge_low: GPIO27_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var gpio27_level_high: GPIO27_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var gpio27_level_low: GPIO27_LEVEL_LOW_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var gpio26_edge_high: GPIO26_EDGE_HIGH_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var gpio26_edge_low: GPIO26_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var gpio26_level_high: GPIO26_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var gpio26_level_low: GPIO26_LEVEL_LOW_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var gpio25_edge_high: GPIO25_EDGE_HIGH_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var gpio25_edge_low: GPIO25_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var gpio25_level_high: GPIO25_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var gpio25_level_low: GPIO25_LEVEL_LOW_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var gpio24_edge_high: GPIO24_EDGE_HIGH_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var gpio24_edge_low: GPIO24_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var gpio24_level_high: GPIO24_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var gpio24_level_low: GPIO24_LEVEL_LOW_Field
    }

    /// Interrupt Enable for proc1
    @RegisterBank(offset: 0x0130)
    public var proc1_inte0: Register<PROC1_INTE0>

    @Register(bitWidth: 32)
    public struct PROC1_INTE0 {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var gpio7_edge_high: GPIO7_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var gpio7_edge_low: GPIO7_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var gpio7_level_high: GPIO7_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var gpio7_level_low: GPIO7_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var gpio6_edge_high: GPIO6_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var gpio6_edge_low: GPIO6_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var gpio6_level_high: GPIO6_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var gpio6_level_low: GPIO6_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio5_edge_high: GPIO5_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio5_edge_low: GPIO5_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var gpio5_level_high: GPIO5_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var gpio5_level_low: GPIO5_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio4_edge_high: GPIO4_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio4_edge_low: GPIO4_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var gpio4_level_high: GPIO4_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var gpio4_level_low: GPIO4_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio3_edge_high: GPIO3_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio3_edge_low: GPIO3_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var gpio3_level_high: GPIO3_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var gpio3_level_low: GPIO3_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio2_edge_high: GPIO2_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio2_edge_low: GPIO2_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var gpio2_level_high: GPIO2_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var gpio2_level_low: GPIO2_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio1_edge_high: GPIO1_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio1_edge_low: GPIO1_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var gpio1_level_high: GPIO1_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var gpio1_level_low: GPIO1_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio0_edge_high: GPIO0_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio0_edge_low: GPIO0_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var gpio0_level_high: GPIO0_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var gpio0_level_low: GPIO0_LEVEL_LOW_Field
    }

    /// Interrupt Enable for proc1
    @RegisterBank(offset: 0x0134)
    public var proc1_inte1: Register<PROC1_INTE1>

    @Register(bitWidth: 32)
    public struct PROC1_INTE1 {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var gpio15_edge_high: GPIO15_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var gpio15_edge_low: GPIO15_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var gpio15_level_high: GPIO15_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var gpio15_level_low: GPIO15_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var gpio14_edge_high: GPIO14_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var gpio14_edge_low: GPIO14_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var gpio14_level_high: GPIO14_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var gpio14_level_low: GPIO14_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio13_edge_high: GPIO13_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio13_edge_low: GPIO13_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var gpio13_level_high: GPIO13_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var gpio13_level_low: GPIO13_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio12_edge_high: GPIO12_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio12_edge_low: GPIO12_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var gpio12_level_high: GPIO12_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var gpio12_level_low: GPIO12_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio11_edge_high: GPIO11_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio11_edge_low: GPIO11_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var gpio11_level_high: GPIO11_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var gpio11_level_low: GPIO11_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio10_edge_high: GPIO10_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio10_edge_low: GPIO10_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var gpio10_level_high: GPIO10_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var gpio10_level_low: GPIO10_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio9_edge_high: GPIO9_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio9_edge_low: GPIO9_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var gpio9_level_high: GPIO9_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var gpio9_level_low: GPIO9_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio8_edge_high: GPIO8_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio8_edge_low: GPIO8_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var gpio8_level_high: GPIO8_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var gpio8_level_low: GPIO8_LEVEL_LOW_Field
    }

    /// Interrupt Enable for proc1
    @RegisterBank(offset: 0x0138)
    public var proc1_inte2: Register<PROC1_INTE2>

    @Register(bitWidth: 32)
    public struct PROC1_INTE2 {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var gpio23_edge_high: GPIO23_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var gpio23_edge_low: GPIO23_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var gpio23_level_high: GPIO23_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var gpio23_level_low: GPIO23_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var gpio22_edge_high: GPIO22_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var gpio22_edge_low: GPIO22_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var gpio22_level_high: GPIO22_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var gpio22_level_low: GPIO22_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio21_edge_high: GPIO21_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio21_edge_low: GPIO21_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var gpio21_level_high: GPIO21_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var gpio21_level_low: GPIO21_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio20_edge_high: GPIO20_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio20_edge_low: GPIO20_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var gpio20_level_high: GPIO20_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var gpio20_level_low: GPIO20_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio19_edge_high: GPIO19_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio19_edge_low: GPIO19_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var gpio19_level_high: GPIO19_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var gpio19_level_low: GPIO19_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio18_edge_high: GPIO18_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio18_edge_low: GPIO18_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var gpio18_level_high: GPIO18_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var gpio18_level_low: GPIO18_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio17_edge_high: GPIO17_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio17_edge_low: GPIO17_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var gpio17_level_high: GPIO17_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var gpio17_level_low: GPIO17_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio16_edge_high: GPIO16_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio16_edge_low: GPIO16_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var gpio16_level_high: GPIO16_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var gpio16_level_low: GPIO16_LEVEL_LOW_Field
    }

    /// Interrupt Enable for proc1
    @RegisterBank(offset: 0x013c)
    public var proc1_inte3: Register<PROC1_INTE3>

    @Register(bitWidth: 32)
    public struct PROC1_INTE3 {
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio29_edge_high: GPIO29_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio29_edge_low: GPIO29_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var gpio29_level_high: GPIO29_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var gpio29_level_low: GPIO29_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio28_edge_high: GPIO28_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio28_edge_low: GPIO28_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var gpio28_level_high: GPIO28_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var gpio28_level_low: GPIO28_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio27_edge_high: GPIO27_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio27_edge_low: GPIO27_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var gpio27_level_high: GPIO27_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var gpio27_level_low: GPIO27_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio26_edge_high: GPIO26_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio26_edge_low: GPIO26_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var gpio26_level_high: GPIO26_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var gpio26_level_low: GPIO26_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio25_edge_high: GPIO25_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio25_edge_low: GPIO25_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var gpio25_level_high: GPIO25_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var gpio25_level_low: GPIO25_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio24_edge_high: GPIO24_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio24_edge_low: GPIO24_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var gpio24_level_high: GPIO24_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var gpio24_level_low: GPIO24_LEVEL_LOW_Field
    }

    /// Interrupt Force for proc1
    @RegisterBank(offset: 0x0140)
    public var proc1_intf0: Register<PROC1_INTF0>

    @Register(bitWidth: 32)
    public struct PROC1_INTF0 {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var gpio7_edge_high: GPIO7_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var gpio7_edge_low: GPIO7_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var gpio7_level_high: GPIO7_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var gpio7_level_low: GPIO7_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var gpio6_edge_high: GPIO6_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var gpio6_edge_low: GPIO6_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var gpio6_level_high: GPIO6_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var gpio6_level_low: GPIO6_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio5_edge_high: GPIO5_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio5_edge_low: GPIO5_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var gpio5_level_high: GPIO5_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var gpio5_level_low: GPIO5_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio4_edge_high: GPIO4_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio4_edge_low: GPIO4_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var gpio4_level_high: GPIO4_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var gpio4_level_low: GPIO4_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio3_edge_high: GPIO3_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio3_edge_low: GPIO3_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var gpio3_level_high: GPIO3_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var gpio3_level_low: GPIO3_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio2_edge_high: GPIO2_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio2_edge_low: GPIO2_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var gpio2_level_high: GPIO2_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var gpio2_level_low: GPIO2_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio1_edge_high: GPIO1_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio1_edge_low: GPIO1_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var gpio1_level_high: GPIO1_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var gpio1_level_low: GPIO1_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio0_edge_high: GPIO0_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio0_edge_low: GPIO0_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var gpio0_level_high: GPIO0_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var gpio0_level_low: GPIO0_LEVEL_LOW_Field
    }

    /// Interrupt Force for proc1
    @RegisterBank(offset: 0x0144)
    public var proc1_intf1: Register<PROC1_INTF1>

    @Register(bitWidth: 32)
    public struct PROC1_INTF1 {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var gpio15_edge_high: GPIO15_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var gpio15_edge_low: GPIO15_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var gpio15_level_high: GPIO15_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var gpio15_level_low: GPIO15_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var gpio14_edge_high: GPIO14_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var gpio14_edge_low: GPIO14_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var gpio14_level_high: GPIO14_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var gpio14_level_low: GPIO14_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio13_edge_high: GPIO13_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio13_edge_low: GPIO13_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var gpio13_level_high: GPIO13_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var gpio13_level_low: GPIO13_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio12_edge_high: GPIO12_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio12_edge_low: GPIO12_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var gpio12_level_high: GPIO12_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var gpio12_level_low: GPIO12_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio11_edge_high: GPIO11_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio11_edge_low: GPIO11_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var gpio11_level_high: GPIO11_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var gpio11_level_low: GPIO11_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio10_edge_high: GPIO10_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio10_edge_low: GPIO10_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var gpio10_level_high: GPIO10_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var gpio10_level_low: GPIO10_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio9_edge_high: GPIO9_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio9_edge_low: GPIO9_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var gpio9_level_high: GPIO9_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var gpio9_level_low: GPIO9_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio8_edge_high: GPIO8_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio8_edge_low: GPIO8_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var gpio8_level_high: GPIO8_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var gpio8_level_low: GPIO8_LEVEL_LOW_Field
    }

    /// Interrupt Force for proc1
    @RegisterBank(offset: 0x0148)
    public var proc1_intf2: Register<PROC1_INTF2>

    @Register(bitWidth: 32)
    public struct PROC1_INTF2 {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var gpio23_edge_high: GPIO23_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var gpio23_edge_low: GPIO23_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var gpio23_level_high: GPIO23_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var gpio23_level_low: GPIO23_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var gpio22_edge_high: GPIO22_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var gpio22_edge_low: GPIO22_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var gpio22_level_high: GPIO22_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var gpio22_level_low: GPIO22_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio21_edge_high: GPIO21_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio21_edge_low: GPIO21_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var gpio21_level_high: GPIO21_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var gpio21_level_low: GPIO21_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio20_edge_high: GPIO20_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio20_edge_low: GPIO20_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var gpio20_level_high: GPIO20_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var gpio20_level_low: GPIO20_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio19_edge_high: GPIO19_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio19_edge_low: GPIO19_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var gpio19_level_high: GPIO19_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var gpio19_level_low: GPIO19_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio18_edge_high: GPIO18_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio18_edge_low: GPIO18_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var gpio18_level_high: GPIO18_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var gpio18_level_low: GPIO18_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio17_edge_high: GPIO17_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio17_edge_low: GPIO17_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var gpio17_level_high: GPIO17_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var gpio17_level_low: GPIO17_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio16_edge_high: GPIO16_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio16_edge_low: GPIO16_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var gpio16_level_high: GPIO16_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var gpio16_level_low: GPIO16_LEVEL_LOW_Field
    }

    /// Interrupt Force for proc1
    @RegisterBank(offset: 0x014c)
    public var proc1_intf3: Register<PROC1_INTF3>

    @Register(bitWidth: 32)
    public struct PROC1_INTF3 {
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio29_edge_high: GPIO29_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio29_edge_low: GPIO29_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var gpio29_level_high: GPIO29_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var gpio29_level_low: GPIO29_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio28_edge_high: GPIO28_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio28_edge_low: GPIO28_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var gpio28_level_high: GPIO28_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var gpio28_level_low: GPIO28_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio27_edge_high: GPIO27_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio27_edge_low: GPIO27_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var gpio27_level_high: GPIO27_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var gpio27_level_low: GPIO27_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio26_edge_high: GPIO26_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio26_edge_low: GPIO26_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var gpio26_level_high: GPIO26_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var gpio26_level_low: GPIO26_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio25_edge_high: GPIO25_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio25_edge_low: GPIO25_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var gpio25_level_high: GPIO25_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var gpio25_level_low: GPIO25_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio24_edge_high: GPIO24_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio24_edge_low: GPIO24_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var gpio24_level_high: GPIO24_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var gpio24_level_low: GPIO24_LEVEL_LOW_Field
    }

    /// Interrupt status after masking & forcing for proc1
    @RegisterBank(offset: 0x0150)
    public var proc1_ints0: Register<PROC1_INTS0>

    @Register(bitWidth: 32)
    public struct PROC1_INTS0 {
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var gpio7_edge_high: GPIO7_EDGE_HIGH_Field

        @ReadOnly(bits: 30..<31, as: Bool.self)
        public var gpio7_edge_low: GPIO7_EDGE_LOW_Field

        @ReadOnly(bits: 29..<30, as: Bool.self)
        public var gpio7_level_high: GPIO7_LEVEL_HIGH_Field

        @ReadOnly(bits: 28..<29, as: Bool.self)
        public var gpio7_level_low: GPIO7_LEVEL_LOW_Field

        @ReadOnly(bits: 27..<28, as: Bool.self)
        public var gpio6_edge_high: GPIO6_EDGE_HIGH_Field

        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var gpio6_edge_low: GPIO6_EDGE_LOW_Field

        @ReadOnly(bits: 25..<26, as: Bool.self)
        public var gpio6_level_high: GPIO6_LEVEL_HIGH_Field

        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var gpio6_level_low: GPIO6_LEVEL_LOW_Field

        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var gpio5_edge_high: GPIO5_EDGE_HIGH_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var gpio5_edge_low: GPIO5_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var gpio5_level_high: GPIO5_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var gpio5_level_low: GPIO5_LEVEL_LOW_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var gpio4_edge_high: GPIO4_EDGE_HIGH_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var gpio4_edge_low: GPIO4_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var gpio4_level_high: GPIO4_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var gpio4_level_low: GPIO4_LEVEL_LOW_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var gpio3_edge_high: GPIO3_EDGE_HIGH_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var gpio3_edge_low: GPIO3_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var gpio3_level_high: GPIO3_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var gpio3_level_low: GPIO3_LEVEL_LOW_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var gpio2_edge_high: GPIO2_EDGE_HIGH_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var gpio2_edge_low: GPIO2_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var gpio2_level_high: GPIO2_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var gpio2_level_low: GPIO2_LEVEL_LOW_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var gpio1_edge_high: GPIO1_EDGE_HIGH_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var gpio1_edge_low: GPIO1_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var gpio1_level_high: GPIO1_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var gpio1_level_low: GPIO1_LEVEL_LOW_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var gpio0_edge_high: GPIO0_EDGE_HIGH_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var gpio0_edge_low: GPIO0_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var gpio0_level_high: GPIO0_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var gpio0_level_low: GPIO0_LEVEL_LOW_Field
    }

    /// Interrupt status after masking & forcing for proc1
    @RegisterBank(offset: 0x0154)
    public var proc1_ints1: Register<PROC1_INTS1>

    @Register(bitWidth: 32)
    public struct PROC1_INTS1 {
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var gpio15_edge_high: GPIO15_EDGE_HIGH_Field

        @ReadOnly(bits: 30..<31, as: Bool.self)
        public var gpio15_edge_low: GPIO15_EDGE_LOW_Field

        @ReadOnly(bits: 29..<30, as: Bool.self)
        public var gpio15_level_high: GPIO15_LEVEL_HIGH_Field

        @ReadOnly(bits: 28..<29, as: Bool.self)
        public var gpio15_level_low: GPIO15_LEVEL_LOW_Field

        @ReadOnly(bits: 27..<28, as: Bool.self)
        public var gpio14_edge_high: GPIO14_EDGE_HIGH_Field

        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var gpio14_edge_low: GPIO14_EDGE_LOW_Field

        @ReadOnly(bits: 25..<26, as: Bool.self)
        public var gpio14_level_high: GPIO14_LEVEL_HIGH_Field

        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var gpio14_level_low: GPIO14_LEVEL_LOW_Field

        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var gpio13_edge_high: GPIO13_EDGE_HIGH_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var gpio13_edge_low: GPIO13_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var gpio13_level_high: GPIO13_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var gpio13_level_low: GPIO13_LEVEL_LOW_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var gpio12_edge_high: GPIO12_EDGE_HIGH_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var gpio12_edge_low: GPIO12_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var gpio12_level_high: GPIO12_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var gpio12_level_low: GPIO12_LEVEL_LOW_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var gpio11_edge_high: GPIO11_EDGE_HIGH_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var gpio11_edge_low: GPIO11_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var gpio11_level_high: GPIO11_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var gpio11_level_low: GPIO11_LEVEL_LOW_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var gpio10_edge_high: GPIO10_EDGE_HIGH_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var gpio10_edge_low: GPIO10_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var gpio10_level_high: GPIO10_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var gpio10_level_low: GPIO10_LEVEL_LOW_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var gpio9_edge_high: GPIO9_EDGE_HIGH_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var gpio9_edge_low: GPIO9_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var gpio9_level_high: GPIO9_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var gpio9_level_low: GPIO9_LEVEL_LOW_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var gpio8_edge_high: GPIO8_EDGE_HIGH_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var gpio8_edge_low: GPIO8_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var gpio8_level_high: GPIO8_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var gpio8_level_low: GPIO8_LEVEL_LOW_Field
    }

    /// Interrupt status after masking & forcing for proc1
    @RegisterBank(offset: 0x0158)
    public var proc1_ints2: Register<PROC1_INTS2>

    @Register(bitWidth: 32)
    public struct PROC1_INTS2 {
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var gpio23_edge_high: GPIO23_EDGE_HIGH_Field

        @ReadOnly(bits: 30..<31, as: Bool.self)
        public var gpio23_edge_low: GPIO23_EDGE_LOW_Field

        @ReadOnly(bits: 29..<30, as: Bool.self)
        public var gpio23_level_high: GPIO23_LEVEL_HIGH_Field

        @ReadOnly(bits: 28..<29, as: Bool.self)
        public var gpio23_level_low: GPIO23_LEVEL_LOW_Field

        @ReadOnly(bits: 27..<28, as: Bool.self)
        public var gpio22_edge_high: GPIO22_EDGE_HIGH_Field

        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var gpio22_edge_low: GPIO22_EDGE_LOW_Field

        @ReadOnly(bits: 25..<26, as: Bool.self)
        public var gpio22_level_high: GPIO22_LEVEL_HIGH_Field

        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var gpio22_level_low: GPIO22_LEVEL_LOW_Field

        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var gpio21_edge_high: GPIO21_EDGE_HIGH_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var gpio21_edge_low: GPIO21_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var gpio21_level_high: GPIO21_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var gpio21_level_low: GPIO21_LEVEL_LOW_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var gpio20_edge_high: GPIO20_EDGE_HIGH_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var gpio20_edge_low: GPIO20_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var gpio20_level_high: GPIO20_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var gpio20_level_low: GPIO20_LEVEL_LOW_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var gpio19_edge_high: GPIO19_EDGE_HIGH_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var gpio19_edge_low: GPIO19_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var gpio19_level_high: GPIO19_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var gpio19_level_low: GPIO19_LEVEL_LOW_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var gpio18_edge_high: GPIO18_EDGE_HIGH_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var gpio18_edge_low: GPIO18_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var gpio18_level_high: GPIO18_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var gpio18_level_low: GPIO18_LEVEL_LOW_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var gpio17_edge_high: GPIO17_EDGE_HIGH_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var gpio17_edge_low: GPIO17_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var gpio17_level_high: GPIO17_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var gpio17_level_low: GPIO17_LEVEL_LOW_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var gpio16_edge_high: GPIO16_EDGE_HIGH_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var gpio16_edge_low: GPIO16_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var gpio16_level_high: GPIO16_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var gpio16_level_low: GPIO16_LEVEL_LOW_Field
    }

    /// Interrupt status after masking & forcing for proc1
    @RegisterBank(offset: 0x015c)
    public var proc1_ints3: Register<PROC1_INTS3>

    @Register(bitWidth: 32)
    public struct PROC1_INTS3 {
        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var gpio29_edge_high: GPIO29_EDGE_HIGH_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var gpio29_edge_low: GPIO29_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var gpio29_level_high: GPIO29_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var gpio29_level_low: GPIO29_LEVEL_LOW_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var gpio28_edge_high: GPIO28_EDGE_HIGH_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var gpio28_edge_low: GPIO28_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var gpio28_level_high: GPIO28_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var gpio28_level_low: GPIO28_LEVEL_LOW_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var gpio27_edge_high: GPIO27_EDGE_HIGH_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var gpio27_edge_low: GPIO27_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var gpio27_level_high: GPIO27_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var gpio27_level_low: GPIO27_LEVEL_LOW_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var gpio26_edge_high: GPIO26_EDGE_HIGH_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var gpio26_edge_low: GPIO26_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var gpio26_level_high: GPIO26_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var gpio26_level_low: GPIO26_LEVEL_LOW_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var gpio25_edge_high: GPIO25_EDGE_HIGH_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var gpio25_edge_low: GPIO25_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var gpio25_level_high: GPIO25_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var gpio25_level_low: GPIO25_LEVEL_LOW_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var gpio24_edge_high: GPIO24_EDGE_HIGH_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var gpio24_edge_low: GPIO24_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var gpio24_level_high: GPIO24_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var gpio24_level_low: GPIO24_LEVEL_LOW_Field
    }

    /// Interrupt Enable for dormant_wake
    @RegisterBank(offset: 0x0160)
    public var dormant_wake_inte0: Register<DORMANT_WAKE_INTE0>

    @Register(bitWidth: 32)
    public struct DORMANT_WAKE_INTE0 {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var gpio7_edge_high: GPIO7_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var gpio7_edge_low: GPIO7_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var gpio7_level_high: GPIO7_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var gpio7_level_low: GPIO7_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var gpio6_edge_high: GPIO6_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var gpio6_edge_low: GPIO6_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var gpio6_level_high: GPIO6_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var gpio6_level_low: GPIO6_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio5_edge_high: GPIO5_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio5_edge_low: GPIO5_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var gpio5_level_high: GPIO5_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var gpio5_level_low: GPIO5_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio4_edge_high: GPIO4_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio4_edge_low: GPIO4_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var gpio4_level_high: GPIO4_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var gpio4_level_low: GPIO4_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio3_edge_high: GPIO3_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio3_edge_low: GPIO3_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var gpio3_level_high: GPIO3_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var gpio3_level_low: GPIO3_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio2_edge_high: GPIO2_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio2_edge_low: GPIO2_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var gpio2_level_high: GPIO2_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var gpio2_level_low: GPIO2_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio1_edge_high: GPIO1_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio1_edge_low: GPIO1_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var gpio1_level_high: GPIO1_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var gpio1_level_low: GPIO1_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio0_edge_high: GPIO0_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio0_edge_low: GPIO0_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var gpio0_level_high: GPIO0_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var gpio0_level_low: GPIO0_LEVEL_LOW_Field
    }

    /// Interrupt Enable for dormant_wake
    @RegisterBank(offset: 0x0164)
    public var dormant_wake_inte1: Register<DORMANT_WAKE_INTE1>

    @Register(bitWidth: 32)
    public struct DORMANT_WAKE_INTE1 {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var gpio15_edge_high: GPIO15_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var gpio15_edge_low: GPIO15_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var gpio15_level_high: GPIO15_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var gpio15_level_low: GPIO15_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var gpio14_edge_high: GPIO14_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var gpio14_edge_low: GPIO14_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var gpio14_level_high: GPIO14_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var gpio14_level_low: GPIO14_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio13_edge_high: GPIO13_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio13_edge_low: GPIO13_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var gpio13_level_high: GPIO13_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var gpio13_level_low: GPIO13_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio12_edge_high: GPIO12_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio12_edge_low: GPIO12_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var gpio12_level_high: GPIO12_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var gpio12_level_low: GPIO12_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio11_edge_high: GPIO11_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio11_edge_low: GPIO11_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var gpio11_level_high: GPIO11_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var gpio11_level_low: GPIO11_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio10_edge_high: GPIO10_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio10_edge_low: GPIO10_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var gpio10_level_high: GPIO10_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var gpio10_level_low: GPIO10_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio9_edge_high: GPIO9_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio9_edge_low: GPIO9_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var gpio9_level_high: GPIO9_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var gpio9_level_low: GPIO9_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio8_edge_high: GPIO8_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio8_edge_low: GPIO8_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var gpio8_level_high: GPIO8_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var gpio8_level_low: GPIO8_LEVEL_LOW_Field
    }

    /// Interrupt Enable for dormant_wake
    @RegisterBank(offset: 0x0168)
    public var dormant_wake_inte2: Register<DORMANT_WAKE_INTE2>

    @Register(bitWidth: 32)
    public struct DORMANT_WAKE_INTE2 {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var gpio23_edge_high: GPIO23_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var gpio23_edge_low: GPIO23_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var gpio23_level_high: GPIO23_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var gpio23_level_low: GPIO23_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var gpio22_edge_high: GPIO22_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var gpio22_edge_low: GPIO22_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var gpio22_level_high: GPIO22_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var gpio22_level_low: GPIO22_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio21_edge_high: GPIO21_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio21_edge_low: GPIO21_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var gpio21_level_high: GPIO21_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var gpio21_level_low: GPIO21_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio20_edge_high: GPIO20_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio20_edge_low: GPIO20_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var gpio20_level_high: GPIO20_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var gpio20_level_low: GPIO20_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio19_edge_high: GPIO19_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio19_edge_low: GPIO19_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var gpio19_level_high: GPIO19_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var gpio19_level_low: GPIO19_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio18_edge_high: GPIO18_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio18_edge_low: GPIO18_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var gpio18_level_high: GPIO18_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var gpio18_level_low: GPIO18_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio17_edge_high: GPIO17_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio17_edge_low: GPIO17_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var gpio17_level_high: GPIO17_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var gpio17_level_low: GPIO17_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio16_edge_high: GPIO16_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio16_edge_low: GPIO16_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var gpio16_level_high: GPIO16_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var gpio16_level_low: GPIO16_LEVEL_LOW_Field
    }

    /// Interrupt Enable for dormant_wake
    @RegisterBank(offset: 0x016c)
    public var dormant_wake_inte3: Register<DORMANT_WAKE_INTE3>

    @Register(bitWidth: 32)
    public struct DORMANT_WAKE_INTE3 {
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio29_edge_high: GPIO29_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio29_edge_low: GPIO29_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var gpio29_level_high: GPIO29_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var gpio29_level_low: GPIO29_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio28_edge_high: GPIO28_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio28_edge_low: GPIO28_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var gpio28_level_high: GPIO28_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var gpio28_level_low: GPIO28_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio27_edge_high: GPIO27_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio27_edge_low: GPIO27_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var gpio27_level_high: GPIO27_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var gpio27_level_low: GPIO27_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio26_edge_high: GPIO26_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio26_edge_low: GPIO26_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var gpio26_level_high: GPIO26_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var gpio26_level_low: GPIO26_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio25_edge_high: GPIO25_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio25_edge_low: GPIO25_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var gpio25_level_high: GPIO25_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var gpio25_level_low: GPIO25_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio24_edge_high: GPIO24_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio24_edge_low: GPIO24_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var gpio24_level_high: GPIO24_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var gpio24_level_low: GPIO24_LEVEL_LOW_Field
    }

    /// Interrupt Force for dormant_wake
    @RegisterBank(offset: 0x0170)
    public var dormant_wake_intf0: Register<DORMANT_WAKE_INTF0>

    @Register(bitWidth: 32)
    public struct DORMANT_WAKE_INTF0 {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var gpio7_edge_high: GPIO7_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var gpio7_edge_low: GPIO7_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var gpio7_level_high: GPIO7_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var gpio7_level_low: GPIO7_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var gpio6_edge_high: GPIO6_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var gpio6_edge_low: GPIO6_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var gpio6_level_high: GPIO6_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var gpio6_level_low: GPIO6_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio5_edge_high: GPIO5_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio5_edge_low: GPIO5_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var gpio5_level_high: GPIO5_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var gpio5_level_low: GPIO5_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio4_edge_high: GPIO4_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio4_edge_low: GPIO4_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var gpio4_level_high: GPIO4_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var gpio4_level_low: GPIO4_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio3_edge_high: GPIO3_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio3_edge_low: GPIO3_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var gpio3_level_high: GPIO3_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var gpio3_level_low: GPIO3_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio2_edge_high: GPIO2_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio2_edge_low: GPIO2_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var gpio2_level_high: GPIO2_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var gpio2_level_low: GPIO2_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio1_edge_high: GPIO1_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio1_edge_low: GPIO1_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var gpio1_level_high: GPIO1_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var gpio1_level_low: GPIO1_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio0_edge_high: GPIO0_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio0_edge_low: GPIO0_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var gpio0_level_high: GPIO0_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var gpio0_level_low: GPIO0_LEVEL_LOW_Field
    }

    /// Interrupt Force for dormant_wake
    @RegisterBank(offset: 0x0174)
    public var dormant_wake_intf1: Register<DORMANT_WAKE_INTF1>

    @Register(bitWidth: 32)
    public struct DORMANT_WAKE_INTF1 {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var gpio15_edge_high: GPIO15_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var gpio15_edge_low: GPIO15_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var gpio15_level_high: GPIO15_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var gpio15_level_low: GPIO15_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var gpio14_edge_high: GPIO14_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var gpio14_edge_low: GPIO14_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var gpio14_level_high: GPIO14_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var gpio14_level_low: GPIO14_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio13_edge_high: GPIO13_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio13_edge_low: GPIO13_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var gpio13_level_high: GPIO13_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var gpio13_level_low: GPIO13_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio12_edge_high: GPIO12_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio12_edge_low: GPIO12_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var gpio12_level_high: GPIO12_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var gpio12_level_low: GPIO12_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio11_edge_high: GPIO11_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio11_edge_low: GPIO11_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var gpio11_level_high: GPIO11_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var gpio11_level_low: GPIO11_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio10_edge_high: GPIO10_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio10_edge_low: GPIO10_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var gpio10_level_high: GPIO10_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var gpio10_level_low: GPIO10_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio9_edge_high: GPIO9_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio9_edge_low: GPIO9_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var gpio9_level_high: GPIO9_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var gpio9_level_low: GPIO9_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio8_edge_high: GPIO8_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio8_edge_low: GPIO8_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var gpio8_level_high: GPIO8_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var gpio8_level_low: GPIO8_LEVEL_LOW_Field
    }

    /// Interrupt Force for dormant_wake
    @RegisterBank(offset: 0x0178)
    public var dormant_wake_intf2: Register<DORMANT_WAKE_INTF2>

    @Register(bitWidth: 32)
    public struct DORMANT_WAKE_INTF2 {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var gpio23_edge_high: GPIO23_EDGE_HIGH_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var gpio23_edge_low: GPIO23_EDGE_LOW_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var gpio23_level_high: GPIO23_LEVEL_HIGH_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var gpio23_level_low: GPIO23_LEVEL_LOW_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var gpio22_edge_high: GPIO22_EDGE_HIGH_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var gpio22_edge_low: GPIO22_EDGE_LOW_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var gpio22_level_high: GPIO22_LEVEL_HIGH_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var gpio22_level_low: GPIO22_LEVEL_LOW_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio21_edge_high: GPIO21_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio21_edge_low: GPIO21_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var gpio21_level_high: GPIO21_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var gpio21_level_low: GPIO21_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio20_edge_high: GPIO20_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio20_edge_low: GPIO20_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var gpio20_level_high: GPIO20_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var gpio20_level_low: GPIO20_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio19_edge_high: GPIO19_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio19_edge_low: GPIO19_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var gpio19_level_high: GPIO19_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var gpio19_level_low: GPIO19_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio18_edge_high: GPIO18_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio18_edge_low: GPIO18_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var gpio18_level_high: GPIO18_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var gpio18_level_low: GPIO18_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio17_edge_high: GPIO17_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio17_edge_low: GPIO17_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var gpio17_level_high: GPIO17_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var gpio17_level_low: GPIO17_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio16_edge_high: GPIO16_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio16_edge_low: GPIO16_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var gpio16_level_high: GPIO16_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var gpio16_level_low: GPIO16_LEVEL_LOW_Field
    }

    /// Interrupt Force for dormant_wake
    @RegisterBank(offset: 0x017c)
    public var dormant_wake_intf3: Register<DORMANT_WAKE_INTF3>

    @Register(bitWidth: 32)
    public struct DORMANT_WAKE_INTF3 {
        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var gpio29_edge_high: GPIO29_EDGE_HIGH_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var gpio29_edge_low: GPIO29_EDGE_LOW_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var gpio29_level_high: GPIO29_LEVEL_HIGH_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var gpio29_level_low: GPIO29_LEVEL_LOW_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var gpio28_edge_high: GPIO28_EDGE_HIGH_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var gpio28_edge_low: GPIO28_EDGE_LOW_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var gpio28_level_high: GPIO28_LEVEL_HIGH_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var gpio28_level_low: GPIO28_LEVEL_LOW_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var gpio27_edge_high: GPIO27_EDGE_HIGH_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var gpio27_edge_low: GPIO27_EDGE_LOW_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var gpio27_level_high: GPIO27_LEVEL_HIGH_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var gpio27_level_low: GPIO27_LEVEL_LOW_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var gpio26_edge_high: GPIO26_EDGE_HIGH_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var gpio26_edge_low: GPIO26_EDGE_LOW_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var gpio26_level_high: GPIO26_LEVEL_HIGH_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var gpio26_level_low: GPIO26_LEVEL_LOW_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var gpio25_edge_high: GPIO25_EDGE_HIGH_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var gpio25_edge_low: GPIO25_EDGE_LOW_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var gpio25_level_high: GPIO25_LEVEL_HIGH_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var gpio25_level_low: GPIO25_LEVEL_LOW_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var gpio24_edge_high: GPIO24_EDGE_HIGH_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var gpio24_edge_low: GPIO24_EDGE_LOW_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var gpio24_level_high: GPIO24_LEVEL_HIGH_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var gpio24_level_low: GPIO24_LEVEL_LOW_Field
    }

    /// Interrupt status after masking & forcing for dormant_wake
    @RegisterBank(offset: 0x0180)
    public var dormant_wake_ints0: Register<DORMANT_WAKE_INTS0>

    @Register(bitWidth: 32)
    public struct DORMANT_WAKE_INTS0 {
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var gpio7_edge_high: GPIO7_EDGE_HIGH_Field

        @ReadOnly(bits: 30..<31, as: Bool.self)
        public var gpio7_edge_low: GPIO7_EDGE_LOW_Field

        @ReadOnly(bits: 29..<30, as: Bool.self)
        public var gpio7_level_high: GPIO7_LEVEL_HIGH_Field

        @ReadOnly(bits: 28..<29, as: Bool.self)
        public var gpio7_level_low: GPIO7_LEVEL_LOW_Field

        @ReadOnly(bits: 27..<28, as: Bool.self)
        public var gpio6_edge_high: GPIO6_EDGE_HIGH_Field

        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var gpio6_edge_low: GPIO6_EDGE_LOW_Field

        @ReadOnly(bits: 25..<26, as: Bool.self)
        public var gpio6_level_high: GPIO6_LEVEL_HIGH_Field

        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var gpio6_level_low: GPIO6_LEVEL_LOW_Field

        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var gpio5_edge_high: GPIO5_EDGE_HIGH_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var gpio5_edge_low: GPIO5_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var gpio5_level_high: GPIO5_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var gpio5_level_low: GPIO5_LEVEL_LOW_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var gpio4_edge_high: GPIO4_EDGE_HIGH_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var gpio4_edge_low: GPIO4_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var gpio4_level_high: GPIO4_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var gpio4_level_low: GPIO4_LEVEL_LOW_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var gpio3_edge_high: GPIO3_EDGE_HIGH_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var gpio3_edge_low: GPIO3_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var gpio3_level_high: GPIO3_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var gpio3_level_low: GPIO3_LEVEL_LOW_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var gpio2_edge_high: GPIO2_EDGE_HIGH_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var gpio2_edge_low: GPIO2_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var gpio2_level_high: GPIO2_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var gpio2_level_low: GPIO2_LEVEL_LOW_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var gpio1_edge_high: GPIO1_EDGE_HIGH_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var gpio1_edge_low: GPIO1_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var gpio1_level_high: GPIO1_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var gpio1_level_low: GPIO1_LEVEL_LOW_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var gpio0_edge_high: GPIO0_EDGE_HIGH_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var gpio0_edge_low: GPIO0_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var gpio0_level_high: GPIO0_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var gpio0_level_low: GPIO0_LEVEL_LOW_Field
    }

    /// Interrupt status after masking & forcing for dormant_wake
    @RegisterBank(offset: 0x0184)
    public var dormant_wake_ints1: Register<DORMANT_WAKE_INTS1>

    @Register(bitWidth: 32)
    public struct DORMANT_WAKE_INTS1 {
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var gpio15_edge_high: GPIO15_EDGE_HIGH_Field

        @ReadOnly(bits: 30..<31, as: Bool.self)
        public var gpio15_edge_low: GPIO15_EDGE_LOW_Field

        @ReadOnly(bits: 29..<30, as: Bool.self)
        public var gpio15_level_high: GPIO15_LEVEL_HIGH_Field

        @ReadOnly(bits: 28..<29, as: Bool.self)
        public var gpio15_level_low: GPIO15_LEVEL_LOW_Field

        @ReadOnly(bits: 27..<28, as: Bool.self)
        public var gpio14_edge_high: GPIO14_EDGE_HIGH_Field

        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var gpio14_edge_low: GPIO14_EDGE_LOW_Field

        @ReadOnly(bits: 25..<26, as: Bool.self)
        public var gpio14_level_high: GPIO14_LEVEL_HIGH_Field

        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var gpio14_level_low: GPIO14_LEVEL_LOW_Field

        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var gpio13_edge_high: GPIO13_EDGE_HIGH_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var gpio13_edge_low: GPIO13_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var gpio13_level_high: GPIO13_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var gpio13_level_low: GPIO13_LEVEL_LOW_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var gpio12_edge_high: GPIO12_EDGE_HIGH_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var gpio12_edge_low: GPIO12_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var gpio12_level_high: GPIO12_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var gpio12_level_low: GPIO12_LEVEL_LOW_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var gpio11_edge_high: GPIO11_EDGE_HIGH_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var gpio11_edge_low: GPIO11_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var gpio11_level_high: GPIO11_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var gpio11_level_low: GPIO11_LEVEL_LOW_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var gpio10_edge_high: GPIO10_EDGE_HIGH_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var gpio10_edge_low: GPIO10_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var gpio10_level_high: GPIO10_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var gpio10_level_low: GPIO10_LEVEL_LOW_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var gpio9_edge_high: GPIO9_EDGE_HIGH_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var gpio9_edge_low: GPIO9_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var gpio9_level_high: GPIO9_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var gpio9_level_low: GPIO9_LEVEL_LOW_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var gpio8_edge_high: GPIO8_EDGE_HIGH_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var gpio8_edge_low: GPIO8_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var gpio8_level_high: GPIO8_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var gpio8_level_low: GPIO8_LEVEL_LOW_Field
    }

    /// Interrupt status after masking & forcing for dormant_wake
    @RegisterBank(offset: 0x0188)
    public var dormant_wake_ints2: Register<DORMANT_WAKE_INTS2>

    @Register(bitWidth: 32)
    public struct DORMANT_WAKE_INTS2 {
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var gpio23_edge_high: GPIO23_EDGE_HIGH_Field

        @ReadOnly(bits: 30..<31, as: Bool.self)
        public var gpio23_edge_low: GPIO23_EDGE_LOW_Field

        @ReadOnly(bits: 29..<30, as: Bool.self)
        public var gpio23_level_high: GPIO23_LEVEL_HIGH_Field

        @ReadOnly(bits: 28..<29, as: Bool.self)
        public var gpio23_level_low: GPIO23_LEVEL_LOW_Field

        @ReadOnly(bits: 27..<28, as: Bool.self)
        public var gpio22_edge_high: GPIO22_EDGE_HIGH_Field

        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var gpio22_edge_low: GPIO22_EDGE_LOW_Field

        @ReadOnly(bits: 25..<26, as: Bool.self)
        public var gpio22_level_high: GPIO22_LEVEL_HIGH_Field

        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var gpio22_level_low: GPIO22_LEVEL_LOW_Field

        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var gpio21_edge_high: GPIO21_EDGE_HIGH_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var gpio21_edge_low: GPIO21_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var gpio21_level_high: GPIO21_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var gpio21_level_low: GPIO21_LEVEL_LOW_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var gpio20_edge_high: GPIO20_EDGE_HIGH_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var gpio20_edge_low: GPIO20_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var gpio20_level_high: GPIO20_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var gpio20_level_low: GPIO20_LEVEL_LOW_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var gpio19_edge_high: GPIO19_EDGE_HIGH_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var gpio19_edge_low: GPIO19_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var gpio19_level_high: GPIO19_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var gpio19_level_low: GPIO19_LEVEL_LOW_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var gpio18_edge_high: GPIO18_EDGE_HIGH_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var gpio18_edge_low: GPIO18_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var gpio18_level_high: GPIO18_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var gpio18_level_low: GPIO18_LEVEL_LOW_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var gpio17_edge_high: GPIO17_EDGE_HIGH_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var gpio17_edge_low: GPIO17_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var gpio17_level_high: GPIO17_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var gpio17_level_low: GPIO17_LEVEL_LOW_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var gpio16_edge_high: GPIO16_EDGE_HIGH_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var gpio16_edge_low: GPIO16_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var gpio16_level_high: GPIO16_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var gpio16_level_low: GPIO16_LEVEL_LOW_Field
    }

    /// Interrupt status after masking & forcing for dormant_wake
    @RegisterBank(offset: 0x018c)
    public var dormant_wake_ints3: Register<DORMANT_WAKE_INTS3>

    @Register(bitWidth: 32)
    public struct DORMANT_WAKE_INTS3 {
        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var gpio29_edge_high: GPIO29_EDGE_HIGH_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var gpio29_edge_low: GPIO29_EDGE_LOW_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var gpio29_level_high: GPIO29_LEVEL_HIGH_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var gpio29_level_low: GPIO29_LEVEL_LOW_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var gpio28_edge_high: GPIO28_EDGE_HIGH_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var gpio28_edge_low: GPIO28_EDGE_LOW_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var gpio28_level_high: GPIO28_LEVEL_HIGH_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var gpio28_level_low: GPIO28_LEVEL_LOW_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var gpio27_edge_high: GPIO27_EDGE_HIGH_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var gpio27_edge_low: GPIO27_EDGE_LOW_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var gpio27_level_high: GPIO27_LEVEL_HIGH_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var gpio27_level_low: GPIO27_LEVEL_LOW_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var gpio26_edge_high: GPIO26_EDGE_HIGH_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var gpio26_edge_low: GPIO26_EDGE_LOW_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var gpio26_level_high: GPIO26_LEVEL_HIGH_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var gpio26_level_low: GPIO26_LEVEL_LOW_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var gpio25_edge_high: GPIO25_EDGE_HIGH_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var gpio25_edge_low: GPIO25_EDGE_LOW_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var gpio25_level_high: GPIO25_LEVEL_HIGH_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var gpio25_level_low: GPIO25_LEVEL_LOW_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var gpio24_edge_high: GPIO24_EDGE_HIGH_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var gpio24_edge_low: GPIO24_EDGE_LOW_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var gpio24_level_high: GPIO24_LEVEL_HIGH_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var gpio24_level_low: GPIO24_LEVEL_LOW_Field
    }
}
