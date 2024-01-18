import MMIO
import MMIOExtensions

@RegisterBank
public struct UART0 {

    public static var `default`: Self { .init(unsafeAddress: 0x40034000) }

    /// Data Register, UARTDR
    @RegisterBank(offset: 0x0000)
    public var uartdr: Register<UARTDR>

    @Register(bitWidth: 32)
    public struct UARTDR {
        /// Overrun error. This bit is set to 1 if data is received and the receive FIFO is already full. This is cleared to 0 once there is an empty space in the FIFO and a new character can be written to it.
        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var oe: OE_Field

        /// Break error. This bit is set to 1 if a break condition was detected, indicating that the received data input was held LOW for longer than a full-word transmission time (defined as start, data, parity and stop bits). In FIFO mode, this error is associated with the character at the top of the FIFO. When a break occurs, only one 0 character is loaded into the FIFO. The next character is only enabled after the receive data input goes to a 1 (marking state), and the next valid start bit is received.
        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var be: BE_Field

        /// Parity error. When set to 1, it indicates that the parity of the received data character does not match the parity that the EPS and SPS bits in the Line Control Register, UARTLCR_H. In FIFO mode, this error is associated with the character at the top of the FIFO.
        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var pe: PE_Field

        /// Framing error. When set to 1, it indicates that the received character did not have a valid stop bit (a valid stop bit is 1). In FIFO mode, this error is associated with the character at the top of the FIFO.
        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var fe: FE_Field

        /// Receive (read) data character. Transmit (write) data character.
        @ReadWrite(bits: 0..<8, as: BitField8.self)
        public var data: DATA_Field
    }

    /// Receive Status Register/Error Clear Register, UARTRSR/UARTECR
    @RegisterBank(offset: 0x0004)
    public var uartrsr: Register<UARTRSR>

    @Register(bitWidth: 32)
    public struct UARTRSR {
        /// Overrun error. This bit is set to 1 if data is received and the FIFO is already full. This bit is cleared to 0 by a write to UARTECR. The FIFO contents remain valid because no more data is written when the FIFO is full, only the contents of the shift register are overwritten. The CPU must now read the data, to empty the FIFO.
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var oe: OE_Field

        /// Break error. This bit is set to 1 if a break condition was detected, indicating that the received data input was held LOW for longer than a full-word transmission time (defined as start, data, parity, and stop bits). This bit is cleared to 0 after a write to UARTECR. In FIFO mode, this error is associated with the character at the top of the FIFO. When a break occurs, only one 0 character is loaded into the FIFO. The next character is only enabled after the receive data input goes to a 1 (marking state) and the next valid start bit is received.
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var be: BE_Field

        /// Parity error. When set to 1, it indicates that the parity of the received data character does not match the parity that the EPS and SPS bits in the Line Control Register, UARTLCR_H. This bit is cleared to 0 by a write to UARTECR. In FIFO mode, this error is associated with the character at the top of the FIFO.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var pe: PE_Field

        /// Framing error. When set to 1, it indicates that the received character did not have a valid stop bit (a valid stop bit is 1). This bit is cleared to 0 by a write to UARTECR. In FIFO mode, this error is associated with the character at the top of the FIFO.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var fe: FE_Field
    }

    /// Flag Register, UARTFR
    @RegisterBank(offset: 0x0018)
    public var uartfr: Register<UARTFR>

    @Register(bitWidth: 32)
    public struct UARTFR {
        /// Ring indicator. This bit is the complement of the UART ring indicator, nUARTRI, modem status input. That is, the bit is 1 when nUARTRI is LOW.
        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var ri: RI_Field

        /// Transmit FIFO empty. The meaning of this bit depends on the state of the FEN bit in the Line Control Register, UARTLCR_H. If the FIFO is disabled, this bit is set when the transmit holding register is empty. If the FIFO is enabled, the TXFE bit is set when the transmit FIFO is empty. This bit does not indicate if there is data in the transmit shift register.
        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var txfe: TXFE_Field

        /// Receive FIFO full. The meaning of this bit depends on the state of the FEN bit in the UARTLCR_H Register. If the FIFO is disabled, this bit is set when the receive holding register is full. If the FIFO is enabled, the RXFF bit is set when the receive FIFO is full.
        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var rxff: RXFF_Field

        /// Transmit FIFO full. The meaning of this bit depends on the state of the FEN bit in the UARTLCR_H Register. If the FIFO is disabled, this bit is set when the transmit holding register is full. If the FIFO is enabled, the TXFF bit is set when the transmit FIFO is full.
        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var txff: TXFF_Field

