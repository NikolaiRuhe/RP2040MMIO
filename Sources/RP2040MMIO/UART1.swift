import MMIO
import MMIOExtensions

@RegisterBank
public struct UART1 {

    public static var `default`: Self { .init(unsafeAddress: 0x40038000) }

    /// Data Register, UARTDR
    @RegisterBank(offset: 0x0000)
    public var UARTDR: Register<UARTDR_Descriptor>


    @Register(bitWidth: 32)
    public struct UARTDR_Descriptor {
        /// Overrun error. This bit is set to 1 if data is received and the receive FIFO is already full. This is cleared to 0 once there is an empty space in the FIFO and a new character can be written to it.
        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var OE: OE_Field

        /// Break error. This bit is set to 1 if a break condition was detected, indicating that the received data input was held LOW for longer than a full-word transmission time (defined as start, data, parity and stop bits). In FIFO mode, this error is associated with the character at the top of the FIFO. When a break occurs, only one 0 character is loaded into the FIFO. The next character is only enabled after the receive data input goes to a 1 (marking state), and the next valid start bit is received.
        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var BE: BE_Field

        /// Parity error. When set to 1, it indicates that the parity of the received data character does not match the parity that the EPS and SPS bits in the Line Control Register, UARTLCR_H. In FIFO mode, this error is associated with the character at the top of the FIFO.
        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var PE: PE_Field

        /// Framing error. When set to 1, it indicates that the received character did not have a valid stop bit (a valid stop bit is 1). In FIFO mode, this error is associated with the character at the top of the FIFO.
        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var FE: FE_Field

        /// Receive (read) data character. Transmit (write) data character.
        @ReadWrite(bits: 0..<8, as: BitField8.self)
        public var DATA: DATA_Field
    }

    /// Receive Status Register/Error Clear Register, UARTRSR/UARTECR
    @RegisterBank(offset: 0x0004)
    public var UARTRSR: Register<UARTRSR_Descriptor>


    @Register(bitWidth: 32)
    public struct UARTRSR_Descriptor {
        /// Overrun error. This bit is set to 1 if data is received and the FIFO is already full. This bit is cleared to 0 by a write to UARTECR. The FIFO contents remain valid because no more data is written when the FIFO is full, only the contents of the shift register are overwritten. The CPU must now read the data, to empty the FIFO.
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var OE: OE_Field

        /// Break error. This bit is set to 1 if a break condition was detected, indicating that the received data input was held LOW for longer than a full-word transmission time (defined as start, data, parity, and stop bits). This bit is cleared to 0 after a write to UARTECR. In FIFO mode, this error is associated with the character at the top of the FIFO. When a break occurs, only one 0 character is loaded into the FIFO. The next character is only enabled after the receive data input goes to a 1 (marking state) and the next valid start bit is received.
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var BE: BE_Field

        /// Parity error. When set to 1, it indicates that the parity of the received data character does not match the parity that the EPS and SPS bits in the Line Control Register, UARTLCR_H. This bit is cleared to 0 by a write to UARTECR. In FIFO mode, this error is associated with the character at the top of the FIFO.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var PE: PE_Field

        /// Framing error. When set to 1, it indicates that the received character did not have a valid stop bit (a valid stop bit is 1). This bit is cleared to 0 by a write to UARTECR. In FIFO mode, this error is associated with the character at the top of the FIFO.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var FE: FE_Field
    }

    /// Flag Register, UARTFR
    @RegisterBank(offset: 0x0018)
    public var UARTFR: Register<UARTFR_Descriptor>


    @Register(bitWidth: 32)
    public struct UARTFR_Descriptor {
        /// Ring indicator. This bit is the complement of the UART ring indicator, nUARTRI, modem status input. That is, the bit is 1 when nUARTRI is LOW.
        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var RI: RI_Field

        /// Transmit FIFO empty. The meaning of this bit depends on the state of the FEN bit in the Line Control Register, UARTLCR_H. If the FIFO is disabled, this bit is set when the transmit holding register is empty. If the FIFO is enabled, the TXFE bit is set when the transmit FIFO is empty. This bit does not indicate if there is data in the transmit shift register.
        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var TXFE: TXFE_Field

