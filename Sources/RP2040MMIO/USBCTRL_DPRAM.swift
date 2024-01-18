import MMIO
import MMIOExtensions

/// DPRAM layout for USB device.
@RegisterBank
public struct USBCTRL_DPRAM {

    public static var `default`: Self { .init(unsafeAddress: 0x50100000) }

    /// Bytes 0-3 of the SETUP packet from the host.
    @RegisterBank(offset: 0x0000)
    public var setup_packet_low: Register<SETUP_PACKET_LOW>

    @Register(bitWidth: 32)
    public struct SETUP_PACKET_LOW {
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var wvalue: WVALUE_Field

        @ReadWrite(bits: 8..<16, as: BitField8.self)
        public var brequest: BREQUEST_Field

        @ReadWrite(bits: 0..<8, as: BitField8.self)
        public var bmrequesttype: BMREQUESTTYPE_Field
    }

    /// Bytes 4-7 of the setup packet from the host.
    @RegisterBank(offset: 0x0004)
    public var setup_packet_high: Register<SETUP_PACKET_HIGH>

    @Register(bitWidth: 32)
    public struct SETUP_PACKET_HIGH {
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var wlength: WLENGTH_Field

        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var windex: WINDEX_Field
    }

    @RegisterBank(offset: 0x0008)
    public var ep1_in_control: Register<EP1_IN_CONTROL>

    @Register(bitWidth: 32)
    public struct EP1_IN_CONTROL {
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var enable: ENABLE_Field

        /// This endpoint is double buffered.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var double_buffered: DOUBLE_BUFFERED_Field

        /// Trigger an interrupt each time a buffer is done.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var interrupt_per_buff: INTERRUPT_PER_BUFF_Field

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var interrupt_per_double_buff: INTERRUPT_PER_DOUBLE_BUFF_Field

        @ReadWrite(bits: 26..<28, as: ENDPOINT_TYPE_Values.self)
        public var endpoint_type: ENDPOINT_TYPE_Field

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var interrupt_on_stall: INTERRUPT_ON_STALL_Field

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var interrupt_on_nak: INTERRUPT_ON_NAK_Field

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var buffer_address: BUFFER_ADDRESS_Field
    }

    @RegisterBank(offset: 0x000c)
    public var ep1_out_control: Register<EP1_OUT_CONTROL>

    @Register(bitWidth: 32)
    public struct EP1_OUT_CONTROL {
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var enable: ENABLE_Field

        /// This endpoint is double buffered.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var double_buffered: DOUBLE_BUFFERED_Field

        /// Trigger an interrupt each time a buffer is done.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var interrupt_per_buff: INTERRUPT_PER_BUFF_Field

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var interrupt_per_double_buff: INTERRUPT_PER_DOUBLE_BUFF_Field

        @ReadWrite(bits: 26..<28, as: ENDPOINT_TYPE_Values.self)
        public var endpoint_type: ENDPOINT_TYPE_Field

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var interrupt_on_stall: INTERRUPT_ON_STALL_Field

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var interrupt_on_nak: INTERRUPT_ON_NAK_Field

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var buffer_address: BUFFER_ADDRESS_Field
    }

    @RegisterBank(offset: 0x0010)
    public var ep2_in_control: Register<EP2_IN_CONTROL>

    @Register(bitWidth: 32)
    public struct EP2_IN_CONTROL {
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var enable: ENABLE_Field

        /// This endpoint is double buffered.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var double_buffered: DOUBLE_BUFFERED_Field

        /// Trigger an interrupt each time a buffer is done.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var interrupt_per_buff: INTERRUPT_PER_BUFF_Field

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var interrupt_per_double_buff: INTERRUPT_PER_DOUBLE_BUFF_Field

        @ReadWrite(bits: 26..<28, as: ENDPOINT_TYPE_Values.self)
        public var endpoint_type: ENDPOINT_TYPE_Field

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var interrupt_on_stall: INTERRUPT_ON_STALL_Field

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var interrupt_on_nak: INTERRUPT_ON_NAK_Field

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var buffer_address: BUFFER_ADDRESS_Field
    }

    @RegisterBank(offset: 0x0014)
    public var ep2_out_control: Register<EP2_OUT_CONTROL>

    @Register(bitWidth: 32)
    public struct EP2_OUT_CONTROL {
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var enable: ENABLE_Field

        /// This endpoint is double buffered.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var double_buffered: DOUBLE_BUFFERED_Field

        /// Trigger an interrupt each time a buffer is done.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var interrupt_per_buff: INTERRUPT_PER_BUFF_Field

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var interrupt_per_double_buff: INTERRUPT_PER_DOUBLE_BUFF_Field