        /// Receive FIFO empty. The meaning of this bit depends on the state of the FEN bit in the UARTLCR_H Register. If the FIFO is disabled, this bit is set when the receive holding register is empty. If the FIFO is enabled, the RXFE bit is set when the receive FIFO is empty.
        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var rxfe: RXFE_Field

        /// UART busy. If this bit is set to 1, the UART is busy transmitting data. This bit remains set until the complete byte, including all the stop bits, has been sent from the shift register. This bit is set as soon as the transmit FIFO becomes non-empty, regardless of whether the UART is enabled or not.
        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var busy: BUSY_Field

        /// Data carrier detect. This bit is the complement of the UART data carrier detect, nUARTDCD, modem status input. That is, the bit is 1 when nUARTDCD is LOW.
        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var dcd: DCD_Field

        /// Data set ready. This bit is the complement of the UART data set ready, nUARTDSR, modem status input. That is, the bit is 1 when nUARTDSR is LOW.
        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var dsr: DSR_Field

        /// Clear to send. This bit is the complement of the UART clear to send, nUARTCTS, modem status input. That is, the bit is 1 when nUARTCTS is LOW.
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var cts: CTS_Field
    }

    /// IrDA Low-Power Counter Register, UARTILPR
    @RegisterBank(offset: 0x0020)
    public var uartilpr: Register<UARTILPR>

    @Register(bitWidth: 32)
    public struct UARTILPR {
        /// 8-bit low-power divisor value. These bits are cleared to 0 at reset.
        @ReadWrite(bits: 0..<8, as: BitField8.self)
        public var ilpdvsr: ILPDVSR_Field
    }

    /// Integer Baud Rate Register, UARTIBRD
    @RegisterBank(offset: 0x0024)
    public var uartibrd: Register<UARTIBRD>

    @Register(bitWidth: 32)
    public struct UARTIBRD {
        /// The integer baud rate divisor. These bits are cleared to 0 on reset.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var baud_divint: BAUD_DIVINT_Field
    }

    /// Fractional Baud Rate Register, UARTFBRD
    @RegisterBank(offset: 0x0028)
    public var uartfbrd: Register<UARTFBRD>

    @Register(bitWidth: 32)
    public struct UARTFBRD {
        /// The fractional baud rate divisor. These bits are cleared to 0 on reset.
        @ReadWrite(bits: 0..<6, as: BitField6.self)
        public var baud_divfrac: BAUD_DIVFRAC_Field
    }

    /// Line Control Register, UARTLCR_H
    @RegisterBank(offset: 0x002c)
    public var uartlcr_h: Register<UARTLCR_H>

    @Register(bitWidth: 32)
    public struct UARTLCR_H {
        /// Stick parity select. 0 = stick parity is disabled 1 = either: * if the EPS bit is 0 then the parity bit is transmitted and checked as a 1 * if the EPS bit is 1 then the parity bit is transmitted and checked as a 0. This bit has no effect when the PEN bit disables parity checking and generation.
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var sps: SPS_Field

        /// Word length. These bits indicate the number of data bits transmitted or received in a frame as follows: b11 = 8 bits b10 = 7 bits b01 = 6 bits b00 = 5 bits.
        @ReadWrite(bits: 5..<7, as: BitField2.self)
        public var wlen: WLEN_Field

        /// Enable FIFOs: 0 = FIFOs are disabled (character mode) that is, the FIFOs become 1-byte-deep holding registers 1 = transmit and receive FIFO buffers are enabled (FIFO mode).
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var fen: FEN_Field

        /// Two stop bits select. If this bit is set to 1, two stop bits are transmitted at the end of the frame. The receive logic does not check for two stop bits being received.
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var stp2: STP2_Field

        /// Even parity select. Controls the type of parity the UART uses during transmission and reception: 0 = odd parity. The UART generates or checks for an odd number of 1s in the data and parity bits. 1 = even parity. The UART generates or checks for an even number of 1s in the data and parity bits. This bit has no effect when the PEN bit disables parity checking and generation.
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var eps: EPS_Field

        /// Parity enable: 0 = parity is disabled and no parity bit added to the data frame 1 = parity checking and generation is enabled.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var pen: PEN_Field

        /// Send break. If this bit is set to 1, a low-level is continually output on the UARTTXD output, after completing transmission of the current character. For the proper execution of the break command, the software must set this bit for at least two complete frames. For normal use, this bit must be cleared to 0.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var brk: BRK_Field
    }

