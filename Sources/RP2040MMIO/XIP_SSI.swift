import MMIO
import MMIOExtensions

/// DW_apb_ssi has the following features:
/// * APB interface - Allows for easy integration into a DesignWare Synthesizable Components for AMBA 2 implementation.
/// * APB3 and APB4 protocol support.
/// * Scalable APB data bus width - Supports APB data bus widths of 8, 16, and 32 bits.
/// * Serial-master or serial-slave operation - Enables serial communication with serial-master or serial-slave peripheral devices.
/// * Programmable Dual/Quad/Octal SPI support in Master Mode.
/// * Dual Data Rate (DDR) and Read Data Strobe (RDS) Support - Enables the DW_apb_ssi master to perform operations with the device in DDR and RDS modes when working in Dual/Quad/Octal mode of operation.
/// * Data Mask Support - Enables the DW_apb_ssi to selectively update the bytes in the device. This feature is applicable only in enhanced SPI modes.
/// * eXecute-In-Place (XIP) support - Enables the DW_apb_ssi master to behave as a memory mapped I/O and fetches the data from the device based on the APB read request. This feature is applicable only in enhanced SPI modes.
/// * DMA Controller Interface - Enables the DW_apb_ssi to interface to a DMA controller over the bus using a handshaking interface for transfer requests.
/// * Independent masking of interrupts - Master collision, transmit FIFO overflow, transmit FIFO empty, receive FIFO full, receive FIFO underflow, and receive FIFO overflow interrupts can all be masked independently.
/// * Multi-master contention detection - Informs the processor of multiple serial-master accesses on the serial bus.
/// * Bypass of meta-stability flip-flops for synchronous clocks - When the APB clock (pclk) and the DW_apb_ssi serial clock (ssi_clk) are synchronous, meta-stable flip-flops are not used when transferring control signals across these clock domains.
/// * Programmable delay on the sample time of the received serial data bit (rxd); enables programmable control of routing delays resulting in higher serial data-bit rates.
/// * Programmable features:
/// - Serial interface operation - Choice of Motorola SPI, Texas Instruments Synchronous Serial Protocol or National Semiconductor Microwire.
/// - Clock bit-rate - Dynamic control of the serial bit rate of the data transfer; used in only serial-master mode of operation.
/// - Data Item size (4 to 32 bits) - Item size of each data transfer under the control of the programmer.
/// * Configured features:
/// - FIFO depth - 16 words deep. The FIFO width is fixed at 32 bits.
/// - 1 slave select output.
/// - Hardware slave-select - Dedicated hardware slave-select line.
/// - Combined interrupt line - one combined interrupt line from the DW_apb_ssi to the interrupt controller.
/// - Interrupt polarity - active high interrupt lines.
/// - Serial clock polarity - low serial-clock polarity directly after reset.
/// - Serial clock phase - capture on first edge of serial-clock directly after reset.
@RegisterBank
public struct XIP_SSI {

    public static var `default`: Self { .init(unsafeAddress: 0x18000000) }

    /// Control register 0
    @RegisterBank(offset: 0x0000)
    public var ctrlr0: Register<CTRLR0>

    @Register(bitWidth: 32)
    public struct CTRLR0 {
        /// Slave select toggle enable
        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var sste: SSTE_Field

        /// SPI frame format
        @ReadWrite(bits: 21..<23, as: SPI_FRF_Values.self)
        public var spi_frf: SPI_FRF_Field

        public enum SPI_FRF_Values: UInt, BitFieldProjectable {
            /// Standard 1-bit SPI frame format; 1 bit per SCK, full-duplex
            case SPI_FRF_STD = 0
            /// Dual-SPI frame format; two bits per SCK, half-duplex
            case SPI_FRF_DUAL = 1
            /// Quad-SPI frame format; four bits per SCK, half-duplex
            case SPI_FRF_QUAD = 2

            public static var bitWidth: Int { 2 }
        }

        /// Data frame size in 32b transfer mode
        /// Value of n -> n+1 clocks per frame.
        @ReadWrite(bits: 16..<21, as: BitField5.self)
        public var dfs_32: DFS_32_Field

        /// Control frame size
        /// Value of n -> n+1 clocks per frame.
        @ReadWrite(bits: 12..<16, as: BitField4.self)
        public var cfs: CFS_Field

        /// Shift register loop (test mode)
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var srl: SRL_Field

        /// Slave output enable
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var slv_oe: SLV_OE_Field