        @ReadWrite(bits: 26..<28, as: ENDPOINT_TYPE_Values.self)
        public var endpoint_type: ENDPOINT_TYPE_Field

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var interrupt_on_stall: INTERRUPT_ON_STALL_Field

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var interrupt_on_nak: INTERRUPT_ON_NAK_Field

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var buffer_address: BUFFER_ADDRESS_Field
    }

    @RegisterBank(offset: 0x0018)
    public var ep3_in_control: Register<EP3_IN_CONTROL>

    @Register(bitWidth: 32)
    public struct EP3_IN_CONTROL {
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var enable: ENABLE_Field

        /// This endpoint is double buffered.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var double_buffered: DOUBLE_BUFFERED_Field

        /// Trigger an interrupt each time a buffer is done.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var interrupt_per_buff: INTERRUPT_PER_BUFF_Field

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var interrupt_per_double_buff: INTERRUPT_PER_DOUBLE_BUFF_Field

        @ReadWrite(bits: 26..<28, as: ENDPOINT_TYPE_Values.self)
        public var endpoint_type: ENDPOINT_TYPE_Field

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var interrupt_on_stall: INTERRUPT_ON_STALL_Field

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var interrupt_on_nak: INTERRUPT_ON_NAK_Field

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var buffer_address: BUFFER_ADDRESS_Field
    }

    @RegisterBank(offset: 0x001c)
    public var ep3_out_control: Register<EP3_OUT_CONTROL>

    @Register(bitWidth: 32)
    public struct EP3_OUT_CONTROL {
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var enable: ENABLE_Field

        /// This endpoint is double buffered.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var double_buffered: DOUBLE_BUFFERED_Field

        /// Trigger an interrupt each time a buffer is done.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var interrupt_per_buff: INTERRUPT_PER_BUFF_Field

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var interrupt_per_double_buff: INTERRUPT_PER_DOUBLE_BUFF_Field

        @ReadWrite(bits: 26..<28, as: ENDPOINT_TYPE_Values.self)
        public var endpoint_type: ENDPOINT_TYPE_Field

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var interrupt_on_stall: INTERRUPT_ON_STALL_Field

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var interrupt_on_nak: INTERRUPT_ON_NAK_Field

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var buffer_address: BUFFER_ADDRESS_Field
    }

    @RegisterBank(offset: 0x0020)
    public var ep4_in_control: Register<EP4_IN_CONTROL>

    @Register(bitWidth: 32)
    public struct EP4_IN_CONTROL {
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var enable: ENABLE_Field

        /// This endpoint is double buffered.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var double_buffered: DOUBLE_BUFFERED_Field

        /// Trigger an interrupt each time a buffer is done.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var interrupt_per_buff: INTERRUPT_PER_BUFF_Field

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var interrupt_per_double_buff: INTERRUPT_PER_DOUBLE_BUFF_Field

        @ReadWrite(bits: 26..<28, as: ENDPOINT_TYPE_Values.self)
        public var endpoint_type: ENDPOINT_TYPE_Field

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var interrupt_on_stall: INTERRUPT_ON_STALL_Field

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var interrupt_on_nak: INTERRUPT_ON_NAK_Field

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var buffer_address: BUFFER_ADDRESS_Field
    }

    @RegisterBank(offset: 0x0024)
    public var ep4_out_control: Register<EP4_OUT_CONTROL>

    @Register(bitWidth: 32)
    public struct EP4_OUT_CONTROL {
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var enable: ENABLE_Field

        /// This endpoint is double buffered.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var double_buffered: DOUBLE_BUFFERED_Field

        /// Trigger an interrupt each time a buffer is done.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var interrupt_per_buff: INTERRUPT_PER_BUFF_Field

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var interrupt_per_double_buff: INTERRUPT_PER_DOUBLE_BUFF_Field

        @ReadWrite(bits: 26..<28, as: ENDPOINT_TYPE_Values.self)
        public var endpoint_type: ENDPOINT_TYPE_Field

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var interrupt_on_stall: INTERRUPT_ON_STALL_Field

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var interrupt_on_nak: INTERRUPT_ON_NAK_Field

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var buffer_address: BUFFER_ADDRESS_Field
    }

    @RegisterBank(offset: 0x0028)
    public var ep5_in_control: Register<EP5_IN_CONTROL>

    @Register(bitWidth: 32)
    public struct EP5_IN_CONTROL {
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var enable: ENABLE_Field

        /// This endpoint is double buffered.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var double_buffered: DOUBLE_BUFFERED_Field