    /// Control Register, UARTCR
    @RegisterBank(offset: 0x0030)
    public var uartcr: Register<UARTCR>

    @Register(bitWidth: 32)
    public struct UARTCR {
        /// CTS hardware flow control enable. If this bit is set to 1, CTS hardware flow control is enabled. Data is only transmitted when the nUARTCTS signal is asserted.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var ctsen: CTSEN_Field

        /// RTS hardware flow control enable. If this bit is set to 1, RTS hardware flow control is enabled. Data is only requested when there is space in the receive FIFO for it to be received.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var rtsen: RTSEN_Field

        /// This bit is the complement of the UART Out2 (nUARTOut2) modem status output. That is, when the bit is programmed to a 1, the output is 0. For DTE this can be used as Ring Indicator (RI).
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var out2: OUT2_Field

        /// This bit is the complement of the UART Out1 (nUARTOut1) modem status output. That is, when the bit is programmed to a 1 the output is 0. For DTE this can be used as Data Carrier Detect (DCD).
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var out1: OUT1_Field

        /// Request to send. This bit is the complement of the UART request to send, nUARTRTS, modem status output. That is, when the bit is programmed to a 1 then nUARTRTS is LOW.
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var rts: RTS_Field

        /// Data transmit ready. This bit is the complement of the UART data transmit ready, nUARTDTR, modem status output. That is, when the bit is programmed to a 1 then nUARTDTR is LOW.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var dtr: DTR_Field

        /// Receive enable. If this bit is set to 1, the receive section of the UART is enabled. Data reception occurs for either UART signals or SIR signals depending on the setting of the SIREN bit. When the UART is disabled in the middle of reception, it completes the current character before stopping.
        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var rxe: RXE_Field

        /// Transmit enable. If this bit is set to 1, the transmit section of the UART is enabled. Data transmission occurs for either UART signals, or SIR signals depending on the setting of the SIREN bit. When the UART is disabled in the middle of transmission, it completes the current character before stopping.
        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var txe: TXE_Field

        /// Loopback enable. If this bit is set to 1 and the SIREN bit is set to 1 and the SIRTEST bit in the Test Control Register, UARTTCR is set to 1, then the nSIROUT path is inverted, and fed through to the SIRIN path. The SIRTEST bit in the test register must be set to 1 to override the normal half-duplex SIR operation. This must be the requirement for accessing the test registers during normal operation, and SIRTEST must be cleared to 0 when loopback testing is finished. This feature reduces the amount of external coupling required during system test. If this bit is set to 1, and the SIRTEST bit is set to 0, the UARTTXD path is fed through to the UARTRXD path. In either SIR mode or UART mode, when this bit is set, the modem outputs are also fed through to the modem inputs. This bit is cleared to 0 on reset, to disable loopback.
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var lbe: LBE_Field

        /// SIR low-power IrDA mode. This bit selects the IrDA encoding mode. If this bit is cleared to 0, low-level bits are transmitted as an active high pulse with a width of 3 / 16th of the bit period. If this bit is set to 1, low-level bits are transmitted with a pulse width that is 3 times the period of the IrLPBaud16 input signal, regardless of the selected bit rate. Setting this bit uses less power, but might reduce transmission distances.
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var sirlp: SIRLP_Field

        /// SIR enable: 0 = IrDA SIR ENDEC is disabled. nSIROUT remains LOW (no light pulse generated), and signal transitions on SIRIN have no effect. 1 = IrDA SIR ENDEC is enabled. Data is transmitted and received on nSIROUT and SIRIN. UARTTXD remains HIGH, in the marking state. Signal transitions on UARTRXD or modem status inputs have no effect. This bit has no effect if the UARTEN bit disables the UART.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var siren: SIREN_Field

        /// UART enable: 0 = UART is disabled. If the UART is disabled in the middle of transmission or reception, it completes the current character before stopping. 1 = the UART is enabled. Data transmission and reception occurs for either UART signals or SIR signals depending on the setting of the SIREN bit.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var uarten: UARTEN_Field
    }

    /// Interrupt FIFO Level Select Register, UARTIFLS
    @RegisterBank(offset: 0x0034)
    public var uartifls: Register<UARTIFLS>

