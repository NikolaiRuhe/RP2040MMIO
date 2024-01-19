import MMIO
import MMIOExtensions

@RegisterBank
public struct SPI1 {

    public static var `default`: Self { .init(unsafeAddress: 0x40040000) }

    /// Control register 0, SSPCR0 on page 3-4
    @RegisterBank(offset: 0x0000)
    public var SSPCR0: Register<SSPCR0_Descriptor>


    @Register(bitWidth: 32)
    public struct SSPCR0_Descriptor {
        /// Serial clock rate. The value SCR is used to generate the transmit and receive bit rate of the PrimeCell SSP. The bit rate is: F SSPCLK CPSDVSR x (1+SCR) where CPSDVSR is an even value from 2-254, programmed through the SSPCPSR register and SCR is a value from 0-255.
        @ReadWrite(bits: 8..<16, as: BitField8.self)
        public var SCR: SCR_Field

        /// SSPCLKOUT phase, applicable to Motorola SPI frame format only. See Motorola SPI frame format on page 2-10.
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var SPH: SPH_Field

        /// SSPCLKOUT polarity, applicable to Motorola SPI frame format only. See Motorola SPI frame format on page 2-10.
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var SPO: SPO_Field

        /// Frame format: 00 Motorola SPI frame format. 01 TI synchronous serial frame format. 10 National Microwire frame format. 11 Reserved, undefined operation.
        @ReadWrite(bits: 4..<6, as: BitField2.self)
        public var FRF: FRF_Field

        /// Data Size Select: 0000 Reserved, undefined operation. 0001 Reserved, undefined operation. 0010 Reserved, undefined operation. 0011 4-bit data. 0100 5-bit data. 0101 6-bit data. 0110 7-bit data. 0111 8-bit data. 1000 9-bit data. 1001 10-bit data. 1010 11-bit data. 1011 12-bit data. 1100 13-bit data. 1101 14-bit data. 1110 15-bit data. 1111 16-bit data.
        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var DSS: DSS_Field
    }

    /// Control register 1, SSPCR1 on page 3-5
    @RegisterBank(offset: 0x0004)
    public var SSPCR1: Register<SSPCR1_Descriptor>


    @Register(bitWidth: 32)
    public struct SSPCR1_Descriptor {
        /// Slave-mode output disable. This bit is relevant only in the slave mode, MS=1. In multiple-slave systems, it is possible for an PrimeCell SSP master to broadcast a message to all slaves in the system while ensuring that only one slave drives data onto its serial output line. In such systems the RXD lines from multiple slaves could be tied together. To operate in such systems, the SOD bit can be set if the PrimeCell SSP slave is not supposed to drive the SSPTXD line: 0 SSP can drive the SSPTXD output in slave mode. 1 SSP must not drive the SSPTXD output in slave mode.
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var SOD: SOD_Field

        /// Master or slave mode select. This bit can be modified only when the PrimeCell SSP is disabled, SSE=0: 0 Device configured as master, default. 1 Device configured as slave.
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var MS: MS_Field

        /// Synchronous serial port enable: 0 SSP operation disabled. 1 SSP operation enabled.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SSE: SSE_Field

        /// Loop back mode: 0 Normal serial port operation enabled. 1 Output of transmit serial shifter is connected to input of receive serial shifter internally.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var LBM: LBM_Field
    }

    /// Data register, SSPDR on page 3-6
    @RegisterBank(offset: 0x0008)
    public var SSPDR: Register<SSPDR_Descriptor>


    @Register(bitWidth: 32)
    public struct SSPDR_Descriptor {
        /// Transmit/Receive FIFO: Read Receive FIFO. Write Transmit FIFO. You must right-justify data when the PrimeCell SSP is programmed for a data size that is less than 16 bits. Unused bits at the top are ignored by transmit logic. The receive logic automatically right-justifies.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var DATA: DATA_Field
    }

    /// Status register, SSPSR on page 3-7
    @RegisterBank(offset: 0x000c)
    public var SSPSR: Register<SSPSR_Descriptor>


    @Register(bitWidth: 32)
    public struct SSPSR_Descriptor {
        /// PrimeCell SSP busy flag, RO: 0 SSP is idle. 1 SSP is currently transmitting and/or receiving a frame or the transmit FIFO is not empty.
        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var BSY: BSY_Field

        /// Receive FIFO full, RO: 0 Receive FIFO is not full. 1 Receive FIFO is full.
        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var RFF: RFF_Field

