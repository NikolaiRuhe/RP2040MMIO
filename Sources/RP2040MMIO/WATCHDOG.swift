import MMIO
import MMIOExtensions

@RegisterBank
public struct WATCHDOG {

    public static var `default`: Self { .init(unsafeAddress: 0x40058000) }

    /// Watchdog control
    /// The rst_wdsel register determines which subsystems are reset when the watchdog is triggered.
    /// The watchdog can be triggered in software.
    @RegisterBank(offset: 0x0000)
    public var ctrl: Register<CTRL>

    @Register(bitWidth: 32)
    public struct CTRL {
        /// Trigger a watchdog reset
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var trigger: TRIGGER_Field

        /// When not enabled the watchdog timer is paused
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var enable: ENABLE_Field

        /// Pause the watchdog timer when processor 1 is in debug mode
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var pause_dbg1: PAUSE_DBG1_Field

        /// Pause the watchdog timer when processor 0 is in debug mode
        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var pause_dbg0: PAUSE_DBG0_Field

        /// Pause the watchdog timer when JTAG is accessing the bus fabric
        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var pause_jtag: PAUSE_JTAG_Field

        /// Indicates the number of ticks / 2 (see errata RP2040-E1) before a watchdog reset will be triggered
        @ReadOnly(bits: 0..<24, as: BitField24.self)
        public var time: TIME_Field
    }

    /// Load the watchdog timer. The maximum setting is 0xffffff which corresponds to 0xffffff / 2 ticks before triggering a watchdog reset (see errata RP2040-E1).
    @RegisterBank(offset: 0x0004)
    public var load: Register<LOAD>

    @Register(bitWidth: 32)
    public struct LOAD {
        @WriteOnly(bits: 0..<24, as: BitField24.self)
        public var load: LOAD_Field
    }

    /// Logs the reason for the last reset. Both bits are zero for the case of a hardware reset.
    @RegisterBank(offset: 0x0008)
    public var reason: Register<REASON>

    @Register(bitWidth: 32)
    public struct REASON {
        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var force: FORCE_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var timer: TIMER_Field
    }

    /// Scratch register. Information persists through soft reset of the chip.
    @RegisterBank(offset: 0x000c)
    public var scratch0: Register<SCRATCH0>

    @Register(bitWidth: 32)
    public struct SCRATCH0 {    }

    /// Scratch register. Information persists through soft reset of the chip.
    @RegisterBank(offset: 0x0010)
    public var scratch1: Register<SCRATCH1>

    @Register(bitWidth: 32)
    public struct SCRATCH1 {    }

    /// Scratch register. Information persists through soft reset of the chip.
    @RegisterBank(offset: 0x0014)
    public var scratch2: Register<SCRATCH2>

    @Register(bitWidth: 32)
    public struct SCRATCH2 {    }

    /// Scratch register. Information persists through soft reset of the chip.
    @RegisterBank(offset: 0x0018)
    public var scratch3: Register<SCRATCH3>

    @Register(bitWidth: 32)
    public struct SCRATCH3 {    }

    /// Scratch register. Information persists through soft reset of the chip.
    @RegisterBank(offset: 0x001c)
    public var scratch4: Register<SCRATCH4>

    @Register(bitWidth: 32)
    public struct SCRATCH4 {    }

    /// Scratch register. Information persists through soft reset of the chip.
    @RegisterBank(offset: 0x0020)
    public var scratch5: Register<SCRATCH5>

    @Register(bitWidth: 32)
    public struct SCRATCH5 {    }

    /// Scratch register. Information persists through soft reset of the chip.
    @RegisterBank(offset: 0x0024)
    public var scratch6: Register<SCRATCH6>

    @Register(bitWidth: 32)
    public struct SCRATCH6 {    }

    /// Scratch register. Information persists through soft reset of the chip.
    @RegisterBank(offset: 0x0028)
    public var scratch7: Register<SCRATCH7>

    @Register(bitWidth: 32)
    public struct SCRATCH7 {    }

    /// Controls the tick generator
    @RegisterBank(offset: 0x002c)
    public var tick: Register<TICK>

    @Register(bitWidth: 32)
    public struct TICK {
        /// Count down timer: the remaining number clk_tick cycles before the next tick is generated.
        @ReadOnly(bits: 11..<20, as: BitField9.self)
        public var count: COUNT_Field

        /// Is the tick generator running?
        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var running: RUNNING_Field

        /// start / stop tick generation
        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var enable: ENABLE_Field

        /// Total number of clk_tick cycles before the next tick.
        @ReadWrite(bits: 0..<9, as: BitField9.self)
        public var cycles: CYCLES_Field
    }
}