        /// Trigger an interrupt each time a buffer is done.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var interrupt_per_buff: INTERRUPT_PER_BUFF_Field

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var interrupt_per_double_buff: INTERRUPT_PER_DOUBLE_BUFF_Field

        @ReadWrite(bits: 26..<28, as: ENDPOINT_TYPE_Values.self)
        public var endpoint_type: ENDPOINT_TYPE_Field

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var interrupt_on_stall: INTERRUPT_ON_STALL_Field

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var interrupt_on_nak: INTERRUPT_ON_NAK_Field

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var buffer_address: BUFFER_ADDRESS_Field
    }

    @RegisterBank(offset: 0x002c)
    public var ep5_out_control: Register<EP5_OUT_CONTROL>

    @Register(bitWidth: 32)
    public struct EP5_OUT_CONTROL {
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var enable: ENABLE_Field

        /// This endpoint is double buffered.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var double_buffered: DOUBLE_BUFFERED_Field

        /// Trigger an interrupt each time a buffer is done.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var interrupt_per_buff: INTERRUPT_PER_BUFF_Field

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var interrupt_per_double_buff: INTERRUPT_PER_DOUBLE_BUFF_Field

        @ReadWrite(bits: 26..<28, as: ENDPOINT_TYPE_Values.self)
        public var endpoint_type: ENDPOINT_TYPE_Field

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var interrupt_on_stall: INTERRUPT_ON_STALL_Field

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var interrupt_on_nak: INTERRUPT_ON_NAK_Field

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var buffer_address: BUFFER_ADDRESS_Field
    }

    @RegisterBank(offset: 0x0030)
    public var ep6_in_control: Register<EP6_IN_CONTROL>

    @Register(bitWidth: 32)
    public struct EP6_IN_CONTROL {
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var enable: ENABLE_Field

        /// This endpoint is double buffered.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var double_buffered: DOUBLE_BUFFERED_Field

        /// Trigger an interrupt each time a buffer is done.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var interrupt_per_buff: INTERRUPT_PER_BUFF_Field

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var interrupt_per_double_buff: INTERRUPT_PER_DOUBLE_BUFF_Field

        @ReadWrite(bits: 26..<28, as: ENDPOINT_TYPE_Values.self)
        public var endpoint_type: ENDPOINT_TYPE_Field

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var interrupt_on_stall: INTERRUPT_ON_STALL_Field

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var interrupt_on_nak: INTERRUPT_ON_NAK_Field

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var buffer_address: BUFFER_ADDRESS_Field
    }

    @RegisterBank(offset: 0x0034)
    public var ep6_out_control: Register<EP6_OUT_CONTROL>

    @Register(bitWidth: 32)
    public struct EP6_OUT_CONTROL {
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var enable: ENABLE_Field

        /// This endpoint is double buffered.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var double_buffered: DOUBLE_BUFFERED_Field

        /// Trigger an interrupt each time a buffer is done.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var interrupt_per_buff: INTERRUPT_PER_BUFF_Field

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var interrupt_per_double_buff: INTERRUPT_PER_DOUBLE_BUFF_Field

        @ReadWrite(bits: 26..<28, as: ENDPOINT_TYPE_Values.self)
        public var endpoint_type: ENDPOINT_TYPE_Field

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var interrupt_on_stall: INTERRUPT_ON_STALL_Field

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var interrupt_on_nak: INTERRUPT_ON_NAK_Field

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var buffer_address: BUFFER_ADDRESS_Field
    }

    @RegisterBank(offset: 0x0038)
    public var ep7_in_control: Register<EP7_IN_CONTROL>

    @Register(bitWidth: 32)
    public struct EP7_IN_CONTROL {
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var enable: ENABLE_Field

        /// This endpoint is double buffered.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var double_buffered: DOUBLE_BUFFERED_Field

        /// Trigger an interrupt each time a buffer is done.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var interrupt_per_buff: INTERRUPT_PER_BUFF_Field

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var interrupt_per_double_buff: INTERRUPT_PER_DOUBLE_BUFF_Field

        @ReadWrite(bits: 26..<28, as: ENDPOINT_TYPE_Values.self)
        public var endpoint_type: ENDPOINT_TYPE_Field

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var interrupt_on_stall: INTERRUPT_ON_STALL_Field

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var interrupt_on_nak: INTERRUPT_ON_NAK_Field

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var buffer_address: BUFFER_ADDRESS_Field
    }

    @RegisterBank(offset: 0x003c)
    public var ep7_out_control: Register<EP7_OUT_CONTROL>

    @Register(bitWidth: 32)
    public struct EP7_OUT_CONTROL {
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var enable: ENABLE_Field