        /// Transfer mode
        @ReadWrite(bits: 8..<10, as: TMOD_Values.self)
        public var tmod: TMOD_Field

        public enum TMOD_Values: UInt, BitFieldProjectable {
            /// Both transmit and receive
            case TMOD_TX_AND_RX = 0
            /// Transmit only (not for FRF == 0, standard SPI mode)
            case TMOD_TX_ONLY = 1
            /// Receive only (not for FRF == 0, standard SPI mode)
            case TMOD_RX_ONLY = 2
            /// EEPROM read mode (TX then RX; RX starts after control data TX'd)
            case TMOD_EEPROM_READ = 3

            public static var bitWidth: Int { 2 }
        }

        /// Serial clock polarity
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var scpol: SCPOL_Field

        /// Serial clock phase
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var scph: SCPH_Field

        /// Frame format
        @ReadWrite(bits: 4..<6, as: BitField2.self)
        public var frf: FRF_Field

        /// Data frame size
        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var dfs: DFS_Field
    }

    /// Master Control register 1
    @RegisterBank(offset: 0x0004)
    public var ctrlr1: Register<CTRLR1>

    @Register(bitWidth: 32)
    public struct CTRLR1 {
        /// Number of data frames
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var ndf: NDF_Field
    }

    /// SSI Enable
    @RegisterBank(offset: 0x0008)
    public var ssienr: Register<SSIENR>

    @Register(bitWidth: 32)
    public struct SSIENR {
        /// SSI enable
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var ssi_en: SSI_EN_Field
    }

    /// Microwire Control
    @RegisterBank(offset: 0x000c)
    public var mwcr: Register<MWCR>

    @Register(bitWidth: 32)
    public struct MWCR {
        /// Microwire handshaking
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var mhs: MHS_Field

        /// Microwire control
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var mdd: MDD_Field

        /// Microwire transfer mode
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var mwmod: MWMOD_Field
    }

    /// Slave enable
    @RegisterBank(offset: 0x0010)
    public var ser: Register<SER>

    @Register(bitWidth: 32)
    public struct SER {
        /// For each bit:
        /// 0 -> slave not selected
        /// 1 -> slave selected
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var ser: SER_Field
    }

    /// Baud rate
    @RegisterBank(offset: 0x0014)
    public var baudr: Register<BAUDR>

    @Register(bitWidth: 32)
    public struct BAUDR {
        /// SSI clock divider
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var sckdv: SCKDV_Field
    }

    /// TX FIFO threshold level
    @RegisterBank(offset: 0x0018)
    public var txftlr: Register<TXFTLR>

    @Register(bitWidth: 32)
    public struct TXFTLR {
        /// Transmit FIFO threshold
        @ReadWrite(bits: 0..<8, as: BitField8.self)
        public var tft: TFT_Field
    }

    /// RX FIFO threshold level
    @RegisterBank(offset: 0x001c)
    public var rxftlr: Register<RXFTLR>

    @Register(bitWidth: 32)
    public struct RXFTLR {
        /// Receive FIFO threshold
        @ReadWrite(bits: 0..<8, as: BitField8.self)
        public var rft: RFT_Field
    }

    /// TX FIFO level
    @RegisterBank(offset: 0x0020)
    public var txflr: Register<TXFLR>

    @Register(bitWidth: 32)
    public struct TXFLR {
        /// Transmit FIFO level
        @ReadOnly(bits: 0..<8, as: BitField8.self)
        public var tftfl: TFTFL_Field
    }

    /// RX FIFO level
    @RegisterBank(offset: 0x0024)
    public var rxflr: Register<RXFLR>

    @Register(bitWidth: 32)
    public struct RXFLR {
        /// Receive FIFO level
        @ReadOnly(bits: 0..<8, as: BitField8.self)
        public var rxtfl: RXTFL_Field
    }

    /// Status register
    @RegisterBank(offset: 0x0028)
    public var sr: Register<SR>

    @Register(bitWidth: 32)
    public struct SR {
        /// Data collision error
        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var dcol: DCOL_Field

        /// Transmission error
        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var txe: TXE_Field

        /// Receive FIFO full
        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var rff: RFF_Field

        /// Receive FIFO not empty
        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var rfne: RFNE_Field

        /// Transmit FIFO empty
        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var tfe: TFE_Field

        /// Transmit FIFO not full
        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var tfnf: TFNF_Field

        /// SSI busy flag
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var busy: BUSY_Field
    }

