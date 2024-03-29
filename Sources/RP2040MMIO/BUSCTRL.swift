import MMIO
import MMIOExtensions

/// Register block for busfabric control signals and performance counters
@RegisterBank
public struct BUSCTRL {

    public static var `default`: Self { .init(unsafeAddress: 0x40030000) }

    /// Set the priority of each master for bus arbitration.
    @RegisterBank(offset: 0x0000)
    public var BUS_PRIORITY: Register<BUS_PRIORITY_Descriptor>


    @Register(bitWidth: 32)
    public struct BUS_PRIORITY_Descriptor {
        /// 0 - low priority, 1 - high priority
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var DMA_W: DMA_W_Field

        /// 0 - low priority, 1 - high priority
        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var DMA_R: DMA_R_Field

        /// 0 - low priority, 1 - high priority
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var PROC1: PROC1_Field

        /// 0 - low priority, 1 - high priority
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var PROC0: PROC0_Field
    }

    /// Bus priority acknowledge
    @RegisterBank(offset: 0x0004)
    public var BUS_PRIORITY_ACK: Register<BUS_PRIORITY_ACK_Descriptor>


    @Register(bitWidth: 32)
    public struct BUS_PRIORITY_ACK_Descriptor {
        /// Goes to 1 once all arbiters have registered the new global priority levels.
        /// Arbiters update their local priority when servicing a new nonsequential access.
        /// In normal circumstances this will happen almost immediately.
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var BUS_PRIORITY_ACK: BUS_PRIORITY_ACK_Field
    }

    /// Bus fabric performance counter 0
    @RegisterBank(offset: 0x0008)
    public var PERFCTR0: Register<PERFCTR0_Descriptor>


    @Register(bitWidth: 32)
    public struct PERFCTR0_Descriptor {
        /// Busfabric saturating performance counter 0
        /// Count some event signal from the busfabric arbiters.
        /// Write any value to clear. Select an event to count using PERFSEL0
        @ReadWrite(bits: 0..<24, as: BitField24.self)
        public var PERFCTR0: PERFCTR0_Field
    }

    /// Bus fabric performance event select for PERFCTR0
    @RegisterBank(offset: 0x000c)
    public var PERFSEL0: Register<PERFSEL0_Descriptor>


    @Register(bitWidth: 32)
    public struct PERFSEL0_Descriptor {
        /// Select an event for PERFCTR0. Count either contested accesses, or all accesses, on a downstream port of the main crossbar.
        @ReadWrite(bits: 0..<5, as: PERFSEL0_Values.self)
        public var PERFSEL0: PERFSEL0_Field

        public enum PERFSEL0_Values: UInt, BitFieldProjectable {
            case PERFSEL0_apb_contested = 0
            case PERFSEL0_apb = 1
            case PERFSEL0_fastperi_contested = 2
            case PERFSEL0_fastperi = 3
            case PERFSEL0_sram5_contested = 4
            case PERFSEL0_sram5 = 5
            case PERFSEL0_sram4_contested = 6
            case PERFSEL0_sram4 = 7
            case PERFSEL0_sram3_contested = 8
            case PERFSEL0_sram3 = 9
            case PERFSEL0_sram2_contested = 10
            case PERFSEL0_sram2 = 11
            case PERFSEL0_sram1_contested = 12
            case PERFSEL0_sram1 = 13
            case PERFSEL0_sram0_contested = 14
            case PERFSEL0_sram0 = 15
            case PERFSEL0_xip_main_contested = 16
            case PERFSEL0_xip_main = 17
            case PERFSEL0_rom_contested = 18
            case PERFSEL0_rom = 19

            public static var bitWidth: Int { 5 }
        }
    }

    /// Bus fabric performance counter 1
    @RegisterBank(offset: 0x0010)
    public var PERFCTR1: Register<PERFCTR1_Descriptor>


    @Register(bitWidth: 32)
    public struct PERFCTR1_Descriptor {
        /// Busfabric saturating performance counter 1
        /// Count some event signal from the busfabric arbiters.
        /// Write any value to clear. Select an event to count using PERFSEL1
        @ReadWrite(bits: 0..<24, as: BitField24.self)
        public var PERFCTR1: PERFCTR1_Field
    }

    /// Bus fabric performance event select for PERFCTR1
    @RegisterBank(offset: 0x0014)
    public var PERFSEL1: Register<PERFSEL1_Descriptor>


    @Register(bitWidth: 32)
    public struct PERFSEL1_Descriptor {
        /// Select an event for PERFCTR1. Count either contested accesses, or all accesses, on a downstream port of the main crossbar.
        @ReadWrite(bits: 0..<5, as: PERFSEL1_Values.self)
        public var PERFSEL1: PERFSEL1_Field