        /// Receive FIFO full. The meaning of this bit depends on the state of the FEN bit in the UARTLCR_H Register. If the FIFO is disabled, this bit is set when the receive holding register is full. If the FIFO is enabled, the RXFF bit is set when the receive FIFO is full.
        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var RXFF: RXFF_Field

        /// Transmit FIFO full. The meaning of this bit depends on the state of the FEN bit in the UARTLCR_H Register. If the FIFO is disabled, this bit is set when the transmit holding register is full. If the FIFO is enabled, the TXFF bit is set when the transmit FIFO is full.
        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var TXFF: TXFF_Field

        /// Receive FIFO empty. The meaning of this bit depends on the state of the FEN bit in the UARTLCR_H Register. If the FIFO is disabled, this bit is set when the receive holding register is empty. If the FIFO is enabled, the RXFE bit is set when the receive FIFO is empty.
        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var RXFE: RXFE_Field

        /// UART busy. If this bit is set to 1, the UART is busy transmitting data. This bit remains set until the complete byte, including all the stop bits, has been sent from the shift register. This bit is set as soon as the transmit FIFO becomes non-empty, regardless of whether the UART is enabled or not.
        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var BUSY: BUSY_Field

        /// Data carrier detect. This bit is the complement of the UART data carrier detect, nUARTDCD, modem status input. That is, the bit is 1 when nUARTDCD is LOW.
        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var DCD: DCD_Field

        /// Data set ready. This bit is the complement of the UART data set ready, nUARTDSR, modem status input. That is, the bit is 1 when nUARTDSR is LOW.
        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var DSR: DSR_Field

        /// Clear to send. This bit is the complement of the UART clear to send, nUARTCTS, modem status input. That is, the bit is 1 when nUARTCTS is LOW.
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var CTS: CTS_Field
    }

    /// IrDA Low-Power Counter Register, UARTILPR
    @RegisterBank(offset: 0x0020)
    public var UARTILPR: Register<UARTILPR_Descriptor>


    @Register(bitWidth: 32)
    public struct UARTILPR_Descriptor {
        /// 8-bit low-power divisor value. These bits are cleared to 0 at reset.
        @ReadWrite(bits: 0..<8, as: BitField8.self)
        public var ILPDVSR: ILPDVSR_Field
    }

    /// Integer Baud Rate Register, UARTIBRD
    @RegisterBank(offset: 0x0024)
    public var UARTIBRD: Register<UARTIBRD_Descriptor>


    @Register(bitWidth: 32)
    public struct UARTIBRD_Descriptor {
        /// The integer baud rate divisor. These bits are cleared to 0 on reset.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var BAUD_DIVINT: BAUD_DIVINT_Field
    }

    /// Fractional Baud Rate Register, UARTFBRD
    @RegisterBank(offset: 0x0028)
    public var UARTFBRD: Register<UARTFBRD_Descriptor>


    @Register(bitWidth: 32)
    public struct UARTFBRD_Descriptor {
        /// The fractional baud rate divisor. These bits are cleared to 0 on reset.
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var BAUD_DIVFRAC: BAUD_DIVFRAC_Field
    }

    /// Line Control Register, UARTLCR_H
    @RegisterBank(offset: 0x002c)
    public var UARTLCR_H: Register<UARTLCR_H_Descriptor>


    @Register(bitWidth: 32)
    public struct UARTLCR_H_Descriptor {
        /// Stick parity select. 0 = stick parity is disabled 1 = either: * if the EPS bit is 0 then the parity bit is transmitted and checked as a 1 * if the EPS bit is 1 then the parity bit is transmitted and checked as a 0. This bit has no effect when the PEN bit disables parity checking and generation.
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var SPS: SPS_Field

        /// Word length. These bits indicate the number of data bits transmitted or received in a frame as follows: b11 = 8 bits b10 = 7 bits b01 = 6 bits b00 = 5 bits.
        @ReadWrite(bits: 5..<7, as: BitField2.self)
        public var WLEN: WLEN_Field