    @Register(bitWidth: 32)
    public struct UARTIFLS {
        /// Receive interrupt FIFO level select. The trigger points for the receive interrupt are as follows: b000 = Receive FIFO becomes >= 1 / 8 full b001 = Receive FIFO becomes >= 1 / 4 full b010 = Receive FIFO becomes >= 1 / 2 full b011 = Receive FIFO becomes >= 3 / 4 full b100 = Receive FIFO becomes >= 7 / 8 full b101-b111 = reserved.
        @ReadWrite(bits: 3..<6, as: BitField3.self)
        public var rxiflsel: RXIFLSEL_Field

        /// Transmit interrupt FIFO level select. The trigger points for the transmit interrupt are as follows: b000 = Transmit FIFO becomes <= 1 / 8 full b001 = Transmit FIFO becomes <= 1 / 4 full b010 = Transmit FIFO becomes <= 1 / 2 full b011 = Transmit FIFO becomes <= 3 / 4 full b100 = Transmit FIFO becomes <= 7 / 8 full b101-b111 = reserved.
        @ReadWrite(bits: 0..<3, as: BitField3.self)
        public var txiflsel: TXIFLSEL_Field
    }

    /// Interrupt Mask Set/Clear Register, UARTIMSC
    @RegisterBank(offset: 0x0038)
    public var uartimsc: Register<UARTIMSC>

    @Register(bitWidth: 32)
    public struct UARTIMSC {
        /// Overrun error interrupt mask. A read returns the current mask for the UARTOEINTR interrupt. On a write of 1, the mask of the UARTOEINTR interrupt is set. A write of 0 clears the mask.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var oeim: OEIM_Field

        /// Break error interrupt mask. A read returns the current mask for the UARTBEINTR interrupt. On a write of 1, the mask of the UARTBEINTR interrupt is set. A write of 0 clears the mask.
        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var beim: BEIM_Field

        /// Parity error interrupt mask. A read returns the current mask for the UARTPEINTR interrupt. On a write of 1, the mask of the UARTPEINTR interrupt is set. A write of 0 clears the mask.
        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var peim: PEIM_Field

        /// Framing error interrupt mask. A read returns the current mask for the UARTFEINTR interrupt. On a write of 1, the mask of the UARTFEINTR interrupt is set. A write of 0 clears the mask.
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var feim: FEIM_Field

        /// Receive timeout interrupt mask. A read returns the current mask for the UARTRTINTR interrupt. On a write of 1, the mask of the UARTRTINTR interrupt is set. A write of 0 clears the mask.
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var rtim: RTIM_Field

        /// Transmit interrupt mask. A read returns the current mask for the UARTTXINTR interrupt. On a write of 1, the mask of the UARTTXINTR interrupt is set. A write of 0 clears the mask.
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var txim: TXIM_Field

        /// Receive interrupt mask. A read returns the current mask for the UARTRXINTR interrupt. On a write of 1, the mask of the UARTRXINTR interrupt is set. A write of 0 clears the mask.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var rxim: RXIM_Field

        /// nUARTDSR modem interrupt mask. A read returns the current mask for the UARTDSRINTR interrupt. On a write of 1, the mask of the UARTDSRINTR interrupt is set. A write of 0 clears the mask.
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var dsrmim: DSRMIM_Field

        /// nUARTDCD modem interrupt mask. A read returns the current mask for the UARTDCDINTR interrupt. On a write of 1, the mask of the UARTDCDINTR interrupt is set. A write of 0 clears the mask.
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var dcdmim: DCDMIM_Field

        /// nUARTCTS modem interrupt mask. A read returns the current mask for the UARTCTSINTR interrupt. On a write of 1, the mask of the UARTCTSINTR interrupt is set. A write of 0 clears the mask.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var ctsmim: CTSMIM_Field

        /// nUARTRI modem interrupt mask. A read returns the current mask for the UARTRIINTR interrupt. On a write of 1, the mask of the UARTRIINTR interrupt is set. A write of 0 clears the mask.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var rimim: RIMIM_Field
    }

    /// Raw Interrupt Status Register, UARTRIS
    @RegisterBank(offset: 0x003c)
    public var uartris: Register<UARTRIS>

    @Register(bitWidth: 32)
    public struct UARTRIS {
        /// Overrun error interrupt status. Returns the raw interrupt state of the UARTOEINTR interrupt.
        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var oeris: OERIS_Field

        /// Break error interrupt status. Returns the raw interrupt state of the UARTBEINTR interrupt.
        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var beris: BERIS_Field

        /// Parity error interrupt status. Returns the raw interrupt state of the UARTPEINTR interrupt.
        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var peris: PERIS_Field

        /// Framing error interrupt status. Returns the raw interrupt state of the UARTFEINTR interrupt.
        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var feris: FERIS_Field

