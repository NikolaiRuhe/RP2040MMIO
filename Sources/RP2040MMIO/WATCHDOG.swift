import MMIO
import MMIOExtensions

@RegisterBank
public struct WATCHDOG {

    public static var `default`: Self { .init(unsafeAddress: 0x40058000) }

    /// Watchdog control
    /// The rst_wdsel register determines which subsystems are reset when the watchdog is triggered.
    /// The watchdog can be triggered in software.
    @RegisterBank(offset: 0x0000)
    public var CTRL: Register<CTRL_Descriptor>


    @Register(bitWidth: 32)
    public struct CTRL_Descriptor {
        /// Trigger a watchdog reset
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var TRIGGER: TRIGGER_Field

        /// When not enabled the watchdog timer is paused
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var ENABLE: ENABLE_Field

        /// Pause the watchdog timer when processor 1 is in debug mode
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var PAUSE_DBG1: PAUSE_DBG1_Field

        /// Pause the watchdog timer when processor 0 is in debug mode
        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var PAUSE_DBG0: PAUSE_DBG0_Field

        /// Pause the watchdog timer when JTAG is accessing the bus fabric
        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var PAUSE_JTAG: PAUSE_JTAG_Field

        /// Indicates the number of ticks / 2 (see errata RP2040-E1) before a watchdog reset will be triggered
        @ReadOnly(bits: 0..<24, as: BitField24.self)
        public var TIME: TIME_Field
    }

    /// Load the watchdog timer. The maximum setting is 0xffffff which corresponds to 0xffffff / 2 ticks before triggering a watchdog reset (see errata RP2040-E1).
    @RegisterBank(offset: 0x0004)
    public var LOAD: Register<LOAD_Descriptor>


    @Register(bitWidth: 32)
    public struct LOAD_Descriptor {
        @WriteOnly(bits: 0..<24, as: BitField24.self)
        public var LOAD: LOAD_Field
    }

    /// Logs the reason for the last reset. Both bits are zero for the case of a hardware reset.
    @RegisterBank(offset: 0x0008)
    public var REASON: Register<REASON_Descriptor>


    @Register(bitWidth: 32)
    public struct REASON_Descriptor {
        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var FORCE: FORCE_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var TIMER: TIMER_Field
    }

    /// Scratch register. Information persists through soft reset of the chip.
    @RegisterBank(offset: 0x000c)
    public var SCRATCH0: Register<SCRATCH0_Descriptor>


    @Register(bitWidth: 32)
    public struct SCRATCH0_Descriptor {}

    /// Scratch register. Information persists through soft reset of the chip.
    @RegisterBank(offset: 0x0010)
    public var SCRATCH1: Register<SCRATCH1_Descriptor>


    @Register(bitWidth: 32)
    public struct SCRATCH1_Descriptor {}

    /// Scratch register. Information persists through soft reset of the chip.
    @RegisterBank(offset: 0x0014)
    public var SCRATCH2: Register<SCRATCH2_Descriptor>


    @Register(bitWidth: 32)
    public struct SCRATCH2_Descriptor {}

    /// Scratch register. Information persists through soft reset of the chip.
    @RegisterBank(offset: 0x0018)
    public var SCRATCH3: Register<SCRATCH3_Descriptor>


    @Register(bitWidth: 32)
    public struct SCRATCH3_Descriptor {}

    /// Scratch register. Information persists through soft reset of the chip.
    @RegisterBank(offset: 0x001c)
    public var SCRATCH4: Register<SCRATCH4_Descriptor>


    @Register(bitWidth: 32)
    public struct SCRATCH4_Descriptor {}

    /// Scratch register. Information persists through soft reset of the chip.
    @RegisterBank(offset: 0x0020)
    public var SCRATCH5: Register<SCRATCH5_Descriptor>


    @Register(bitWidth: 32)
    public struct SCRATCH5_Descriptor {}

    /// Scratch register. Information persists through soft reset of the chip.
    @RegisterBank(offset: 0x0024)
    public var SCRATCH6: Register<SCRATCH6_Descriptor>


    @Register(bitWidth: 32)
    public struct SCRATCH6_Descriptor {}

    /// Scratch register. Information persists through soft reset of the chip.
    @RegisterBank(offset: 0x0028)
    public var SCRATCH7: Register<SCRATCH7_Descriptor>


    @Register(bitWidth: 32)
    public struct SCRATCH7_Descriptor {}

    /// Controls the tick generator
    @RegisterBank(offset: 0x002c)
    public var TICK: Register<TICK_Descriptor>


    @Register(bitWidth: 32)
    public struct TICK_Descriptor {
        /// Count down timer: the remaining number clk_tick cycles before the next tick is generated.
        @ReadOnly(bits: 11..<20, as: BitField9.self)
        public var COUNT: COUNT_Field

        /// Is the tick generator running?
        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var RUNNING: RUNNING_Field

        /// start / stop tick generation
        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var ENABLE: ENABLE_Field

        /// Total number of clk_tick cycles before the next tick.
        @ReadWrite(bits: 0..<9, as: BitField9.self)
        public var CYCLES: CYCLES_Field
    }
}
