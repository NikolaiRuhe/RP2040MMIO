import MMIO
import MMIOExtensions

/// control and status for on-chip voltage regulator and chip level reset subsystem
@RegisterBank
public struct VREG_AND_CHIP_RESET {

    public static var `default`: Self { .init(unsafeAddress: 0x40064000) }

    /// Voltage regulator control and status
    @RegisterBank(offset: 0x0000)
    public var vreg: Register<VREG>

    @Register(bitWidth: 32)
    public struct VREG {
        /// regulation status
        /// 0=not in regulation, 1=in regulation
        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var rok: ROK_Field

        /// output voltage select
        /// 0000 to 0101 - 0.80V
        /// 0110         - 0.85V
        /// 0111         - 0.90V
        /// 1000         - 0.95V
        /// 1001         - 1.00V
        /// 1010         - 1.05V
        /// 1011         - 1.10V (default)
        /// 1100         - 1.15V
        /// 1101         - 1.20V
        /// 1110         - 1.25V
        /// 1111         - 1.30V
        @ReadWrite(bits: 4..<8, as: BitField4.self)
        public var vsel: VSEL_Field

        /// high impedance mode select
        /// 0=not in high impedance mode, 1=in high impedance mode
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var hiz: HIZ_Field

        /// enable
        /// 0=not enabled, 1=enabled
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var en: EN_Field
    }

    /// brown-out detection control
    @RegisterBank(offset: 0x0004)
    public var bod: Register<BOD>

    @Register(bitWidth: 32)
    public struct BOD {
        /// threshold select
        /// 0000 - 0.473V
        /// 0001 - 0.516V
        /// 0010 - 0.559V
        /// 0011 - 0.602V
        /// 0100 - 0.645V
        /// 0101 - 0.688V
        /// 0110 - 0.731V
        /// 0111 - 0.774V
        /// 1000 - 0.817V
        /// 1001 - 0.860V (default)
        /// 1010 - 0.903V
        /// 1011 - 0.946V
        /// 1100 - 0.989V
        /// 1101 - 1.032V
        /// 1110 - 1.075V
        /// 1111 - 1.118V
        @ReadWrite(bits: 4..<8, as: BitField4.self)
        public var vsel: VSEL_Field

        /// enable
        /// 0=not enabled, 1=enabled
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var en: EN_Field
    }

    /// Chip reset control and status
    @RegisterBank(offset: 0x0008)
    public var chip_reset: Register<CHIP_RESET>

    @Register(bitWidth: 32)
    public struct CHIP_RESET {
        /// This is set by psm_restart from the debugger.
        /// Its purpose is to branch bootcode to a safe mode when the debugger has issued a psm_restart in order to recover from a boot lock-up.
        /// In the safe mode the debugger can repair the boot code, clear this flag then reboot the processor.
        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var psm_restart_flag: PSM_RESTART_FLAG_Field

        /// Last reset was from the debug port
        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var had_psm_restart: HAD_PSM_RESTART_Field

        /// Last reset was from the RUN pin
        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var had_run: HAD_RUN_Field

        /// Last reset was from the power-on reset or brown-out detection blocks
        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var had_por: HAD_POR_Field
    }
}
