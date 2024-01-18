import MMIO
import MMIOExtensions

@RegisterBank
public struct SPI0 {

    public static var `default`: Self { .init(unsafeAddress: 0x4003c000) }

    /// Control register 0, SSPCR0 on page 3-4
    @RegisterBank(offset: 0x0000)
    public var sspcr0: Register<SSPCR0>

    @Register(bitWidth: 32)
    public struct SSPCR0 {
        /// Serial clock rate. The value SCR is used to generate the transmit and receive bit rate of the PrimeCell SSP. The bit rate is: F SSPCLK CPSDVSR x (1+SCR) where CPSDVSR is an even value from 2-254, programmed through the SSPCPSR register and SCR is a value from 0-255.
        @ReadWrite(bits: 8..<16, as: BitField8.self)
        public var scr: SCR_Field

        /// SSPCLKOUT phase, applicable to Motorola SPI frame format only. See Motorola SPI frame format on page 2-10.
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var sph: SPH_Field

        /// SSPCLKOUT polarity, applicable to Motorola SPI frame format only. See Motorola SPI frame format on page 2-10.
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var spo: SPO_Field

        /// Frame format: 00 Motorola SPI frame format. 01 TI synchronous serial frame format. 10 National Microwire frame format. 11 Reserved, undefined operation.
        @ReadWrite(bits: 4..<6, as: BitField2.self)
        public var frf: FRF_Field

        /// Data Size Select: 0000 Reserved, undefined operation. 0001 Reserved, undefined operation. 0010 Reserved, undefined operation. 0011 4-bit data. 0100 5-bit data. 0101 6-bit data. 0110 7-bit data. 0111 8-bit data. 1000 9-bit data. 1001 10-bit data. 1010 11-bit data. 1011 12-bit data. 1100 13-bit data. 1101 14-bit data. 1110 15-bit data. 1111 16-bit data.
        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var dss: DSS_Field
    }

    /// Control register 1, SSPCR1 on page 3-5
    @RegisterBank(offset: 0x0004)
    public var sspcr1: Register<SSPCR1>

    @Register(bitWidth: 32)
    public struct SSPCR1 {
        /// Slave-mode output disable. This bit is relevant only in the slave mode, MS=1. In multiple-slave systems, it is possible for an PrimeCell SSP master to broadcast a message to all slaves in the system while ensuring that only one slave drives data onto its serial output line. In such systems the RXD lines from multiple slaves could be tied together. To operate in such systems, the SOD bit can be set if the PrimeCell SSP slave is not supposed to drive the SSPTXD line: 0 SSP can drive the SSPTXD output in slave mode. 1 SSP must not drive the SSPTXD output in slave mode.
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var sod: SOD_Field

        /// Master or slave mode select. This bit can be modified only when the PrimeCell SSP is disabled, SSE=0: 0 Device configured as master, default. 1 Device configured as slave.
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var ms: MS_Field

        /// Synchronous serial port enable: 0 SSP operation disabled. 1 SSP operation enabled.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var sse: SSE_Field

        /// Loop back mode: 0 Normal serial port operation enabled. 1 Output of transmit serial shifter is connected to input of receive serial shifter internally.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var lbm: LBM_Field
    }

    /// Data register, SSPDR on page 3-6
    @RegisterBank(offset: 0x0008)
    public var sspdr: Register<SSPDR>

    @Register(bitWidth: 32)
    public struct SSPDR {
        /// Transmit/Receive FIFO: Read Receive FIFO. Write Transmit FIFO. You must right-justify data when the PrimeCell SSP is programmed for a data size that is less than 16 bits. Unused bits at the top are ignored by transmit logic. The receive logic automatically right-justifies.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var data: DATA_Field
    }

    /// Status register, SSPSR on page 3-7
    @RegisterBank(offset: 0x000c)
    public var sspsr: Register<SSPSR>

    @Register(bitWidth: 32)
    public struct SSPSR {
        /// PrimeCell SSP busy flag, RO: 0 SSP is idle. 1 SSP is currently transmitting and/or receiving a frame or the transmit FIFO is not empty.
        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var bsy: BSY_Field

        /// Receive FIFO full, RO: 0 Receive FIFO is not full. 1 Receive FIFO is full.
        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var rff: RFF_Field

