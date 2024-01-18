import MMIO
import MMIOExtensions

/// USB FS/LS controller device registers
@RegisterBank
public struct USBCTRL_REGS {

    public static var `default`: Self { .init(unsafeAddress: 0x50110000) }

    /// Device address and endpoint control
    @RegisterBank(offset: 0x0000)
    public var addr_endp: Register<ADDR_ENDP>

    @Register(bitWidth: 32)
    public struct ADDR_ENDP {
        /// Device endpoint to send data to. Only valid for HOST mode.
        @ReadWrite(bits: 16..<20, as: BitField4.self)
        public var endpoint: ENDPOINT_Field

        /// In device mode, the address that the device should respond to. Set in response to a SET_ADDR setup packet from the host. In host mode set to the address of the device to communicate with.
        @ReadWrite(bits: 0..<7, as: BitField7.self)
        public var address: ADDRESS_Field
    }

    /// Interrupt endpoint 1. Only valid for HOST mode.
    @RegisterBank(offset: 0x0004)
    public var addr_endp1: Register<ADDR_ENDP1>

    @Register(bitWidth: 32)
    public struct ADDR_ENDP1 {
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var intep_preamble: INTEP_PREAMBLE_Field

        /// Direction of the interrupt endpoint. In=0, Out=1
        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var intep_dir: INTEP_DIR_Field

        /// Endpoint number of the interrupt endpoint
        @ReadWrite(bits: 16..<20, as: BitField4.self)
        public var endpoint: ENDPOINT_Field

        /// Device address
        @ReadWrite(bits: 0..<7, as: BitField7.self)
        public var address: ADDRESS_Field
    }

    /// Interrupt endpoint 2. Only valid for HOST mode.
    @RegisterBank(offset: 0x0008)
    public var addr_endp2: Register<ADDR_ENDP2>

    @Register(bitWidth: 32)
    public struct ADDR_ENDP2 {
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var intep_preamble: INTEP_PREAMBLE_Field

        /// Direction of the interrupt endpoint. In=0, Out=1
        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var intep_dir: INTEP_DIR_Field

        /// Endpoint number of the interrupt endpoint
        @ReadWrite(bits: 16..<20, as: BitField4.self)
        public var endpoint: ENDPOINT_Field

        /// Device address
        @ReadWrite(bits: 0..<7, as: BitField7.self)
        public var address: ADDRESS_Field
    }

    /// Interrupt endpoint 3. Only valid for HOST mode.
    @RegisterBank(offset: 0x000c)
    public var addr_endp3: Register<ADDR_ENDP3>

    @Register(bitWidth: 32)
    public struct ADDR_ENDP3 {
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var intep_preamble: INTEP_PREAMBLE_Field

        /// Direction of the interrupt endpoint. In=0, Out=1
        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var intep_dir: INTEP_DIR_Field

        /// Endpoint number of the interrupt endpoint
        @ReadWrite(bits: 16..<20, as: BitField4.self)
        public var endpoint: ENDPOINT_Field

        /// Device address
        @ReadWrite(bits: 0..<7, as: BitField7.self)
        public var address: ADDRESS_Field
    }

    /// Interrupt endpoint 4. Only valid for HOST mode.
    @RegisterBank(offset: 0x0010)
    public var addr_endp4: Register<ADDR_ENDP4>

    @Register(bitWidth: 32)
    public struct ADDR_ENDP4 {
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var intep_preamble: INTEP_PREAMBLE_Field

        /// Direction of the interrupt endpoint. In=0, Out=1
        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var intep_dir: INTEP_DIR_Field

        /// Endpoint number of the interrupt endpoint
        @ReadWrite(bits: 16..<20, as: BitField4.self)
        public var endpoint: ENDPOINT_Field

        /// Device address
        @ReadWrite(bits: 0..<7, as: BitField7.self)
        public var address: ADDRESS_Field
    }

    /// Interrupt endpoint 5. Only valid for HOST mode.
    @RegisterBank(offset: 0x0014)
    public var addr_endp5: Register<ADDR_ENDP5>

    @Register(bitWidth: 32)
    public struct ADDR_ENDP5 {
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var intep_preamble: INTEP_PREAMBLE_Field

        /// Direction of the interrupt endpoint. In=0, Out=1
        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var intep_dir: INTEP_DIR_Field

        /// Endpoint number of the interrupt endpoint
        @ReadWrite(bits: 16..<20, as: BitField4.self)
        public var endpoint: ENDPOINT_Field

        /// Device address
        @ReadWrite(bits: 0..<7, as: BitField7.self)
        public var address: ADDRESS_Field
    }

    /// Interrupt endpoint 6. Only valid for HOST mode.
    @RegisterBank(offset: 0x0018)
    public var addr_endp6: Register<ADDR_ENDP6>

    @Register(bitWidth: 32)
    public struct ADDR_ENDP6 {
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var intep_preamble: INTEP_PREAMBLE_Field

        /// Direction of the interrupt endpoint. In=0, Out=1
        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var intep_dir: INTEP_DIR_Field

        /// Endpoint number of the interrupt endpoint
        @ReadWrite(bits: 16..<20, as: BitField4.self)
        public var endpoint: ENDPOINT_Field

        /// Device address
        @ReadWrite(bits: 0..<7, as: BitField7.self)
        public var address: ADDRESS_Field
    }

    /// Interrupt endpoint 7. Only valid for HOST mode.
    @RegisterBank(offset: 0x001c)
    public var addr_endp7: Register<ADDR_ENDP7>

    @Register(bitWidth: 32)
    public struct ADDR_ENDP7 {
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var intep_preamble: INTEP_PREAMBLE_Field

        /// Direction of the interrupt endpoint. In=0, Out=1
        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var intep_dir: INTEP_DIR_Field

        /// Endpoint number of the interrupt endpoint
        @ReadWrite(bits: 16..<20, as: BitField4.self)
        public var endpoint: ENDPOINT_Field

        /// Device address
        @ReadWrite(bits: 0..<7, as: BitField7.self)
        public var address: ADDRESS_Field
    }

    /// Interrupt endpoint 8. Only valid for HOST mode.
    @RegisterBank(offset: 0x0020)
    public var addr_endp8: Register<ADDR_ENDP8>

    @Register(bitWidth: 32)
    public struct ADDR_ENDP8 {
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var intep_preamble: INTEP_PREAMBLE_Field