        /// This endpoint is double buffered.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var double_buffered: DOUBLE_BUFFERED_Field

        /// Trigger an interrupt each time a buffer is done.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var interrupt_per_buff: INTERRUPT_PER_BUFF_Field

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var interrupt_per_double_buff: INTERRUPT_PER_DOUBLE_BUFF_Field

        @ReadWrite(bits: 26..<28, as: ENDPOINT_TYPE_Values.self)
        public var endpoint_type: ENDPOINT_TYPE_Field

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var interrupt_on_stall: INTERRUPT_ON_STALL_Field

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var interrupt_on_nak: INTERRUPT_ON_NAK_Field

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var buffer_address: BUFFER_ADDRESS_Field
    }

    @RegisterBank(offset: 0x0040)
    public var ep8_in_control: Register<EP8_IN_CONTROL>

    @Register(bitWidth: 32)
    public struct EP8_IN_CONTROL {
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var enable: ENABLE_Field

        /// This endpoint is double buffered.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var double_buffered: DOUBLE_BUFFERED_Field

        /// Trigger an interrupt each time a buffer is done.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var interrupt_per_buff: INTERRUPT_PER_BUFF_Field

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var interrupt_per_double_buff: INTERRUPT_PER_DOUBLE_BUFF_Field

        @ReadWrite(bits: 26..<28, as: ENDPOINT_TYPE_Values.self)
        public var endpoint_type: ENDPOINT_TYPE_Field

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var interrupt_on_stall: INTERRUPT_ON_STALL_Field

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var interrupt_on_nak: INTERRUPT_ON_NAK_Field

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var buffer_address: BUFFER_ADDRESS_Field
    }

    @RegisterBank(offset: 0x0044)
    public var ep8_out_control: Register<EP8_OUT_CONTROL>

    @Register(bitWidth: 32)
    public struct EP8_OUT_CONTROL {
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var enable: ENABLE_Field

        /// This endpoint is double buffered.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var double_buffered: DOUBLE_BUFFERED_Field

        /// Trigger an interrupt each time a buffer is done.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var interrupt_per_buff: INTERRUPT_PER_BUFF_Field

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var interrupt_per_double_buff: INTERRUPT_PER_DOUBLE_BUFF_Field

        @ReadWrite(bits: 26..<28, as: ENDPOINT_TYPE_Values.self)
        public var endpoint_type: ENDPOINT_TYPE_Field

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var interrupt_on_stall: INTERRUPT_ON_STALL_Field

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var interrupt_on_nak: INTERRUPT_ON_NAK_Field

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var buffer_address: BUFFER_ADDRESS_Field
    }

    @RegisterBank(offset: 0x0048)
    public var ep9_in_control: Register<EP9_IN_CONTROL>

    @Register(bitWidth: 32)
    public struct EP9_IN_CONTROL {
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var enable: ENABLE_Field

        /// This endpoint is double buffered.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var double_buffered: DOUBLE_BUFFERED_Field

        /// Trigger an interrupt each time a buffer is done.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var interrupt_per_buff: INTERRUPT_PER_BUFF_Field

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var interrupt_per_double_buff: INTERRUPT_PER_DOUBLE_BUFF_Field

        @ReadWrite(bits: 26..<28, as: ENDPOINT_TYPE_Values.self)
        public var endpoint_type: ENDPOINT_TYPE_Field

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var interrupt_on_stall: INTERRUPT_ON_STALL_Field

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var interrupt_on_nak: INTERRUPT_ON_NAK_Field

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var buffer_address: BUFFER_ADDRESS_Field
    }

    @RegisterBank(offset: 0x004c)
    public var ep9_out_control: Register<EP9_OUT_CONTROL>

    @Register(bitWidth: 32)
    public struct EP9_OUT_CONTROL {
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var enable: ENABLE_Field

        /// This endpoint is double buffered.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var double_buffered: DOUBLE_BUFFERED_Field

        /// Trigger an interrupt each time a buffer is done.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var interrupt_per_buff: INTERRUPT_PER_BUFF_Field

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var interrupt_per_double_buff: INTERRUPT_PER_DOUBLE_BUFF_Field

        @ReadWrite(bits: 26..<28, as: ENDPOINT_TYPE_Values.self)
        public var endpoint_type: ENDPOINT_TYPE_Field

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var interrupt_on_stall: INTERRUPT_ON_STALL_Field

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var interrupt_on_nak: INTERRUPT_ON_NAK_Field

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var buffer_address: BUFFER_ADDRESS_Field
    }

    @RegisterBank(offset: 0x0050)
    public var ep10_in_control: Register<EP10_IN_CONTROL>