        /// Receive FIFO not empty, RO: 0 Receive FIFO is empty. 1 Receive FIFO is not empty.
        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var rne: RNE_Field

        /// Transmit FIFO not full, RO: 0 Transmit FIFO is full. 1 Transmit FIFO is not full.
        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var tnf: TNF_Field

        /// Transmit FIFO empty, RO: 0 Transmit FIFO is not empty. 1 Transmit FIFO is empty.
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var tfe: TFE_Field
    }

    /// Clock prescale register, SSPCPSR on page 3-8
    @RegisterBank(offset: 0x0010)
    public var sspcpsr: Register<SSPCPSR>

    @Register(bitWidth: 32)
    public struct SSPCPSR {
        /// Clock prescale divisor. Must be an even number from 2-254, depending on the frequency of SSPCLK. The least significant bit always returns zero on reads.
        @ReadWrite(bits: 0..<8, as: BitField8.self)
        public var cpsdvsr: CPSDVSR_Field
    }

    /// Interrupt mask set or clear register, SSPIMSC on page 3-9
    @RegisterBank(offset: 0x0014)
    public var sspimsc: Register<SSPIMSC>

    @Register(bitWidth: 32)
    public struct SSPIMSC {
        /// Transmit FIFO interrupt mask: 0 Transmit FIFO half empty or less condition interrupt is masked. 1 Transmit FIFO half empty or less condition interrupt is not masked.
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var txim: TXIM_Field

        /// Receive FIFO interrupt mask: 0 Receive FIFO half full or less condition interrupt is masked. 1 Receive FIFO half full or less condition interrupt is not masked.
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var rxim: RXIM_Field

        /// Receive timeout interrupt mask: 0 Receive FIFO not empty and no read prior to timeout period interrupt is masked. 1 Receive FIFO not empty and no read prior to timeout period interrupt is not masked.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var rtim: RTIM_Field

        /// Receive overrun interrupt mask: 0 Receive FIFO written to while full condition interrupt is masked. 1 Receive FIFO written to while full condition interrupt is not masked.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var rorim: RORIM_Field
    }

    /// Raw interrupt status register, SSPRIS on page 3-10
    @RegisterBank(offset: 0x0018)
    public var sspris: Register<SSPRIS>

    @Register(bitWidth: 32)
    public struct SSPRIS {
        /// Gives the raw interrupt state, prior to masking, of the SSPTXINTR interrupt
        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var txris: TXRIS_Field

        /// Gives the raw interrupt state, prior to masking, of the SSPRXINTR interrupt
        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var rxris: RXRIS_Field

        /// Gives the raw interrupt state, prior to masking, of the SSPRTINTR interrupt
        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var rtris: RTRIS_Field

        /// Gives the raw interrupt state, prior to masking, of the SSPRORINTR interrupt
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var rorris: RORRIS_Field
    }

    /// Masked interrupt status register, SSPMIS on page 3-11
    @RegisterBank(offset: 0x001c)
    public var sspmis: Register<SSPMIS>

    @Register(bitWidth: 32)
    public struct SSPMIS {
        /// Gives the transmit FIFO masked interrupt state, after masking, of the SSPTXINTR interrupt
        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var txmis: TXMIS_Field

        /// Gives the receive FIFO masked interrupt state, after masking, of the SSPRXINTR interrupt
        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var rxmis: RXMIS_Field

        /// Gives the receive timeout masked interrupt state, after masking, of the SSPRTINTR interrupt
        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var rtmis: RTMIS_Field

        /// Gives the receive over run masked interrupt status, after masking, of the SSPRORINTR interrupt
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var rormis: RORMIS_Field
    }

    /// Interrupt clear register, SSPICR on page 3-11
    @RegisterBank(offset: 0x0020)
    public var sspicr: Register<SSPICR>

    @Register(bitWidth: 32)
    public struct SSPICR {
        /// Clears the SSPRTINTR interrupt
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var rtic: RTIC_Field

        /// Clears the SSPRORINTR interrupt
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var roric: RORIC_Field
    }

    /// DMA control register, SSPDMACR on page 3-12
    @RegisterBank(offset: 0x0024)
    public var sspdmacr: Register<SSPDMACR>