        /// Direction of the interrupt endpoint. In=0, Out=1
        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var intep_dir: INTEP_DIR_Field

        /// Endpoint number of the interrupt endpoint
        @ReadWrite(bits: 16..<20, as: BitField4.self)
        public var endpoint: ENDPOINT_Field

        /// Device address
        @ReadWrite(bits: 0..<7, as: BitField7.self)
        public var address: ADDRESS_Field
    }

    /// Interrupt endpoint 9. Only valid for HOST mode.
    @RegisterBank(offset: 0x0024)
    public var addr_endp9: Register<ADDR_ENDP9>

    @Register(bitWidth: 32)
    public struct ADDR_ENDP9 {
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var intep_preamble: INTEP_PREAMBLE_Field

        /// Direction of the interrupt endpoint. In=0, Out=1
        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var intep_dir: INTEP_DIR_Field

        /// Endpoint number of the interrupt endpoint
        @ReadWrite(bits: 16..<20, as: BitField4.self)
        public var endpoint: ENDPOINT_Field

        /// Device address
        @ReadWrite(bits: 0..<7, as: BitField7.self)
        public var address: ADDRESS_Field
    }

    /// Interrupt endpoint 10. Only valid for HOST mode.
    @RegisterBank(offset: 0x0028)
    public var addr_endp10: Register<ADDR_ENDP10>

    @Register(bitWidth: 32)
    public struct ADDR_ENDP10 {
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var intep_preamble: INTEP_PREAMBLE_Field

        /// Direction of the interrupt endpoint. In=0, Out=1
        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var intep_dir: INTEP_DIR_Field

        /// Endpoint number of the interrupt endpoint
        @ReadWrite(bits: 16..<20, as: BitField4.self)
        public var endpoint: ENDPOINT_Field

        /// Device address
        @ReadWrite(bits: 0..<7, as: BitField7.self)
        public var address: ADDRESS_Field
    }

    /// Interrupt endpoint 11. Only valid for HOST mode.
    @RegisterBank(offset: 0x002c)
    public var addr_endp11: Register<ADDR_ENDP11>

    @Register(bitWidth: 32)
    public struct ADDR_ENDP11 {
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var intep_preamble: INTEP_PREAMBLE_Field

        /// Direction of the interrupt endpoint. In=0, Out=1
        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var intep_dir: INTEP_DIR_Field

        /// Endpoint number of the interrupt endpoint
        @ReadWrite(bits: 16..<20, as: BitField4.self)
        public var endpoint: ENDPOINT_Field

        /// Device address
        @ReadWrite(bits: 0..<7, as: BitField7.self)
        public var address: ADDRESS_Field
    }

    /// Interrupt endpoint 12. Only valid for HOST mode.
    @RegisterBank(offset: 0x0030)
    public var addr_endp12: Register<ADDR_ENDP12>

    @Register(bitWidth: 32)
    public struct ADDR_ENDP12 {
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var intep_preamble: INTEP_PREAMBLE_Field

        /// Direction of the interrupt endpoint. In=0, Out=1
        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var intep_dir: INTEP_DIR_Field

        /// Endpoint number of the interrupt endpoint
        @ReadWrite(bits: 16..<20, as: BitField4.self)
        public var endpoint: ENDPOINT_Field

        /// Device address
        @ReadWrite(bits: 0..<7, as: BitField7.self)
        public var address: ADDRESS_Field
    }

    /// Interrupt endpoint 13. Only valid for HOST mode.
    @RegisterBank(offset: 0x0034)
    public var addr_endp13: Register<ADDR_ENDP13>

    @Register(bitWidth: 32)
    public struct ADDR_ENDP13 {
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var intep_preamble: INTEP_PREAMBLE_Field

        /// Direction of the interrupt endpoint. In=0, Out=1
        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var intep_dir: INTEP_DIR_Field

        /// Endpoint number of the interrupt endpoint
        @ReadWrite(bits: 16..<20, as: BitField4.self)
        public var endpoint: ENDPOINT_Field

        /// Device address
        @ReadWrite(bits: 0..<7, as: BitField7.self)
        public var address: ADDRESS_Field
    }

    /// Interrupt endpoint 14. Only valid for HOST mode.
    @RegisterBank(offset: 0x0038)
    public var addr_endp14: Register<ADDR_ENDP14>

    @Register(bitWidth: 32)
    public struct ADDR_ENDP14 {
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var intep_preamble: INTEP_PREAMBLE_Field

        /// Direction of the interrupt endpoint. In=0, Out=1
        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var intep_dir: INTEP_DIR_Field

        /// Endpoint number of the interrupt endpoint
        @ReadWrite(bits: 16..<20, as: BitField4.self)
        public var endpoint: ENDPOINT_Field

        /// Device address
        @ReadWrite(bits: 0..<7, as: BitField7.self)
        public var address: ADDRESS_Field
    }

    /// Interrupt endpoint 15. Only valid for HOST mode.
    @RegisterBank(offset: 0x003c)
    public var addr_endp15: Register<ADDR_ENDP15>

    @Register(bitWidth: 32)
    public struct ADDR_ENDP15 {
        /// Interrupt EP requires preamble (is a low speed device on a full speed hub)
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var intep_preamble: INTEP_PREAMBLE_Field

        /// Direction of the interrupt endpoint. In=0, Out=1
        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var intep_dir: INTEP_DIR_Field

        /// Endpoint number of the interrupt endpoint
        @ReadWrite(bits: 16..<20, as: BitField4.self)
        public var endpoint: ENDPOINT_Field

        /// Device address
        @ReadWrite(bits: 0..<7, as: BitField7.self)
        public var address: ADDRESS_Field
    }

    /// Main control register
    @RegisterBank(offset: 0x0040)
    public var main_ctrl: Register<MAIN_CTRL>

    @Register(bitWidth: 32)
    public struct MAIN_CTRL {
        /// Reduced timings for simulation
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var sim_timing: SIM_TIMING_Field

        /// Device mode = 0, Host mode = 1
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var host_ndevice: HOST_NDEVICE_Field

        /// Enable controller
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var controller_en: CONTROLLER_EN_Field
    }

    /// Set the SOF (Start of Frame) frame number in the host controller. The SOF packet is sent every 1ms and the host will increment the frame number by 1 each time.
    @RegisterBank(offset: 0x0044)
    public var sof_wr: Register<SOF_WR>