        /// Enable FIFOs: 0 = FIFOs are disabled (character mode) that is, the FIFOs become 1-byte-deep holding registers 1 = transmit and receive FIFO buffers are enabled (FIFO mode).
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var FEN: FEN_Field

        /// Two stop bits select. If this bit is set to 1, two stop bits are transmitted at the end of the frame. The receive logic does not check for two stop bits being received.
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var STP2: STP2_Field

        /// Even parity select. Controls the type of parity the UART uses during transmission and reception: 0 = odd parity. The UART generates or checks for an odd number of 1s in the data and parity bits. 1 = even parity. The UART generates or checks for an even number of 1s in the data and parity bits. This bit has no effect when the PEN bit disables parity checking and generation.
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var EPS: EPS_Field

        /// Parity enable: 0 = parity is disabled and no parity bit added to the data frame 1 = parity checking and generation is enabled.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var PEN: PEN_Field

        /// Send break. If this bit is set to 1, a low-level is continually output on the UARTTXD output, after completing transmission of the current character. For the proper execution of the break command, the software must set this bit for at least two complete frames. For normal use, this bit must be cleared to 0.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var BRK: BRK_Field
    }

    /// Control Register, UARTCR
    @RegisterBank(offset: 0x0030)
    public var UARTCR: Register<UARTCR_Descriptor>


    @Register(bitWidth: 32)
    public struct UARTCR_Descriptor {
        /// CTS hardware flow control enable. If this bit is set to 1, CTS hardware flow control is enabled. Data is only transmitted when the nUARTCTS signal is asserted.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var CTSEN: CTSEN_Field

        /// RTS hardware flow control enable. If this bit is set to 1, RTS hardware flow control is enabled. Data is only requested when there is space in the receive FIFO for it to be received.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var RTSEN: RTSEN_Field

        /// This bit is the complement of the UART Out2 (nUARTOut2) modem status output. That is, when the bit is programmed to a 1, the output is 0. For DTE this can be used as Ring Indicator (RI).
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var OUT2: OUT2_Field

        /// This bit is the complement of the UART Out1 (nUARTOut1) modem status output. That is, when the bit is programmed to a 1 the output is 0. For DTE this can be used as Data Carrier Detect (DCD).
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var OUT1: OUT1_Field

        /// Request to send. This bit is the complement of the UART request to send, nUARTRTS, modem status output. That is, when the bit is programmed to a 1 then nUARTRTS is LOW.
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var RTS: RTS_Field

        /// Data transmit ready. This bit is the complement of the UART data transmit ready, nUARTDTR, modem status output. That is, when the bit is programmed to a 1 then nUARTDTR is LOW.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var DTR: DTR_Field

        /// Receive enable. If this bit is set to 1, the receive section of the UART is enabled. Data reception occurs for either UART signals or SIR signals depending on the setting of the SIREN bit. When the UART is disabled in the middle of reception, it completes the current character before stopping.
        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var RXE: RXE_Field

        /// Transmit enable. If this bit is set to 1, the transmit section of the UART is enabled. Data transmission occurs for either UART signals, or SIR signals depending on the setting of the SIREN bit. When the UART is disabled in the middle of transmission, it completes the current character before stopping.
        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var TXE: TXE_Field

        /// Loopback enable. If this bit is set to 1 and the SIREN bit is set to 1 and the SIRTEST bit in the Test Control Register, UARTTCR is set to 1, then the nSIROUT path is inverted, and fed through to the SIRIN path. The SIRTEST bit in the test register must be set to 1 to override the normal half-duplex SIR operation. This must be the requirement for accessing the test registers during normal operation, and SIRTEST must be cleared to 0 when loopback testing is finished. This feature reduces the amount of external coupling required during system test. If this bit is set to 1, and the SIRTEST bit is set to 0, the UARTTXD path is fed through to the UARTRXD path. In either SIR mode or UART mode, when this bit is set, the modem outputs are also fed through to the modem inputs. This bit is cleared to 0 on reset, to disable loopback.
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var LBE: LBE_Field

