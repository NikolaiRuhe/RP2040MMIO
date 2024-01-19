import MMIO
import MMIOExtensions

@RegisterBank
public struct PSM {

    public static var `default`: Self { .init(unsafeAddress: 0x40010000) }

    /// Force block out of reset (i.e. power it on)
    @RegisterBank(offset: 0x0000)
    public var FRCE_ON: Register<FRCE_ON_Descriptor>


    @Register(bitWidth: 32)
    public struct FRCE_ON_Descriptor {
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var proc1: proc1_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var proc0: proc0_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var sio: sio_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var vreg_and_chip_reset: vreg_and_chip_reset_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var xip: xip_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var sram5: sram5_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var sram4: sram4_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var sram3: sram3_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var sram2: sram2_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var sram1: sram1_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var sram0: sram0_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var rom: rom_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var busfabric: busfabric_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var resets: resets_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var clocks: clocks_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var xosc: xosc_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var rosc: rosc_Field
    }

    /// Force into reset (i.e. power it off)
    @RegisterBank(offset: 0x0004)
    public var FRCE_OFF: Register<FRCE_OFF_Descriptor>


    @Register(bitWidth: 32)
    public struct FRCE_OFF_Descriptor {
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var proc1: proc1_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var proc0: proc0_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var sio: sio_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var vreg_and_chip_reset: vreg_and_chip_reset_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var xip: xip_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var sram5: sram5_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var sram4: sram4_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var sram3: sram3_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var sram2: sram2_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var sram1: sram1_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var sram0: sram0_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var rom: rom_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var busfabric: busfabric_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var resets: resets_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var clocks: clocks_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var xosc: xosc_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var rosc: rosc_Field
    }

    /// Set to 1 if this peripheral should be reset when the watchdog fires.
    @RegisterBank(offset: 0x0008)
    public var WDSEL: Register<WDSEL_Descriptor>


    @Register(bitWidth: 32)
    public struct WDSEL_Descriptor {
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var proc1: proc1_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var proc0: proc0_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var sio: sio_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var vreg_and_chip_reset: vreg_and_chip_reset_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var xip: xip_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var sram5: sram5_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var sram4: sram4_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var sram3: sram3_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var sram2: sram2_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var sram1: sram1_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var sram0: sram0_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var rom: rom_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var busfabric: busfabric_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var resets: resets_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var clocks: clocks_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var xosc: xosc_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var rosc: rosc_Field
    }

    /// Indicates the peripheral's registers are ready to access.
    @RegisterBank(offset: 0x000c)
    public var DONE: Register<DONE_Descriptor>


    @Register(bitWidth: 32)
    public struct DONE_Descriptor {
        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var proc1: proc1_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var proc0: proc0_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var sio: sio_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var vreg_and_chip_reset: vreg_and_chip_reset_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var xip: xip_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var sram5: sram5_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var sram4: sram4_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var sram3: sram3_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var sram2: sram2_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var sram1: sram1_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var sram0: sram0_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var rom: rom_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var busfabric: busfabric_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var resets: resets_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var clocks: clocks_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var xosc: xosc_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var rosc: rosc_Field
    }
}
