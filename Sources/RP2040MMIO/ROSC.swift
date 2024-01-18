import MMIO
import MMIOExtensions

@RegisterBank
public struct ROSC {

    public static var `default`: Self { .init(unsafeAddress: 0x40060000) }

    /// Ring Oscillator control
    @RegisterBank(offset: 0x0000)
    public var ctrl: Register<CTRL>

    @Register(bitWidth: 32)
    public struct CTRL {
        /// On power-up this field is initialised to ENABLE
        /// The system clock must be switched to another source before setting this field to DISABLE otherwise the chip will lock up
        /// The 12-bit code is intended to give some protection against accidental writes. An invalid setting will enable the oscillator.
        @ReadWrite(bits: 12..<24, as: ENABLE_Values.self)
        public var enable: ENABLE_Field

        public enum ENABLE_Values: UInt, BitFieldProjectable {
            case ENABLE_DISABLE = 3358
            case ENABLE_ENABLE = 4011

            public static var bitWidth: Int { 12 }
        }

        /// Controls the number of delay stages in the ROSC ring
        /// LOW uses stages 0 to 7
        /// MEDIUM uses stages 0 to 5
        /// HIGH uses stages 0 to 3
        /// TOOHIGH uses stages 0 to 1 and should not be used because its frequency exceeds design specifications
        /// The clock output will not glitch when changing the range up one step at a time
        /// The clock output will glitch when changing the range down
        /// Note: the values here are gray coded which is why HIGH comes before TOOHIGH
        @ReadWrite(bits: 0..<12, as: FREQ_RANGE_Values.self)
        public var freq_range: FREQ_RANGE_Field

        public enum FREQ_RANGE_Values: UInt, BitFieldProjectable {
            case FREQ_RANGE_LOW = 4004
            case FREQ_RANGE_MEDIUM = 4005
            case FREQ_RANGE_HIGH = 4007
            case FREQ_RANGE_TOOHIGH = 4006

            public static var bitWidth: Int { 12 }
        }
    }

    /// The FREQA & FREQB registers control the frequency by controlling the drive strength of each stage
    /// The drive strength has 4 levels determined by the number of bits set
    /// Increasing the number of bits set increases the drive strength and increases the oscillation frequency
    /// 0 bits set is the default drive strength
    /// 1 bit set doubles the drive strength
    /// 2 bits set triples drive strength
    /// 3 bits set quadruples drive strength
    @RegisterBank(offset: 0x0004)
    public var freqa: Register<FREQA>

    @Register(bitWidth: 32)
    public struct FREQA {
        /// Set to 0x9696 to apply the settings
        /// Any other value in this field will set all drive strengths to 0
        @ReadWrite(bits: 16..<32, as: PASSWD_Values.self)
        public var passwd: PASSWD_Field

        public enum PASSWD_Values: UInt, BitFieldProjectable {
            case PASSWD_PASS = 38550

            public static var bitWidth: Int { 16 }
        }

        /// Stage 3 drive strength
        @ReadWrite(bits: 12..<15, as: BitField3.self)
        public var ds3: DS3_Field

        /// Stage 2 drive strength
        @ReadWrite(bits: 8..<11, as: BitField3.self)
        public var ds2: DS2_Field

        /// Stage 1 drive strength
        @ReadWrite(bits: 4..<7, as: BitField3.self)
        public var ds1: DS1_Field

        /// Stage 0 drive strength
        @ReadWrite(bits: 0..<3, as: BitField3.self)
        public var ds0: DS0_Field
    }

    /// For a detailed description see freqa register
    @RegisterBank(offset: 0x0008)
    public var freqb: Register<FREQB>

    @Register(bitWidth: 32)
    public struct FREQB {
        /// Set to 0x9696 to apply the settings
        /// Any other value in this field will set all drive strengths to 0
        @ReadWrite(bits: 16..<32, as: PASSWD_Values.self)
        public var passwd: PASSWD_Field

        public enum PASSWD_Values: UInt, BitFieldProjectable {
            case PASSWD_PASS = 38550