        /// SIR low-power IrDA mode. This bit selects the IrDA encoding mode. If this bit is cleared to 0, low-level bits are transmitted as an active high pulse with a width of 3 / 16th of the bit period. If this bit is set to 1, low-level bits are transmitted with a pulse width that is 3 times the period of the IrLPBaud16 input signal, regardless of the selected bit rate. Setting this bit uses less power, but might reduce transmission distances.
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var SIRLP: SIRLP_Field

        /// SIR enable: 0 = IrDA SIR ENDEC is disabled. nSIROUT remains LOW (no light pulse generated), and signal transitions on SIRIN have no effect. 1 = IrDA SIR ENDEC is enabled. Data is transmitted and received on nSIROUT and SIRIN. UARTTXD remains HIGH, in the marking state. Signal transitions on UARTRXD or modem status inputs have no effect. This bit has no effect if the UARTEN bit disables the UART.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SIREN: SIREN_Field

        /// UART enable: 0 = UART is disabled. If the UART is disabled in the middle of transmission or reception, it completes the current character before stopping. 1 = the UART is enabled. Data transmission and reception occurs for either UART signals or SIR signals depending on the setting of the SIREN bit.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var UARTEN: UARTEN_Field
    }

    /// Interrupt FIFO Level Select Register, UARTIFLS
    @RegisterBank(offset: 0x0034)
    public var UARTIFLS: Register<UARTIFLS_Descriptor>


    @Register(bitWidth: 32)
    public struct UARTIFLS_Descriptor {
        /// Receive interrupt FIFO level select. The trigger points for the receive interrupt are as follows: b000 = Receive FIFO becomes >= 1 / 8 full b001 = Receive FIFO becomes >= 1 / 4 full b010 = Receive FIFO becomes >= 1 / 2 full b011 = Receive FIFO becomes >= 3 / 4 full b100 = Receive FIFO becomes >= 7 / 8 full b101-b111 = reserved.
        @ReadWrite(bits: 3..<6, as: BitField3.self)
        public var RXIFLSEL: RXIFLSEL_Field

        /// Transmit interrupt FIFO level select. The trigger points for the transmit interrupt are as follows: b000 = Transmit FIFO becomes <= 1 / 8 full b001 = Transmit FIFO becomes <= 1 / 4 full b010 = Transmit FIFO becomes <= 1 / 2 full b011 = Transmit FIFO becomes <= 3 / 4 full b100 = Transmit FIFO becomes <= 7 / 8 full b101-b111 = reserved.
        @ReadWrite(bits: 0..<3, as: BitField3.self)
        public var TXIFLSEL: TXIFLSEL_Field
    }

    /// Interrupt Mask Set/Clear Register, UARTIMSC
    @RegisterBank(offset: 0x0038)
    public var UARTIMSC: Register<UARTIMSC_Descriptor>


    @Register(bitWidth: 32)
    public struct UARTIMSC_Descriptor {
        /// Overrun error interrupt mask. A read returns the current mask for the UARTOEINTR interrupt. On a write of 1, the mask of the UARTOEINTR interrupt is set. A write of 0 clears the mask.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var OEIM: OEIM_Field

        /// Break error interrupt mask. A read returns the current mask for the UARTBEINTR interrupt. On a write of 1, the mask of the UARTBEINTR interrupt is set. A write of 0 clears the mask.
        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var BEIM: BEIM_Field

        /// Parity error interrupt mask. A read returns the current mask for the UARTPEINTR interrupt. On a write of 1, the mask of the UARTPEINTR interrupt is set. A write of 0 clears the mask.
        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var PEIM: PEIM_Field

        /// Framing error interrupt mask. A read returns the current mask for the UARTFEINTR interrupt. On a write of 1, the mask of the UARTFEINTR interrupt is set. A write of 0 clears the mask.
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var FEIM: FEIM_Field