    @Register(bitWidth: 32)
    public struct EP10_IN_CONTROL {
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var enable: ENABLE_Field

        /// This endpoint is double buffered.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var double_buffered: DOUBLE_BUFFERED_Field

        /// Trigger an interrupt each time a buffer is done.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var interrupt_per_buff: INTERRUPT_PER_BUFF_Field

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var interrupt_per_double_buff: INTERRUPT_PER_DOUBLE_BUFF_Field

        @ReadWrite(bits: 26..<28, as: ENDPOINT_TYPE_Values.self)
        public var endpoint_type: ENDPOINT_TYPE_Field

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var interrupt_on_stall: INTERRUPT_ON_STALL_Field

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var interrupt_on_nak: INTERRUPT_ON_NAK_Field

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var buffer_address: BUFFER_ADDRESS_Field
    }

    @RegisterBank(offset: 0x0054)
    public var ep10_out_control: Register<EP10_OUT_CONTROL>

    @Register(bitWidth: 32)
    public struct EP10_OUT_CONTROL {
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var enable: ENABLE_Field

        /// This endpoint is double buffered.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var double_buffered: DOUBLE_BUFFERED_Field

        /// Trigger an interrupt each time a buffer is done.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var interrupt_per_buff: INTERRUPT_PER_BUFF_Field

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var interrupt_per_double_buff: INTERRUPT_PER_DOUBLE_BUFF_Field

        @ReadWrite(bits: 26..<28, as: ENDPOINT_TYPE_Values.self)
        public var endpoint_type: ENDPOINT_TYPE_Field

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var interrupt_on_stall: INTERRUPT_ON_STALL_Field

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var interrupt_on_nak: INTERRUPT_ON_NAK_Field

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var buffer_address: BUFFER_ADDRESS_Field
    }

    @RegisterBank(offset: 0x0058)
    public var ep11_in_control: Register<EP11_IN_CONTROL>

    @Register(bitWidth: 32)
    public struct EP11_IN_CONTROL {
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var enable: ENABLE_Field

        /// This endpoint is double buffered.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var double_buffered: DOUBLE_BUFFERED_Field

        /// Trigger an interrupt each time a buffer is done.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var interrupt_per_buff: INTERRUPT_PER_BUFF_Field

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var interrupt_per_double_buff: INTERRUPT_PER_DOUBLE_BUFF_Field

        @ReadWrite(bits: 26..<28, as: ENDPOINT_TYPE_Values.self)
        public var endpoint_type: ENDPOINT_TYPE_Field

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var interrupt_on_stall: INTERRUPT_ON_STALL_Field

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var interrupt_on_nak: INTERRUPT_ON_NAK_Field

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var buffer_address: BUFFER_ADDRESS_Field
    }

    @RegisterBank(offset: 0x005c)
    public var ep11_out_control: Register<EP11_OUT_CONTROL>

    @Register(bitWidth: 32)
    public struct EP11_OUT_CONTROL {
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var enable: ENABLE_Field

        /// This endpoint is double buffered.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var double_buffered: DOUBLE_BUFFERED_Field

        /// Trigger an interrupt each time a buffer is done.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var interrupt_per_buff: INTERRUPT_PER_BUFF_Field

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var interrupt_per_double_buff: INTERRUPT_PER_DOUBLE_BUFF_Field

        @ReadWrite(bits: 26..<28, as: ENDPOINT_TYPE_Values.self)
        public var endpoint_type: ENDPOINT_TYPE_Field

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var interrupt_on_stall: INTERRUPT_ON_STALL_Field

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var interrupt_on_nak: INTERRUPT_ON_NAK_Field

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var buffer_address: BUFFER_ADDRESS_Field
    }

    @RegisterBank(offset: 0x0060)
    public var ep12_in_control: Register<EP12_IN_CONTROL>

    @Register(bitWidth: 32)
    public struct EP12_IN_CONTROL {
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var enable: ENABLE_Field

        /// This endpoint is double buffered.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var double_buffered: DOUBLE_BUFFERED_Field

        /// Trigger an interrupt each time a buffer is done.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var interrupt_per_buff: INTERRUPT_PER_BUFF_Field

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var interrupt_per_double_buff: INTERRUPT_PER_DOUBLE_BUFF_Field

        @ReadWrite(bits: 26..<28, as: ENDPOINT_TYPE_Values.self)
        public var endpoint_type: ENDPOINT_TYPE_Field

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var interrupt_on_stall: INTERRUPT_ON_STALL_Field

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var interrupt_on_nak: INTERRUPT_ON_NAK_Field

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var buffer_address: BUFFER_ADDRESS_Field
    }

