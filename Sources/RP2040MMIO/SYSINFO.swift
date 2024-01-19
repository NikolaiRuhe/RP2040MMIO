import MMIO
import MMIOExtensions

@RegisterBank
public struct SYSINFO {

    public static var `default`: Self { .init(unsafeAddress: 0x40000000) }

    /// JEDEC JEP-106 compliant chip identifier.
    @RegisterBank(offset: 0x0000)
    public var CHIP_ID: Register<CHIP_ID_Descriptor>


    @Register(bitWidth: 32)
    public struct CHIP_ID_Descriptor {
        @ReadOnly(bits: 28..<32, as: BitField4.self)
        public var REVISION: REVISION_Field

        @ReadOnly(bits: 12..<28, as: BitField16.self)
        public var PART: PART_Field

        @ReadOnly(bits: 0..<12, as: BitField12.self)
        public var MANUFACTURER: MANUFACTURER_Field
    }

    /// Platform register. Allows software to know what environment it is running in.
    @RegisterBank(offset: 0x0004)
    public var PLATFORM: Register<PLATFORM_Descriptor>


    @Register(bitWidth: 32)
    public struct PLATFORM_Descriptor {
        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var ASIC: ASIC_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var FPGA: FPGA_Field
    }

    /// Git hash of the chip source. Used to identify chip version.
    @RegisterBank(offset: 0x0040)
    public var GITREF_RP2040: Register<GITREF_RP2040_Descriptor>


    @Register(bitWidth: 32)
    public struct GITREF_RP2040_Descriptor {}
}