        /// Receive timeout interrupt mask. A read returns the current mask for the UARTRTINTR interrupt. On a write of 1, the mask of the UARTRTINTR interrupt is set. A write of 0 clears the mask.
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var RTIM: RTIM_Field

        /// Transmit interrupt mask. A read returns the current mask for the UARTTXINTR interrupt. On a write of 1, the mask of the UARTTXINTR interrupt is set. A write of 0 clears the mask.
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var TXIM: TXIM_Field

        /// Receive interrupt mask. A read returns the current mask for the UARTRXINTR interrupt. On a write of 1, the mask of the UARTRXINTR interrupt is set. A write of 0 clears the mask.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var RXIM: RXIM_Field

        /// nUARTDSR modem interrupt mask. A read returns the current mask for the UARTDSRINTR interrupt. On a write of 1, the mask of the UARTDSRINTR interrupt is set. A write of 0 clears the mask.
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var DSRMIM: DSRMIM_Field

        /// nUARTDCD modem interrupt mask. A read returns the current mask for the UARTDCDINTR interrupt. On a write of 1, the mask of the UARTDCDINTR interrupt is set. A write of 0 clears the mask.
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var DCDMIM: DCDMIM_Field

        /// nUARTCTS modem interrupt mask. A read returns the current mask for the UARTCTSINTR interrupt. On a write of 1, the mask of the UARTCTSINTR interrupt is set. A write of 0 clears the mask.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var CTSMIM: CTSMIM_Field

        /// nUARTRI modem interrupt mask. A read returns the current mask for the UARTRIINTR interrupt. On a write of 1, the mask of the UARTRIINTR interrupt is set. A write of 0 clears the mask.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var RIMIM: RIMIM_Field
    }

    /// Raw Interrupt Status Register, UARTRIS
    @RegisterBank(offset: 0x003c)
    public var UARTRIS: Register<UARTRIS_Descriptor>


    @Register(bitWidth: 32)
    public struct UARTRIS_Descriptor {
        /// Overrun error interrupt status. Returns the raw interrupt state of the UARTOEINTR interrupt.
        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var OERIS: OERIS_Field

        /// Break error interrupt status. Returns the raw interrupt state of the UARTBEINTR interrupt.
        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var BERIS: BERIS_Field

        /// Parity error interrupt status. Returns the raw interrupt state of the UARTPEINTR interrupt.
        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var PERIS: PERIS_Field

        /// Framing error interrupt status. Returns the raw interrupt state of the UARTFEINTR interrupt.
        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var FERIS: FERIS_Field

        /// Receive timeout interrupt status. Returns the raw interrupt state of the UARTRTINTR interrupt. a
        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var RTRIS: RTRIS_Field

        /// Transmit interrupt status. Returns the raw interrupt state of the UARTTXINTR interrupt.
        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var TXRIS: TXRIS_Field

        /// Receive interrupt status. Returns the raw interrupt state of the UARTRXINTR interrupt.
        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var RXRIS: RXRIS_Field

        /// nUARTDSR modem interrupt status. Returns the raw interrupt state of the UARTDSRINTR interrupt.
        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var DSRRMIS: DSRRMIS_Field

        /// nUARTDCD modem interrupt status. Returns the raw interrupt state of the UARTDCDINTR interrupt.
        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var DCDRMIS: DCDRMIS_Field

        /// nUARTCTS modem interrupt status. Returns the raw interrupt state of the UARTCTSINTR interrupt.
        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var CTSRMIS: CTSRMIS_Field

        /// nUARTRI modem interrupt status. Returns the raw interrupt state of the UARTRIINTR interrupt.
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var RIRMIS: RIRMIS_Field
    }

    /// Masked Interrupt Status Register, UARTMIS
    @RegisterBank(offset: 0x0040)
    public var UARTMIS: Register<UARTMIS_Descriptor>


    @Register(bitWidth: 32)
    public struct UARTMIS_Descriptor {
        /// Overrun error masked interrupt status. Returns the masked interrupt state of the UARTOEINTR interrupt.
        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var OEMIS: OEMIS_Field