    /// Interrupt mask
    @RegisterBank(offset: 0x002c)
    public var imr: Register<IMR>

    @Register(bitWidth: 32)
    public struct IMR {
        /// Multi-master contention interrupt mask
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var mstim: MSTIM_Field

        /// Receive FIFO full interrupt mask
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var rxfim: RXFIM_Field

        /// Receive FIFO overflow interrupt mask
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var rxoim: RXOIM_Field

        /// Receive FIFO underflow interrupt mask
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var rxuim: RXUIM_Field

        /// Transmit FIFO overflow interrupt mask
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var txoim: TXOIM_Field

        /// Transmit FIFO empty interrupt mask
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var txeim: TXEIM_Field
    }

    /// Interrupt status
    @RegisterBank(offset: 0x0030)
    public var isr: Register<ISR>

    @Register(bitWidth: 32)
    public struct ISR {
        /// Multi-master contention interrupt status
        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var mstis: MSTIS_Field

        /// Receive FIFO full interrupt status
        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var rxfis: RXFIS_Field

        /// Receive FIFO overflow interrupt status
        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var rxois: RXOIS_Field

        /// Receive FIFO underflow interrupt status
        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var rxuis: RXUIS_Field

        /// Transmit FIFO overflow interrupt status
        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var txois: TXOIS_Field

        /// Transmit FIFO empty interrupt status
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var txeis: TXEIS_Field
    }

    /// Raw interrupt status
    @RegisterBank(offset: 0x0034)
    public var risr: Register<RISR>

    @Register(bitWidth: 32)
    public struct RISR {
        /// Multi-master contention raw interrupt status
        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var mstir: MSTIR_Field

        /// Receive FIFO full raw interrupt status
        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var rxfir: RXFIR_Field

        /// Receive FIFO overflow raw interrupt status
        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var rxoir: RXOIR_Field

        /// Receive FIFO underflow raw interrupt status
        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var rxuir: RXUIR_Field

        /// Transmit FIFO overflow raw interrupt status
        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var txoir: TXOIR_Field

        /// Transmit FIFO empty raw interrupt status
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var txeir: TXEIR_Field
    }

    /// TX FIFO overflow interrupt clear
    @RegisterBank(offset: 0x0038)
    public var txoicr: Register<TXOICR>

    @Register(bitWidth: 32)
    public struct TXOICR {
        /// Clear-on-read transmit FIFO overflow interrupt
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var txoicr: TXOICR_Field
    }

    /// RX FIFO overflow interrupt clear
    @RegisterBank(offset: 0x003c)
    public var rxoicr: Register<RXOICR>

    @Register(bitWidth: 32)
    public struct RXOICR {
        /// Clear-on-read receive FIFO overflow interrupt
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var rxoicr: RXOICR_Field
    }

    /// RX FIFO underflow interrupt clear
    @RegisterBank(offset: 0x0040)
    public var rxuicr: Register<RXUICR>

    @Register(bitWidth: 32)
    public struct RXUICR {
        /// Clear-on-read receive FIFO underflow interrupt
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var rxuicr: RXUICR_Field
    }

    /// Multi-master interrupt clear
    @RegisterBank(offset: 0x0044)
    public var msticr: Register<MSTICR>

    @Register(bitWidth: 32)
    public struct MSTICR {
        /// Clear-on-read multi-master contention interrupt
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var msticr: MSTICR_Field
    }

    /// Interrupt clear
    @RegisterBank(offset: 0x0048)
    public var icr: Register<ICR>

    @Register(bitWidth: 32)
    public struct ICR {
        /// Clear-on-read all active interrupts
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var icr: ICR_Field
    }

    /// DMA control
    @RegisterBank(offset: 0x004c)
    public var dmacr: Register<DMACR>

    @Register(bitWidth: 32)
    public struct DMACR {
        /// Transmit DMA enable
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var tdmae: TDMAE_Field

        /// Receive DMA enable
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var rdmae: RDMAE_Field
    }

    /// DMA TX data level
    @RegisterBank(offset: 0x0050)
    public var dmatdlr: Register<DMATDLR>

    @Register(bitWidth: 32)
    public struct DMATDLR {
        /// Transmit data watermark level
        @ReadWrite(bits: 0..<8, as: BitField8.self)
        public var dmatdl: DMATDL_Field
    }

    /// DMA RX data level
    @RegisterBank(offset: 0x0054)
    public var dmardlr: Register<DMARDLR>