        public enum PERFSEL1_Values: UInt, BitFieldProjectable {
            case PERFSEL1_apb_contested = 0
            case PERFSEL1_apb = 1
            case PERFSEL1_fastperi_contested = 2
            case PERFSEL1_fastperi = 3
            case PERFSEL1_sram5_contested = 4
            case PERFSEL1_sram5 = 5
            case PERFSEL1_sram4_contested = 6
            case PERFSEL1_sram4 = 7
            case PERFSEL1_sram3_contested = 8
            case PERFSEL1_sram3 = 9
            case PERFSEL1_sram2_contested = 10
            case PERFSEL1_sram2 = 11
            case PERFSEL1_sram1_contested = 12
            case PERFSEL1_sram1 = 13
            case PERFSEL1_sram0_contested = 14
            case PERFSEL1_sram0 = 15
            case PERFSEL1_xip_main_contested = 16
            case PERFSEL1_xip_main = 17
            case PERFSEL1_rom_contested = 18
            case PERFSEL1_rom = 19

            public static var bitWidth: Int { 5 }
        }
    }

    /// Bus fabric performance counter 2
    @RegisterBank(offset: 0x0018)
    public var PERFCTR2: Register<PERFCTR2_Descriptor>


    @Register(bitWidth: 32)
    public struct PERFCTR2_Descriptor {
        /// Busfabric saturating performance counter 2
        /// Count some event signal from the busfabric arbiters.
        /// Write any value to clear. Select an event to count using PERFSEL2
        @ReadWrite(bits: 0..<24, as: BitField24.self)
        public var PERFCTR2: PERFCTR2_Field
    }

    /// Bus fabric performance event select for PERFCTR2
    @RegisterBank(offset: 0x001c)
    public var PERFSEL2: Register<PERFSEL2_Descriptor>


    @Register(bitWidth: 32)
    public struct PERFSEL2_Descriptor {
        /// Select an event for PERFCTR2. Count either contested accesses, or all accesses, on a downstream port of the main crossbar.
        @ReadWrite(bits: 0..<5, as: PERFSEL2_Values.self)
        public var PERFSEL2: PERFSEL2_Field

        public enum PERFSEL2_Values: UInt, BitFieldProjectable {
            case PERFSEL2_apb_contested = 0
            case PERFSEL2_apb = 1
            case PERFSEL2_fastperi_contested = 2
            case PERFSEL2_fastperi = 3
            case PERFSEL2_sram5_contested = 4
            case PERFSEL2_sram5 = 5
            case PERFSEL2_sram4_contested = 6
            case PERFSEL2_sram4 = 7
            case PERFSEL2_sram3_contested = 8
            case PERFSEL2_sram3 = 9
            case PERFSEL2_sram2_contested = 10
            case PERFSEL2_sram2 = 11
            case PERFSEL2_sram1_contested = 12
            case PERFSEL2_sram1 = 13
            case PERFSEL2_sram0_contested = 14
            case PERFSEL2_sram0 = 15
            case PERFSEL2_xip_main_contested = 16
            case PERFSEL2_xip_main = 17
            case PERFSEL2_rom_contested = 18
            case PERFSEL2_rom = 19

            public static var bitWidth: Int { 5 }
        }
    }

    /// Bus fabric performance counter 3
    @RegisterBank(offset: 0x0020)
    public var PERFCTR3: Register<PERFCTR3_Descriptor>


    @Register(bitWidth: 32)
    public struct PERFCTR3_Descriptor {
        /// Busfabric saturating performance counter 3
        /// Count some event signal from the busfabric arbiters.
        /// Write any value to clear. Select an event to count using PERFSEL3
        @ReadWrite(bits: 0..<24, as: BitField24.self)
        public var PERFCTR3: PERFCTR3_Field
    }

    /// Bus fabric performance event select for PERFCTR3
    @RegisterBank(offset: 0x0024)
    public var PERFSEL3: Register<PERFSEL3_Descriptor>


    @Register(bitWidth: 32)
    public struct PERFSEL3_Descriptor {
        /// Select an event for PERFCTR3. Count either contested accesses, or all accesses, on a downstream port of the main crossbar.
        @ReadWrite(bits: 0..<5, as: PERFSEL3_Values.self)
        public var PERFSEL3: PERFSEL3_Field

        public enum PERFSEL3_Values: UInt, BitFieldProjectable {
            case PERFSEL3_apb_contested = 0
            case PERFSEL3_apb = 1
            case PERFSEL3_fastperi_contested = 2
            case PERFSEL3_fastperi = 3
            case PERFSEL3_sram5_contested = 4
            case PERFSEL3_sram5 = 5
            case PERFSEL3_sram4_contested = 6
            case PERFSEL3_sram4 = 7
            case PERFSEL3_sram3_contested = 8
            case PERFSEL3_sram3 = 9
            case PERFSEL3_sram2_contested = 10
            case PERFSEL3_sram2 = 11
            case PERFSEL3_sram1_contested = 12
            case PERFSEL3_sram1 = 13
            case PERFSEL3_sram0_contested = 14
            case PERFSEL3_sram0 = 15
            case PERFSEL3_xip_main_contested = 16
            case PERFSEL3_xip_main = 17
            case PERFSEL3_rom_contested = 18
            case PERFSEL3_rom = 19

            public static var bitWidth: Int { 5 }
        }
    }
}