        /// Break error masked interrupt status. Returns the masked interrupt state of the UARTBEINTR interrupt.
        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var BEMIS: BEMIS_Field

        /// Parity error masked interrupt status. Returns the masked interrupt state of the UARTPEINTR interrupt.
        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var PEMIS: PEMIS_Field

        /// Framing error masked interrupt status. Returns the masked interrupt state of the UARTFEINTR interrupt.
        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var FEMIS: FEMIS_Field

        /// Receive timeout masked interrupt status. Returns the masked interrupt state of the UARTRTINTR interrupt.
        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var RTMIS: RTMIS_Field

        /// Transmit masked interrupt status. Returns the masked interrupt state of the UARTTXINTR interrupt.
        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var TXMIS: TXMIS_Field

        /// Receive masked interrupt status. Returns the masked interrupt state of the UARTRXINTR interrupt.
        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var RXMIS: RXMIS_Field

        /// nUARTDSR modem masked interrupt status. Returns the masked interrupt state of the UARTDSRINTR interrupt.
        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var DSRMMIS: DSRMMIS_Field

        /// nUARTDCD modem masked interrupt status. Returns the masked interrupt state of the UARTDCDINTR interrupt.
        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var DCDMMIS: DCDMMIS_Field

        /// nUARTCTS modem masked interrupt status. Returns the masked interrupt state of the UARTCTSINTR interrupt.
        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var CTSMMIS: CTSMMIS_Field

        /// nUARTRI modem masked interrupt status. Returns the masked interrupt state of the UARTRIINTR interrupt.
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var RIMMIS: RIMMIS_Field
    }

    /// Interrupt Clear Register, UARTICR
    @RegisterBank(offset: 0x0044)
    public var UARTICR: Register<UARTICR_Descriptor>


    @Register(bitWidth: 32)
    public struct UARTICR_Descriptor {
        /// Overrun error interrupt clear. Clears the UARTOEINTR interrupt.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var OEIC: OEIC_Field

        /// Break error interrupt clear. Clears the UARTBEINTR interrupt.
        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var BEIC: BEIC_Field

        /// Parity error interrupt clear. Clears the UARTPEINTR interrupt.
        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var PEIC: PEIC_Field

        /// Framing error interrupt clear. Clears the UARTFEINTR interrupt.
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var FEIC: FEIC_Field

        /// Receive timeout interrupt clear. Clears the UARTRTINTR interrupt.
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var RTIC: RTIC_Field

        /// Transmit interrupt clear. Clears the UARTTXINTR interrupt.
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var TXIC: TXIC_Field

        /// Receive interrupt clear. Clears the UARTRXINTR interrupt.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var RXIC: RXIC_Field

        /// nUARTDSR modem interrupt clear. Clears the UARTDSRINTR interrupt.
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var DSRMIC: DSRMIC_Field

        /// nUARTDCD modem interrupt clear. Clears the UARTDCDINTR interrupt.
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var DCDMIC: DCDMIC_Field

        /// nUARTCTS modem interrupt clear. Clears the UARTCTSINTR interrupt.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var CTSMIC: CTSMIC_Field

        /// nUARTRI modem interrupt clear. Clears the UARTRIINTR interrupt.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var RIMIC: RIMIC_Field
    }

    /// DMA Control Register, UARTDMACR
    @RegisterBank(offset: 0x0048)
    public var UARTDMACR: Register<UARTDMACR_Descriptor>


    @Register(bitWidth: 32)
    public struct UARTDMACR_Descriptor {
        /// DMA on error. If this bit is set to 1, the DMA receive request outputs, UARTRXDMASREQ or UARTRXDMABREQ, are disabled when the UART error interrupt is asserted.
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var DMAONERR: DMAONERR_Field

        /// Transmit DMA enable. If this bit is set to 1, DMA for the transmit FIFO is enabled.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var TXDMAE: TXDMAE_Field

        /// Receive DMA enable. If this bit is set to 1, DMA for the receive FIFO is enabled.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var RXDMAE: RXDMAE_Field
    }