    @Register(bitWidth: 32)
    public struct SOF_WR {
        @WriteOnly(bits: 0..<11, as: BitField11.self)
        public var count: COUNT_Field
    }

    /// Read the last SOF (Start of Frame) frame number seen. In device mode the last SOF received from the host. In host mode the last SOF sent by the host.
    @RegisterBank(offset: 0x0048)
    public var sof_rd: Register<SOF_RD>

    @Register(bitWidth: 32)
    public struct SOF_RD {
        @ReadOnly(bits: 0..<11, as: BitField11.self)
        public var count: COUNT_Field
    }

    /// SIE control register
    @RegisterBank(offset: 0x004c)
    public var sie_ctrl: Register<SIE_CTRL>

    @Register(bitWidth: 32)
    public struct SIE_CTRL {
        /// Device: Set bit in EP_STATUS_STALL_NAK when EP0 sends a STALL
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var ep0_int_stall: EP0_INT_STALL_Field

        /// Device: EP0 single buffered = 0, double buffered = 1
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var ep0_double_buf: EP0_DOUBLE_BUF_Field

        /// Device: Set bit in BUFF_STATUS for every buffer completed on EP0
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var ep0_int_1buf: EP0_INT_1BUF_Field

        /// Device: Set bit in BUFF_STATUS for every 2 buffers completed on EP0
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var ep0_int_2buf: EP0_INT_2BUF_Field

        /// Device: Set bit in EP_STATUS_STALL_NAK when EP0 sends a NAK
        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var ep0_int_nak: EP0_INT_NAK_Field

        /// Direct bus drive enable
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var direct_en: DIRECT_EN_Field

        /// Direct control of DP
        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var direct_dp: DIRECT_DP_Field

        /// Direct control of DM
        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var direct_dm: DIRECT_DM_Field

        /// Power down bus transceiver
        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var transceiver_pd: TRANSCEIVER_PD_Field

        /// Device: Pull-up strength (0=1K2, 1=2k3)
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var rpu_opt: RPU_OPT_Field

        /// Device: Enable pull up resistor
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var pullup_en: PULLUP_EN_Field

        /// Host: Enable pull down resistors
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var pulldown_en: PULLDOWN_EN_Field

        /// Host: Reset bus
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var reset_bus: RESET_BUS_Field

        /// Device: Remote wakeup. Device can initiate its own resume after suspend.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var resume: RESUME_Field

        /// Host: Enable VBUS
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var vbus_en: VBUS_EN_Field

        /// Host: Enable keep alive packet (for low speed bus)
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var keep_alive_en: KEEP_ALIVE_EN_Field

        /// Host: Enable SOF generation (for full speed bus)
        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var sof_en: SOF_EN_Field

        /// Host: Delay packet(s) until after SOF
        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var sof_sync: SOF_SYNC_Field

        /// Host: Preable enable for LS device on FS hub
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var preamble_en: PREAMBLE_EN_Field

        /// Host: Stop transaction
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var stop_trans: STOP_TRANS_Field

        /// Host: Receive transaction (IN to host)
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var receive_data: RECEIVE_DATA_Field

        /// Host: Send transaction (OUT from host)
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var send_data: SEND_DATA_Field

        /// Host: Send Setup packet
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var send_setup: SEND_SETUP_Field

        /// Host: Start transaction
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var start_trans: START_TRANS_Field
    }

    /// SIE status register
    @RegisterBank(offset: 0x0050)
    public var sie_status: Register<SIE_STATUS>

    @Register(bitWidth: 32)
    public struct SIE_STATUS {
        /// Data Sequence Error.
        /// The device can raise a sequence error in the following conditions:
        /// * A SETUP packet is received followed by a DATA1 packet (data phase should always be DATA0) * An OUT packet is received from the host but doesn't match the data pid in the buffer control register read from DPSRAM
        /// The host can raise a data sequence error in the following conditions:
        /// * An IN packet from the device has the wrong data PID
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var data_seq_error: DATA_SEQ_ERROR_Field

        /// ACK received. Raised by both host and device.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var ack_rec: ACK_REC_Field

        /// Host: STALL received
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var stall_rec: STALL_REC_Field

        /// Host: NAK received
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var nak_rec: NAK_REC_Field

        /// RX timeout is raised by both the host and device if an ACK is not received in the maximum time specified by the USB spec.
        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var rx_timeout: RX_TIMEOUT_Field

        /// RX overflow is raised by the Serial RX engine if the incoming data is too fast.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var rx_overflow: RX_OVERFLOW_Field

        /// Bit Stuff Error. Raised by the Serial RX engine.
        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var bit_stuff_error: BIT_STUFF_ERROR_Field

        /// CRC Error. Raised by the Serial RX engine.
        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var crc_error: CRC_ERROR_Field

        /// Device: bus reset received
        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var bus_reset: BUS_RESET_Field

        /// Transaction complete.
        /// Raised by device if:
        /// * An IN or OUT packet is sent with the `LAST_BUFF` bit set in the buffer control register
        /// Raised by host if:
        /// * A setup packet is sent when no data in or data out transaction follows * An IN packet is received and the `LAST_BUFF` bit is set in the buffer control register * An IN packet is received with zero length * An OUT packet is sent and the `LAST_BUFF` bit is set
        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var trans_complete: TRANS_COMPLETE_Field

        /// Device: Setup packet received
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var setup_rec: SETUP_REC_Field

        /// Device: connected
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var connected: CONNECTED_Field

        /// Host: Device has initiated a remote resume. Device: host has initiated a resume.
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var resume: RESUME_Field

        /// VBUS over current detected
        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var vbus_over_curr: VBUS_OVER_CURR_Field

        /// Host: device speed. Disconnected = 00, LS = 01, FS = 10
        @ReadWrite(bits: 8..<10, as: BitField2.self)
        public var speed: SPEED_Field

        /// Bus in suspended state. Valid for device and host. Host and device will go into suspend if neither Keep Alive / SOF frames are enabled.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var suspended: SUSPENDED_Field

        /// USB bus line state
        @ReadOnly(bits: 2..<4, as: BitField2.self)
        public var line_state: LINE_STATE_Field

        /// Device: VBUS Detected
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var vbus_detected: VBUS_DETECTED_Field
    }

    /// interrupt endpoint control register
    @RegisterBank(offset: 0x0054)
    public var int_ep_ctrl: Register<INT_EP_CTRL>