        /// Receive timeout interrupt status. Returns the raw interrupt state of the UARTRTINTR interrupt. a
        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var rtris: RTRIS_Field

        /// Transmit interrupt status. Returns the raw interrupt state of the UARTTXINTR interrupt.
        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var txris: TXRIS_Field

        /// Receive interrupt status. Returns the raw interrupt state of the UARTRXINTR interrupt.
        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var rxris: RXRIS_Field

        /// nUARTDSR modem interrupt status. Returns the raw interrupt state of the UARTDSRINTR interrupt.
        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var dsrrmis: DSRRMIS_Field

        /// nUARTDCD modem interrupt status. Returns the raw interrupt state of the UARTDCDINTR interrupt.
        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var dcdrmis: DCDRMIS_Field

        /// nUARTCTS modem interrupt status. Returns the raw interrupt state of the UARTCTSINTR interrupt.
        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var ctsrmis: CTSRMIS_Field

        /// nUARTRI modem interrupt status. Returns the raw interrupt state of the UARTRIINTR interrupt.
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var rirmis: RIRMIS_Field
    }

    /// Masked Interrupt Status Register, UARTMIS
    @RegisterBank(offset: 0x0040)
    public var uartmis: Register<UARTMIS>

    @Register(bitWidth: 32)
    public struct UARTMIS {
        /// Overrun error masked interrupt status. Returns the masked interrupt state of the UARTOEINTR interrupt.
        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var oemis: OEMIS_Field

        /// Break error masked interrupt status. Returns the masked interrupt state of the UARTBEINTR interrupt.
        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var bemis: BEMIS_Field

        /// Parity error masked interrupt status. Returns the masked interrupt state of the UARTPEINTR interrupt.
        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var pemis: PEMIS_Field

        /// Framing error masked interrupt status. Returns the masked interrupt state of the UARTFEINTR interrupt.
        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var femis: FEMIS_Field

        /// Receive timeout masked interrupt status. Returns the masked interrupt state of the UARTRTINTR interrupt.
        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var rtmis: RTMIS_Field

        /// Transmit masked interrupt status. Returns the masked interrupt state of the UARTTXINTR interrupt.
        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var txmis: TXMIS_Field

        /// Receive masked interrupt status. Returns the masked interrupt state of the UARTRXINTR interrupt.
        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var rxmis: RXMIS_Field

        /// nUARTDSR modem masked interrupt status. Returns the masked interrupt state of the UARTDSRINTR interrupt.
        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var dsrmmis: DSRMMIS_Field

        /// nUARTDCD modem masked interrupt status. Returns the masked interrupt state of the UARTDCDINTR interrupt.
        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var dcdmmis: DCDMMIS_Field

        /// nUARTCTS modem masked interrupt status. Returns the masked interrupt state of the UARTCTSINTR interrupt.
        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var ctsmmis: CTSMMIS_Field

        /// nUARTRI modem masked interrupt status. Returns the masked interrupt state of the UARTRIINTR interrupt.
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var rimmis: RIMMIS_Field
    }

    /// Interrupt Clear Register, UARTICR
    @RegisterBank(offset: 0x0044)
    public var uarticr: Register<UARTICR>

    @Register(bitWidth: 32)
    public struct UARTICR {
        /// Overrun error interrupt clear. Clears the UARTOEINTR interrupt.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var oeic: OEIC_Field

        /// Break error interrupt clear. Clears the UARTBEINTR interrupt.
        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var beic: BEIC_Field

        /// Parity error interrupt clear. Clears the UARTPEINTR interrupt.
        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var peic: PEIC_Field

        /// Framing error interrupt clear. Clears the UARTFEINTR interrupt.
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var feic: FEIC_Field

        /// Receive timeout interrupt clear. Clears the UARTRTINTR interrupt.
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var rtic: RTIC_Field

        /// Transmit interrupt clear. Clears the UARTTXINTR interrupt.
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var txic: TXIC_Field

        /// Receive interrupt clear. Clears the UARTRXINTR interrupt.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var rxic: RXIC_Field

        /// nUARTDSR modem interrupt clear. Clears the UARTDSRINTR interrupt.
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var dsrmic: DSRMIC_Field

        /// nUARTDCD modem interrupt clear. Clears the UARTDCDINTR interrupt.
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var dcdmic: DCDMIC_Field

        /// nUARTCTS modem interrupt clear. Clears the UARTCTSINTR interrupt.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var ctsmic: CTSMIC_Field

