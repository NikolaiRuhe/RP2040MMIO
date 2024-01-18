import MMIO
import MMIOExtensions

/// Controls time and alarms
/// time is a 64 bit value indicating the time in usec since power-on
/// timeh is the top 32 bits of time & timel is the bottom 32 bits
/// to change time write to timelw before timehw
/// to read time read from timelr before timehr
/// An alarm is set by setting alarm_enable and writing to the corresponding alarm register
/// When an alarm is pending, the corresponding alarm_running signal will be high
/// An alarm can be cancelled before it has finished by clearing the alarm_enable
/// When an alarm fires, the corresponding alarm_irq is set and alarm_running is cleared
/// To clear the interrupt write a 1 to the corresponding alarm_irq
@RegisterBank
public struct TIMER {

    public static var `default`: Self { .init(unsafeAddress: 0x40054000) }

    /// Write to bits 63:32 of time
    /// always write timelw before timehw
    @RegisterBank(offset: 0x0000)
    public var timehw: Register<TIMEHW>

    @Register(bitWidth: 32)
    public struct TIMEHW {    }

    /// Write to bits 31:0 of time
    /// writes do not get copied to time until timehw is written
    @RegisterBank(offset: 0x0004)
    public var timelw: Register<TIMELW>

    @Register(bitWidth: 32)
    public struct TIMELW {    }

    /// Read from bits 63:32 of time
    /// always read timelr before timehr
    @RegisterBank(offset: 0x0008)
    public var timehr: Register<TIMEHR>

    @Register(bitWidth: 32)
    public struct TIMEHR {    }

    /// Read from bits 31:0 of time
    @RegisterBank(offset: 0x000c)
    public var timelr: Register<TIMELR>

    @Register(bitWidth: 32)
    public struct TIMELR {    }

    /// Arm alarm 0, and configure the time it will fire.
    /// Once armed, the alarm fires when TIMER_ALARM0 == TIMELR.
    /// The alarm will disarm itself once it fires, and can
    /// be disarmed early using the ARMED status register.
    @RegisterBank(offset: 0x0010)
    public var alarm0: Register<ALARM0>

    @Register(bitWidth: 32)
    public struct ALARM0 {    }

    /// Arm alarm 1, and configure the time it will fire.
    /// Once armed, the alarm fires when TIMER_ALARM1 == TIMELR.
    /// The alarm will disarm itself once it fires, and can
    /// be disarmed early using the ARMED status register.
    @RegisterBank(offset: 0x0014)
    public var alarm1: Register<ALARM1>

    @Register(bitWidth: 32)
    public struct ALARM1 {    }

    /// Arm alarm 2, and configure the time it will fire.
    /// Once armed, the alarm fires when TIMER_ALARM2 == TIMELR.
    /// The alarm will disarm itself once it fires, and can
    /// be disarmed early using the ARMED status register.
    @RegisterBank(offset: 0x0018)
    public var alarm2: Register<ALARM2>

    @Register(bitWidth: 32)
    public struct ALARM2 {    }

    /// Arm alarm 3, and configure the time it will fire.
    /// Once armed, the alarm fires when TIMER_ALARM3 == TIMELR.
    /// The alarm will disarm itself once it fires, and can
    /// be disarmed early using the ARMED status register.
    @RegisterBank(offset: 0x001c)
    public var alarm3: Register<ALARM3>

    @Register(bitWidth: 32)
    public struct ALARM3 {    }

    /// Indicates the armed/disarmed status of each alarm.
    /// A write to the corresponding ALARMx register arms the alarm.
    /// Alarms automatically disarm upon firing, but writing ones here
    /// will disarm immediately without waiting to fire.
    @RegisterBank(offset: 0x0020)
    public var armed: Register<ARMED>

    @Register(bitWidth: 32)
    public struct ARMED {
        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var armed: ARMED_Field
    }

    /// Raw read from bits 63:32 of time (no side effects)
    @RegisterBank(offset: 0x0024)
    public var timerawh: Register<TIMERAWH>

    @Register(bitWidth: 32)
    public struct TIMERAWH {    }

    /// Raw read from bits 31:0 of time (no side effects)
    @RegisterBank(offset: 0x0028)
    public var timerawl: Register<TIMERAWL>

    @Register(bitWidth: 32)
    public struct TIMERAWL {    }

    /// Set bits high to enable pause when the corresponding debug ports are active
    @RegisterBank(offset: 0x002c)
    public var dbgpause: Register<DBGPAUSE>

    @Register(bitWidth: 32)
    public struct DBGPAUSE {
        /// Pause when processor 1 is in debug mode
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var dbg1: DBG1_Field

        /// Pause when processor 0 is in debug mode
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var dbg0: DBG0_Field
    }

    /// Set high to pause the timer
    @RegisterBank(offset: 0x0030)
    public var pause: Register<PAUSE>

    @Register(bitWidth: 32)
    public struct PAUSE {
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var pause: PAUSE_Field
    }

    /// Raw Interrupts
    @RegisterBank(offset: 0x0034)
    public var intr: Register<INTR>

    @Register(bitWidth: 32)
    public struct INTR {
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var alarm_3: ALARM_3_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var alarm_2: ALARM_2_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var alarm_1: ALARM_1_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var alarm_0: ALARM_0_Field
    }

    /// Interrupt Enable
    @RegisterBank(offset: 0x0038)
    public var inte: Register<INTE>

    @Register(bitWidth: 32)
    public struct INTE {
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var alarm_3: ALARM_3_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var alarm_2: ALARM_2_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var alarm_1: ALARM_1_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var alarm_0: ALARM_0_Field
    }

    /// Interrupt Force
    @RegisterBank(offset: 0x003c)
    public var intf: Register<INTF>

    @Register(bitWidth: 32)
    public struct INTF {
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var alarm_3: ALARM_3_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var alarm_2: ALARM_2_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var alarm_1: ALARM_1_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var alarm_0: ALARM_0_Field
    }

    /// Interrupt status after masking & forcing
    @RegisterBank(offset: 0x0040)
    public var ints: Register<INTS>

    @Register(bitWidth: 32)
    public struct INTS {
        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var alarm_3: ALARM_3_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var alarm_2: ALARM_2_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var alarm_1: ALARM_1_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var alarm_0: ALARM_0_Field
    }
}