            public static var bitWidth: Int { 16 }
        }

        /// Stage 7 drive strength
        @ReadWrite(bits: 12..<15, as: BitField3.self)
        public var ds7: DS7_Field

        /// Stage 6 drive strength
        @ReadWrite(bits: 8..<11, as: BitField3.self)
        public var ds6: DS6_Field

        /// Stage 5 drive strength
        @ReadWrite(bits: 4..<7, as: BitField3.self)
        public var ds5: DS5_Field

        /// Stage 4 drive strength
        @ReadWrite(bits: 0..<3, as: BitField3.self)
        public var ds4: DS4_Field
    }

    /// Ring Oscillator pause control
    /// This is used to save power by pausing the ROSC
    /// On power-up this field is initialised to WAKE
    /// An invalid write will also select WAKE
    /// Warning: setup the irq before selecting dormant mode
    @RegisterBank(offset: 0x000c)
    public var dormant: Register<DORMANT>

    @Register(bitWidth: 32)
    public struct DORMANT {    }

    /// Controls the output divider
    @RegisterBank(offset: 0x0010)
    public var div: Register<DIV>

    @Register(bitWidth: 32)
    public struct DIV {
        /// set to 0xaa0 + div where
        /// div = 0 divides by 32
        /// div = 1-31 divides by div
        /// any other value sets div=31
        /// this register resets to div=16
        @ReadWrite(bits: 0..<12, as: DIV_Values.self)
        public var div: DIV_Field

        public enum DIV_Values: UInt, BitFieldProjectable {
            case DIV_PASS = 2720

            public static var bitWidth: Int { 12 }
        }
    }

    /// Controls the phase shifted output
    @RegisterBank(offset: 0x0014)
    public var phase: Register<PHASE>

    @Register(bitWidth: 32)
    public struct PHASE {
        /// set to 0xaa
        /// any other value enables the output with shift=0
        @ReadWrite(bits: 4..<12, as: BitField8.self)
        public var passwd: PASSWD_Field

        /// enable the phase-shifted output
        /// this can be changed on-the-fly
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var enable: ENABLE_Field

        /// invert the phase-shifted output
        /// this is ignored when div=1
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var flip: FLIP_Field

        /// phase shift the phase-shifted output by SHIFT input clocks
        /// this can be changed on-the-fly
        /// must be set to 0 before setting div=1
        @ReadWrite(bits: 0..<2, as: BitField2.self)
        public var shift: SHIFT_Field
    }

    /// Ring Oscillator Status
    @RegisterBank(offset: 0x0018)
    public var status: Register<STATUS>

    @Register(bitWidth: 32)
    public struct STATUS {
        /// Oscillator is running and stable
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var stable: STABLE_Field

        /// An invalid value has been written to CTRL_ENABLE or CTRL_FREQ_RANGE or FREQA or FREQB or DIV or PHASE or DORMANT
        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var badwrite: BADWRITE_Field

        /// post-divider is running
        /// this resets to 0 but transitions to 1 during chip startup
        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var div_running: DIV_RUNNING_Field

        /// Oscillator is enabled but not necessarily running and stable
        /// this resets to 0 but transitions to 1 during chip startup
        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var enabled: ENABLED_Field
    }

    /// This just reads the state of the oscillator output so randomness is compromised if the ring oscillator is stopped or run at a harmonic of the bus frequency
    @RegisterBank(offset: 0x001c)
    public var randombit: Register<RANDOMBIT>

    @Register(bitWidth: 32)
    public struct RANDOMBIT {
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var randombit: RANDOMBIT_Field
    }

    /// A down counter running at the ROSC frequency which counts to zero and stops.
    /// To start the counter write a non-zero value.
    /// Can be used for short software pauses when setting up time sensitive hardware.
    @RegisterBank(offset: 0x0020)
    public var count: Register<COUNT>

    @Register(bitWidth: 32)
    public struct COUNT {
        @ReadWrite(bits: 0..<8, as: BitField8.self)
        public var count: COUNT_Field
    }
}