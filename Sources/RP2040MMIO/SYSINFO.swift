import MMIO
import MMIOExtensions

@RegisterBank
public struct SYSINFO {

    public static var `default`: Self { .init(unsafeAddress: 0x40000000) }

    /// JEDEC JEP-106 compliant chip identifier.
    @RegisterBank(offset: 0x0000)
    public var chip_id: Register<CHIP_ID>

    @Register(bitWidth: 32)
    public struct CHIP_ID {
        @ReadOnly(bits: 28..<32, as: BitField4.self)
        public var revision: REVISION_Field

        @ReadOnly(bits: 12..<28, as: BitField16.self)
        public var part: PART_Field

        @ReadOnly(bits: 0..<12, as: BitField12.self)
        public var manufacturer: MANUFACTURER_Field
    }

    /// Platform register. Allows software to know what environment it is running in.
    @RegisterBank(offset: 0x0004)
    public var platform: Register<PLATFORM>

    @Register(bitWidth: 32)
    public struct PLATFORM {
        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var asic: ASIC_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var fpga: FPGA_Field
    }

    /// Git hash of the chip source. Used to identify chip version.
    @RegisterBank(offset: 0x0040)
    public var gitref_rp2040: Register<GITREF_RP2040>

    @Register(bitWidth: 32)
    public struct GITREF_RP2040 {}
}
