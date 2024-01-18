import MMIO
import MMIOExtensions

@RegisterBank
public struct RESETS {

    public static var `default`: Self { .init(unsafeAddress: 0x4000c000) }

    /// Reset control. If a bit is set it means the peripheral is in reset. 0 means the peripheral's reset is deasserted.
    @RegisterBank(offset: 0x0000)
    public var reset: Register<RESET>

    @Register(bitWidth: 32)
    public struct RESET {
        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var usbctrl: usbctrl_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var uart1: uart1_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var uart0: uart0_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var timer: timer_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var tbman: tbman_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var sysinfo: sysinfo_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var syscfg: syscfg_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var spi1: spi1_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var spi0: spi0_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var rtc: rtc_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var pwm: pwm_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pll_usb: pll_usb_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var pll_sys: pll_sys_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var pio1: pio1_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var pio0: pio0_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var pads_qspi: pads_qspi_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var pads_bank0: pads_bank0_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var jtag: jtag_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var io_qspi: io_qspi_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var io_bank0: io_bank0_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var i2c1: i2c1_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var i2c0: i2c0_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var dma: dma_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var busctrl: busctrl_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var adc: adc_Field
    }

    /// Watchdog select. If a bit is set then the watchdog will reset this peripheral when the watchdog fires.
    @RegisterBank(offset: 0x0004)
    public var wdsel: Register<WDSEL>

    @Register(bitWidth: 32)
    public struct WDSEL {
        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var usbctrl: usbctrl_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var uart1: uart1_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var uart0: uart0_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var timer: timer_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var tbman: tbman_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var sysinfo: sysinfo_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var syscfg: syscfg_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var spi1: spi1_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var spi0: spi0_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var rtc: rtc_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var pwm: pwm_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pll_usb: pll_usb_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var pll_sys: pll_sys_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var pio1: pio1_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var pio0: pio0_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var pads_qspi: pads_qspi_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var pads_bank0: pads_bank0_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var jtag: jtag_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var io_qspi: io_qspi_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var io_bank0: io_bank0_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var i2c1: i2c1_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var i2c0: i2c0_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var dma: dma_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var busctrl: busctrl_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var adc: adc_Field
    }

    /// Reset done. If a bit is set then a reset done signal has been returned by the peripheral. This indicates that the peripheral's registers are ready to be accessed.
    @RegisterBank(offset: 0x0008)
    public var reset_done: Register<RESET_DONE>

    @Register(bitWidth: 32)
    public struct RESET_DONE {
        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var usbctrl: usbctrl_Field

        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var uart1: uart1_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var uart0: uart0_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var timer: timer_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var tbman: tbman_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var sysinfo: sysinfo_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var syscfg: syscfg_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var spi1: spi1_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var spi0: spi0_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var rtc: rtc_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var pwm: pwm_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var pll_usb: pll_usb_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var pll_sys: pll_sys_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var pio1: pio1_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var pio0: pio0_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var pads_qspi: pads_qspi_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var pads_bank0: pads_bank0_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var jtag: jtag_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var io_qspi: io_qspi_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var io_bank0: io_bank0_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var i2c1: i2c1_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var i2c0: i2c0_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var dma: dma_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var busctrl: busctrl_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var adc: adc_Field
    }
}