    @RegisterBank(offset: 0x0064)
    public var ep12_out_control: Register<EP12_OUT_CONTROL>

    @Register(bitWidth: 32)
    public struct EP12_OUT_CONTROL {
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var enable: ENABLE_Field

        /// This endpoint is double buffered.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var double_buffered: DOUBLE_BUFFERED_Field

        /// Trigger an interrupt each time a buffer is done.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var interrupt_per_buff: INTERRUPT_PER_BUFF_Field

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var interrupt_per_double_buff: INTERRUPT_PER_DOUBLE_BUFF_Field

        @ReadWrite(bits: 26..<28, as: ENDPOINT_TYPE_Values.self)
        public var endpoint_type: ENDPOINT_TYPE_Field

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var interrupt_on_stall: INTERRUPT_ON_STALL_Field

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var interrupt_on_nak: INTERRUPT_ON_NAK_Field

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var buffer_address: BUFFER_ADDRESS_Field
    }

    @RegisterBank(offset: 0x0068)
    public var ep13_in_control: Register<EP13_IN_CONTROL>

    @Register(bitWidth: 32)
    public struct EP13_IN_CONTROL {
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var enable: ENABLE_Field

        /// This endpoint is double buffered.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var double_buffered: DOUBLE_BUFFERED_Field

        /// Trigger an interrupt each time a buffer is done.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var interrupt_per_buff: INTERRUPT_PER_BUFF_Field

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var interrupt_per_double_buff: INTERRUPT_PER_DOUBLE_BUFF_Field

        @ReadWrite(bits: 26..<28, as: ENDPOINT_TYPE_Values.self)
        public var endpoint_type: ENDPOINT_TYPE_Field

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var interrupt_on_stall: INTERRUPT_ON_STALL_Field

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var interrupt_on_nak: INTERRUPT_ON_NAK_Field

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var buffer_address: BUFFER_ADDRESS_Field
    }

    @RegisterBank(offset: 0x006c)
    public var ep13_out_control: Register<EP13_OUT_CONTROL>

    @Register(bitWidth: 32)
    public struct EP13_OUT_CONTROL {
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var enable: ENABLE_Field

        /// This endpoint is double buffered.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var double_buffered: DOUBLE_BUFFERED_Field

        /// Trigger an interrupt each time a buffer is done.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var interrupt_per_buff: INTERRUPT_PER_BUFF_Field

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var interrupt_per_double_buff: INTERRUPT_PER_DOUBLE_BUFF_Field

        @ReadWrite(bits: 26..<28, as: ENDPOINT_TYPE_Values.self)
        public var endpoint_type: ENDPOINT_TYPE_Field

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var interrupt_on_stall: INTERRUPT_ON_STALL_Field

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var interrupt_on_nak: INTERRUPT_ON_NAK_Field

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var buffer_address: BUFFER_ADDRESS_Field
    }

    @RegisterBank(offset: 0x0070)
    public var ep14_in_control: Register<EP14_IN_CONTROL>

    @Register(bitWidth: 32)
    public struct EP14_IN_CONTROL {
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var enable: ENABLE_Field

        /// This endpoint is double buffered.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var double_buffered: DOUBLE_BUFFERED_Field

        /// Trigger an interrupt each time a buffer is done.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var interrupt_per_buff: INTERRUPT_PER_BUFF_Field

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var interrupt_per_double_buff: INTERRUPT_PER_DOUBLE_BUFF_Field

        @ReadWrite(bits: 26..<28, as: ENDPOINT_TYPE_Values.self)
        public var endpoint_type: ENDPOINT_TYPE_Field

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var interrupt_on_stall: INTERRUPT_ON_STALL_Field

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var interrupt_on_nak: INTERRUPT_ON_NAK_Field

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var buffer_address: BUFFER_ADDRESS_Field
    }

    @RegisterBank(offset: 0x0074)
    public var ep14_out_control: Register<EP14_OUT_CONTROL>

    @Register(bitWidth: 32)
    public struct EP14_OUT_CONTROL {
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var enable: ENABLE_Field

        /// This endpoint is double buffered.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var double_buffered: DOUBLE_BUFFERED_Field

        /// Trigger an interrupt each time a buffer is done.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var interrupt_per_buff: INTERRUPT_PER_BUFF_Field

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var interrupt_per_double_buff: INTERRUPT_PER_DOUBLE_BUFF_Field

