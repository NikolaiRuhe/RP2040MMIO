import MMIO
import MMIOExtensions

/// Register block for various chip control signals
@RegisterBank
public struct SYSCFG {

    public static var `default`: Self { .init(unsafeAddress: 0x40004000) }

    /// Processor core 0 NMI source mask
    /// Set a bit high to enable NMI from that IRQ
    @RegisterBank(offset: 0x0000)
    public var PROC0_NMI_MASK: Register<PROC0_NMI_MASK_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC0_NMI_MASK_Descriptor {}

    /// Processor core 1 NMI source mask
    /// Set a bit high to enable NMI from that IRQ
    @RegisterBank(offset: 0x0004)
    public var PROC1_NMI_MASK: Register<PROC1_NMI_MASK_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC1_NMI_MASK_Descriptor {}

    /// Configuration for processors
    @RegisterBank(offset: 0x0008)
    public var PROC_CONFIG: Register<PROC_CONFIG_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC_CONFIG_Descriptor {
        /// Configure proc1 DAP instance ID.
        /// Recommend that this is NOT changed until you require debug access in multi-chip environment
        /// WARNING: do not set to 15 as this is reserved for RescueDP
        @ReadWrite(bits: 28..<32, as: BitField4.self)
        public var PROC1_DAP_INSTID: PROC1_DAP_INSTID_Field

        /// Configure proc0 DAP instance ID.
        /// Recommend that this is NOT changed until you require debug access in multi-chip environment
        /// WARNING: do not set to 15 as this is reserved for RescueDP
        @ReadWrite(bits: 24..<28, as: BitField4.self)
        public var PROC0_DAP_INSTID: PROC0_DAP_INSTID_Field

        /// Indication that proc1 has halted
        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var PROC1_HALTED: PROC1_HALTED_Field

        /// Indication that proc0 has halted
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var PROC0_HALTED: PROC0_HALTED_Field
    }

    /// For each bit, if 1, bypass the input synchronizer between that GPIO
    /// and the GPIO input register in the SIO. The input synchronizers should
    /// generally be unbypassed, to avoid injecting metastabilities into processors.
    /// If you're feeling brave, you can bypass to save two cycles of input
    /// latency. This register applies to GPIO 0...29.
    @RegisterBank(offset: 0x000c)
    public var PROC_IN_SYNC_BYPASS: Register<PROC_IN_SYNC_BYPASS_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC_IN_SYNC_BYPASS_Descriptor {
        @ReadWrite(bits: 0..<30, as: BitField30.self)
        public var PROC_IN_SYNC_BYPASS: PROC_IN_SYNC_BYPASS_Field
    }

    /// For each bit, if 1, bypass the input synchronizer between that GPIO
    /// and the GPIO input register in the SIO. The input synchronizers should
    /// generally be unbypassed, to avoid injecting metastabilities into processors.
    /// If you're feeling brave, you can bypass to save two cycles of input
    /// latency. This register applies to GPIO 30...35 (the QSPI IOs).
    @RegisterBank(offset: 0x0010)
    public var PROC_IN_SYNC_BYPASS_HI: Register<PROC_IN_SYNC_BYPASS_HI_Descriptor>


    @Register(bitWidth: 32)
    public struct PROC_IN_SYNC_BYPASS_HI_Descriptor {
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var PROC_IN_SYNC_BYPASS_HI: PROC_IN_SYNC_BYPASS_HI_Field
    }

    /// Directly control the SWD debug port of either processor
    @RegisterBank(offset: 0x0014)
    public var DBGFORCE: Register<DBGFORCE_Descriptor>


    @Register(bitWidth: 32)
    public struct DBGFORCE_Descriptor {
        /// Attach processor 1 debug port to syscfg controls, and disconnect it from external SWD pads.
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var PROC1_ATTACH: PROC1_ATTACH_Field

        /// Directly drive processor 1 SWCLK, if PROC1_ATTACH is set
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var PROC1_SWCLK: PROC1_SWCLK_Field

        /// Directly drive processor 1 SWDIO input, if PROC1_ATTACH is set
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var PROC1_SWDI: PROC1_SWDI_Field

        /// Observe the value of processor 1 SWDIO output.
        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var PROC1_SWDO: PROC1_SWDO_Field

        /// Attach processor 0 debug port to syscfg controls, and disconnect it from external SWD pads.
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var PROC0_ATTACH: PROC0_ATTACH_Field

        /// Directly drive processor 0 SWCLK, if PROC0_ATTACH is set
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var PROC0_SWCLK: PROC0_SWCLK_Field

        /// Directly drive processor 0 SWDIO input, if PROC0_ATTACH is set
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var PROC0_SWDI: PROC0_SWDI_Field

        /// Observe the value of processor 0 SWDIO output.
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var PROC0_SWDO: PROC0_SWDO_Field
    }

    /// Control power downs to memories. Set high to power down memories.
    /// Use with extreme caution
    @RegisterBank(offset: 0x0018)
    public var MEMPOWERDOWN: Register<MEMPOWERDOWN_Descriptor>


    @Register(bitWidth: 32)
    public struct MEMPOWERDOWN_Descriptor {
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var ROM: ROM_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var USB: USB_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var SRAM5: SRAM5_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var SRAM4: SRAM4_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var SRAM3: SRAM3_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var SRAM2: SRAM2_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SRAM1: SRAM1_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var SRAM0: SRAM0_Field
    }
}
