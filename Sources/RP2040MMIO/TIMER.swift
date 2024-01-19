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
    public var TIMEHW: Register<TIMEHW_Descriptor>


    @Register(bitWidth: 32)
    public struct TIMEHW_Descriptor {}

    /// Write to bits 31:0 of time
    /// writes do not get copied to time until timehw is written
    @RegisterBank(offset: 0x0004)
    public var TIMELW: Register<TIMELW_Descriptor>


    @Register(bitWidth: 32)
    public struct TIMELW_Descriptor {}

    /// Read from bits 63:32 of time
    /// always read timelr before timehr
    @RegisterBank(offset: 0x0008)
    public var TIMEHR: Register<TIMEHR_Descriptor>


    @Register(bitWidth: 32)
    public struct TIMEHR_Descriptor {}

    /// Read from bits 31:0 of time
    @RegisterBank(offset: 0x000c)
    public var TIMELR: Register<TIMELR_Descriptor>


    @Register(bitWidth: 32)
    public struct TIMELR_Descriptor {}

    /// Arm alarm 0, and configure the time it will fire.
    /// Once armed, the alarm fires when TIMER_ALARM0 == TIMELR.
    /// The alarm will disarm itself once it fires, and can
    /// be disarmed early using the ARMED status register.
    @RegisterBank(offset: 0x0010)
    public var ALARM0: Register<ALARM0_Descriptor>


    @Register(bitWidth: 32)
    public struct ALARM0_Descriptor {}

    /// Arm alarm 1, and configure the time it will fire.
    /// Once armed, the alarm fires when TIMER_ALARM1 == TIMELR.
    /// The alarm will disarm itself once it fires, and can
    /// be disarmed early using the ARMED status register.
    @RegisterBank(offset: 0x0014)
    public var ALARM1: Register<ALARM1_Descriptor>


    @Register(bitWidth: 32)
    public struct ALARM1_Descriptor {}

    /// Arm alarm 2, and configure the time it will fire.
    /// Once armed, the alarm fires when TIMER_ALARM2 == TIMELR.
    /// The alarm will disarm itself once it fires, and can
    /// be disarmed early using the ARMED status register.
    @RegisterBank(offset: 0x0018)
    public var ALARM2: Register<ALARM2_Descriptor>


    @Register(bitWidth: 32)
    public struct ALARM2_Descriptor {}

    /// Arm alarm 3, and configure the time it will fire.
    /// Once armed, the alarm fires when TIMER_ALARM3 == TIMELR.
    /// The alarm will disarm itself once it fires, and can
    /// be disarmed early using the ARMED status register.
    @RegisterBank(offset: 0x001c)
    public var ALARM3: Register<ALARM3_Descriptor>


    @Register(bitWidth: 32)
    public struct ALARM3_Descriptor {}

    /// Indicates the armed/disarmed status of each alarm.
    /// A write to the corresponding ALARMx register arms the alarm.
    /// Alarms automatically disarm upon firing, but writing ones here
    /// will disarm immediately without waiting to fire.
    @RegisterBank(offset: 0x0020)
    public var ARMED: Register<ARMED_Descriptor>


    @Register(bitWidth: 32)
    public struct ARMED_Descriptor {
        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var ARMED: ARMED_Field
    }

    /// Raw read from bits 63:32 of time (no side effects)
    @RegisterBank(offset: 0x0024)
    public var TIMERAWH: Register<TIMERAWH_Descriptor>


    @Register(bitWidth: 32)
    public struct TIMERAWH_Descriptor {}

    /// Raw read from bits 31:0 of time (no side effects)
    @RegisterBank(offset: 0x0028)
    public var TIMERAWL: Register<TIMERAWL_Descriptor>


    @Register(bitWidth: 32)
    public struct TIMERAWL_Descriptor {}

    /// Set bits high to enable pause when the corresponding debug ports are active
    @RegisterBank(offset: 0x002c)
    public var DBGPAUSE: Register<DBGPAUSE_Descriptor>


    @Register(bitWidth: 32)
    public struct DBGPAUSE_Descriptor {
        /// Pause when processor 1 is in debug mode
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var DBG1: DBG1_Field

        /// Pause when processor 0 is in debug mode
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var DBG0: DBG0_Field
    }

    /// Set high to pause the timer
    @RegisterBank(offset: 0x0030)
    public var PAUSE: Register<PAUSE_Descriptor>


    @Register(bitWidth: 32)
    public struct PAUSE_Descriptor {
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var PAUSE: PAUSE_Field
    }

    /// Raw Interrupts
    @RegisterBank(offset: 0x0034)
    public var INTR: Register<INTR_Descriptor>


    @Register(bitWidth: 32)
    public struct INTR_Descriptor {
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var ALARM_3: ALARM_3_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var ALARM_2: ALARM_2_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var ALARM_1: ALARM_1_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var ALARM_0: ALARM_0_Field
    }

    /// Interrupt Enable
    @RegisterBank(offset: 0x0038)
    public var INTE: Register<INTE_Descriptor>


    @Register(bitWidth: 32)
    public struct INTE_Descriptor {
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var ALARM_3: ALARM_3_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var ALARM_2: ALARM_2_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var ALARM_1: ALARM_1_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var ALARM_0: ALARM_0_Field
    }

    /// Interrupt Force
    @RegisterBank(offset: 0x003c)
    public var INTF: Register<INTF_Descriptor>


    @Register(bitWidth: 32)
    public struct INTF_Descriptor {
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var ALARM_3: ALARM_3_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var ALARM_2: ALARM_2_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var ALARM_1: ALARM_1_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var ALARM_0: ALARM_0_Field
    }

    /// Interrupt status after masking & forcing
    @RegisterBank(offset: 0x0040)
    public var INTS: Register<INTS_Descriptor>


    @Register(bitWidth: 32)
    public struct INTS_Descriptor {
        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var ALARM_3: ALARM_3_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var ALARM_2: ALARM_2_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var ALARM_1: ALARM_1_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var ALARM_0: ALARM_0_Field
    }
}