        @ReadWrite(bits: 26..<28, as: ENDPOINT_TYPE_Values.self)
        public var endpoint_type: ENDPOINT_TYPE_Field

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var interrupt_on_stall: INTERRUPT_ON_STALL_Field

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var interrupt_on_nak: INTERRUPT_ON_NAK_Field

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var buffer_address: BUFFER_ADDRESS_Field
    }

    @RegisterBank(offset: 0x0078)
    public var ep15_in_control: Register<EP15_IN_CONTROL>

    @Register(bitWidth: 32)
    public struct EP15_IN_CONTROL {
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var enable: ENABLE_Field

        /// This endpoint is double buffered.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var double_buffered: DOUBLE_BUFFERED_Field

        /// Trigger an interrupt each time a buffer is done.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var interrupt_per_buff: INTERRUPT_PER_BUFF_Field

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var interrupt_per_double_buff: INTERRUPT_PER_DOUBLE_BUFF_Field

        @ReadWrite(bits: 26..<28, as: ENDPOINT_TYPE_Values.self)
        public var endpoint_type: ENDPOINT_TYPE_Field

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var interrupt_on_stall: INTERRUPT_ON_STALL_Field

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var interrupt_on_nak: INTERRUPT_ON_NAK_Field

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var buffer_address: BUFFER_ADDRESS_Field
    }

    @RegisterBank(offset: 0x007c)
    public var ep15_out_control: Register<EP15_OUT_CONTROL>

    @Register(bitWidth: 32)
    public struct EP15_OUT_CONTROL {
        /// Enable this endpoint. The device will not reply to any packets for this endpoint if this bit is not set.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var enable: ENABLE_Field

        /// This endpoint is double buffered.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var double_buffered: DOUBLE_BUFFERED_Field

        /// Trigger an interrupt each time a buffer is done.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var interrupt_per_buff: INTERRUPT_PER_BUFF_Field

        /// Trigger an interrupt each time both buffers are done. Only valid in double buffered mode.
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var interrupt_per_double_buff: INTERRUPT_PER_DOUBLE_BUFF_Field

        @ReadWrite(bits: 26..<28, as: ENDPOINT_TYPE_Values.self)
        public var endpoint_type: ENDPOINT_TYPE_Field

        public enum ENDPOINT_TYPE_Values: UInt, BitFieldProjectable {
            case ENDPOINT_TYPE_Control = 0
            case ENDPOINT_TYPE_Isochronous = 1
            case ENDPOINT_TYPE_Bulk = 2
            case ENDPOINT_TYPE_Interrupt = 3

            public static var bitWidth: Int { 2 }
        }

        /// Trigger an interrupt if a STALL is sent. Intended for debug only.
        @ReadWrite(bits: 17..<18, as: Bool.self)
        public var interrupt_on_stall: INTERRUPT_ON_STALL_Field

        /// Trigger an interrupt if a NAK is sent. Intended for debug only.
        @ReadWrite(bits: 16..<17, as: Bool.self)
        public var interrupt_on_nak: INTERRUPT_ON_NAK_Field