    @Register(bitWidth: 32)
    public struct INT_EP_CTRL {
        /// Host: Enable interrupt endpoint 1 -> 15
        @ReadWrite(bits: 1..<16, as: BitField15.self)
        public var int_ep_active: INT_EP_ACTIVE_Field
    }

    /// Buffer status register. A bit set here indicates that a buffer has completed on the endpoint (if the buffer interrupt is enabled). It is possible for 2 buffers to be completed, so clearing the buffer status bit may instantly re set it on the next clock cycle.
    @RegisterBank(offset: 0x0058)
    public var buff_status: Register<BUFF_STATUS>

    @Register(bitWidth: 32)
    public struct BUFF_STATUS {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var ep15_out: EP15_OUT_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var ep15_in: EP15_IN_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var ep14_out: EP14_OUT_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var ep14_in: EP14_IN_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var ep13_out: EP13_OUT_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var ep13_in: EP13_IN_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var ep12_out: EP12_OUT_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var ep12_in: EP12_IN_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var ep11_out: EP11_OUT_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var ep11_in: EP11_IN_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var ep10_out: EP10_OUT_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var ep10_in: EP10_IN_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var ep9_out: EP9_OUT_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var ep9_in: EP9_IN_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var ep8_out: EP8_OUT_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var ep8_in: EP8_IN_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var ep7_out: EP7_OUT_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var ep7_in: EP7_IN_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var ep6_out: EP6_OUT_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var ep6_in: EP6_IN_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var ep5_out: EP5_OUT_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var ep5_in: EP5_IN_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var ep4_out: EP4_OUT_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var ep4_in: EP4_IN_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var ep3_out: EP3_OUT_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var ep3_in: EP3_IN_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var ep2_out: EP2_OUT_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var ep2_in: EP2_IN_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var ep1_out: EP1_OUT_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var ep1_in: EP1_IN_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var ep0_out: EP0_OUT_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var ep0_in: EP0_IN_Field
    }

    /// Which of the double buffers should be handled. Only valid if using an interrupt per buffer (i.e. not per 2 buffers). Not valid for host interrupt endpoint polling because they are only single buffered.
    @RegisterBank(offset: 0x005c)
    public var buff_cpu_should_handle: Register<BUFF_CPU_SHOULD_HANDLE>

    @Register(bitWidth: 32)
    public struct BUFF_CPU_SHOULD_HANDLE {
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var ep15_out: EP15_OUT_Field

        @ReadOnly(bits: 30..<31, as: Bool.self)
        public var ep15_in: EP15_IN_Field

        @ReadOnly(bits: 29..<30, as: Bool.self)
        public var ep14_out: EP14_OUT_Field

        @ReadOnly(bits: 28..<29, as: Bool.self)
        public var ep14_in: EP14_IN_Field

        @ReadOnly(bits: 27..<28, as: Bool.self)
        public var ep13_out: EP13_OUT_Field

        @ReadOnly(bits: 26..<27, as: Bool.self)
        public var ep13_in: EP13_IN_Field

        @ReadOnly(bits: 25..<26, as: Bool.self)
        public var ep12_out: EP12_OUT_Field

        @ReadOnly(bits: 24..<25, as: Bool.self)
        public var ep12_in: EP12_IN_Field

        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var ep11_out: EP11_OUT_Field

        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var ep11_in: EP11_IN_Field

        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var ep10_out: EP10_OUT_Field

        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var ep10_in: EP10_IN_Field

        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var ep9_out: EP9_OUT_Field

        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var ep9_in: EP9_IN_Field

        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var ep8_out: EP8_OUT_Field

        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var ep8_in: EP8_IN_Field

        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var ep7_out: EP7_OUT_Field

        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var ep7_in: EP7_IN_Field

        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var ep6_out: EP6_OUT_Field

        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var ep6_in: EP6_IN_Field

        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var ep5_out: EP5_OUT_Field

        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var ep5_in: EP5_IN_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var ep4_out: EP4_OUT_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var ep4_in: EP4_IN_Field

        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var ep3_out: EP3_OUT_Field

        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var ep3_in: EP3_IN_Field

        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var ep2_out: EP2_OUT_Field

        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var ep2_in: EP2_IN_Field

        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var ep1_out: EP1_OUT_Field

        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var ep1_in: EP1_IN_Field

        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var ep0_out: EP0_OUT_Field

        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var ep0_in: EP0_IN_Field
    }

    /// Device only: Can be set to ignore the buffer control register for this endpoint in case you would like to revoke a buffer. A NAK will be sent for every access to the endpoint until this bit is cleared. A corresponding bit in `EP_ABORT_DONE` is set when it is safe to modify the buffer control register.
    @RegisterBank(offset: 0x0060)
    public var ep_abort: Register<EP_ABORT>

    @Register(bitWidth: 32)
    public struct EP_ABORT {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var ep15_out: EP15_OUT_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var ep15_in: EP15_IN_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var ep14_out: EP14_OUT_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var ep14_in: EP14_IN_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var ep13_out: EP13_OUT_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var ep13_in: EP13_IN_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var ep12_out: EP12_OUT_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var ep12_in: EP12_IN_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var ep11_out: EP11_OUT_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var ep11_in: EP11_IN_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var ep10_out: EP10_OUT_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var ep10_in: EP10_IN_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var ep9_out: EP9_OUT_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var ep9_in: EP9_IN_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var ep8_out: EP8_OUT_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var ep8_in: EP8_IN_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var ep7_out: EP7_OUT_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var ep7_in: EP7_IN_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var ep6_out: EP6_OUT_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var ep6_in: EP6_IN_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var ep5_out: EP5_OUT_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var ep5_in: EP5_IN_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var ep4_out: EP4_OUT_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var ep4_in: EP4_IN_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var ep3_out: EP3_OUT_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var ep3_in: EP3_IN_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var ep2_out: EP2_OUT_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var ep2_in: EP2_IN_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var ep1_out: EP1_OUT_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var ep1_in: EP1_IN_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var ep0_out: EP0_OUT_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var ep0_in: EP0_IN_Field
    }

    /// Device only: Used in conjunction with `EP_ABORT`. Set once an endpoint is idle so the programmer knows it is safe to modify the buffer control register.
    @RegisterBank(offset: 0x0064)
    public var ep_abort_done: Register<EP_ABORT_DONE>

