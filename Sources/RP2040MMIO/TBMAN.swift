import MMIO
import MMIOExtensions

/// Testbench manager. Allows the programmer to know what platform their software is running on.
@RegisterBank
public struct TBMAN {

    public static var `default`: Self { .init(unsafeAddress: 0x4006c000) }

    /// Indicates the type of platform in use
    @RegisterBank(offset: 0x0000)
    public var platform: Register<PLATFORM>

    @Register(bitWidth: 32)
    public struct PLATFORM {
        /// Indicates the platform is an FPGA
        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var fpga: FPGA_Field

        /// Indicates the platform is an ASIC
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var asic: ASIC_Field
    }
}