        /// 64 byte aligned buffer address for this EP (bits 0-5 are ignored). Relative to the start of the DPRAM.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var buffer_address: BUFFER_ADDRESS_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x0080)
    public var ep0_in_buffer_control: Register<EP0_IN_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP0_IN_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x0084)
    public var ep0_out_buffer_control: Register<EP0_OUT_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP0_OUT_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x0088)
    public var ep1_in_buffer_control: Register<EP1_IN_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP1_IN_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x008c)
    public var ep1_out_buffer_control: Register<EP1_OUT_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP1_OUT_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x0090)
    public var ep2_in_buffer_control: Register<EP2_IN_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP2_IN_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x0094)
    public var ep2_out_buffer_control: Register<EP2_OUT_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP2_OUT_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x0098)
    public var ep3_in_buffer_control: Register<EP3_IN_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP3_IN_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x009c)
    public var ep3_out_buffer_control: Register<EP3_OUT_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP3_OUT_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x00a0)
    public var ep4_in_buffer_control: Register<EP4_IN_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP4_IN_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x00a4)
    public var ep4_out_buffer_control: Register<EP4_OUT_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP4_OUT_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x00a8)
    public var ep5_in_buffer_control: Register<EP5_IN_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP5_IN_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x00ac)
    public var ep5_out_buffer_control: Register<EP5_OUT_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP5_OUT_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x00b0)
    public var ep6_in_buffer_control: Register<EP6_IN_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP6_IN_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x00b4)
    public var ep6_out_buffer_control: Register<EP6_OUT_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP6_OUT_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x00b8)
    public var ep7_in_buffer_control: Register<EP7_IN_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP7_IN_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x00bc)
    public var ep7_out_buffer_control: Register<EP7_OUT_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP7_OUT_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x00c0)
    public var ep8_in_buffer_control: Register<EP8_IN_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP8_IN_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x00c4)
    public var ep8_out_buffer_control: Register<EP8_OUT_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP8_OUT_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x00c8)
    public var ep9_in_buffer_control: Register<EP9_IN_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP9_IN_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x00cc)
    public var ep9_out_buffer_control: Register<EP9_OUT_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP9_OUT_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x00d0)
    public var ep10_in_buffer_control: Register<EP10_IN_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP10_IN_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x00d4)
    public var ep10_out_buffer_control: Register<EP10_OUT_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP10_OUT_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x00d8)
    public var ep11_in_buffer_control: Register<EP11_IN_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP11_IN_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x00dc)
    public var ep11_out_buffer_control: Register<EP11_OUT_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP11_OUT_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x00e0)
    public var ep12_in_buffer_control: Register<EP12_IN_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP12_IN_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x00e4)
    public var ep12_out_buffer_control: Register<EP12_OUT_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP12_OUT_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x00e8)
    public var ep13_in_buffer_control: Register<EP13_IN_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP13_IN_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x00ec)
    public var ep13_out_buffer_control: Register<EP13_OUT_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP13_OUT_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x00f0)
    public var ep14_in_buffer_control: Register<EP14_IN_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP14_IN_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x00f4)
    public var ep14_out_buffer_control: Register<EP14_OUT_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP14_OUT_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x00f8)
    public var ep15_in_buffer_control: Register<EP15_IN_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP15_IN_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }

    /// Buffer control for both buffers of an endpoint. Fields ending in a _1 are for buffer 1.
    /// Fields ending in a _0 are for buffer 0. Buffer 1 controls are only valid if the endpoint is in double buffered mode.
    @RegisterBank(offset: 0x00fc)
    public var ep15_out_buffer_control: Register<EP15_OUT_BUFFER_CONTROL>

    @Register(bitWidth: 32)
    public struct EP15_OUT_BUFFER_CONTROL {
        /// Buffer 1 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var full_1: FULL_1_Field

        /// Buffer 1 is the last buffer of the transfer.
        @ReadWrite(bits: 30..<31, as: Bool.self)
        public var last_1: LAST_1_Field

        /// The data pid of buffer 1.
        @ReadWrite(bits: 29..<30, as: Bool.self)
        public var pid_1: PID_1_Field

        /// The number of bytes buffer 1 is offset from buffer 0 in Isochronous mode. Only valid in double buffered mode for an Isochronous endpoint.
        /// For a non Isochronous endpoint the offset is always 64 bytes.
        @ReadWrite(bits: 27..<29, as: DOUBLE_BUFFER_ISO_OFFSET_Values.self)
        public var double_buffer_iso_offset: DOUBLE_BUFFER_ISO_OFFSET_Field

        public enum DOUBLE_BUFFER_ISO_OFFSET_Values: UInt, BitFieldProjectable {
            case DOUBLE_BUFFER_ISO_OFFSET_128 = 0
            case DOUBLE_BUFFER_ISO_OFFSET_256 = 1
            case DOUBLE_BUFFER_ISO_OFFSET_512 = 2
            case DOUBLE_BUFFER_ISO_OFFSET_1024 = 3

            public static var bitWidth: Int { 2 }
        }

        /// Buffer 1 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var available_1: AVAILABLE_1_Field

        /// The length of the data in buffer 1.
        @ReadWrite(bits: 16..<26, as: BitField10.self)
        public var length_1: LENGTH_1_Field

        /// Buffer 0 is full. For an IN transfer (TX to the host) the bit is set to indicate the data is valid. For an OUT transfer (RX from the host) this bit should be left as a 0. The host will set it when it has filled the buffer with data.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var full_0: FULL_0_Field

        /// Buffer 0 is the last buffer of the transfer.
        @ReadWrite(bits: 14..<15, as: Bool.self)
        public var last_0: LAST_0_Field

        /// The data pid of buffer 0.
        @ReadWrite(bits: 13..<14, as: Bool.self)
        public var pid_0: PID_0_Field

        /// Reset the buffer selector to buffer 0.
        @ReadWrite(bits: 12..<13, as: Bool.self)
        public var reset: RESET_Field

        /// Reply with a stall (valid for both buffers).
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var stall: STALL_Field

        /// Buffer 0 is available. This bit is set to indicate the buffer can be used by the controller. The controller clears the available bit when writing the status back.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var available_0: AVAILABLE_0_Field

        /// The length of the data in buffer 0.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var length_0: LENGTH_0_Field
    }
}