    @Register(bitWidth: 32)
    public struct EP_ABORT_DONE {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var ep15_out: EP15_OUT_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var ep15_in: EP15_IN_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var ep14_out: EP14_OUT_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var ep14_in: EP14_IN_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var ep13_out: EP13_OUT_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var ep13_in: EP13_IN_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var ep12_out: EP12_OUT_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var ep12_in: EP12_IN_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var ep11_out: EP11_OUT_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var ep11_in: EP11_IN_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var ep10_out: EP10_OUT_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var ep10_in: EP10_IN_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var ep9_out: EP9_OUT_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var ep9_in: EP9_IN_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var ep8_out: EP8_OUT_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var ep8_in: EP8_IN_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var ep7_out: EP7_OUT_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var ep7_in: EP7_IN_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var ep6_out: EP6_OUT_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var ep6_in: EP6_IN_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var ep5_out: EP5_OUT_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var ep5_in: EP5_IN_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var ep4_out: EP4_OUT_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var ep4_in: EP4_IN_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var ep3_out: EP3_OUT_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var ep3_in: EP3_IN_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var ep2_out: EP2_OUT_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var ep2_in: EP2_IN_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var ep1_out: EP1_OUT_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var ep1_in: EP1_IN_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var ep0_out: EP0_OUT_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var ep0_in: EP0_IN_Field
    }

    /// Device: this bit must be set in conjunction with the `STALL` bit in the buffer control register to send a STALL on EP0. The device controller clears these bits when a SETUP packet is received because the USB spec requires that a STALL condition is cleared when a SETUP packet is received.
    @RegisterBank(offset: 0x0068)
    public var ep_stall_arm: Register<EP_STALL_ARM>

    @Register(bitWidth: 32)
    public struct EP_STALL_ARM {
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var ep0_out: EP0_OUT_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var ep0_in: EP0_IN_Field
    }

    /// Used by the host controller. Sets the wait time in microseconds before trying again if the device replies with a NAK.
    @RegisterBank(offset: 0x006c)
    public var nak_poll: Register<NAK_POLL>

    @Register(bitWidth: 32)
    public struct NAK_POLL {
        /// NAK polling interval for a full speed device
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var delay_fs: DELAY_FS_Field

        /// NAK polling interval for a low speed device
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var delay_ls: DELAY_LS_Field
    }

    /// Device: bits are set when the `IRQ_ON_NAK` or `IRQ_ON_STALL` bits are set. For EP0 this comes from `SIE_CTRL`. For all other endpoints it comes from the endpoint control register.
    @RegisterBank(offset: 0x0070)
    public var ep_status_stall_nak: Register<EP_STATUS_STALL_NAK>

    @Register(bitWidth: 32)
    public struct EP_STATUS_STALL_NAK {
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var ep15_out: EP15_OUT_Field

        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var ep15_in: EP15_IN_Field

        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var ep14_out: EP14_OUT_Field

        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var ep14_in: EP14_IN_Field

        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var ep13_out: EP13_OUT_Field

        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var ep13_in: EP13_IN_Field

        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var ep12_out: EP12_OUT_Field

        @ReadWrite(bits: 24..<25, as: Bool.self)
        public var ep12_in: EP12_IN_Field

        @ReadWrite(bits: 23..<24, as: Bool.self)
        public var ep11_out: EP11_OUT_Field

        @ReadWrite(bits: 22..<23, as: Bool.self)
        public var ep11_in: EP11_IN_Field

        @ReadWrite(bits: 21..<22, as: Bool.self)
        public var ep10_out: EP10_OUT_Field

        @ReadWrite(bits: 20..<21, as: Bool.self)
        public var ep10_in: EP10_IN_Field

        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var ep9_out: EP9_OUT_Field

        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var ep9_in: EP9_IN_Field

        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var ep8_out: EP8_OUT_Field

        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var ep8_in: EP8_IN_Field

        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var ep7_out: EP7_OUT_Field

        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var ep7_in: EP7_IN_Field

        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var ep6_out: EP6_OUT_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var ep6_in: EP6_IN_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var ep5_out: EP5_OUT_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var ep5_in: EP5_IN_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var ep4_out: EP4_OUT_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var ep4_in: EP4_IN_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var ep3_out: EP3_OUT_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var ep3_in: EP3_IN_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var ep2_out: EP2_OUT_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var ep2_in: EP2_IN_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var ep1_out: EP1_OUT_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var ep1_in: EP1_IN_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var ep0_out: EP0_OUT_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var ep0_in: EP0_IN_Field
    }

    /// Where to connect the USB controller. Should be to_phy by default.
    @RegisterBank(offset: 0x0074)
    public var usb_muxing: Register<USB_MUXING>

    @Register(bitWidth: 32)
    public struct USB_MUXING {
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var softcon: SOFTCON_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var to_digital_pad: TO_DIGITAL_PAD_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var to_extphy: TO_EXTPHY_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var to_phy: TO_PHY_Field
    }

    /// Overrides for the power signals in the event that the VBUS signals are not hooked up to GPIO. Set the value of the override and then the override enable to switch over to the override value.
    @RegisterBank(offset: 0x0078)
    public var usb_pwr: Register<USB_PWR>

    @Register(bitWidth: 32)
    public struct USB_PWR {
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var overcurr_detect_en: OVERCURR_DETECT_EN_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var overcurr_detect: OVERCURR_DETECT_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var vbus_detect_override_en: VBUS_DETECT_OVERRIDE_EN_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var vbus_detect: VBUS_DETECT_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var vbus_en_override_en: VBUS_EN_OVERRIDE_EN_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var vbus_en: VBUS_EN_Field
    }

    /// This register allows for direct control of the USB phy. Use in conjunction with usbphy_direct_override register to enable each override bit.
    @RegisterBank(offset: 0x007c)
    public var usbphy_direct: Register<USBPHY_DIRECT>

    @Register(bitWidth: 32)
    public struct USBPHY_DIRECT {
        /// DM over voltage
        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var dm_ovv: DM_OVV_Field

        /// DP over voltage
        @ReadOnly(bits: 21..<22, as: Bool.self)
        public var dp_ovv: DP_OVV_Field

        /// DM overcurrent
        @ReadOnly(bits: 20..<21, as: Bool.self)
        public var dm_ovcn: DM_OVCN_Field