        /// Receive FIFO not empty, RO: 0 Receive FIFO is empty. 1 Receive FIFO is not empty.
        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var RNE: RNE_Field

        /// Transmit FIFO not full, RO: 0 Transmit FIFO is full. 1 Transmit FIFO is not full.
        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var TNF: TNF_Field

        /// Transmit FIFO empty, RO: 0 Transmit FIFO is not empty. 1 Transmit FIFO is empty.
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var TFE: TFE_Field
    }

    /// Clock prescale register, SSPCPSR on page 3-8
    @RegisterBank(offset: 0x0010)
    public var SSPCPSR: Register<SSPCPSR_Descriptor>


    @Register(bitWidth: 32)
    public struct SSPCPSR_Descriptor {
        /// Clock prescale divisor. Must be an even number from 2-254, depending on the frequency of SSPCLK. The least significant bit always returns zero on reads.
        @ReadWrite(bits: 0..<8, as: BitField8.self)
        public var CPSDVSR: CPSDVSR_Field
    }

    /// Interrupt mask set or clear register, SSPIMSC on page 3-9
    @RegisterBank(offset: 0x0014)
    public var SSPIMSC: Register<SSPIMSC_Descriptor>


    @Register(bitWidth: 32)
    public struct SSPIMSC_Descriptor {
        /// Transmit FIFO interrupt mask: 0 Transmit FIFO half empty or less condition interrupt is masked. 1 Transmit FIFO half empty or less condition interrupt is not masked.
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var TXIM: TXIM_Field

        /// Receive FIFO interrupt mask: 0 Receive FIFO half full or less condition interrupt is masked. 1 Receive FIFO half full or less condition interrupt is not masked.
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var RXIM: RXIM_Field

        /// Receive timeout interrupt mask: 0 Receive FIFO not empty and no read prior to timeout period interrupt is masked. 1 Receive FIFO not empty and no read prior to timeout period interrupt is not masked.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var RTIM: RTIM_Field

        /// Receive overrun interrupt mask: 0 Receive FIFO written to while full condition interrupt is masked. 1 Receive FIFO written to while full condition interrupt is not masked.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var RORIM: RORIM_Field
    }

    /// Raw interrupt status register, SSPRIS on page 3-10
    @RegisterBank(offset: 0x0018)
    public var SSPRIS: Register<SSPRIS_Descriptor>


    @Register(bitWidth: 32)
    public struct SSPRIS_Descriptor {
        /// Gives the raw interrupt state, prior to masking, of the SSPTXINTR interrupt
        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var TXRIS: TXRIS_Field

        /// Gives the raw interrupt state, prior to masking, of the SSPRXINTR interrupt
        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var RXRIS: RXRIS_Field

        /// Gives the raw interrupt state, prior to masking, of the SSPRTINTR interrupt
        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var RTRIS: RTRIS_Field

        /// Gives the raw interrupt state, prior to masking, of the SSPRORINTR interrupt
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var RORRIS: RORRIS_Field
    }

    /// Masked interrupt status register, SSPMIS on page 3-11
    @RegisterBank(offset: 0x001c)
    public var SSPMIS: Register<SSPMIS_Descriptor>


    @Register(bitWidth: 32)
    public struct SSPMIS_Descriptor {
        /// Gives the transmit FIFO masked interrupt state, after masking, of the SSPTXINTR interrupt
        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var TXMIS: TXMIS_Field

        /// Gives the receive FIFO masked interrupt state, after masking, of the SSPRXINTR interrupt
        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var RXMIS: RXMIS_Field

        /// Gives the receive timeout masked interrupt state, after masking, of the SSPRTINTR interrupt
        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var RTMIS: RTMIS_Field

        /// Gives the receive over run masked interrupt status, after masking, of the SSPRORINTR interrupt
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var RORMIS: RORMIS_Field
    }

    /// Interrupt clear register, SSPICR on page 3-11
    @RegisterBank(offset: 0x0020)
    public var SSPICR: Register<SSPICR_Descriptor>


    @Register(bitWidth: 32)
    public struct SSPICR_Descriptor {
        /// Clears the SSPRTINTR interrupt
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var RTIC: RTIC_Field

        /// Clears the SSPRORINTR interrupt
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var RORIC: RORIC_Field
    }

    /// DMA control register, SSPDMACR on page 3-12
    @RegisterBank(offset: 0x0024)
    public var SSPDMACR: Register<SSPDMACR_Descriptor>