        /// nUARTRI modem interrupt clear. Clears the UARTRIINTR interrupt.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var rimic: RIMIC_Field
    }

    /// DMA Control Register, UARTDMACR
    @RegisterBank(offset: 0x0048)
    public var uartdmacr: Register<UARTDMACR>

    @Register(bitWidth: 32)
    public struct UARTDMACR {
        /// DMA on error. If this bit is set to 1, the DMA receive request outputs, UARTRXDMASREQ or UARTRXDMABREQ, are disabled when the UART error interrupt is asserted.
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var dmaonerr: DMAONERR_Field

        /// Transmit DMA enable. If this bit is set to 1, DMA for the transmit FIFO is enabled.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var txdmae: TXDMAE_Field

        /// Receive DMA enable. If this bit is set to 1, DMA for the receive FIFO is enabled.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var rxdmae: RXDMAE_Field
    }

    /// UARTPeriphID0 Register
    @RegisterBank(offset: 0x0fe0)
    public var uartperiphid0: Register<UARTPERIPHID0>

    @Register(bitWidth: 32)
    public struct UARTPERIPHID0 {
        /// These bits read back as 0x11
        @ReadOnly(bits: 0..<8, as: BitField8.self)
        public var partnumber0: PARTNUMBER0_Field
    }

    /// UARTPeriphID1 Register
    @RegisterBank(offset: 0x0fe4)
    public var uartperiphid1: Register<UARTPERIPHID1>

    @Register(bitWidth: 32)
    public struct UARTPERIPHID1 {
        /// These bits read back as 0x1
        @ReadOnly(bits: 4..<8, as: BitField4.self)
        public var designer0: DESIGNER0_Field

        /// These bits read back as 0x0
        @ReadOnly(bits: 0..<4, as: BitField4.self)
        public var partnumber1: PARTNUMBER1_Field
    }

    /// UARTPeriphID2 Register
    @RegisterBank(offset: 0x0fe8)
    public var uartperiphid2: Register<UARTPERIPHID2>

    @Register(bitWidth: 32)
    public struct UARTPERIPHID2 {
        /// This field depends on the revision of the UART: r1p0 0x0 r1p1 0x1 r1p3 0x2 r1p4 0x2 r1p5 0x3
        @ReadOnly(bits: 4..<8, as: BitField4.self)
        public var revision: REVISION_Field

        /// These bits read back as 0x4
        @ReadOnly(bits: 0..<4, as: BitField4.self)
        public var designer1: DESIGNER1_Field
    }

    /// UARTPeriphID3 Register
    @RegisterBank(offset: 0x0fec)
    public var uartperiphid3: Register<UARTPERIPHID3>

    @Register(bitWidth: 32)
    public struct UARTPERIPHID3 {
        /// These bits read back as 0x00
        @ReadOnly(bits: 0..<8, as: BitField8.self)
        public var configuration: CONFIGURATION_Field
    }

    /// UARTPCellID0 Register
    @RegisterBank(offset: 0x0ff0)
    public var uartpcellid0: Register<UARTPCELLID0>

    @Register(bitWidth: 32)
    public struct UARTPCELLID0 {
        /// These bits read back as 0x0D
        @ReadOnly(bits: 0..<8, as: BitField8.self)
        public var uartpcellid0: UARTPCELLID0_Field
    }

    /// UARTPCellID1 Register
    @RegisterBank(offset: 0x0ff4)
    public var uartpcellid1: Register<UARTPCELLID1>

    @Register(bitWidth: 32)
    public struct UARTPCELLID1 {
        /// These bits read back as 0xF0
        @ReadOnly(bits: 0..<8, as: BitField8.self)
        public var uartpcellid1: UARTPCELLID1_Field
    }

    /// UARTPCellID2 Register
    @RegisterBank(offset: 0x0ff8)
    public var uartpcellid2: Register<UARTPCELLID2>

    @Register(bitWidth: 32)
    public struct UARTPCELLID2 {
        /// These bits read back as 0x05
        @ReadOnly(bits: 0..<8, as: BitField8.self)
        public var uartpcellid2: UARTPCELLID2_Field
    }

    /// UARTPCellID3 Register
    @RegisterBank(offset: 0x0ffc)
    public var uartpcellid3: Register<UARTPCELLID3>

    @Register(bitWidth: 32)
    public struct UARTPCELLID3 {
        /// These bits read back as 0xB1
        @ReadOnly(bits: 0..<8, as: BitField8.self)
        public var uartpcellid3: UARTPCELLID3_Field
    }
}
