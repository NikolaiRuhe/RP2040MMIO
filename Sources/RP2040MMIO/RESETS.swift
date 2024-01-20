import MMIO
import MMIOExtensions
public struct RESETS {

    public static var `default`: Self { .init(unsafeAddress: 0x4000c000) }

    /// Reset control. If a bit is set it means the peripheral is in reset. 0 means the peripheral's reset is deasserted.
    public var RESET: Register<RESET_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0000), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0000))
          #endif
        }
    }
    public struct RESET_Descriptor {
        @available(*, unavailable)
        public var usbctrl: usbctrl_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var uart1: uart1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var uart0: uart0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var timer: timer_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var tbman: tbman_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var sysinfo: sysinfo_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var syscfg: syscfg_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var spi1: spi1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var spi0: spi0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var rtc: rtc_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var pwm: pwm_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var pll_usb: pll_usb_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var pll_sys: pll_sys_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var pio1: pio1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var pio0: pio0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var pads_qspi: pads_qspi_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var pads_bank0: pads_bank0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var jtag: jtag_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var io_qspi: io_qspi_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var io_bank0: io_bank0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var i2c1: i2c1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var i2c0: i2c0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var dma: dma_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var busctrl: busctrl_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var adc: adc_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum usbctrl_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum uart1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum uart0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum timer_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum tbman_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum sysinfo_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum syscfg_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum spi1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum spi0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum rtc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum pwm_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum pll_usb_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum pll_sys_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum pio1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum pio0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum pads_qspi_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum pads_bank0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum jtag_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum io_qspi_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum io_bank0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum i2c1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum i2c0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum dma_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum busctrl_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum adc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = RESET_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var usbctrl: UInt32 {
                @inlinable @inline(__always) get {
                    usbctrl_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    usbctrl_Field.insert(newValue, into: &self.storage)
                }
                }
              public var uart1: UInt32 {
                @inlinable @inline(__always) get {
                  uart1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  uart1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var uart0: UInt32 {
                @inlinable @inline(__always) get {
                  uart0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  uart0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var timer: UInt32 {
                @inlinable @inline(__always) get {
                  timer_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  timer_Field.insert(newValue, into: &self.storage)
                }
              }
              public var tbman: UInt32 {
                @inlinable @inline(__always) get {
                  tbman_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  tbman_Field.insert(newValue, into: &self.storage)
                }
              }
              public var sysinfo: UInt32 {
                @inlinable @inline(__always) get {
                  sysinfo_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  sysinfo_Field.insert(newValue, into: &self.storage)
                }
              }
              public var syscfg: UInt32 {
                @inlinable @inline(__always) get {
                  syscfg_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  syscfg_Field.insert(newValue, into: &self.storage)
                }
              }
              public var spi1: UInt32 {
                @inlinable @inline(__always) get {
                  spi1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  spi1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var spi0: UInt32 {
                @inlinable @inline(__always) get {
                  spi0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  spi0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var rtc: UInt32 {
                @inlinable @inline(__always) get {
                  rtc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  rtc_Field.insert(newValue, into: &self.storage)
                }
              }
              public var pwm: UInt32 {
                @inlinable @inline(__always) get {
                  pwm_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  pwm_Field.insert(newValue, into: &self.storage)
                }
              }
              public var pll_usb: UInt32 {
                @inlinable @inline(__always) get {
                  pll_usb_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  pll_usb_Field.insert(newValue, into: &self.storage)
                }
              }
              public var pll_sys: UInt32 {
                @inlinable @inline(__always) get {
                  pll_sys_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  pll_sys_Field.insert(newValue, into: &self.storage)
                }
              }
              public var pio1: UInt32 {
                @inlinable @inline(__always) get {
                  pio1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  pio1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var pio0: UInt32 {
                @inlinable @inline(__always) get {
                  pio0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  pio0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var pads_qspi: UInt32 {
                @inlinable @inline(__always) get {
                  pads_qspi_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  pads_qspi_Field.insert(newValue, into: &self.storage)
                }
              }
              public var pads_bank0: UInt32 {
                @inlinable @inline(__always) get {
                  pads_bank0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  pads_bank0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var jtag: UInt32 {
                @inlinable @inline(__always) get {
                  jtag_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  jtag_Field.insert(newValue, into: &self.storage)
                }
              }
              public var io_qspi: UInt32 {
                @inlinable @inline(__always) get {
                  io_qspi_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  io_qspi_Field.insert(newValue, into: &self.storage)
                }
              }
              public var io_bank0: UInt32 {
                @inlinable @inline(__always) get {
                  io_bank0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  io_bank0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var i2c1: UInt32 {
                @inlinable @inline(__always) get {
                  i2c1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  i2c1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var i2c0: UInt32 {
                @inlinable @inline(__always) get {
                  i2c0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  i2c0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var dma: UInt32 {
                @inlinable @inline(__always) get {
                  dma_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  dma_Field.insert(newValue, into: &self.storage)
                }
              }
              public var busctrl: UInt32 {
                @inlinable @inline(__always) get {
                  busctrl_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  busctrl_Field.insert(newValue, into: &self.storage)
                }
              }
              public var adc: UInt32 {
                @inlinable @inline(__always) get {
                  adc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  adc_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = RESET_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var usbctrl: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(usbctrl_Field.self, Bool.self)
                    return Bool(storage: self.raw.usbctrl)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(usbctrl_Field.self, Bool.self)
                    self.raw.usbctrl = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var uart1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(uart1_Field.self, Bool.self)
                  return Bool(storage: self.raw.uart1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(uart1_Field.self, Bool.self)
                  self.raw.uart1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var uart0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(uart0_Field.self, Bool.self)
                  return Bool(storage: self.raw.uart0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(uart0_Field.self, Bool.self)
                  self.raw.uart0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var timer: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(timer_Field.self, Bool.self)
                  return Bool(storage: self.raw.timer)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(timer_Field.self, Bool.self)
                  self.raw.timer = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var tbman: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(tbman_Field.self, Bool.self)
                  return Bool(storage: self.raw.tbman)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(tbman_Field.self, Bool.self)
                  self.raw.tbman = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var sysinfo: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(sysinfo_Field.self, Bool.self)
                  return Bool(storage: self.raw.sysinfo)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(sysinfo_Field.self, Bool.self)
                  self.raw.sysinfo = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var syscfg: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(syscfg_Field.self, Bool.self)
                  return Bool(storage: self.raw.syscfg)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(syscfg_Field.self, Bool.self)
                  self.raw.syscfg = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var spi1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(spi1_Field.self, Bool.self)
                  return Bool(storage: self.raw.spi1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(spi1_Field.self, Bool.self)
                  self.raw.spi1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var spi0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(spi0_Field.self, Bool.self)
                  return Bool(storage: self.raw.spi0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(spi0_Field.self, Bool.self)
                  self.raw.spi0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var rtc: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(rtc_Field.self, Bool.self)
                  return Bool(storage: self.raw.rtc)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(rtc_Field.self, Bool.self)
                  self.raw.rtc = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var pwm: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(pwm_Field.self, Bool.self)
                  return Bool(storage: self.raw.pwm)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(pwm_Field.self, Bool.self)
                  self.raw.pwm = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var pll_usb: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(pll_usb_Field.self, Bool.self)
                  return Bool(storage: self.raw.pll_usb)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(pll_usb_Field.self, Bool.self)
                  self.raw.pll_usb = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var pll_sys: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(pll_sys_Field.self, Bool.self)
                  return Bool(storage: self.raw.pll_sys)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(pll_sys_Field.self, Bool.self)
                  self.raw.pll_sys = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var pio1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(pio1_Field.self, Bool.self)
                  return Bool(storage: self.raw.pio1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(pio1_Field.self, Bool.self)
                  self.raw.pio1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var pio0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(pio0_Field.self, Bool.self)
                  return Bool(storage: self.raw.pio0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(pio0_Field.self, Bool.self)
                  self.raw.pio0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var pads_qspi: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(pads_qspi_Field.self, Bool.self)
                  return Bool(storage: self.raw.pads_qspi)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(pads_qspi_Field.self, Bool.self)
                  self.raw.pads_qspi = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var pads_bank0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(pads_bank0_Field.self, Bool.self)
                  return Bool(storage: self.raw.pads_bank0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(pads_bank0_Field.self, Bool.self)
                  self.raw.pads_bank0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var jtag: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(jtag_Field.self, Bool.self)
                  return Bool(storage: self.raw.jtag)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(jtag_Field.self, Bool.self)
                  self.raw.jtag = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var io_qspi: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(io_qspi_Field.self, Bool.self)
                  return Bool(storage: self.raw.io_qspi)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(io_qspi_Field.self, Bool.self)
                  self.raw.io_qspi = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var io_bank0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(io_bank0_Field.self, Bool.self)
                  return Bool(storage: self.raw.io_bank0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(io_bank0_Field.self, Bool.self)
                  self.raw.io_bank0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var i2c1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(i2c1_Field.self, Bool.self)
                  return Bool(storage: self.raw.i2c1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(i2c1_Field.self, Bool.self)
                  self.raw.i2c1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var i2c0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(i2c0_Field.self, Bool.self)
                  return Bool(storage: self.raw.i2c0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(i2c0_Field.self, Bool.self)
                  self.raw.i2c0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var dma: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(dma_Field.self, Bool.self)
                  return Bool(storage: self.raw.dma)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(dma_Field.self, Bool.self)
                  self.raw.dma = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var busctrl: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(busctrl_Field.self, Bool.self)
                  return Bool(storage: self.raw.busctrl)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(busctrl_Field.self, Bool.self)
                  self.raw.busctrl = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var adc: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(adc_Field.self, Bool.self)
                  return Bool(storage: self.raw.adc)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(adc_Field.self, Bool.self)
                  self.raw.adc = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Watchdog select. If a bit is set then the watchdog will reset this peripheral when the watchdog fires.
    public var WDSEL: Register<WDSEL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0004), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0004))
          #endif
        }
    }
    public struct WDSEL_Descriptor {
        @available(*, unavailable)
        public var usbctrl: usbctrl_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var uart1: uart1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var uart0: uart0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var timer: timer_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var tbman: tbman_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var sysinfo: sysinfo_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var syscfg: syscfg_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var spi1: spi1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var spi0: spi0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var rtc: rtc_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var pwm: pwm_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var pll_usb: pll_usb_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var pll_sys: pll_sys_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var pio1: pio1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var pio0: pio0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var pads_qspi: pads_qspi_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var pads_bank0: pads_bank0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var jtag: jtag_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var io_qspi: io_qspi_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var io_bank0: io_bank0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var i2c1: i2c1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var i2c0: i2c0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var dma: dma_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var busctrl: busctrl_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var adc: adc_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum usbctrl_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum uart1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum uart0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum timer_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum tbman_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum sysinfo_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum syscfg_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum spi1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum spi0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum rtc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum pwm_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum pll_usb_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum pll_sys_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum pio1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum pio0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum pads_qspi_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum pads_bank0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum jtag_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum io_qspi_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum io_bank0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum i2c1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum i2c0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum dma_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum busctrl_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum adc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = WDSEL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var usbctrl: UInt32 {
                @inlinable @inline(__always) get {
                    usbctrl_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    usbctrl_Field.insert(newValue, into: &self.storage)
                }
                }
              public var uart1: UInt32 {
                @inlinable @inline(__always) get {
                  uart1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  uart1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var uart0: UInt32 {
                @inlinable @inline(__always) get {
                  uart0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  uart0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var timer: UInt32 {
                @inlinable @inline(__always) get {
                  timer_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  timer_Field.insert(newValue, into: &self.storage)
                }
              }
              public var tbman: UInt32 {
                @inlinable @inline(__always) get {
                  tbman_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  tbman_Field.insert(newValue, into: &self.storage)
                }
              }
              public var sysinfo: UInt32 {
                @inlinable @inline(__always) get {
                  sysinfo_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  sysinfo_Field.insert(newValue, into: &self.storage)
                }
              }
              public var syscfg: UInt32 {
                @inlinable @inline(__always) get {
                  syscfg_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  syscfg_Field.insert(newValue, into: &self.storage)
                }
              }
              public var spi1: UInt32 {
                @inlinable @inline(__always) get {
                  spi1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  spi1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var spi0: UInt32 {
                @inlinable @inline(__always) get {
                  spi0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  spi0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var rtc: UInt32 {
                @inlinable @inline(__always) get {
                  rtc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  rtc_Field.insert(newValue, into: &self.storage)
                }
              }
              public var pwm: UInt32 {
                @inlinable @inline(__always) get {
                  pwm_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  pwm_Field.insert(newValue, into: &self.storage)
                }
              }
              public var pll_usb: UInt32 {
                @inlinable @inline(__always) get {
                  pll_usb_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  pll_usb_Field.insert(newValue, into: &self.storage)
                }
              }
              public var pll_sys: UInt32 {
                @inlinable @inline(__always) get {
                  pll_sys_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  pll_sys_Field.insert(newValue, into: &self.storage)
                }
              }
              public var pio1: UInt32 {
                @inlinable @inline(__always) get {
                  pio1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  pio1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var pio0: UInt32 {
                @inlinable @inline(__always) get {
                  pio0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  pio0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var pads_qspi: UInt32 {
                @inlinable @inline(__always) get {
                  pads_qspi_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  pads_qspi_Field.insert(newValue, into: &self.storage)
                }
              }
              public var pads_bank0: UInt32 {
                @inlinable @inline(__always) get {
                  pads_bank0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  pads_bank0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var jtag: UInt32 {
                @inlinable @inline(__always) get {
                  jtag_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  jtag_Field.insert(newValue, into: &self.storage)
                }
              }
              public var io_qspi: UInt32 {
                @inlinable @inline(__always) get {
                  io_qspi_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  io_qspi_Field.insert(newValue, into: &self.storage)
                }
              }
              public var io_bank0: UInt32 {
                @inlinable @inline(__always) get {
                  io_bank0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  io_bank0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var i2c1: UInt32 {
                @inlinable @inline(__always) get {
                  i2c1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  i2c1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var i2c0: UInt32 {
                @inlinable @inline(__always) get {
                  i2c0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  i2c0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var dma: UInt32 {
                @inlinable @inline(__always) get {
                  dma_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  dma_Field.insert(newValue, into: &self.storage)
                }
              }
              public var busctrl: UInt32 {
                @inlinable @inline(__always) get {
                  busctrl_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  busctrl_Field.insert(newValue, into: &self.storage)
                }
              }
              public var adc: UInt32 {
                @inlinable @inline(__always) get {
                  adc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  adc_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = WDSEL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var usbctrl: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(usbctrl_Field.self, Bool.self)
                    return Bool(storage: self.raw.usbctrl)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(usbctrl_Field.self, Bool.self)
                    self.raw.usbctrl = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var uart1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(uart1_Field.self, Bool.self)
                  return Bool(storage: self.raw.uart1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(uart1_Field.self, Bool.self)
                  self.raw.uart1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var uart0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(uart0_Field.self, Bool.self)
                  return Bool(storage: self.raw.uart0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(uart0_Field.self, Bool.self)
                  self.raw.uart0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var timer: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(timer_Field.self, Bool.self)
                  return Bool(storage: self.raw.timer)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(timer_Field.self, Bool.self)
                  self.raw.timer = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var tbman: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(tbman_Field.self, Bool.self)
                  return Bool(storage: self.raw.tbman)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(tbman_Field.self, Bool.self)
                  self.raw.tbman = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var sysinfo: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(sysinfo_Field.self, Bool.self)
                  return Bool(storage: self.raw.sysinfo)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(sysinfo_Field.self, Bool.self)
                  self.raw.sysinfo = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var syscfg: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(syscfg_Field.self, Bool.self)
                  return Bool(storage: self.raw.syscfg)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(syscfg_Field.self, Bool.self)
                  self.raw.syscfg = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var spi1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(spi1_Field.self, Bool.self)
                  return Bool(storage: self.raw.spi1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(spi1_Field.self, Bool.self)
                  self.raw.spi1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var spi0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(spi0_Field.self, Bool.self)
                  return Bool(storage: self.raw.spi0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(spi0_Field.self, Bool.self)
                  self.raw.spi0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var rtc: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(rtc_Field.self, Bool.self)
                  return Bool(storage: self.raw.rtc)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(rtc_Field.self, Bool.self)
                  self.raw.rtc = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var pwm: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(pwm_Field.self, Bool.self)
                  return Bool(storage: self.raw.pwm)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(pwm_Field.self, Bool.self)
                  self.raw.pwm = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var pll_usb: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(pll_usb_Field.self, Bool.self)
                  return Bool(storage: self.raw.pll_usb)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(pll_usb_Field.self, Bool.self)
                  self.raw.pll_usb = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var pll_sys: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(pll_sys_Field.self, Bool.self)
                  return Bool(storage: self.raw.pll_sys)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(pll_sys_Field.self, Bool.self)
                  self.raw.pll_sys = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var pio1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(pio1_Field.self, Bool.self)
                  return Bool(storage: self.raw.pio1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(pio1_Field.self, Bool.self)
                  self.raw.pio1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var pio0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(pio0_Field.self, Bool.self)
                  return Bool(storage: self.raw.pio0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(pio0_Field.self, Bool.self)
                  self.raw.pio0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var pads_qspi: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(pads_qspi_Field.self, Bool.self)
                  return Bool(storage: self.raw.pads_qspi)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(pads_qspi_Field.self, Bool.self)
                  self.raw.pads_qspi = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var pads_bank0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(pads_bank0_Field.self, Bool.self)
                  return Bool(storage: self.raw.pads_bank0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(pads_bank0_Field.self, Bool.self)
                  self.raw.pads_bank0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var jtag: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(jtag_Field.self, Bool.self)
                  return Bool(storage: self.raw.jtag)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(jtag_Field.self, Bool.self)
                  self.raw.jtag = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var io_qspi: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(io_qspi_Field.self, Bool.self)
                  return Bool(storage: self.raw.io_qspi)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(io_qspi_Field.self, Bool.self)
                  self.raw.io_qspi = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var io_bank0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(io_bank0_Field.self, Bool.self)
                  return Bool(storage: self.raw.io_bank0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(io_bank0_Field.self, Bool.self)
                  self.raw.io_bank0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var i2c1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(i2c1_Field.self, Bool.self)
                  return Bool(storage: self.raw.i2c1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(i2c1_Field.self, Bool.self)
                  self.raw.i2c1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var i2c0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(i2c0_Field.self, Bool.self)
                  return Bool(storage: self.raw.i2c0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(i2c0_Field.self, Bool.self)
                  self.raw.i2c0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var dma: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(dma_Field.self, Bool.self)
                  return Bool(storage: self.raw.dma)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(dma_Field.self, Bool.self)
                  self.raw.dma = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var busctrl: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(busctrl_Field.self, Bool.self)
                  return Bool(storage: self.raw.busctrl)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(busctrl_Field.self, Bool.self)
                  self.raw.busctrl = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var adc: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(adc_Field.self, Bool.self)
                  return Bool(storage: self.raw.adc)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(adc_Field.self, Bool.self)
                  self.raw.adc = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Reset done. If a bit is set then a reset done signal has been returned by the peripheral. This indicates that the peripheral's registers are ready to be accessed.
    public var RESET_DONE: Register<RESET_DONE_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0008), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0008))
          #endif
        }
    }
    public struct RESET_DONE_Descriptor {
        @available(*, unavailable)
        public var usbctrl: usbctrl_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var uart1: uart1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var uart0: uart0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var timer: timer_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var tbman: tbman_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var sysinfo: sysinfo_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var syscfg: syscfg_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var spi1: spi1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var spi0: spi0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var rtc: rtc_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var pwm: pwm_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var pll_usb: pll_usb_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var pll_sys: pll_sys_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var pio1: pio1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var pio0: pio0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var pads_qspi: pads_qspi_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var pads_bank0: pads_bank0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var jtag: jtag_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var io_qspi: io_qspi_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var io_bank0: io_bank0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var i2c1: i2c1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var i2c0: i2c0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var dma: dma_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var busctrl: busctrl_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var adc: adc_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum usbctrl_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 24 ..< 25
        }

        public enum uart1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 24
        }

        public enum uart0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 22 ..< 23
        }

        public enum timer_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 21 ..< 22
        }

        public enum tbman_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 20 ..< 21
        }

        public enum sysinfo_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 19 ..< 20
        }

        public enum syscfg_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 18 ..< 19
        }

        public enum spi1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 17 ..< 18
        }

        public enum spi0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum rtc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum pwm_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum pll_usb_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum pll_sys_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum pio1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum pio0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum pads_qspi_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum pads_bank0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum jtag_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum io_qspi_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum io_bank0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum i2c1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum i2c0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum dma_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum busctrl_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum adc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = RESET_DONE_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.Read) {
                self.storage = value.storage
                }

                  public  init(_ value: Value.Write) {
            self.storage = value.storage
              }
                public var usbctrl: UInt32 {
                @inlinable @inline(__always) get {
                    usbctrl_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    usbctrl_Field.insert(newValue, into: &self.storage)
                }
                }
              public var uart1: UInt32 {
                @inlinable @inline(__always) get {
                  uart1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  uart1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var uart0: UInt32 {
                @inlinable @inline(__always) get {
                  uart0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  uart0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var timer: UInt32 {
                @inlinable @inline(__always) get {
                  timer_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  timer_Field.insert(newValue, into: &self.storage)
                }
              }
              public var tbman: UInt32 {
                @inlinable @inline(__always) get {
                  tbman_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  tbman_Field.insert(newValue, into: &self.storage)
                }
              }
              public var sysinfo: UInt32 {
                @inlinable @inline(__always) get {
                  sysinfo_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  sysinfo_Field.insert(newValue, into: &self.storage)
                }
              }
              public var syscfg: UInt32 {
                @inlinable @inline(__always) get {
                  syscfg_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  syscfg_Field.insert(newValue, into: &self.storage)
                }
              }
              public var spi1: UInt32 {
                @inlinable @inline(__always) get {
                  spi1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  spi1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var spi0: UInt32 {
                @inlinable @inline(__always) get {
                  spi0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  spi0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var rtc: UInt32 {
                @inlinable @inline(__always) get {
                  rtc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  rtc_Field.insert(newValue, into: &self.storage)
                }
              }
              public var pwm: UInt32 {
                @inlinable @inline(__always) get {
                  pwm_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  pwm_Field.insert(newValue, into: &self.storage)
                }
              }
              public var pll_usb: UInt32 {
                @inlinable @inline(__always) get {
                  pll_usb_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  pll_usb_Field.insert(newValue, into: &self.storage)
                }
              }
              public var pll_sys: UInt32 {
                @inlinable @inline(__always) get {
                  pll_sys_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  pll_sys_Field.insert(newValue, into: &self.storage)
                }
              }
              public var pio1: UInt32 {
                @inlinable @inline(__always) get {
                  pio1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  pio1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var pio0: UInt32 {
                @inlinable @inline(__always) get {
                  pio0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  pio0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var pads_qspi: UInt32 {
                @inlinable @inline(__always) get {
                  pads_qspi_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  pads_qspi_Field.insert(newValue, into: &self.storage)
                }
              }
              public var pads_bank0: UInt32 {
                @inlinable @inline(__always) get {
                  pads_bank0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  pads_bank0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var jtag: UInt32 {
                @inlinable @inline(__always) get {
                  jtag_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  jtag_Field.insert(newValue, into: &self.storage)
                }
              }
              public var io_qspi: UInt32 {
                @inlinable @inline(__always) get {
                  io_qspi_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  io_qspi_Field.insert(newValue, into: &self.storage)
                }
              }
              public var io_bank0: UInt32 {
                @inlinable @inline(__always) get {
                  io_bank0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  io_bank0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var i2c1: UInt32 {
                @inlinable @inline(__always) get {
                  i2c1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  i2c1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var i2c0: UInt32 {
                @inlinable @inline(__always) get {
                  i2c0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  i2c0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var dma: UInt32 {
                @inlinable @inline(__always) get {
                  dma_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  dma_Field.insert(newValue, into: &self.storage)
                }
              }
              public var busctrl: UInt32 {
                @inlinable @inline(__always) get {
                  busctrl_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  busctrl_Field.insert(newValue, into: &self.storage)
                }
              }
              public var adc: UInt32 {
                @inlinable @inline(__always) get {
                  adc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  adc_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = RESET_DONE_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var usbctrl: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(usbctrl_Field.self, Bool.self)
                    return Bool(storage: self.raw.usbctrl)
                }
                }
              public var uart1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(uart1_Field.self, Bool.self)
                  return Bool(storage: self.raw.uart1)
                }
              }
              public var uart0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(uart0_Field.self, Bool.self)
                  return Bool(storage: self.raw.uart0)
                }
              }
              public var timer: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(timer_Field.self, Bool.self)
                  return Bool(storage: self.raw.timer)
                }
              }
              public var tbman: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(tbman_Field.self, Bool.self)
                  return Bool(storage: self.raw.tbman)
                }
              }
              public var sysinfo: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(sysinfo_Field.self, Bool.self)
                  return Bool(storage: self.raw.sysinfo)
                }
              }
              public var syscfg: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(syscfg_Field.self, Bool.self)
                  return Bool(storage: self.raw.syscfg)
                }
              }
              public var spi1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(spi1_Field.self, Bool.self)
                  return Bool(storage: self.raw.spi1)
                }
              }
              public var spi0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(spi0_Field.self, Bool.self)
                  return Bool(storage: self.raw.spi0)
                }
              }
              public var rtc: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(rtc_Field.self, Bool.self)
                  return Bool(storage: self.raw.rtc)
                }
              }
              public var pwm: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(pwm_Field.self, Bool.self)
                  return Bool(storage: self.raw.pwm)
                }
              }
              public var pll_usb: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(pll_usb_Field.self, Bool.self)
                  return Bool(storage: self.raw.pll_usb)
                }
              }
              public var pll_sys: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(pll_sys_Field.self, Bool.self)
                  return Bool(storage: self.raw.pll_sys)
                }
              }
              public var pio1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(pio1_Field.self, Bool.self)
                  return Bool(storage: self.raw.pio1)
                }
              }
              public var pio0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(pio0_Field.self, Bool.self)
                  return Bool(storage: self.raw.pio0)
                }
              }
              public var pads_qspi: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(pads_qspi_Field.self, Bool.self)
                  return Bool(storage: self.raw.pads_qspi)
                }
              }
              public var pads_bank0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(pads_bank0_Field.self, Bool.self)
                  return Bool(storage: self.raw.pads_bank0)
                }
              }
              public var jtag: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(jtag_Field.self, Bool.self)
                  return Bool(storage: self.raw.jtag)
                }
              }
              public var io_qspi: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(io_qspi_Field.self, Bool.self)
                  return Bool(storage: self.raw.io_qspi)
                }
              }
              public var io_bank0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(io_bank0_Field.self, Bool.self)
                  return Bool(storage: self.raw.io_bank0)
                }
              }
              public var i2c1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(i2c1_Field.self, Bool.self)
                  return Bool(storage: self.raw.i2c1)
                }
              }
              public var i2c0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(i2c0_Field.self, Bool.self)
                  return Bool(storage: self.raw.i2c0)
                }
              }
              public var dma: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(dma_Field.self, Bool.self)
                  return Bool(storage: self.raw.dma)
                }
              }
              public var busctrl: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(busctrl_Field.self, Bool.self)
                  return Bool(storage: self.raw.busctrl)
                }
              }
              public var adc: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(adc_Field.self, Bool.self)
                  return Bool(storage: self.raw.adc)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = RESET_DONE_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }

        }
    }

    public  let unsafeAddress: UInt

    #if FEATURE_INTERPOSABLE
    var interposer: (any MMIOInterposer)?
    #endif

    #if FEATURE_INTERPOSABLE
    @inlinable @inline(__always)
    public init(unsafeAddress: UInt, interposer: (any MMIOInterposer)?) {
      self.unsafeAddress = unsafeAddress
      self.interposer = interposer
    }
    #else
    @inlinable @inline(__always)
    public init(unsafeAddress: UInt) {
      self.unsafeAddress = unsafeAddress
    }
    #endif
}

extension RESETS.RESET_Descriptor: RegisterValue {
}

extension RESETS.WDSEL_Descriptor: RegisterValue {
}

extension RESETS.RESET_DONE_Descriptor: RegisterValue {
}