    @Register(bitWidth: 32)
    public struct SSPDMACR {
        /// Transmit DMA Enable. If this bit is set to 1, DMA for the transmit FIFO is enabled.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var txdmae: TXDMAE_Field

        /// Receive DMA Enable. If this bit is set to 1, DMA for the receive FIFO is enabled.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var rxdmae: RXDMAE_Field
    }

    /// Peripheral identification registers, SSPPeriphID0-3 on page 3-13
    @RegisterBank(offset: 0x0fe0)
    public var sspperiphid0: Register<SSPPERIPHID0>

    @Register(bitWidth: 32)
    public struct SSPPERIPHID0 {
        /// These bits read back as 0x22
        @ReadOnly(bits: 0..<8, as: BitField8.self)
        public var partnumber0: PARTNUMBER0_Field
    }

    /// Peripheral identification registers, SSPPeriphID0-3 on page 3-13
    @RegisterBank(offset: 0x0fe4)
    public var sspperiphid1: Register<SSPPERIPHID1>

    @Register(bitWidth: 32)
    public struct SSPPERIPHID1 {
        /// These bits read back as 0x1
        @ReadOnly(bits: 4..<8, as: BitField4.self)
        public var designer0: DESIGNER0_Field

        /// These bits read back as 0x0
        @ReadOnly(bits: 0..<4, as: BitField4.self)
        public var partnumber1: PARTNUMBER1_Field
    }

    /// Peripheral identification registers, SSPPeriphID0-3 on page 3-13
    @RegisterBank(offset: 0x0fe8)
    public var sspperiphid2: Register<SSPPERIPHID2>

    @Register(bitWidth: 32)
    public struct SSPPERIPHID2 {
        /// These bits return the peripheral revision
        @ReadOnly(bits: 4..<8, as: BitField4.self)
        public var revision: REVISION_Field

        /// These bits read back as 0x4
        @ReadOnly(bits: 0..<4, as: BitField4.self)
        public var designer1: DESIGNER1_Field
    }

    /// Peripheral identification registers, SSPPeriphID0-3 on page 3-13
    @RegisterBank(offset: 0x0fec)
    public var sspperiphid3: Register<SSPPERIPHID3>

    @Register(bitWidth: 32)
    public struct SSPPERIPHID3 {
        /// These bits read back as 0x00
        @ReadOnly(bits: 0..<8, as: BitField8.self)
        public var configuration: CONFIGURATION_Field
    }

    /// PrimeCell identification registers, SSPPCellID0-3 on page 3-16
    @RegisterBank(offset: 0x0ff0)
    public var ssppcellid0: Register<SSPPCELLID0>

    @Register(bitWidth: 32)
    public struct SSPPCELLID0 {
        /// These bits read back as 0x0D
        @ReadOnly(bits: 0..<8, as: BitField8.self)
        public var ssppcellid0: SSPPCELLID0_Field
    }

    /// PrimeCell identification registers, SSPPCellID0-3 on page 3-16
    @RegisterBank(offset: 0x0ff4)
    public var ssppcellid1: Register<SSPPCELLID1>

    @Register(bitWidth: 32)
    public struct SSPPCELLID1 {
        /// These bits read back as 0xF0
        @ReadOnly(bits: 0..<8, as: BitField8.self)
        public var ssppcellid1: SSPPCELLID1_Field
    }

    /// PrimeCell identification registers, SSPPCellID0-3 on page 3-16
    @RegisterBank(offset: 0x0ff8)
    public var ssppcellid2: Register<SSPPCELLID2>

    @Register(bitWidth: 32)
    public struct SSPPCELLID2 {
        /// These bits read back as 0x05
        @ReadOnly(bits: 0..<8, as: BitField8.self)
        public var ssppcellid2: SSPPCELLID2_Field
    }

    /// PrimeCell identification registers, SSPPCellID0-3 on page 3-16
    @RegisterBank(offset: 0x0ffc)
    public var ssppcellid3: Register<SSPPCELLID3>

    @Register(bitWidth: 32)
    public struct SSPPCELLID3 {
        /// These bits read back as 0xB1
        @ReadOnly(bits: 0..<8, as: BitField8.self)
        public var ssppcellid3: SSPPCELLID3_Field
    }
}
