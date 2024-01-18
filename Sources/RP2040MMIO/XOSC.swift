import MMIO
import MMIOExtensions

/// Controls the crystal oscillator
@RegisterBank
public struct XOSC {

    public static var `default`: Self { .init(unsafeAddress: 0x40024000) }

    /// Crystal Oscillator Control
    @RegisterBank(offset: 0x0000)
    public var ctrl: Register<CTRL>

    @Register(bitWidth: 32)
    public struct CTRL {
        /// On power-up this field is initialised to DISABLE and the chip runs from the ROSC.
        /// If the chip has subsequently been programmed to run from the XOSC then setting this field to DISABLE may lock-up the chip. If this is a concern then run the clk_ref from the ROSC and enable the clk_sys RESUS feature.
        /// The 12-bit code is intended to give some protection against accidental writes. An invalid setting will enable the oscillator.
        @ReadWrite(bits: 12..<24, as: ENABLE_Values.self)
        public var enable: ENABLE_Field

        public enum ENABLE_Values: UInt, BitFieldProjectable {
            case ENABLE_DISABLE = 3358
            case ENABLE_ENABLE = 4011

            public static var bitWidth: Int { 12 }
        }

        /// Frequency range. This resets to 0xAA0 and cannot be changed.
        @ReadWrite(bits: 0..<12, as: FREQ_RANGE_Values.self)
        public var freq_range: FREQ_RANGE_Field

        public enum FREQ_RANGE_Values: UInt, BitFieldProjectable {
            case FREQ_RANGE_1_15MHZ = 2720
            case FREQ_RANGE_RESERVED_1 = 2721
            case FREQ_RANGE_RESERVED_2 = 2722
            case FREQ_RANGE_RESERVED_3 = 2723

            public static var bitWidth: Int { 12 }
        }
    }

    /// Crystal Oscillator Status
    @RegisterBank(offset: 0x0004)
    public var status: Register<STATUS>

    @Register(bitWidth: 32)
    public struct STATUS {
        /// Oscillator is running and stable
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var stable: STABLE_Field

        /// An invalid value has been written to CTRL_ENABLE or CTRL_FREQ_RANGE or DORMANT
        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var badwrite: BADWRITE_Field

        /// Oscillator is enabled but not necessarily running and stable, resets to 0
        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var enabled: ENABLED_Field

        /// The current frequency range setting, always reads 0
        @ReadOnly(bits: 0..<2, as: FREQ_RANGE_Values.self)
        public var freq_range: FREQ_RANGE_Field

        public enum FREQ_RANGE_Values: UInt, BitFieldProjectable {
            case FREQ_RANGE_1_15MHZ = 0
            case FREQ_RANGE_RESERVED_1 = 1
            case FREQ_RANGE_RESERVED_2 = 2
            case FREQ_RANGE_RESERVED_3 = 3

            public static var bitWidth: Int { 2 }
        }
    }

    /// Crystal Oscillator pause control
    /// This is used to save power by pausing the XOSC
    /// On power-up this field is initialised to WAKE
    /// An invalid write will also select WAKE
    /// WARNING: stop the PLLs before selecting dormant mode
    /// WARNING: setup the irq before selecting dormant mode
    @RegisterBank(offset: 0x0008)
    public var dormant: Register<DORMANT>

    @Register(bitWidth: 32)
    public struct DORMANT {    }

    /// Controls the startup delay
    @RegisterBank(offset: 0x000c)
    public var startup: Register<STARTUP>

    @Register(bitWidth: 32)
    public struct STARTUP {
        /// Multiplies the startup_delay by 4. This is of little value to the user given that the delay can be programmed directly.
        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var x4: X4_Field

        /// in multiples of 256*xtal_period. The reset value of 0xc4 corresponds to approx 50 000 cycles.
        @ReadWrite(bits: 0..<14, as: BitField14.self)
        public var delay: DELAY_Field
    }

    /// A down counter running at the xosc frequency which counts to zero and stops.
    /// To start the counter write a non-zero value.
    /// Can be used for short software pauses when setting up time sensitive hardware.
    @RegisterBank(offset: 0x001c)
    public var count: Register<COUNT>

    @Register(bitWidth: 32)
    public struct COUNT {
        @ReadWrite(bits: 0..<8, as: BitField8.self)
        public var count: COUNT_Field
    }
}