    @Register(bitWidth: 32)
    public struct SSPDMACR_Descriptor {
        /// Transmit DMA Enable. If this bit is set to 1, DMA for the transmit FIFO is enabled.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var TXDMAE: TXDMAE_Field

        /// Receive DMA Enable. If this bit is set to 1, DMA for the receive FIFO is enabled.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var RXDMAE: RXDMAE_Field
    }

    /// Peripheral identification registers, SSPPeriphID0-3 on page 3-13
    @RegisterBank(offset: 0x0fe0)
    public var SSPPERIPHID0: Register<SSPPERIPHID0_Descriptor>


    @Register(bitWidth: 32)
    public struct SSPPERIPHID0_Descriptor {
        /// These bits read back as 0x22
        @ReadOnly(bits: 0..<8, as: BitField8.self)
        public var PARTNUMBER0: PARTNUMBER0_Field
    }

    /// Peripheral identification registers, SSPPeriphID0-3 on page 3-13
    @RegisterBank(offset: 0x0fe4)
    public var SSPPERIPHID1: Register<SSPPERIPHID1_Descriptor>


    @Register(bitWidth: 32)
    public struct SSPPERIPHID1_Descriptor {
        /// These bits read back as 0x1
        @ReadOnly(bits: 4..<8, as: BitField4.self)
        public var DESIGNER0: DESIGNER0_Field

        /// These bits read back as 0x0
        @ReadOnly(bits: 0..<4, as: BitField4.self)
        public var PARTNUMBER1: PARTNUMBER1_Field
    }

    /// Peripheral identification registers, SSPPeriphID0-3 on page 3-13
    @RegisterBank(offset: 0x0fe8)
    public var SSPPERIPHID2: Register<SSPPERIPHID2_Descriptor>


    @Register(bitWidth: 32)
    public struct SSPPERIPHID2_Descriptor {
        /// These bits return the peripheral revision
        @ReadOnly(bits: 4..<8, as: BitField4.self)
        public var REVISION: REVISION_Field

        /// These bits read back as 0x4
        @ReadOnly(bits: 0..<4, as: BitField4.self)
        public var DESIGNER1: DESIGNER1_Field
    }

    /// Peripheral identification registers, SSPPeriphID0-3 on page 3-13
    @RegisterBank(offset: 0x0fec)
    public var SSPPERIPHID3: Register<SSPPERIPHID3_Descriptor>


    @Register(bitWidth: 32)
    public struct SSPPERIPHID3_Descriptor {
        /// These bits read back as 0x00
        @ReadOnly(bits: 0..<8, as: BitField8.self)
        public var CONFIGURATION: CONFIGURATION_Field
    }

    /// PrimeCell identification registers, SSPPCellID0-3 on page 3-16
    @RegisterBank(offset: 0x0ff0)
    public var SSPPCELLID0: Register<SSPPCELLID0_Descriptor>


    @Register(bitWidth: 32)
    public struct SSPPCELLID0_Descriptor {
        /// These bits read back as 0x0D
        @ReadOnly(bits: 0..<8, as: BitField8.self)
        public var SSPPCELLID0: SSPPCELLID0_Field
    }

    /// PrimeCell identification registers, SSPPCellID0-3 on page 3-16
    @RegisterBank(offset: 0x0ff4)
    public var SSPPCELLID1: Register<SSPPCELLID1_Descriptor>


    @Register(bitWidth: 32)
    public struct SSPPCELLID1_Descriptor {
        /// These bits read back as 0xF0
        @ReadOnly(bits: 0..<8, as: BitField8.self)
        public var SSPPCELLID1: SSPPCELLID1_Field
    }

    /// PrimeCell identification registers, SSPPCellID0-3 on page 3-16
    @RegisterBank(offset: 0x0ff8)
    public var SSPPCELLID2: Register<SSPPCELLID2_Descriptor>


    @Register(bitWidth: 32)
    public struct SSPPCELLID2_Descriptor {
        /// These bits read back as 0x05
        @ReadOnly(bits: 0..<8, as: BitField8.self)
        public var SSPPCELLID2: SSPPCELLID2_Field
    }

    /// PrimeCell identification registers, SSPPCellID0-3 on page 3-16
    @RegisterBank(offset: 0x0ffc)
    public var SSPPCELLID3: Register<SSPPCELLID3_Descriptor>


    @Register(bitWidth: 32)
    public struct SSPPCELLID3_Descriptor {
        /// These bits read back as 0xB1
        @ReadOnly(bits: 0..<8, as: BitField8.self)
        public var SSPPCELLID3: SSPPCELLID3_Field
    }
}
