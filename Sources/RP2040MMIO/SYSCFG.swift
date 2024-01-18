import MMIO
import MMIOExtensions

/// Register block for various chip control signals
@RegisterBank
public struct SYSCFG {

    public static var `default`: Self { .init(unsafeAddress: 0x40004000) }

    /// Processor core 0 NMI source mask
    /// Set a bit high to enable NMI from that IRQ
    @RegisterBank(offset: 0x0000)
    public var proc0_nmi_mask: Register<PROC0_NMI_MASK>

    @Register(bitWidth: 32)
    public struct PROC0_NMI_MASK {    }

    /// Processor core 1 NMI source mask
    /// Set a bit high to enable NMI from that IRQ
    @RegisterBank(offset: 0x0004)
    public var proc1_nmi_mask: Register<PROC1_NMI_MASK>

    @Register(bitWidth: 32)
    public struct PROC1_NMI_MASK {    }

    /// Configuration for processors
    @RegisterBank(offset: 0x0008)
    public var proc_config: Register<PROC_CONFIG>

    @Register(bitWidth: 32)
    public struct PROC_CONFIG {
        /// Configure proc1 DAP instance ID.
        /// Recommend that this is NOT changed until you require debug access in multi-chip environment
        /// WARNING: do not set to 15 as this is reserved for RescueDP
        @ReadWrite(bits: 28..<32, as: BitField4.self)
        public var proc1_dap_instid: PROC1_DAP_INSTID_Field

        /// Configure proc0 DAP instance ID.
        /// Recommend that this is NOT changed until you require debug access in multi-chip environment
        /// WARNING: do not set to 15 as this is reserved for RescueDP
        @ReadWrite(bits: 24..<28, as: BitField4.self)
        public var proc0_dap_instid: PROC0_DAP_INSTID_Field

        /// Indication that proc1 has halted
        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var proc1_halted: PROC1_HALTED_Field

        /// Indication that proc0 has halted
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var proc0_halted: PROC0_HALTED_Field
    }

    /// For each bit, if 1, bypass the input synchronizer between that GPIO
    /// and the GPIO input register in the SIO. The input synchronizers should
    /// generally be unbypassed, to avoid injecting metastabilities into processors.
    /// If you're feeling brave, you can bypass to save two cycles of input
    /// latency. This register applies to GPIO 0...29.
    @RegisterBank(offset: 0x000c)
    public var proc_in_sync_bypass: Register<PROC_IN_SYNC_BYPASS>

    @Register(bitWidth: 32)
    public struct PROC_IN_SYNC_BYPASS {
        @ReadWrite(bits: 0..<30, as: BitField30.self)
        public var proc_in_sync_bypass: PROC_IN_SYNC_BYPASS_Field
    }

    /// For each bit, if 1, bypass the input synchronizer between that GPIO
    /// and the GPIO input register in the SIO. The input synchronizers should
    /// generally be unbypassed, to avoid injecting metastabilities into processors.
    /// If you're feeling brave, you can bypass to save two cycles of input
    /// latency. This register applies to GPIO 30...35 (the QSPI IOs).
    @RegisterBank(offset: 0x0010)
    public var proc_in_sync_bypass_hi: Register<PROC_IN_SYNC_BYPASS_HI>

    @Register(bitWidth: 32)
    public struct PROC_IN_SYNC_BYPASS_HI {
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var proc_in_sync_bypass_hi: PROC_IN_SYNC_BYPASS_HI_Field
    }

    /// Directly control the SWD debug port of either processor
    @RegisterBank(offset: 0x0014)
    public var dbgforce: Register<DBGFORCE>

    @Register(bitWidth: 32)
    public struct DBGFORCE {
        /// Attach processor 1 debug port to syscfg controls, and disconnect it from external SWD pads.
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var proc1_attach: PROC1_ATTACH_Field

        /// Directly drive processor 1 SWCLK, if PROC1_ATTACH is set
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var proc1_swclk: PROC1_SWCLK_Field

        /// Directly drive processor 1 SWDIO input, if PROC1_ATTACH is set
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var proc1_swdi: PROC1_SWDI_Field

        /// Observe the value of processor 1 SWDIO output.
        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var proc1_swdo: PROC1_SWDO_Field

        /// Attach processor 0 debug port to syscfg controls, and disconnect it from external SWD pads.
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var proc0_attach: PROC0_ATTACH_Field

        /// Directly drive processor 0 SWCLK, if PROC0_ATTACH is set
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var proc0_swclk: PROC0_SWCLK_Field

        /// Directly drive processor 0 SWDIO input, if PROC0_ATTACH is set
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var proc0_swdi: PROC0_SWDI_Field

        /// Observe the value of processor 0 SWDIO output.
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var proc0_swdo: PROC0_SWDO_Field
    }

    /// Control power downs to memories. Set high to power down memories.
    /// Use with extreme caution
    @RegisterBank(offset: 0x0018)
    public var mempowerdown: Register<MEMPOWERDOWN>

    @Register(bitWidth: 32)
    public struct MEMPOWERDOWN {
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var rom: ROM_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var usb: USB_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var sram5: SRAM5_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var sram4: SRAM4_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var sram3: SRAM3_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var sram2: SRAM2_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var sram1: SRAM1_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var sram0: SRAM0_Field
    }
}