    @Register(bitWidth: 32)
    public struct DMARDLR {
        /// Receive data watermark level (DMARDLR+1)
        @ReadWrite(bits: 0..<8, as: BitField8.self)
        public var dmardl: DMARDL_Field
    }

    /// Identification register
    @RegisterBank(offset: 0x0058)
    public var idr: Register<IDR>

    @Register(bitWidth: 32)
    public struct IDR {
        /// Peripheral dentification code
        @ReadOnly(bits: 0..<32, as: BitField32.self)
        public var idcode: IDCODE_Field
    }

    /// Version ID
    @RegisterBank(offset: 0x005c)
    public var ssi_version_id: Register<SSI_VERSION_ID>

    @Register(bitWidth: 32)
    public struct SSI_VERSION_ID {
        /// SNPS component version (format X.YY)
        @ReadOnly(bits: 0..<32, as: BitField32.self)
        public var ssi_comp_version: SSI_COMP_VERSION_Field
    }

    /// Data Register 0 (of 36)
    @RegisterBank(offset: 0x0060)
    public var dr0: Register<DR0>

    @Register(bitWidth: 32)
    public struct DR0 {
        /// First data register of 36
        @ReadWrite(bits: 0..<32, as: BitField32.self)
        public var dr: DR_Field
    }

    /// RX sample delay
    @RegisterBank(offset: 0x00f0)
    public var rx_sample_dly: Register<RX_SAMPLE_DLY>

    @Register(bitWidth: 32)
    public struct RX_SAMPLE_DLY {
        /// RXD sample delay (in SCLK cycles)
        @ReadWrite(bits: 0..<8, as: BitField8.self)
        public var rsd: RSD_Field
    }

    /// SPI control
    @RegisterBank(offset: 0x00f4)
    public var spi_ctrlr0: Register<SPI_CTRLR0>

    @Register(bitWidth: 32)
    public struct SPI_CTRLR0 {
        /// SPI Command to send in XIP mode (INST_L = 8-bit) or to append to Address (INST_L = 0-bit)
        @ReadWrite(bits: 24..<32, as: BitField8.self)
        public var xip_cmd: XIP_CMD_Field

        /// Read data strobe enable
        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var spi_rxds_en: SPI_RXDS_EN_Field

        /// Instruction DDR transfer enable
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var inst_ddr_en: INST_DDR_EN_Field

        /// SPI DDR transfer enable
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var spi_ddr_en: SPI_DDR_EN_Field

        /// Wait cycles between control frame transmit and data reception (in SCLK cycles)
        @ReadWrite(bits: 11..<16, as: BitField5.self)
        public var wait_cycles: WAIT_CYCLES_Field

        /// Instruction length (0/4/8/16b)
        @ReadWrite(bits: 8..<10, as: INST_L_Values.self)
        public var inst_l: INST_L_Field

        public enum INST_L_Values: UInt, BitFieldProjectable {
            /// No instruction
            case INST_L_NONE = 0
            /// 4-bit instruction
            case INST_L_4B = 1
            /// 8-bit instruction
            case INST_L_8B = 2
            /// 16-bit instruction
            case INST_L_16B = 3

            public static var bitWidth: Int { 2 }
        }

        /// Address length (0b-60b in 4b increments)
        @ReadWrite(bits: 2..<6, as: BitField4.self)
        public var addr_l: ADDR_L_Field

        /// Address and instruction transfer format
        @ReadWrite(bits: 0..<2, as: TRANS_TYPE_Values.self)
        public var trans_type: TRANS_TYPE_Field

        public enum TRANS_TYPE_Values: UInt, BitFieldProjectable {
            /// Command and address both in standard SPI frame format
            case TRANS_TYPE_1C1A = 0
            /// Command in standard SPI format, address in format specified by FRF
            case TRANS_TYPE_1C2A = 1
            /// Command and address both in format specified by FRF (e.g. Dual-SPI)
            case TRANS_TYPE_2C2A = 2

            public static var bitWidth: Int { 2 }
        }
    }

    /// TX drive edge
    @RegisterBank(offset: 0x00f8)
    public var txd_drive_edge: Register<TXD_DRIVE_EDGE>

    @Register(bitWidth: 32)
    public struct TXD_DRIVE_EDGE {
        /// TXD drive edge
        @ReadWrite(bits: 0..<8, as: BitField8.self)
        public var tde: TDE_Field
    }
}