        /// DP overcurrent
        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var dp_ovcn: DP_OVCN_Field

        /// DPM pin state
        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var rx_dm: RX_DM_Field

        /// DPP pin state
        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var rx_dp: RX_DP_Field

        /// Differential RX
        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var rx_dd: RX_DD_Field

        /// TX_DIFFMODE=0: Single ended mode
        /// TX_DIFFMODE=1: Differential drive mode (TX_DM, TX_DM_OE ignored)
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var tx_diffmode: TX_DIFFMODE_Field

        /// TX_FSSLEW=0: Low speed slew rate
        /// TX_FSSLEW=1: Full speed slew rate
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var tx_fsslew: TX_FSSLEW_Field

        /// TX power down override (if override enable is set). 1 = powered down.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var tx_pd: TX_PD_Field

        /// RX power down override (if override enable is set). 1 = powered down.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var rx_pd: RX_PD_Field

        /// Output data. TX_DIFFMODE=1, Ignored
        /// TX_DIFFMODE=0, Drives DPM only. TX_DM_OE=1 to enable drive. DPM=TX_DM
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var tx_dm: TX_DM_Field

        /// Output data. If TX_DIFFMODE=1, Drives DPP/DPM diff pair. TX_DP_OE=1 to enable drive. DPP=TX_DP, DPM=~TX_DP
        /// If TX_DIFFMODE=0, Drives DPP only. TX_DP_OE=1 to enable drive. DPP=TX_DP
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var tx_dp: TX_DP_Field

        /// Output enable. If TX_DIFFMODE=1, Ignored.
        /// If TX_DIFFMODE=0, OE for DPM only. 0 - DPM in Hi-Z state; 1 - DPM driving
        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var tx_dm_oe: TX_DM_OE_Field

        /// Output enable. If TX_DIFFMODE=1, OE for DPP/DPM diff pair. 0 - DPP/DPM in Hi-Z state; 1 - DPP/DPM driving
        /// If TX_DIFFMODE=0, OE for DPP only. 0 - DPP in Hi-Z state; 1 - DPP driving
        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var tx_dp_oe: TX_DP_OE_Field

        /// DM pull down enable
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var dm_pulldn_en: DM_PULLDN_EN_Field

        /// DM pull up enable
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var dm_pullup_en: DM_PULLUP_EN_Field

        /// Enable the second DM pull up resistor. 0 - Pull = Rpu2; 1 - Pull = Rpu1 + Rpu2
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var dm_pullup_hisel: DM_PULLUP_HISEL_Field

        /// DP pull down enable
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var dp_pulldn_en: DP_PULLDN_EN_Field

        /// DP pull up enable
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var dp_pullup_en: DP_PULLUP_EN_Field

        /// Enable the second DP pull up resistor. 0 - Pull = Rpu2; 1 - Pull = Rpu1 + Rpu2
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var dp_pullup_hisel: DP_PULLUP_HISEL_Field
    }

    /// Override enable for each control in usbphy_direct
    @RegisterBank(offset: 0x0080)
    public var usbphy_direct_override: Register<USBPHY_DIRECT_OVERRIDE>

    @Register(bitWidth: 32)
    public struct USBPHY_DIRECT_OVERRIDE {
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var tx_diffmode_override_en: TX_DIFFMODE_OVERRIDE_EN_Field

        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var dm_pullup_override_en: DM_PULLUP_OVERRIDE_EN_Field

        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var tx_fsslew_override_en: TX_FSSLEW_OVERRIDE_EN_Field

        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var tx_pd_override_en: TX_PD_OVERRIDE_EN_Field

        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var rx_pd_override_en: RX_PD_OVERRIDE_EN_Field

        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var tx_dm_override_en: TX_DM_OVERRIDE_EN_Field

        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var tx_dp_override_en: TX_DP_OVERRIDE_EN_Field

        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var tx_dm_oe_override_en: TX_DM_OE_OVERRIDE_EN_Field

        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var tx_dp_oe_override_en: TX_DP_OE_OVERRIDE_EN_Field

        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var dm_pulldn_en_override_en: DM_PULLDN_EN_OVERRIDE_EN_Field

        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var dp_pulldn_en_override_en: DP_PULLDN_EN_OVERRIDE_EN_Field

        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var dp_pullup_en_override_en: DP_PULLUP_EN_OVERRIDE_EN_Field

        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var dm_pullup_hisel_override_en: DM_PULLUP_HISEL_OVERRIDE_EN_Field

        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var dp_pullup_hisel_override_en: DP_PULLUP_HISEL_OVERRIDE_EN_Field
    }

    /// Used to adjust trim values of USB phy pull down resistors.
    @RegisterBank(offset: 0x0084)
    public var usbphy_trim: Register<USBPHY_TRIM>

    @Register(bitWidth: 32)
    public struct USBPHY_TRIM {
        /// Value to drive to USB PHY
        /// DM pulldown resistor trim control
        /// Experimental data suggests that the reset value will work, but this register allows adjustment if required
        @ReadWrite(bits: 8..<13, as: BitField5.self)
        public var dm_pulldn_trim: DM_PULLDN_TRIM_Field

        /// Value to drive to USB PHY
        /// DP pulldown resistor trim control
        /// Experimental data suggests that the reset value will work, but this register allows adjustment if required
        @ReadWrite(bits: 0..<5, as: BitField5.self)
        public var dp_pulldn_trim: DP_PULLDN_TRIM_Field
    }

    /// Raw Interrupts
    @RegisterBank(offset: 0x008c)
    public var intr: Register<INTR>

    @Register(bitWidth: 32)
    public struct INTR {
        /// Raised when any bit in EP_STATUS_STALL_NAK is set. Clear by clearing all bits in EP_STATUS_STALL_NAK.
        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var ep_stall_nak: EP_STALL_NAK_Field

        /// Raised when any bit in ABORT_DONE is set. Clear by clearing all bits in ABORT_DONE.
        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var abort_done: ABORT_DONE_Field

        /// Set every time the device receives a SOF (Start of Frame) packet. Cleared by reading SOF_RD
        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var dev_sof: DEV_SOF_Field

        /// Device. Source: SIE_STATUS.SETUP_REC
        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var setup_req: SETUP_REQ_Field

        /// Set when the device receives a resume from the host. Cleared by writing to SIE_STATUS.RESUME
        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var dev_resume_from_host: DEV_RESUME_FROM_HOST_Field