    /// UARTPeriphID0 Register
    @RegisterBank(offset: 0x0fe0)
    public var UARTPERIPHID0: Register<UARTPERIPHID0_Descriptor>


    @Register(bitWidth: 32)
    public struct UARTPERIPHID0_Descriptor {
        /// These bits read back as 0x11
        @ReadOnly(bits: 0..<8, as: BitField8.self)
        public var PARTNUMBER0: PARTNUMBER0_Field
    }

    /// UARTPeriphID1 Register
    @RegisterBank(offset: 0x0fe4)
    public var UARTPERIPHID1: Register<UARTPERIPHID1_Descriptor>


    @Register(bitWidth: 32)
    public struct UARTPERIPHID1_Descriptor {
        /// These bits read back as 0x1
        @ReadOnly(bits: 4..<8, as: BitField4.self)
        public var DESIGNER0: DESIGNER0_Field

        /// These bits read back as 0x0
        @ReadOnly(bits: 0..<4, as: BitField4.self)
        public var PARTNUMBER1: PARTNUMBER1_Field
    }

    /// UARTPeriphID2 Register
    @RegisterBank(offset: 0x0fe8)
    public var UARTPERIPHID2: Register<UARTPERIPHID2_Descriptor>


    @Register(bitWidth: 32)
    public struct UARTPERIPHID2_Descriptor {
        /// This field depends on the revision of the UART: r1p0 0x0 r1p1 0x1 r1p3 0x2 r1p4 0x2 r1p5 0x3
        @ReadOnly(bits: 4..<8, as: BitField4.self)
        public var REVISION: REVISION_Field

        /// These bits read back as 0x4
        @ReadOnly(bits: 0..<4, as: BitField4.self)
        public var DESIGNER1: DESIGNER1_Field
    }

    /// UARTPeriphID3 Register
    @RegisterBank(offset: 0x0fec)
    public var UARTPERIPHID3: Register<UARTPERIPHID3_Descriptor>


    @Register(bitWidth: 32)
    public struct UARTPERIPHID3_Descriptor {
        /// These bits read back as 0x00
        @ReadOnly(bits: 0..<8, as: BitField8.self)
        public var CONFIGURATION: CONFIGURATION_Field
    }

    /// UARTPCellID0 Register
    @RegisterBank(offset: 0x0ff0)
    public var UARTPCELLID0: Register<UARTPCELLID0_Descriptor>


    @Register(bitWidth: 32)
    public struct UARTPCELLID0_Descriptor {
        /// These bits read back as 0x0D
        @ReadOnly(bits: 0..<8, as: BitField8.self)
        public var UARTPCELLID0: UARTPCELLID0_Field
    }

    /// UARTPCellID1 Register
    @RegisterBank(offset: 0x0ff4)
    public var UARTPCELLID1: Register<UARTPCELLID1_Descriptor>


    @Register(bitWidth: 32)
    public struct UARTPCELLID1_Descriptor {
        /// These bits read back as 0xF0
        @ReadOnly(bits: 0..<8, as: BitField8.self)
        public var UARTPCELLID1: UARTPCELLID1_Field
    }

    /// UARTPCellID2 Register
    @RegisterBank(offset: 0x0ff8)
    public var UARTPCELLID2: Register<UARTPCELLID2_Descriptor>


    @Register(bitWidth: 32)
    public struct UARTPCELLID2_Descriptor {
        /// These bits read back as 0x05
        @ReadOnly(bits: 0..<8, as: BitField8.self)
        public var UARTPCELLID2: UARTPCELLID2_Field
    }

    /// UARTPCellID3 Register
    @RegisterBank(offset: 0x0ffc)
    public var UARTPCELLID3: Register<UARTPCELLID3_Descriptor>


    @Register(bitWidth: 32)
    public struct UARTPCELLID3_Descriptor {
        /// These bits read back as 0xB1
        @ReadOnly(bits: 0..<8, as: BitField8.self)
        public var UARTPCELLID3: UARTPCELLID3_Field
    }
}