        /// Set when the device suspend state changes. Cleared by writing to SIE_STATUS.SUSPENDED
        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var dev_suspend: DEV_SUSPEND_Field

        /// Set when the device connection state changes. Cleared by writing to SIE_STATUS.CONNECTED
        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var dev_conn_dis: DEV_CONN_DIS_Field

        /// Source: SIE_STATUS.BUS_RESET
        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var bus_reset: BUS_RESET_Field

        /// Source: SIE_STATUS.VBUS_DETECTED
        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var vbus_detect: VBUS_DETECT_Field

        /// Source: SIE_STATUS.STALL_REC
        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var stall: STALL_Field

        /// Source: SIE_STATUS.CRC_ERROR
        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var error_crc: ERROR_CRC_Field

        /// Source: SIE_STATUS.BIT_STUFF_ERROR
        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var error_bit_stuff: ERROR_BIT_STUFF_Field

        /// Source: SIE_STATUS.RX_OVERFLOW
        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var error_rx_overflow: ERROR_RX_OVERFLOW_Field

        /// Source: SIE_STATUS.RX_TIMEOUT
        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var error_rx_timeout: ERROR_RX_TIMEOUT_Field

        /// Source: SIE_STATUS.DATA_SEQ_ERROR
        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var error_data_seq: ERROR_DATA_SEQ_Field

        /// Raised when any bit in BUFF_STATUS is set. Clear by clearing all bits in BUFF_STATUS.
        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var buff_status: BUFF_STATUS_Field

        /// Raised every time SIE_STATUS.TRANS_COMPLETE is set. Clear by writing to this bit.
        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var trans_complete: TRANS_COMPLETE_Field

        /// Host: raised every time the host sends a SOF (Start of Frame). Cleared by reading SOF_RD
        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var host_sof: HOST_SOF_Field

        /// Host: raised when a device wakes up the host. Cleared by writing to SIE_STATUS.RESUME
        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var host_resume: HOST_RESUME_Field

        /// Host: raised when a device is connected or disconnected (i.e. when SIE_STATUS.SPEED changes). Cleared by writing to SIE_STATUS.SPEED
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var host_conn_dis: HOST_CONN_DIS_Field
    }

    /// Interrupt Enable
    @RegisterBank(offset: 0x0090)
    public var inte: Register<INTE>

    @Register(bitWidth: 32)
    public struct INTE {
        /// Raised when any bit in EP_STATUS_STALL_NAK is set. Clear by clearing all bits in EP_STATUS_STALL_NAK.
        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var ep_stall_nak: EP_STALL_NAK_Field

        /// Raised when any bit in ABORT_DONE is set. Clear by clearing all bits in ABORT_DONE.
        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var abort_done: ABORT_DONE_Field

        /// Set every time the device receives a SOF (Start of Frame) packet. Cleared by reading SOF_RD
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var dev_sof: DEV_SOF_Field

        /// Device. Source: SIE_STATUS.SETUP_REC
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var setup_req: SETUP_REQ_Field

        /// Set when the device receives a resume from the host. Cleared by writing to SIE_STATUS.RESUME
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var dev_resume_from_host: DEV_RESUME_FROM_HOST_Field

        /// Set when the device suspend state changes. Cleared by writing to SIE_STATUS.SUSPENDED
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var dev_suspend: DEV_SUSPEND_Field

        /// Set when the device connection state changes. Cleared by writing to SIE_STATUS.CONNECTED
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var dev_conn_dis: DEV_CONN_DIS_Field

        /// Source: SIE_STATUS.BUS_RESET
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var bus_reset: BUS_RESET_Field

        /// Source: SIE_STATUS.VBUS_DETECTED
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var vbus_detect: VBUS_DETECT_Field

        /// Source: SIE_STATUS.STALL_REC
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var stall: STALL_Field

        /// Source: SIE_STATUS.CRC_ERROR
        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var error_crc: ERROR_CRC_Field

        /// Source: SIE_STATUS.BIT_STUFF_ERROR
        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var error_bit_stuff: ERROR_BIT_STUFF_Field

        /// Source: SIE_STATUS.RX_OVERFLOW
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var error_rx_overflow: ERROR_RX_OVERFLOW_Field

        /// Source: SIE_STATUS.RX_TIMEOUT
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var error_rx_timeout: ERROR_RX_TIMEOUT_Field

        /// Source: SIE_STATUS.DATA_SEQ_ERROR
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var error_data_seq: ERROR_DATA_SEQ_Field

        /// Raised when any bit in BUFF_STATUS is set. Clear by clearing all bits in BUFF_STATUS.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var buff_status: BUFF_STATUS_Field

        /// Raised every time SIE_STATUS.TRANS_COMPLETE is set. Clear by writing to this bit.
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var trans_complete: TRANS_COMPLETE_Field

        /// Host: raised every time the host sends a SOF (Start of Frame). Cleared by reading SOF_RD
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var host_sof: HOST_SOF_Field

        /// Host: raised when a device wakes up the host. Cleared by writing to SIE_STATUS.RESUME
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var host_resume: HOST_RESUME_Field

        /// Host: raised when a device is connected or disconnected (i.e. when SIE_STATUS.SPEED changes). Cleared by writing to SIE_STATUS.SPEED
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var host_conn_dis: HOST_CONN_DIS_Field
    }

    /// Interrupt Force
    @RegisterBank(offset: 0x0094)
    public var intf: Register<INTF>

    @Register(bitWidth: 32)
    public struct INTF {
        /// Raised when any bit in EP_STATUS_STALL_NAK is set. Clear by clearing all bits in EP_STATUS_STALL_NAK.
        @ReadWrite(bits: 19..<20, as: Bool.self)
        public var ep_stall_nak: EP_STALL_NAK_Field

        /// Raised when any bit in ABORT_DONE is set. Clear by clearing all bits in ABORT_DONE.
        @ReadWrite(bits: 18..<19, as: Bool.self)
        public var abort_done: ABORT_DONE_Field

        /// Set every time the device receives a SOF (Start of Frame) packet. Cleared by reading SOF_RD
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var dev_sof: DEV_SOF_Field

        /// Device. Source: SIE_STATUS.SETUP_REC
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var setup_req: SETUP_REQ_Field

        /// Set when the device receives a resume from the host. Cleared by writing to SIE_STATUS.RESUME
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var dev_resume_from_host: DEV_RESUME_FROM_HOST_Field

        /// Set when the device suspend state changes. Cleared by writing to SIE_STATUS.SUSPENDED
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var dev_suspend: DEV_SUSPEND_Field

        /// Set when the device connection state changes. Cleared by writing to SIE_STATUS.CONNECTED
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var dev_conn_dis: DEV_CONN_DIS_Field

        /// Source: SIE_STATUS.BUS_RESET
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var bus_reset: BUS_RESET_Field

        /// Source: SIE_STATUS.VBUS_DETECTED
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var vbus_detect: VBUS_DETECT_Field

        /// Source: SIE_STATUS.STALL_REC
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var stall: STALL_Field

        /// Source: SIE_STATUS.CRC_ERROR
        @ReadWrite(bits: 9..<10, as: Bool.self)
        public var error_crc: ERROR_CRC_Field

        /// Source: SIE_STATUS.BIT_STUFF_ERROR
        @ReadWrite(bits: 8..<9, as: Bool.self)
        public var error_bit_stuff: ERROR_BIT_STUFF_Field

        /// Source: SIE_STATUS.RX_OVERFLOW
        @ReadWrite(bits: 7..<8, as: Bool.self)
        public var error_rx_overflow: ERROR_RX_OVERFLOW_Field

        /// Source: SIE_STATUS.RX_TIMEOUT
        @ReadWrite(bits: 6..<7, as: Bool.self)
        public var error_rx_timeout: ERROR_RX_TIMEOUT_Field

        /// Source: SIE_STATUS.DATA_SEQ_ERROR
        @ReadWrite(bits: 5..<6, as: Bool.self)
        public var error_data_seq: ERROR_DATA_SEQ_Field

        /// Raised when any bit in BUFF_STATUS is set. Clear by clearing all bits in BUFF_STATUS.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var buff_status: BUFF_STATUS_Field

        /// Raised every time SIE_STATUS.TRANS_COMPLETE is set. Clear by writing to this bit.
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var trans_complete: TRANS_COMPLETE_Field

        /// Host: raised every time the host sends a SOF (Start of Frame). Cleared by reading SOF_RD
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var host_sof: HOST_SOF_Field

        /// Host: raised when a device wakes up the host. Cleared by writing to SIE_STATUS.RESUME
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var host_resume: HOST_RESUME_Field

        /// Host: raised when a device is connected or disconnected (i.e. when SIE_STATUS.SPEED changes). Cleared by writing to SIE_STATUS.SPEED
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var host_conn_dis: HOST_CONN_DIS_Field
    }

    /// Interrupt status after masking & forcing
    @RegisterBank(offset: 0x0098)
    public var ints: Register<INTS>

    @Register(bitWidth: 32)
    public struct INTS {
        /// Raised when any bit in EP_STATUS_STALL_NAK is set. Clear by clearing all bits in EP_STATUS_STALL_NAK.
        @ReadOnly(bits: 19..<20, as: Bool.self)
        public var ep_stall_nak: EP_STALL_NAK_Field

        /// Raised when any bit in ABORT_DONE is set. Clear by clearing all bits in ABORT_DONE.
        @ReadOnly(bits: 18..<19, as: Bool.self)
        public var abort_done: ABORT_DONE_Field

        /// Set every time the device receives a SOF (Start of Frame) packet. Cleared by reading SOF_RD
        @ReadOnly(bits: 17..<18, as: Bool.self)
        public var dev_sof: DEV_SOF_Field

        /// Device. Source: SIE_STATUS.SETUP_REC
        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var setup_req: SETUP_REQ_Field

        /// Set when the device receives a resume from the host. Cleared by writing to SIE_STATUS.RESUME
        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var dev_resume_from_host: DEV_RESUME_FROM_HOST_Field

        /// Set when the device suspend state changes. Cleared by writing to SIE_STATUS.SUSPENDED
        @ReadOnly(bits: 14..<15, as: Bool.self)
        public var dev_suspend: DEV_SUSPEND_Field

        /// Set when the device connection state changes. Cleared by writing to SIE_STATUS.CONNECTED
        @ReadOnly(bits: 13..<14, as: Bool.self)
        public var dev_conn_dis: DEV_CONN_DIS_Field

        /// Source: SIE_STATUS.BUS_RESET
        @ReadOnly(bits: 12..<13, as: Bool.self)
        public var bus_reset: BUS_RESET_Field

        /// Source: SIE_STATUS.VBUS_DETECTED
        @ReadOnly(bits: 11..<12, as: Bool.self)
        public var vbus_detect: VBUS_DETECT_Field

        /// Source: SIE_STATUS.STALL_REC
        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var stall: STALL_Field

        /// Source: SIE_STATUS.CRC_ERROR
        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var error_crc: ERROR_CRC_Field

        /// Source: SIE_STATUS.BIT_STUFF_ERROR
        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var error_bit_stuff: ERROR_BIT_STUFF_Field

        /// Source: SIE_STATUS.RX_OVERFLOW
        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var error_rx_overflow: ERROR_RX_OVERFLOW_Field

        /// Source: SIE_STATUS.RX_TIMEOUT
        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var error_rx_timeout: ERROR_RX_TIMEOUT_Field

        /// Source: SIE_STATUS.DATA_SEQ_ERROR
        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var error_data_seq: ERROR_DATA_SEQ_Field

        /// Raised when any bit in BUFF_STATUS is set. Clear by clearing all bits in BUFF_STATUS.
        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var buff_status: BUFF_STATUS_Field

        /// Raised every time SIE_STATUS.TRANS_COMPLETE is set. Clear by writing to this bit.
        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var trans_complete: TRANS_COMPLETE_Field

        /// Host: raised every time the host sends a SOF (Start of Frame). Cleared by reading SOF_RD
        @ReadOnly(bits: 2..<3, as: Bool.self)
        public var host_sof: HOST_SOF_Field

        /// Host: raised when a device wakes up the host. Cleared by writing to SIE_STATUS.RESUME
        @ReadOnly(bits: 1..<2, as: Bool.self)
        public var host_resume: HOST_RESUME_Field

        /// Host: raised when a device is connected or disconnected (i.e. when SIE_STATUS.SPEED changes). Cleared by writing to SIE_STATUS.SPEED
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var host_conn_dis: HOST_CONN_DIS_Field
    }
}