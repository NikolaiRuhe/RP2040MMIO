import MMIO
import MMIOExtensions

/// DW_apb_i2c address block
/// List of configuration constants for the Synopsys I2C hardware (you may see references to these in I2C register header; these are *fixed* values, set at hardware design time):
/// IC_ULTRA_FAST_MODE ................ 0x0
/// IC_UFM_TBUF_CNT_DEFAULT ........... 0x8
/// IC_UFM_SCL_LOW_COUNT .............. 0x0008
/// IC_UFM_SCL_HIGH_COUNT ............. 0x0006
/// IC_TX_TL .......................... 0x0
/// IC_TX_CMD_BLOCK ................... 0x1
/// IC_HAS_DMA ........................ 0x1
/// IC_HAS_ASYNC_FIFO ................. 0x0
/// IC_SMBUS_ARP ...................... 0x0
/// IC_FIRST_DATA_BYTE_STATUS ......... 0x1
/// IC_INTR_IO ........................ 0x1
/// IC_MASTER_MODE .................... 0x1
/// IC_DEFAULT_ACK_GENERAL_CALL ....... 0x1
/// IC_INTR_POL ....................... 0x1
/// IC_OPTIONAL_SAR ................... 0x0
/// IC_DEFAULT_TAR_SLAVE_ADDR ......... 0x055
/// IC_DEFAULT_SLAVE_ADDR ............. 0x055
/// IC_DEFAULT_HS_SPKLEN .............. 0x1
/// IC_FS_SCL_HIGH_COUNT .............. 0x0006
/// IC_HS_SCL_LOW_COUNT ............... 0x0008
/// IC_DEVICE_ID_VALUE ................ 0x0
/// IC_10BITADDR_MASTER ............... 0x0
/// IC_CLK_FREQ_OPTIMIZATION .......... 0x0
/// IC_DEFAULT_FS_SPKLEN .............. 0x7
/// IC_ADD_ENCODED_PARAMS ............. 0x0
/// IC_DEFAULT_SDA_HOLD ............... 0x000001
/// IC_DEFAULT_SDA_SETUP .............. 0x64
/// IC_AVOID_RX_FIFO_FLUSH_ON_TX_ABRT . 0x0
/// IC_CLOCK_PERIOD ................... 100
/// IC_EMPTYFIFO_HOLD_MASTER_EN ....... 1
/// IC_RESTART_EN ..................... 0x1
/// IC_TX_CMD_BLOCK_DEFAULT ........... 0x0
/// IC_BUS_CLEAR_FEATURE .............. 0x0
/// IC_CAP_LOADING .................... 100
/// IC_FS_SCL_LOW_COUNT ............... 0x000d
/// APB_DATA_WIDTH .................... 32
/// IC_SDA_STUCK_TIMEOUT_DEFAULT ...... 0xffffffff
/// IC_SLV_DATA_NACK_ONLY ............. 0x1
/// IC_10BITADDR_SLAVE ................ 0x0
/// IC_CLK_TYPE ....................... 0x0
/// IC_SMBUS_UDID_MSB ................. 0x0
/// IC_SMBUS_SUSPEND_ALERT ............ 0x0
/// IC_HS_SCL_HIGH_COUNT .............. 0x0006
/// IC_SLV_RESTART_DET_EN ............. 0x1
/// IC_SMBUS .......................... 0x0
/// IC_OPTIONAL_SAR_DEFAULT ........... 0x0
/// IC_PERSISTANT_SLV_ADDR_DEFAULT .... 0x0
/// IC_USE_COUNTS ..................... 0x0
/// IC_RX_BUFFER_DEPTH ................ 16
/// IC_SCL_STUCK_TIMEOUT_DEFAULT ...... 0xffffffff
/// IC_RX_FULL_HLD_BUS_EN ............. 0x1
/// IC_SLAVE_DISABLE .................. 0x1
/// IC_RX_TL .......................... 0x0
/// IC_DEVICE_ID ...................... 0x0
/// IC_HC_COUNT_VALUES ................ 0x0
/// I2C_DYNAMIC_TAR_UPDATE ............ 0
/// IC_SMBUS_CLK_LOW_MEXT_DEFAULT ..... 0xffffffff
/// IC_SMBUS_CLK_LOW_SEXT_DEFAULT ..... 0xffffffff
/// IC_HS_MASTER_CODE ................. 0x1
/// IC_SMBUS_RST_IDLE_CNT_DEFAULT ..... 0xffff
/// IC_SMBUS_UDID_LSB_DEFAULT ......... 0xffffffff
/// IC_SS_SCL_HIGH_COUNT .............. 0x0028
/// IC_SS_SCL_LOW_COUNT ............... 0x002f
/// IC_MAX_SPEED_MODE ................. 0x2
/// IC_STAT_FOR_CLK_STRETCH ........... 0x0
/// IC_STOP_DET_IF_MASTER_ACTIVE ...... 0x0
/// IC_DEFAULT_UFM_SPKLEN ............. 0x1
/// IC_TX_BUFFER_DEPTH ................ 16
@RegisterBank
public struct I2C0 {

    public static var `default`: Self { .init(unsafeAddress: 0x40044000) }

    /// I2C Control Register. This register can be written only when the DW_apb_i2c is disabled, which corresponds to the IC_ENABLE[0] register being set to 0. Writes at other times have no effect.
    /// Read/Write Access: - bit 10 is read only. - bit 11 is read only - bit 16 is read only - bit 17 is read only - bits 18 and 19 are read only.
    @RegisterBank(offset: 0x0000)
    public var ic_con: Register<IC_CON>

    @Register(bitWidth: 32)
    public struct IC_CON {
        /// Master issues the STOP_DET interrupt irrespective of whether master is active or not
        @ReadOnly(bits: 10..<11, as: Bool.self)
        public var stop_det_if_master_active: STOP_DET_IF_MASTER_ACTIVE_Field

        /// This bit controls whether DW_apb_i2c should hold the bus when the Rx FIFO is physically full to its RX_BUFFER_DEPTH, as described in the IC_RX_FULL_HLD_BUS_EN parameter.
        /// Reset value: 0x0.
        @ReadWrite(bits: 9..<10, as: RX_FIFO_FULL_HLD_CTRL_Values.self)
        public var rx_fifo_full_hld_ctrl: RX_FIFO_FULL_HLD_CTRL_Field

        public enum RX_FIFO_FULL_HLD_CTRL_Values: UInt, BitFieldProjectable {
            /// Overflow when RX_FIFO is full
            case RX_FIFO_FULL_HLD_CTRL_DISABLED = 0
            /// Hold bus when RX_FIFO is full
            case RX_FIFO_FULL_HLD_CTRL_ENABLED = 1

            public static var bitWidth: Int { 1 }
        }

        /// This bit controls the generation of the TX_EMPTY interrupt, as described in the IC_RAW_INTR_STAT register.
        /// Reset value: 0x0.
        @ReadWrite(bits: 8..<9, as: TX_EMPTY_CTRL_Values.self)
        public var tx_empty_ctrl: TX_EMPTY_CTRL_Field

        public enum TX_EMPTY_CTRL_Values: UInt, BitFieldProjectable {
            /// Default behaviour of TX_EMPTY interrupt
            case TX_EMPTY_CTRL_DISABLED = 0
            /// Controlled generation of TX_EMPTY interrupt
            case TX_EMPTY_CTRL_ENABLED = 1

            public static var bitWidth: Int { 1 }
        }

        /// In slave mode: - 1'b1:  issues the STOP_DET interrupt only when it is addressed. - 1'b0:  issues the STOP_DET irrespective of whether it's addressed or not. Reset value: 0x0
        /// NOTE: During a general call address, this slave does not issue the STOP_DET interrupt if STOP_DET_IF_ADDRESSED = 1'b1, even if the slave responds to the general call address by generating ACK. The STOP_DET interrupt is generated only when the transmitted address matches the slave address (SAR).
        @ReadWrite(bits: 7..<8, as: STOP_DET_IFADDRESSED_Values.self)
        public var stop_det_ifaddressed: STOP_DET_IFADDRESSED_Field

        public enum STOP_DET_IFADDRESSED_Values: UInt, BitFieldProjectable {
            /// slave issues STOP_DET intr always
            case STOP_DET_IFADDRESSED_DISABLED = 0
            /// slave issues STOP_DET intr only if addressed
            case STOP_DET_IFADDRESSED_ENABLED = 1

            public static var bitWidth: Int { 1 }
        }

        /// This bit controls whether I2C has its slave disabled, which means once the presetn signal is applied, then this bit is set and the slave is disabled.
        /// If this bit is set (slave is disabled), DW_apb_i2c functions only as a master and does not perform any action that requires a slave.
        /// NOTE: Software should ensure that if this bit is written with 0, then bit 0 should also be written with a 0.
        @ReadWrite(bits: 6..<7, as: IC_SLAVE_DISABLE_Values.self)
        public var ic_slave_disable: IC_SLAVE_DISABLE_Field

        public enum IC_SLAVE_DISABLE_Values: UInt, BitFieldProjectable {
            /// Slave mode is enabled
            case IC_SLAVE_DISABLE_SLAVE_ENABLED = 0
            /// Slave mode is disabled
            case IC_SLAVE_DISABLE_SLAVE_DISABLED = 1

            public static var bitWidth: Int { 1 }
        }

        /// Determines whether RESTART conditions may be sent when acting as a master. Some older slaves do not support handling RESTART conditions; however, RESTART conditions are used in several DW_apb_i2c operations. When RESTART is disabled, the master is prohibited from performing the following functions: - Sending a START BYTE - Performing any high-speed mode operation - High-speed mode operation - Performing direction changes in combined format mode - Performing a read operation with a 10-bit address By replacing RESTART condition followed by a STOP and a subsequent START condition, split operations are broken down into multiple DW_apb_i2c transfers. If the above operations are performed, it will result in setting bit 6 (TX_ABRT) of the IC_RAW_INTR_STAT register.
        /// Reset value: ENABLED
        @ReadWrite(bits: 5..<6, as: IC_RESTART_EN_Values.self)
        public var ic_restart_en: IC_RESTART_EN_Field

        public enum IC_RESTART_EN_Values: UInt, BitFieldProjectable {
            /// Master restart disabled
            case IC_RESTART_EN_DISABLED = 0
            /// Master restart enabled
            case IC_RESTART_EN_ENABLED = 1

            public static var bitWidth: Int { 1 }
        }

        /// Controls whether the DW_apb_i2c starts its transfers in 7- or 10-bit addressing mode when acting as a master. - 0: 7-bit addressing - 1: 10-bit addressing
        @ReadWrite(bits: 4..<5, as: IC_10BITADDR_MASTER_Values.self)
        public var ic_10bitaddr_master: IC_10BITADDR_MASTER_Field

        public enum IC_10BITADDR_MASTER_Values: UInt, BitFieldProjectable {
            /// Master 7Bit addressing mode
            case IC_10BITADDR_MASTER_ADDR_7BITS = 0
            /// Master 10Bit addressing mode
            case IC_10BITADDR_MASTER_ADDR_10BITS = 1

            public static var bitWidth: Int { 1 }
        }

        /// When acting as a slave, this bit controls whether the DW_apb_i2c responds to 7- or 10-bit addresses. - 0: 7-bit addressing. The DW_apb_i2c ignores transactions that involve 10-bit addressing; for 7-bit addressing, only the lower 7 bits of the IC_SAR register are compared. - 1: 10-bit addressing. The DW_apb_i2c responds to only 10-bit addressing transfers that match the full 10 bits of the IC_SAR register.
        @ReadWrite(bits: 3..<4, as: IC_10BITADDR_SLAVE_Values.self)
        public var ic_10bitaddr_slave: IC_10BITADDR_SLAVE_Field

        public enum IC_10BITADDR_SLAVE_Values: UInt, BitFieldProjectable {
            /// Slave 7Bit addressing
            case IC_10BITADDR_SLAVE_ADDR_7BITS = 0
            /// Slave 10Bit addressing
            case IC_10BITADDR_SLAVE_ADDR_10BITS = 1

            public static var bitWidth: Int { 1 }
        }

        /// These bits control at which speed the DW_apb_i2c operates; its setting is relevant only if one is operating the DW_apb_i2c in master mode. Hardware protects against illegal values being programmed by software. These bits must be programmed appropriately for slave mode also, as it is used to capture correct value of spike filter as per the speed mode.
        /// This register should be programmed only with a value in the range of 1 to IC_MAX_SPEED_MODE; otherwise, hardware updates this register with the value of IC_MAX_SPEED_MODE.
        /// 1: standard mode (100 kbit/s)
        /// 2: fast mode (<=400 kbit/s) or fast mode plus (<=1000Kbit/s)
        /// 3: high speed mode (3.4 Mbit/s)
        /// Note: This field is not applicable when IC_ULTRA_FAST_MODE=1
        @ReadWrite(bits: 1..<3, as: SPEED_Values.self)
        public var speed: SPEED_Field

        public enum SPEED_Values: UInt, BitFieldProjectable {
            /// Standard Speed mode of operation
            case SPEED_STANDARD = 1
            /// Fast or Fast Plus mode of operation
            case SPEED_FAST = 2
            /// High Speed mode of operation
            case SPEED_HIGH = 3

            public static var bitWidth: Int { 2 }
        }

        /// This bit controls whether the DW_apb_i2c master is enabled.
        /// NOTE: Software should ensure that if this bit is written with '1' then bit 6 should also be written with a '1'.
        @ReadWrite(bits: 0..<1, as: MASTER_MODE_Values.self)
        public var master_mode: MASTER_MODE_Field

        public enum MASTER_MODE_Values: UInt, BitFieldProjectable {
            /// Master mode is disabled
            case MASTER_MODE_DISABLED = 0
            /// Master mode is enabled
            case MASTER_MODE_ENABLED = 1

            public static var bitWidth: Int { 1 }
        }
    }

    /// I2C Target Address Register
    /// This register is 12 bits wide, and bits 31:12 are reserved. This register can be written to only when IC_ENABLE[0] is set to 0.
    /// Note: If the software or application is aware that the DW_apb_i2c is not using the TAR address for the pending commands in the Tx FIFO, then it is possible to update the TAR address even while the Tx FIFO has entries (IC_STATUS[2]= 0). - It is not necessary to perform any write to this register if DW_apb_i2c is enabled as an I2C slave only.
    @RegisterBank(offset: 0x0004)
    public var ic_tar: Register<IC_TAR>

    @Register(bitWidth: 32)
    public struct IC_TAR {
        /// This bit indicates whether software performs a Device-ID or General Call or START BYTE command. - 0: ignore bit 10 GC_OR_START and use IC_TAR normally - 1: perform special I2C command as specified in Device_ID or GC_OR_START bit Reset value: 0x0
        @ReadWrite(bits: 11..<12, as: SPECIAL_Values.self)
        public var special: SPECIAL_Field

        public enum SPECIAL_Values: UInt, BitFieldProjectable {
            /// Disables programming of GENERAL_CALL or START_BYTE transmission
            case SPECIAL_DISABLED = 0
            /// Enables programming of GENERAL_CALL or START_BYTE transmission
            case SPECIAL_ENABLED = 1

            public static var bitWidth: Int { 1 }
        }

        /// If bit 11 (SPECIAL) is set to 1 and bit 13(Device-ID) is set to 0, then this bit indicates whether a General Call or START byte command is to be performed by the DW_apb_i2c. - 0: General Call Address - after issuing a General Call, only writes may be performed. Attempting to issue a read command results in setting bit 6 (TX_ABRT) of the IC_RAW_INTR_STAT register. The DW_apb_i2c remains in General Call mode until the SPECIAL bit value (bit 11) is cleared. - 1: START BYTE Reset value: 0x0
        @ReadWrite(bits: 10..<11, as: GC_OR_START_Values.self)
        public var gc_or_start: GC_OR_START_Field

        public enum GC_OR_START_Values: UInt, BitFieldProjectable {
            /// GENERAL_CALL byte transmission
            case GC_OR_START_GENERAL_CALL = 0
            /// START byte transmission
            case GC_OR_START_START_BYTE = 1

            public static var bitWidth: Int { 1 }
        }

        /// This is the target address for any master transaction. When transmitting a General Call, these bits are ignored. To generate a START BYTE, the CPU needs to write only once into these bits.
        /// If the IC_TAR and IC_SAR are the same, loopback exists but the FIFOs are shared between master and slave, so full loopback is not feasible. Only one direction loopback mode is supported (simplex), not duplex. A master cannot transmit to itself; it can transmit to only a slave.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var ic_tar: IC_TAR_Field
    }

    /// I2C Slave Address Register
    @RegisterBank(offset: 0x0008)
    public var ic_sar: Register<IC_SAR>

    @Register(bitWidth: 32)
    public struct IC_SAR {
        /// The IC_SAR holds the slave address when the I2C is operating as a slave. For 7-bit addressing, only IC_SAR[6:0] is used.
        /// This register can be written only when the I2C interface is disabled, which corresponds to the IC_ENABLE[0] register being set to 0. Writes at other times have no effect.
        /// Note: The default values cannot be any of the reserved address locations: that is, 0x00 to 0x07, or 0x78 to 0x7f. The correct operation of the device is not guaranteed if you program the IC_SAR or IC_TAR to a reserved value. Refer to <<table_I2C_firstbyte_bit_defs>> for a complete list of these reserved values.
        @ReadWrite(bits: 0..<10, as: BitField10.self)
        public var ic_sar: IC_SAR_Field
    }

    /// I2C Rx/Tx Data Buffer and Command Register; this is the register the CPU writes to when filling the TX FIFO and the CPU reads from when retrieving bytes from RX FIFO.
    /// The size of the register changes as follows:
    /// Write: - 11 bits when IC_EMPTYFIFO_HOLD_MASTER_EN=1 - 9 bits when IC_EMPTYFIFO_HOLD_MASTER_EN=0 Read: - 12 bits when IC_FIRST_DATA_BYTE_STATUS = 1 - 8 bits when IC_FIRST_DATA_BYTE_STATUS = 0 Note: In order for the DW_apb_i2c to continue acknowledging reads, a read command should be written for every byte that is to be received; otherwise the DW_apb_i2c will stop acknowledging.
    @RegisterBank(offset: 0x0010)
    public var ic_data_cmd: Register<IC_DATA_CMD>

    @Register(bitWidth: 32)
    public struct IC_DATA_CMD {
        /// Indicates the first data byte received after the address phase for receive transfer in Master receiver or Slave receiver mode.
        /// Reset value : 0x0
        /// NOTE:  In case of APB_DATA_WIDTH=8,
        /// 1. The user has to perform two APB Reads to IC_DATA_CMD in order to get status on 11 bit.
        /// 2. In order to read the 11 bit, the user has to perform the first data byte read [7:0] (offset 0x10) and then perform the second read [15:8] (offset 0x11) in order to know the status of 11 bit (whether the data received in previous read is a first data byte or not).
        /// 3. The 11th bit is an optional read field, user can ignore 2nd byte read [15:8] (offset 0x11) if not interested in FIRST_DATA_BYTE status.
        @ReadOnly(bits: 11..<12, as: FIRST_DATA_BYTE_Values.self)
        public var first_data_byte: FIRST_DATA_BYTE_Field

        public enum FIRST_DATA_BYTE_Values: UInt, BitFieldProjectable {
            /// Sequential data byte received
            case FIRST_DATA_BYTE_INACTIVE = 0
            /// Non sequential data byte received
            case FIRST_DATA_BYTE_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        /// This bit controls whether a RESTART is issued before the byte is sent or received.
        /// 1 - If IC_RESTART_EN is 1, a RESTART is issued before the data is sent/received (according to the value of CMD), regardless of whether or not the transfer direction is changing from the previous command; if IC_RESTART_EN is 0, a STOP followed by a START is issued instead.
        /// 0 - If IC_RESTART_EN is 1, a RESTART is issued only if the transfer direction is changing from the previous command; if IC_RESTART_EN is 0, a STOP followed by a START is issued instead.
        /// Reset value: 0x0
        @ReadWrite(bits: 10..<11, as: RESTART_Values.self)
        public var restart: RESTART_Field

        public enum RESTART_Values: UInt, BitFieldProjectable {
            /// Don't Issue RESTART before this command
            case RESTART_DISABLE = 0
            /// Issue RESTART before this command
            case RESTART_ENABLE = 1

            public static var bitWidth: Int { 1 }
        }

        /// This bit controls whether a STOP is issued after the byte is sent or received.
        /// - 1 - STOP is issued after this byte, regardless of whether or not the Tx FIFO is empty. If the Tx FIFO is not empty, the master immediately tries to start a new transfer by issuing a START and arbitrating for the bus. - 0 - STOP is not issued after this byte, regardless of whether or not the Tx FIFO is empty. If the Tx FIFO is not empty, the master continues the current transfer by sending/receiving data bytes according to the value of the CMD bit. If the Tx FIFO is empty, the master holds the SCL line low and stalls the bus until a new command is available in the Tx FIFO. Reset value: 0x0
        @ReadWrite(bits: 9..<10, as: STOP_Values.self)
        public var stop: STOP_Field

        public enum STOP_Values: UInt, BitFieldProjectable {
            /// Don't Issue STOP after this command
            case STOP_DISABLE = 0
            /// Issue STOP after this command
            case STOP_ENABLE = 1

            public static var bitWidth: Int { 1 }
        }

        /// This bit controls whether a read or a write is performed. This bit does not control the direction when the DW_apb_i2con acts as a slave. It controls only the direction when it acts as a master.
        /// When a command is entered in the TX FIFO, this bit distinguishes the write and read commands. In slave-receiver mode, this bit is a 'don't care' because writes to this register are not required. In slave-transmitter mode, a '0' indicates that the data in IC_DATA_CMD is to be transmitted.
        /// When programming this bit, you should remember the following: attempting to perform a read operation after a General Call command has been sent results in a TX_ABRT interrupt (bit 6 of the IC_RAW_INTR_STAT register), unless bit 11 (SPECIAL) in the IC_TAR register has been cleared. If a '1' is written to this bit after receiving a RD_REQ interrupt, then a TX_ABRT interrupt occurs.
        /// Reset value: 0x0
        @ReadWrite(bits: 8..<9, as: CMD_Values.self)
        public var cmd: CMD_Field

        public enum CMD_Values: UInt, BitFieldProjectable {
            /// Master Write Command
            case CMD_WRITE = 0
            /// Master Read Command
            case CMD_READ = 1

            public static var bitWidth: Int { 1 }
        }

        /// This register contains the data to be transmitted or received on the I2C bus. If you are writing to this register and want to perform a read, bits 7:0 (DAT) are ignored by the DW_apb_i2c. However, when you read this register, these bits return the value of data received on the DW_apb_i2c interface.
        /// Reset value: 0x0
        @ReadWrite(bits: 0..<8, as: BitField8.self)
        public var dat: DAT_Field
    }

    /// Standard Speed I2C Clock SCL High Count Register
    @RegisterBank(offset: 0x0014)
    public var ic_ss_scl_hcnt: Register<IC_SS_SCL_HCNT>

    @Register(bitWidth: 32)
    public struct IC_SS_SCL_HCNT {
        /// This register must be set before any I2C bus transaction can take place to ensure proper I/O timing. This register sets the SCL clock high-period count for standard speed. For more information, refer to 'IC_CLK Frequency Configuration'.
        /// This register can be written only when the I2C interface is disabled which corresponds to the IC_ENABLE[0] register being set to 0. Writes at other times have no effect.
        /// The minimum valid value is 6; hardware prevents values less than this being written, and if attempted results in 6 being set. For designs with APB_DATA_WIDTH = 8, the order of programming is important to ensure the correct operation of the DW_apb_i2c. The lower byte must be programmed first. Then the upper byte is programmed.
        /// NOTE: This register must not be programmed to a value higher than 65525, because DW_apb_i2c uses a 16-bit counter to flag an I2C bus idle condition when this counter reaches a value of IC_SS_SCL_HCNT + 10.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var ic_ss_scl_hcnt: IC_SS_SCL_HCNT_Field
    }

    /// Standard Speed I2C Clock SCL Low Count Register
    @RegisterBank(offset: 0x0018)
    public var ic_ss_scl_lcnt: Register<IC_SS_SCL_LCNT>

    @Register(bitWidth: 32)
    public struct IC_SS_SCL_LCNT {
        /// This register must be set before any I2C bus transaction can take place to ensure proper I/O timing. This register sets the SCL clock low period count for standard speed. For more information, refer to 'IC_CLK Frequency Configuration'
        /// This register can be written only when the I2C interface is disabled which corresponds to the IC_ENABLE[0] register being set to 0. Writes at other times have no effect.
        /// The minimum valid value is 8; hardware prevents values less than this being written, and if attempted, results in 8 being set. For designs with APB_DATA_WIDTH = 8, the order of programming is important to ensure the correct operation of DW_apb_i2c. The lower byte must be programmed first, and then the upper byte is programmed.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var ic_ss_scl_lcnt: IC_SS_SCL_LCNT_Field
    }

    /// Fast Mode or Fast Mode Plus I2C Clock SCL High Count Register
    @RegisterBank(offset: 0x001c)
    public var ic_fs_scl_hcnt: Register<IC_FS_SCL_HCNT>

    @Register(bitWidth: 32)
    public struct IC_FS_SCL_HCNT {
        /// This register must be set before any I2C bus transaction can take place to ensure proper I/O timing. This register sets the SCL clock high-period count for fast mode or fast mode plus. It is used in high-speed mode to send the Master Code and START BYTE or General CALL. For more information, refer to 'IC_CLK Frequency Configuration'.
        /// This register goes away and becomes read-only returning 0s if IC_MAX_SPEED_MODE = standard. This register can be written only when the I2C interface is disabled, which corresponds to the IC_ENABLE[0] register being set to 0. Writes at other times have no effect.
        /// The minimum valid value is 6; hardware prevents values less than this being written, and if attempted results in 6 being set. For designs with APB_DATA_WIDTH == 8 the order of programming is important to ensure the correct operation of the DW_apb_i2c. The lower byte must be programmed first. Then the upper byte is programmed.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var ic_fs_scl_hcnt: IC_FS_SCL_HCNT_Field
    }

    /// Fast Mode or Fast Mode Plus I2C Clock SCL Low Count Register
    @RegisterBank(offset: 0x0020)
    public var ic_fs_scl_lcnt: Register<IC_FS_SCL_LCNT>

    @Register(bitWidth: 32)
    public struct IC_FS_SCL_LCNT {
        /// This register must be set before any I2C bus transaction can take place to ensure proper I/O timing. This register sets the SCL clock low period count for fast speed. It is used in high-speed mode to send the Master Code and START BYTE or General CALL. For more information, refer to 'IC_CLK Frequency Configuration'.
        /// This register goes away and becomes read-only returning 0s if IC_MAX_SPEED_MODE = standard.
        /// This register can be written only when the I2C interface is disabled, which corresponds to the IC_ENABLE[0] register being set to 0. Writes at other times have no effect.
        /// The minimum valid value is 8; hardware prevents values less than this being written, and if attempted results in 8 being set. For designs with APB_DATA_WIDTH = 8 the order of programming is important to ensure the correct operation of the DW_apb_i2c. The lower byte must be programmed first. Then the upper byte is programmed. If the value is less than 8 then the count value gets changed to 8.
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var ic_fs_scl_lcnt: IC_FS_SCL_LCNT_Field
    }

    /// I2C Interrupt Status Register
    /// Each bit in this register has a corresponding mask bit in the IC_INTR_MASK register. These bits are cleared by reading the matching interrupt clear register. The unmasked raw versions of these bits are available in the IC_RAW_INTR_STAT register.
    @RegisterBank(offset: 0x002c)
    public var ic_intr_stat: Register<IC_INTR_STAT>

    @Register(bitWidth: 32)
    public struct IC_INTR_STAT {
        /// See IC_RAW_INTR_STAT for a detailed description of R_RESTART_DET bit.
        /// Reset value: 0x0
        @ReadOnly(bits: 12..<13, as: R_RESTART_DET_Values.self)
        public var r_restart_det: R_RESTART_DET_Field

        public enum R_RESTART_DET_Values: UInt, BitFieldProjectable {
            /// R_RESTART_DET interrupt is inactive
            case R_RESTART_DET_INACTIVE = 0
            /// R_RESTART_DET interrupt is active
            case R_RESTART_DET_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        /// See IC_RAW_INTR_STAT for a detailed description of R_GEN_CALL bit.
        /// Reset value: 0x0
        @ReadOnly(bits: 11..<12, as: R_GEN_CALL_Values.self)
        public var r_gen_call: R_GEN_CALL_Field

        public enum R_GEN_CALL_Values: UInt, BitFieldProjectable {
            /// R_GEN_CALL interrupt is inactive
            case R_GEN_CALL_INACTIVE = 0
            /// R_GEN_CALL interrupt is active
            case R_GEN_CALL_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        /// See IC_RAW_INTR_STAT for a detailed description of R_START_DET bit.
        /// Reset value: 0x0
        @ReadOnly(bits: 10..<11, as: R_START_DET_Values.self)
        public var r_start_det: R_START_DET_Field

        public enum R_START_DET_Values: UInt, BitFieldProjectable {
            /// R_START_DET interrupt is inactive
            case R_START_DET_INACTIVE = 0
            /// R_START_DET interrupt is active
            case R_START_DET_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        /// See IC_RAW_INTR_STAT for a detailed description of R_STOP_DET bit.
        /// Reset value: 0x0
        @ReadOnly(bits: 9..<10, as: R_STOP_DET_Values.self)
        public var r_stop_det: R_STOP_DET_Field

        public enum R_STOP_DET_Values: UInt, BitFieldProjectable {
            /// R_STOP_DET interrupt is inactive
            case R_STOP_DET_INACTIVE = 0
            /// R_STOP_DET interrupt is active
            case R_STOP_DET_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        /// See IC_RAW_INTR_STAT for a detailed description of R_ACTIVITY bit.
        /// Reset value: 0x0
        @ReadOnly(bits: 8..<9, as: R_ACTIVITY_Values.self)
        public var r_activity: R_ACTIVITY_Field

        public enum R_ACTIVITY_Values: UInt, BitFieldProjectable {
            /// R_ACTIVITY interrupt is inactive
            case R_ACTIVITY_INACTIVE = 0
            /// R_ACTIVITY interrupt is active
            case R_ACTIVITY_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        /// See IC_RAW_INTR_STAT for a detailed description of R_RX_DONE bit.
        /// Reset value: 0x0
        @ReadOnly(bits: 7..<8, as: R_RX_DONE_Values.self)
        public var r_rx_done: R_RX_DONE_Field

        public enum R_RX_DONE_Values: UInt, BitFieldProjectable {
            /// R_RX_DONE interrupt is inactive
            case R_RX_DONE_INACTIVE = 0
            /// R_RX_DONE interrupt is active
            case R_RX_DONE_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        /// See IC_RAW_INTR_STAT for a detailed description of R_TX_ABRT bit.
        /// Reset value: 0x0
        @ReadOnly(bits: 6..<7, as: R_TX_ABRT_Values.self)
        public var r_tx_abrt: R_TX_ABRT_Field

        public enum R_TX_ABRT_Values: UInt, BitFieldProjectable {
            /// R_TX_ABRT interrupt is inactive
            case R_TX_ABRT_INACTIVE = 0
            /// R_TX_ABRT interrupt is active
            case R_TX_ABRT_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        /// See IC_RAW_INTR_STAT for a detailed description of R_RD_REQ bit.
        /// Reset value: 0x0
        @ReadOnly(bits: 5..<6, as: R_RD_REQ_Values.self)
        public var r_rd_req: R_RD_REQ_Field

        public enum R_RD_REQ_Values: UInt, BitFieldProjectable {
            /// R_RD_REQ interrupt is inactive
            case R_RD_REQ_INACTIVE = 0
            /// R_RD_REQ interrupt is active
            case R_RD_REQ_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        /// See IC_RAW_INTR_STAT for a detailed description of R_TX_EMPTY bit.
        /// Reset value: 0x0
        @ReadOnly(bits: 4..<5, as: R_TX_EMPTY_Values.self)
        public var r_tx_empty: R_TX_EMPTY_Field

        public enum R_TX_EMPTY_Values: UInt, BitFieldProjectable {
            /// R_TX_EMPTY interrupt is inactive
            case R_TX_EMPTY_INACTIVE = 0
            /// R_TX_EMPTY interrupt is active
            case R_TX_EMPTY_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        /// See IC_RAW_INTR_STAT for a detailed description of R_TX_OVER bit.
        /// Reset value: 0x0
        @ReadOnly(bits: 3..<4, as: R_TX_OVER_Values.self)
        public var r_tx_over: R_TX_OVER_Field

        public enum R_TX_OVER_Values: UInt, BitFieldProjectable {
            /// R_TX_OVER interrupt is inactive
            case R_TX_OVER_INACTIVE = 0
            /// R_TX_OVER interrupt is active
            case R_TX_OVER_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        /// See IC_RAW_INTR_STAT for a detailed description of R_RX_FULL bit.
        /// Reset value: 0x0
        @ReadOnly(bits: 2..<3, as: R_RX_FULL_Values.self)
        public var r_rx_full: R_RX_FULL_Field

        public enum R_RX_FULL_Values: UInt, BitFieldProjectable {
            /// R_RX_FULL interrupt is inactive
            case R_RX_FULL_INACTIVE = 0
            /// R_RX_FULL interrupt is active
            case R_RX_FULL_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        /// See IC_RAW_INTR_STAT for a detailed description of R_RX_OVER bit.
        /// Reset value: 0x0
        @ReadOnly(bits: 1..<2, as: R_RX_OVER_Values.self)
        public var r_rx_over: R_RX_OVER_Field

        public enum R_RX_OVER_Values: UInt, BitFieldProjectable {
            /// R_RX_OVER interrupt is inactive
            case R_RX_OVER_INACTIVE = 0
            /// R_RX_OVER interrupt is active
            case R_RX_OVER_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        /// See IC_RAW_INTR_STAT for a detailed description of R_RX_UNDER bit.
        /// Reset value: 0x0
        @ReadOnly(bits: 0..<1, as: R_RX_UNDER_Values.self)
        public var r_rx_under: R_RX_UNDER_Field

        public enum R_RX_UNDER_Values: UInt, BitFieldProjectable {
            /// RX_UNDER interrupt is inactive
            case R_RX_UNDER_INACTIVE = 0
            /// RX_UNDER interrupt is active
            case R_RX_UNDER_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
    }

    /// I2C Interrupt Mask Register.
    /// These bits mask their corresponding interrupt status bits. This register is active low; a value of 0 masks the interrupt, whereas a value of 1 unmasks the interrupt.
    @RegisterBank(offset: 0x0030)
    public var ic_intr_mask: Register<IC_INTR_MASK>

    @Register(bitWidth: 32)
    public struct IC_INTR_MASK {
        /// This bit masks the R_RESTART_DET interrupt in IC_INTR_STAT register.
        /// Reset value: 0x0
        @ReadWrite(bits: 12..<13, as: M_RESTART_DET_Values.self)
        public var m_restart_det: M_RESTART_DET_Field

        public enum M_RESTART_DET_Values: UInt, BitFieldProjectable {
            /// RESTART_DET interrupt is masked
            case M_RESTART_DET_ENABLED = 0
            /// RESTART_DET interrupt is unmasked
            case M_RESTART_DET_DISABLED = 1

            public static var bitWidth: Int { 1 }
        }

        /// This bit masks the R_GEN_CALL interrupt in IC_INTR_STAT register.
        /// Reset value: 0x1
        @ReadWrite(bits: 11..<12, as: M_GEN_CALL_Values.self)
        public var m_gen_call: M_GEN_CALL_Field

        public enum M_GEN_CALL_Values: UInt, BitFieldProjectable {
            /// GEN_CALL interrupt is masked
            case M_GEN_CALL_ENABLED = 0
            /// GEN_CALL interrupt is unmasked
            case M_GEN_CALL_DISABLED = 1

            public static var bitWidth: Int { 1 }
        }

        /// This bit masks the R_START_DET interrupt in IC_INTR_STAT register.
        /// Reset value: 0x0
        @ReadWrite(bits: 10..<11, as: M_START_DET_Values.self)
        public var m_start_det: M_START_DET_Field

        public enum M_START_DET_Values: UInt, BitFieldProjectable {
            /// START_DET interrupt is masked
            case M_START_DET_ENABLED = 0
            /// START_DET interrupt is unmasked
            case M_START_DET_DISABLED = 1

            public static var bitWidth: Int { 1 }
        }

        /// This bit masks the R_STOP_DET interrupt in IC_INTR_STAT register.
        /// Reset value: 0x0
        @ReadWrite(bits: 9..<10, as: M_STOP_DET_Values.self)
        public var m_stop_det: M_STOP_DET_Field

        public enum M_STOP_DET_Values: UInt, BitFieldProjectable {
            /// STOP_DET interrupt is masked
            case M_STOP_DET_ENABLED = 0
            /// STOP_DET interrupt is unmasked
            case M_STOP_DET_DISABLED = 1

            public static var bitWidth: Int { 1 }
        }

        /// This bit masks the R_ACTIVITY interrupt in IC_INTR_STAT register.
        /// Reset value: 0x0
        @ReadWrite(bits: 8..<9, as: M_ACTIVITY_Values.self)
        public var m_activity: M_ACTIVITY_Field

        public enum M_ACTIVITY_Values: UInt, BitFieldProjectable {
            /// ACTIVITY interrupt is masked
            case M_ACTIVITY_ENABLED = 0
            /// ACTIVITY interrupt is unmasked
            case M_ACTIVITY_DISABLED = 1

            public static var bitWidth: Int { 1 }
        }

        /// This bit masks the R_RX_DONE interrupt in IC_INTR_STAT register.
        /// Reset value: 0x1
        @ReadWrite(bits: 7..<8, as: M_RX_DONE_Values.self)
        public var m_rx_done: M_RX_DONE_Field

        public enum M_RX_DONE_Values: UInt, BitFieldProjectable {
            /// RX_DONE interrupt is masked
            case M_RX_DONE_ENABLED = 0
            /// RX_DONE interrupt is unmasked
            case M_RX_DONE_DISABLED = 1

            public static var bitWidth: Int { 1 }
        }

        /// This bit masks the R_TX_ABRT interrupt in IC_INTR_STAT register.
        /// Reset value: 0x1
        @ReadWrite(bits: 6..<7, as: M_TX_ABRT_Values.self)
        public var m_tx_abrt: M_TX_ABRT_Field

        public enum M_TX_ABRT_Values: UInt, BitFieldProjectable {
            /// TX_ABORT interrupt is masked
            case M_TX_ABRT_ENABLED = 0
            /// TX_ABORT interrupt is unmasked
            case M_TX_ABRT_DISABLED = 1

            public static var bitWidth: Int { 1 }
        }

        /// This bit masks the R_RD_REQ interrupt in IC_INTR_STAT register.
        /// Reset value: 0x1
        @ReadWrite(bits: 5..<6, as: M_RD_REQ_Values.self)
        public var m_rd_req: M_RD_REQ_Field

        public enum M_RD_REQ_Values: UInt, BitFieldProjectable {
            /// RD_REQ interrupt is masked
            case M_RD_REQ_ENABLED = 0
            /// RD_REQ interrupt is unmasked
            case M_RD_REQ_DISABLED = 1

            public static var bitWidth: Int { 1 }
        }

        /// This bit masks the R_TX_EMPTY interrupt in IC_INTR_STAT register.
        /// Reset value: 0x1
        @ReadWrite(bits: 4..<5, as: M_TX_EMPTY_Values.self)
        public var m_tx_empty: M_TX_EMPTY_Field

        public enum M_TX_EMPTY_Values: UInt, BitFieldProjectable {
            /// TX_EMPTY interrupt is masked
            case M_TX_EMPTY_ENABLED = 0
            /// TX_EMPTY interrupt is unmasked
            case M_TX_EMPTY_DISABLED = 1

            public static var bitWidth: Int { 1 }
        }

        /// This bit masks the R_TX_OVER interrupt in IC_INTR_STAT register.
        /// Reset value: 0x1
        @ReadWrite(bits: 3..<4, as: M_TX_OVER_Values.self)
        public var m_tx_over: M_TX_OVER_Field

        public enum M_TX_OVER_Values: UInt, BitFieldProjectable {
            /// TX_OVER interrupt is masked
            case M_TX_OVER_ENABLED = 0
            /// TX_OVER interrupt is unmasked
            case M_TX_OVER_DISABLED = 1

            public static var bitWidth: Int { 1 }
        }

        /// This bit masks the R_RX_FULL interrupt in IC_INTR_STAT register.
        /// Reset value: 0x1
        @ReadWrite(bits: 2..<3, as: M_RX_FULL_Values.self)
        public var m_rx_full: M_RX_FULL_Field

        public enum M_RX_FULL_Values: UInt, BitFieldProjectable {
            /// RX_FULL interrupt is masked
            case M_RX_FULL_ENABLED = 0
            /// RX_FULL interrupt is unmasked
            case M_RX_FULL_DISABLED = 1

            public static var bitWidth: Int { 1 }
        }

        /// This bit masks the R_RX_OVER interrupt in IC_INTR_STAT register.
        /// Reset value: 0x1
        @ReadWrite(bits: 1..<2, as: M_RX_OVER_Values.self)
        public var m_rx_over: M_RX_OVER_Field

        public enum M_RX_OVER_Values: UInt, BitFieldProjectable {
            /// RX_OVER interrupt is masked
            case M_RX_OVER_ENABLED = 0
            /// RX_OVER interrupt is unmasked
            case M_RX_OVER_DISABLED = 1

            public static var bitWidth: Int { 1 }
        }

        /// This bit masks the R_RX_UNDER interrupt in IC_INTR_STAT register.
        /// Reset value: 0x1
        @ReadWrite(bits: 0..<1, as: M_RX_UNDER_Values.self)
        public var m_rx_under: M_RX_UNDER_Field

        public enum M_RX_UNDER_Values: UInt, BitFieldProjectable {
            /// RX_UNDER interrupt is masked
            case M_RX_UNDER_ENABLED = 0
            /// RX_UNDER interrupt is unmasked
            case M_RX_UNDER_DISABLED = 1

            public static var bitWidth: Int { 1 }
        }
    }

    /// I2C Raw Interrupt Status Register
    /// Unlike the IC_INTR_STAT register, these bits are not masked so they always show the true status of the DW_apb_i2c.
    @RegisterBank(offset: 0x0034)
    public var ic_raw_intr_stat: Register<IC_RAW_INTR_STAT>

    @Register(bitWidth: 32)
    public struct IC_RAW_INTR_STAT {
        /// Indicates whether a RESTART condition has occurred on the I2C interface when DW_apb_i2c is operating in Slave mode and the slave is being addressed. Enabled only when IC_SLV_RESTART_DET_EN=1.
        /// Note: However, in high-speed mode or during a START BYTE transfer, the RESTART comes before the address field as per the I2C protocol. In this case, the slave is not the addressed slave when the RESTART is issued, therefore DW_apb_i2c does not generate the RESTART_DET interrupt.
        /// Reset value: 0x0
        @ReadOnly(bits: 12..<13, as: RESTART_DET_Values.self)
        public var restart_det: RESTART_DET_Field

        public enum RESTART_DET_Values: UInt, BitFieldProjectable {
            /// RESTART_DET interrupt is inactive
            case RESTART_DET_INACTIVE = 0
            /// RESTART_DET interrupt is active
            case RESTART_DET_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        /// Set only when a General Call address is received and it is acknowledged. It stays set until it is cleared either by disabling DW_apb_i2c or when the CPU reads bit 0 of the IC_CLR_GEN_CALL register. DW_apb_i2c stores the received data in the Rx buffer.
        /// Reset value: 0x0
        @ReadOnly(bits: 11..<12, as: GEN_CALL_Values.self)
        public var gen_call: GEN_CALL_Field

        public enum GEN_CALL_Values: UInt, BitFieldProjectable {
            /// GEN_CALL interrupt is inactive
            case GEN_CALL_INACTIVE = 0
            /// GEN_CALL interrupt is active
            case GEN_CALL_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        /// Indicates whether a START or RESTART condition has occurred on the I2C interface regardless of whether DW_apb_i2c is operating in slave or master mode.
        /// Reset value: 0x0
        @ReadOnly(bits: 10..<11, as: START_DET_Values.self)
        public var start_det: START_DET_Field

        public enum START_DET_Values: UInt, BitFieldProjectable {
            /// START_DET interrupt is inactive
            case START_DET_INACTIVE = 0
            /// START_DET interrupt is active
            case START_DET_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        /// Indicates whether a STOP condition has occurred on the I2C interface regardless of whether DW_apb_i2c is operating in slave or master mode.
        /// In Slave Mode: - If IC_CON[7]=1'b1  (STOP_DET_IFADDRESSED), the STOP_DET interrupt will be issued only if slave is addressed. Note: During a general call address, this slave does not issue a STOP_DET interrupt if STOP_DET_IF_ADDRESSED=1'b1, even if the slave responds to the general call address by generating ACK. The STOP_DET interrupt is generated only when the transmitted address matches the slave address (SAR). - If IC_CON[7]=1'b0 (STOP_DET_IFADDRESSED), the STOP_DET interrupt is issued irrespective of whether it is being addressed. In Master Mode: - If IC_CON[10]=1'b1  (STOP_DET_IF_MASTER_ACTIVE),the STOP_DET interrupt will be issued only if Master is active. - If IC_CON[10]=1'b0  (STOP_DET_IFADDRESSED),the STOP_DET interrupt will be issued irrespective of whether master is active or not. Reset value: 0x0
        @ReadOnly(bits: 9..<10, as: STOP_DET_Values.self)
        public var stop_det: STOP_DET_Field

        public enum STOP_DET_Values: UInt, BitFieldProjectable {
            /// STOP_DET interrupt is inactive
            case STOP_DET_INACTIVE = 0
            /// STOP_DET interrupt is active
            case STOP_DET_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        /// This bit captures DW_apb_i2c activity and stays set until it is cleared. There are four ways to clear it: - Disabling the DW_apb_i2c - Reading the IC_CLR_ACTIVITY register - Reading the IC_CLR_INTR register - System reset Once this bit is set, it stays set unless one of the four methods is used to clear it. Even if the DW_apb_i2c module is idle, this bit remains set until cleared, indicating that there was activity on the bus.
        /// Reset value: 0x0
        @ReadOnly(bits: 8..<9, as: ACTIVITY_Values.self)
        public var activity: ACTIVITY_Field

        public enum ACTIVITY_Values: UInt, BitFieldProjectable {
            /// RAW_INTR_ACTIVITY interrupt is inactive
            case ACTIVITY_INACTIVE = 0
            /// RAW_INTR_ACTIVITY interrupt is active
            case ACTIVITY_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        /// When the DW_apb_i2c is acting as a slave-transmitter, this bit is set to 1 if the master does not acknowledge a transmitted byte. This occurs on the last byte of the transmission, indicating that the transmission is done.
        /// Reset value: 0x0
        @ReadOnly(bits: 7..<8, as: RX_DONE_Values.self)
        public var rx_done: RX_DONE_Field

        public enum RX_DONE_Values: UInt, BitFieldProjectable {
            /// RX_DONE interrupt is inactive
            case RX_DONE_INACTIVE = 0
            /// RX_DONE interrupt is active
            case RX_DONE_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        /// This bit indicates if DW_apb_i2c, as an I2C transmitter, is unable to complete the intended actions on the contents of the transmit FIFO. This situation can occur both as an I2C master or an I2C slave, and is referred to as a 'transmit abort'. When this bit is set to 1, the IC_TX_ABRT_SOURCE register indicates the reason why the transmit abort takes places.
        /// Note:  The DW_apb_i2c flushes/resets/empties the TX_FIFO and RX_FIFO whenever there is a transmit abort caused by any of the events tracked by the IC_TX_ABRT_SOURCE register. The FIFOs remains in this flushed state until the register IC_CLR_TX_ABRT is read. Once this read is performed, the Tx FIFO is then ready to accept more data bytes from the APB interface.
        /// Reset value: 0x0
        @ReadOnly(bits: 6..<7, as: TX_ABRT_Values.self)
        public var tx_abrt: TX_ABRT_Field

        public enum TX_ABRT_Values: UInt, BitFieldProjectable {
            /// TX_ABRT interrupt is inactive
            case TX_ABRT_INACTIVE = 0
            /// TX_ABRT interrupt is active
            case TX_ABRT_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        /// This bit is set to 1 when DW_apb_i2c is acting as a slave and another I2C master is attempting to read data from DW_apb_i2c. The DW_apb_i2c holds the I2C bus in a wait state (SCL=0) until this interrupt is serviced, which means that the slave has been addressed by a remote master that is asking for data to be transferred. The processor must respond to this interrupt and then write the requested data to the IC_DATA_CMD register. This bit is set to 0 just after the processor reads the IC_CLR_RD_REQ register.
        /// Reset value: 0x0
        @ReadOnly(bits: 5..<6, as: RD_REQ_Values.self)
        public var rd_req: RD_REQ_Field

        public enum RD_REQ_Values: UInt, BitFieldProjectable {
            /// RD_REQ interrupt is inactive
            case RD_REQ_INACTIVE = 0
            /// RD_REQ interrupt is active
            case RD_REQ_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        /// The behavior of the TX_EMPTY interrupt status differs based on the TX_EMPTY_CTRL selection in the IC_CON register. - When TX_EMPTY_CTRL = 0: This bit is set to 1 when the transmit buffer is at or below the threshold value set in the IC_TX_TL register. - When TX_EMPTY_CTRL = 1: This bit is set to 1 when the transmit buffer is at or below the threshold value set in the IC_TX_TL register and the transmission of the address/data from the internal shift register for the most recently popped command is completed. It is automatically cleared by hardware when the buffer level goes above the threshold. When IC_ENABLE[0] is set to 0, the TX FIFO is flushed and held in reset. There the TX FIFO looks like it has no data within it, so this bit is set to 1, provided there is activity in the master or slave state machines. When there is no longer any activity, then with ic_en=0, this bit is set to 0.
        /// Reset value: 0x0.
        @ReadOnly(bits: 4..<5, as: TX_EMPTY_Values.self)
        public var tx_empty: TX_EMPTY_Field

        public enum TX_EMPTY_Values: UInt, BitFieldProjectable {
            /// TX_EMPTY interrupt is inactive
            case TX_EMPTY_INACTIVE = 0
            /// TX_EMPTY interrupt is active
            case TX_EMPTY_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        /// Set during transmit if the transmit buffer is filled to IC_TX_BUFFER_DEPTH and the processor attempts to issue another I2C command by writing to the IC_DATA_CMD register. When the module is disabled, this bit keeps its level until the master or slave state machines go into idle, and when ic_en goes to 0, this interrupt is cleared.
        /// Reset value: 0x0
        @ReadOnly(bits: 3..<4, as: TX_OVER_Values.self)
        public var tx_over: TX_OVER_Field

        public enum TX_OVER_Values: UInt, BitFieldProjectable {
            /// TX_OVER interrupt is inactive
            case TX_OVER_INACTIVE = 0
            /// TX_OVER interrupt is active
            case TX_OVER_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        /// Set when the receive buffer reaches or goes above the RX_TL threshold in the IC_RX_TL register. It is automatically cleared by hardware when buffer level goes below the threshold. If the module is disabled (IC_ENABLE[0]=0), the RX FIFO is flushed and held in reset; therefore the RX FIFO is not full. So this bit is cleared once the IC_ENABLE bit 0 is programmed with a 0, regardless of the activity that continues.
        /// Reset value: 0x0
        @ReadOnly(bits: 2..<3, as: RX_FULL_Values.self)
        public var rx_full: RX_FULL_Field

        public enum RX_FULL_Values: UInt, BitFieldProjectable {
            /// RX_FULL interrupt is inactive
            case RX_FULL_INACTIVE = 0
            /// RX_FULL interrupt is active
            case RX_FULL_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        /// Set if the receive buffer is completely filled to IC_RX_BUFFER_DEPTH and an additional byte is received from an external I2C device. The DW_apb_i2c acknowledges this, but any data bytes received after the FIFO is full are lost. If the module is disabled (IC_ENABLE[0]=0), this bit keeps its level until the master or slave state machines go into idle, and when ic_en goes to 0, this interrupt is cleared.
        /// Note:  If bit 9 of the IC_CON register (RX_FIFO_FULL_HLD_CTRL) is programmed to HIGH, then the RX_OVER interrupt never occurs, because the Rx FIFO never overflows.
        /// Reset value: 0x0
        @ReadOnly(bits: 1..<2, as: RX_OVER_Values.self)
        public var rx_over: RX_OVER_Field

        public enum RX_OVER_Values: UInt, BitFieldProjectable {
            /// RX_OVER interrupt is inactive
            case RX_OVER_INACTIVE = 0
            /// RX_OVER interrupt is active
            case RX_OVER_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        /// Set if the processor attempts to read the receive buffer when it is empty by reading from the IC_DATA_CMD register. If the module is disabled (IC_ENABLE[0]=0), this bit keeps its level until the master or slave state machines go into idle, and when ic_en goes to 0, this interrupt is cleared.
        /// Reset value: 0x0
        @ReadOnly(bits: 0..<1, as: RX_UNDER_Values.self)
        public var rx_under: RX_UNDER_Field

        public enum RX_UNDER_Values: UInt, BitFieldProjectable {
            /// RX_UNDER interrupt is inactive
            case RX_UNDER_INACTIVE = 0
            /// RX_UNDER interrupt is active
            case RX_UNDER_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
    }

    /// I2C Receive FIFO Threshold Register
    @RegisterBank(offset: 0x0038)
    public var ic_rx_tl: Register<IC_RX_TL>

    @Register(bitWidth: 32)
    public struct IC_RX_TL {
        /// Receive FIFO Threshold Level.
        /// Controls the level of entries (or above) that triggers the RX_FULL interrupt (bit 2 in IC_RAW_INTR_STAT register). The valid range is 0-255, with the additional restriction that hardware does not allow this value to be set to a value larger than the depth of the buffer. If an attempt is made to do that, the actual value set will be the maximum depth of the buffer. A value of 0 sets the threshold for 1 entry, and a value of 255 sets the threshold for 256 entries.
        @ReadWrite(bits: 0..<8, as: BitField8.self)
        public var rx_tl: RX_TL_Field
    }

    /// I2C Transmit FIFO Threshold Register
    @RegisterBank(offset: 0x003c)
    public var ic_tx_tl: Register<IC_TX_TL>

    @Register(bitWidth: 32)
    public struct IC_TX_TL {
        /// Transmit FIFO Threshold Level.
        /// Controls the level of entries (or below) that trigger the TX_EMPTY interrupt (bit 4 in IC_RAW_INTR_STAT register). The valid range is 0-255, with the additional restriction that it may not be set to value larger than the depth of the buffer. If an attempt is made to do that, the actual value set will be the maximum depth of the buffer. A value of 0 sets the threshold for 0 entries, and a value of 255 sets the threshold for 255 entries.
        @ReadWrite(bits: 0..<8, as: BitField8.self)
        public var tx_tl: TX_TL_Field
    }

    /// Clear Combined and Individual Interrupt Register
    @RegisterBank(offset: 0x0040)
    public var ic_clr_intr: Register<IC_CLR_INTR>

    @Register(bitWidth: 32)
    public struct IC_CLR_INTR {
        /// Read this register to clear the combined interrupt, all individual interrupts, and the IC_TX_ABRT_SOURCE register. This bit does not clear hardware clearable interrupts but software clearable interrupts. Refer to Bit 9 of the IC_TX_ABRT_SOURCE register for an exception to clearing IC_TX_ABRT_SOURCE.
        /// Reset value: 0x0
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var clr_intr: CLR_INTR_Field
    }

    /// Clear RX_UNDER Interrupt Register
    @RegisterBank(offset: 0x0044)
    public var ic_clr_rx_under: Register<IC_CLR_RX_UNDER>

    @Register(bitWidth: 32)
    public struct IC_CLR_RX_UNDER {
        /// Read this register to clear the RX_UNDER interrupt (bit 0) of the IC_RAW_INTR_STAT register.
        /// Reset value: 0x0
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var clr_rx_under: CLR_RX_UNDER_Field
    }

    /// Clear RX_OVER Interrupt Register
    @RegisterBank(offset: 0x0048)
    public var ic_clr_rx_over: Register<IC_CLR_RX_OVER>

    @Register(bitWidth: 32)
    public struct IC_CLR_RX_OVER {
        /// Read this register to clear the RX_OVER interrupt (bit 1) of the IC_RAW_INTR_STAT register.
        /// Reset value: 0x0
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var clr_rx_over: CLR_RX_OVER_Field
    }

    /// Clear TX_OVER Interrupt Register
    @RegisterBank(offset: 0x004c)
    public var ic_clr_tx_over: Register<IC_CLR_TX_OVER>

    @Register(bitWidth: 32)
    public struct IC_CLR_TX_OVER {
        /// Read this register to clear the TX_OVER interrupt (bit 3) of the IC_RAW_INTR_STAT register.
        /// Reset value: 0x0
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var clr_tx_over: CLR_TX_OVER_Field
    }

    /// Clear RD_REQ Interrupt Register
    @RegisterBank(offset: 0x0050)
    public var ic_clr_rd_req: Register<IC_CLR_RD_REQ>

    @Register(bitWidth: 32)
    public struct IC_CLR_RD_REQ {
        /// Read this register to clear the RD_REQ interrupt (bit 5) of the IC_RAW_INTR_STAT register.
        /// Reset value: 0x0
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var clr_rd_req: CLR_RD_REQ_Field
    }

    /// Clear TX_ABRT Interrupt Register
    @RegisterBank(offset: 0x0054)
    public var ic_clr_tx_abrt: Register<IC_CLR_TX_ABRT>

    @Register(bitWidth: 32)
    public struct IC_CLR_TX_ABRT {
        /// Read this register to clear the TX_ABRT interrupt (bit 6) of the IC_RAW_INTR_STAT register, and the IC_TX_ABRT_SOURCE register. This also releases the TX FIFO from the flushed/reset state, allowing more writes to the TX FIFO. Refer to Bit 9 of the IC_TX_ABRT_SOURCE register for an exception to clearing IC_TX_ABRT_SOURCE.
        /// Reset value: 0x0
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var clr_tx_abrt: CLR_TX_ABRT_Field
    }

    /// Clear RX_DONE Interrupt Register
    @RegisterBank(offset: 0x0058)
    public var ic_clr_rx_done: Register<IC_CLR_RX_DONE>

    @Register(bitWidth: 32)
    public struct IC_CLR_RX_DONE {
        /// Read this register to clear the RX_DONE interrupt (bit 7) of the IC_RAW_INTR_STAT register.
        /// Reset value: 0x0
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var clr_rx_done: CLR_RX_DONE_Field
    }

    /// Clear ACTIVITY Interrupt Register
    @RegisterBank(offset: 0x005c)
    public var ic_clr_activity: Register<IC_CLR_ACTIVITY>

    @Register(bitWidth: 32)
    public struct IC_CLR_ACTIVITY {
        /// Reading this register clears the ACTIVITY interrupt if the I2C is not active anymore. If the I2C module is still active on the bus, the ACTIVITY interrupt bit continues to be set. It is automatically cleared by hardware if the module is disabled and if there is no further activity on the bus. The value read from this register to get status of the ACTIVITY interrupt (bit 8) of the IC_RAW_INTR_STAT register.
        /// Reset value: 0x0
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var clr_activity: CLR_ACTIVITY_Field
    }

    /// Clear STOP_DET Interrupt Register
    @RegisterBank(offset: 0x0060)
    public var ic_clr_stop_det: Register<IC_CLR_STOP_DET>

    @Register(bitWidth: 32)
    public struct IC_CLR_STOP_DET {
        /// Read this register to clear the STOP_DET interrupt (bit 9) of the IC_RAW_INTR_STAT register.
        /// Reset value: 0x0
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var clr_stop_det: CLR_STOP_DET_Field
    }

    /// Clear START_DET Interrupt Register
    @RegisterBank(offset: 0x0064)
    public var ic_clr_start_det: Register<IC_CLR_START_DET>

    @Register(bitWidth: 32)
    public struct IC_CLR_START_DET {
        /// Read this register to clear the START_DET interrupt (bit 10) of the IC_RAW_INTR_STAT register.
        /// Reset value: 0x0
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var clr_start_det: CLR_START_DET_Field
    }

    /// Clear GEN_CALL Interrupt Register
    @RegisterBank(offset: 0x0068)
    public var ic_clr_gen_call: Register<IC_CLR_GEN_CALL>

    @Register(bitWidth: 32)
    public struct IC_CLR_GEN_CALL {
        /// Read this register to clear the GEN_CALL interrupt (bit 11) of IC_RAW_INTR_STAT register.
        /// Reset value: 0x0
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var clr_gen_call: CLR_GEN_CALL_Field
    }

    /// I2C Enable Register
    @RegisterBank(offset: 0x006c)
    public var ic_enable: Register<IC_ENABLE>

    @Register(bitWidth: 32)
    public struct IC_ENABLE {
        /// In Master mode: - 1'b1: Blocks the transmission of data on I2C bus even if Tx FIFO has data to transmit. - 1'b0: The transmission of data starts on I2C bus automatically, as soon as the first data is available in the Tx FIFO. Note: To block the execution of Master commands, set the TX_CMD_BLOCK bit only when Tx FIFO is empty (IC_STATUS[2]==1) and Master is in Idle state (IC_STATUS[5] == 0). Any further commands put in the Tx FIFO are not executed until TX_CMD_BLOCK bit is unset. Reset value:  IC_TX_CMD_BLOCK_DEFAULT
        @ReadWrite(bits: 2..<3, as: TX_CMD_BLOCK_Values.self)
        public var tx_cmd_block: TX_CMD_BLOCK_Field

        public enum TX_CMD_BLOCK_Values: UInt, BitFieldProjectable {
            /// Tx Command execution not blocked
            case TX_CMD_BLOCK_NOT_BLOCKED = 0
            /// Tx Command execution blocked
            case TX_CMD_BLOCK_BLOCKED = 1

            public static var bitWidth: Int { 1 }
        }

        /// When set, the controller initiates the transfer abort. - 0: ABORT not initiated or ABORT done - 1: ABORT operation in progress The software can abort the I2C transfer in master mode by setting this bit. The software can set this bit only when ENABLE is already set; otherwise, the controller ignores any write to ABORT bit. The software cannot clear the ABORT bit once set. In response to an ABORT, the controller issues a STOP and flushes the Tx FIFO after completing the current transfer, then sets the TX_ABORT interrupt after the abort operation. The ABORT bit is cleared automatically after the abort operation.
        /// For a detailed description on how to abort I2C transfers, refer to 'Aborting I2C Transfers'.
        /// Reset value: 0x0
        @ReadWrite(bits: 1..<2, as: ABORT_Values.self)
        public var abort: ABORT_Field

        public enum ABORT_Values: UInt, BitFieldProjectable {
            /// ABORT operation not in progress
            case ABORT_DISABLE = 0
            /// ABORT operation in progress
            case ABORT_ENABLED = 1

            public static var bitWidth: Int { 1 }
        }

        /// Controls whether the DW_apb_i2c is enabled. - 0: Disables DW_apb_i2c (TX and RX FIFOs are held in an erased state) - 1: Enables DW_apb_i2c Software can disable DW_apb_i2c while it is active. However, it is important that care be taken to ensure that DW_apb_i2c is disabled properly. A recommended procedure is described in 'Disabling DW_apb_i2c'.
        /// When DW_apb_i2c is disabled, the following occurs: - The TX FIFO and RX FIFO get flushed. - Status bits in the IC_INTR_STAT register are still active until DW_apb_i2c goes into IDLE state. If the module is transmitting, it stops as well as deletes the contents of the transmit buffer after the current transfer is complete. If the module is receiving, the DW_apb_i2c stops the current transfer at the end of the current byte and does not acknowledge the transfer.
        /// In systems with asynchronous pclk and ic_clk when IC_CLK_TYPE parameter set to asynchronous (1), there is a two ic_clk delay when enabling or disabling the DW_apb_i2c. For a detailed description on how to disable DW_apb_i2c, refer to 'Disabling DW_apb_i2c'
        /// Reset value: 0x0
        @ReadWrite(bits: 0..<1, as: ENABLE_Values.self)
        public var enable: ENABLE_Field

        public enum ENABLE_Values: UInt, BitFieldProjectable {
            /// I2C is disabled
            case ENABLE_DISABLED = 0
            /// I2C is enabled
            case ENABLE_ENABLED = 1

            public static var bitWidth: Int { 1 }
        }
    }

    /// I2C Status Register
    /// This is a read-only register used to indicate the current transfer status and FIFO status. The status register may be read at any time. None of the bits in this register request an interrupt.
    /// When the I2C is disabled by writing 0 in bit 0 of the IC_ENABLE register: - Bits 1 and 2 are set to 1 - Bits 3 and 10 are set to 0 When the master or slave state machines goes to idle and ic_en=0: - Bits 5 and 6 are set to 0
    @RegisterBank(offset: 0x0070)
    public var ic_status: Register<IC_STATUS>

    @Register(bitWidth: 32)
    public struct IC_STATUS {
        /// Slave FSM Activity Status. When the Slave Finite State Machine (FSM) is not in the IDLE state, this bit is set. - 0: Slave FSM is in IDLE state so the Slave part of DW_apb_i2c is not Active - 1: Slave FSM is not in IDLE state so the Slave part of DW_apb_i2c is Active Reset value: 0x0
        @ReadOnly(bits: 6..<7, as: SLV_ACTIVITY_Values.self)
        public var slv_activity: SLV_ACTIVITY_Field

        public enum SLV_ACTIVITY_Values: UInt, BitFieldProjectable {
            /// Slave is idle
            case SLV_ACTIVITY_IDLE = 0
            /// Slave not idle
            case SLV_ACTIVITY_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        /// Master FSM Activity Status. When the Master Finite State Machine (FSM) is not in the IDLE state, this bit is set. - 0: Master FSM is in IDLE state so the Master part of DW_apb_i2c is not Active - 1: Master FSM is not in IDLE state so the Master part of DW_apb_i2c is Active Note: IC_STATUS[0]-that is, ACTIVITY bit-is the OR of SLV_ACTIVITY and MST_ACTIVITY bits.
        /// Reset value: 0x0
        @ReadOnly(bits: 5..<6, as: MST_ACTIVITY_Values.self)
        public var mst_activity: MST_ACTIVITY_Field

        public enum MST_ACTIVITY_Values: UInt, BitFieldProjectable {
            /// Master is idle
            case MST_ACTIVITY_IDLE = 0
            /// Master not idle
            case MST_ACTIVITY_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        /// Receive FIFO Completely Full. When the receive FIFO is completely full, this bit is set. When the receive FIFO contains one or more empty location, this bit is cleared. - 0: Receive FIFO is not full - 1: Receive FIFO is full Reset value: 0x0
        @ReadOnly(bits: 4..<5, as: RFF_Values.self)
        public var rff: RFF_Field

        public enum RFF_Values: UInt, BitFieldProjectable {
            /// Rx FIFO not full
            case RFF_NOT_FULL = 0
            /// Rx FIFO is full
            case RFF_FULL = 1

            public static var bitWidth: Int { 1 }
        }

        /// Receive FIFO Not Empty. This bit is set when the receive FIFO contains one or more entries; it is cleared when the receive FIFO is empty. - 0: Receive FIFO is empty - 1: Receive FIFO is not empty Reset value: 0x0
        @ReadOnly(bits: 3..<4, as: RFNE_Values.self)
        public var rfne: RFNE_Field

        public enum RFNE_Values: UInt, BitFieldProjectable {
            /// Rx FIFO is empty
            case RFNE_EMPTY = 0
            /// Rx FIFO not empty
            case RFNE_NOT_EMPTY = 1

            public static var bitWidth: Int { 1 }
        }

        /// Transmit FIFO Completely Empty. When the transmit FIFO is completely empty, this bit is set. When it contains one or more valid entries, this bit is cleared. This bit field does not request an interrupt. - 0: Transmit FIFO is not empty - 1: Transmit FIFO is empty Reset value: 0x1
        @ReadOnly(bits: 2..<3, as: TFE_Values.self)
        public var tfe: TFE_Field

        public enum TFE_Values: UInt, BitFieldProjectable {
            /// Tx FIFO not empty
            case TFE_NON_EMPTY = 0
            /// Tx FIFO is empty
            case TFE_EMPTY = 1

            public static var bitWidth: Int { 1 }
        }

        /// Transmit FIFO Not Full. Set when the transmit FIFO contains one or more empty locations, and is cleared when the FIFO is full. - 0: Transmit FIFO is full - 1: Transmit FIFO is not full Reset value: 0x1
        @ReadOnly(bits: 1..<2, as: TFNF_Values.self)
        public var tfnf: TFNF_Field

        public enum TFNF_Values: UInt, BitFieldProjectable {
            /// Tx FIFO is full
            case TFNF_FULL = 0
            /// Tx FIFO not full
            case TFNF_NOT_FULL = 1

            public static var bitWidth: Int { 1 }
        }

        /// I2C Activity Status. Reset value: 0x0
        @ReadOnly(bits: 0..<1, as: ACTIVITY_Values.self)
        public var activity: ACTIVITY_Field

        public enum ACTIVITY_Values: UInt, BitFieldProjectable {
            /// I2C is idle
            case ACTIVITY_INACTIVE = 0
            /// I2C is active
            case ACTIVITY_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
    }

    /// I2C Transmit FIFO Level Register This register contains the number of valid data entries in the transmit FIFO buffer. It is cleared whenever: - The I2C is disabled - There is a transmit abort - that is, TX_ABRT bit is set in the IC_RAW_INTR_STAT register - The slave bulk transmit mode is aborted The register increments whenever data is placed into the transmit FIFO and decrements when data is taken from the transmit FIFO.
    @RegisterBank(offset: 0x0074)
    public var ic_txflr: Register<IC_TXFLR>

    @Register(bitWidth: 32)
    public struct IC_TXFLR {
        /// Transmit FIFO Level. Contains the number of valid data entries in the transmit FIFO.
        /// Reset value: 0x0
        @ReadOnly(bits: 0..<5, as: BitField5.self)
        public var txflr: TXFLR_Field
    }

    /// I2C Receive FIFO Level Register This register contains the number of valid data entries in the receive FIFO buffer. It is cleared whenever: - The I2C is disabled - Whenever there is a transmit abort caused by any of the events tracked in IC_TX_ABRT_SOURCE The register increments whenever data is placed into the receive FIFO and decrements when data is taken from the receive FIFO.
    @RegisterBank(offset: 0x0078)
    public var ic_rxflr: Register<IC_RXFLR>

    @Register(bitWidth: 32)
    public struct IC_RXFLR {
        /// Receive FIFO Level. Contains the number of valid data entries in the receive FIFO.
        /// Reset value: 0x0
        @ReadOnly(bits: 0..<5, as: BitField5.self)
        public var rxflr: RXFLR_Field
    }

    /// I2C SDA Hold Time Length Register
    /// The bits [15:0] of this register are used to control the hold time of SDA during transmit in both slave and master mode (after SCL goes from HIGH to LOW).
    /// The bits [23:16] of this register are used to extend the SDA transition (if any) whenever SCL is HIGH in the receiver in either master or slave mode.
    /// Writes to this register succeed only when IC_ENABLE[0]=0.
    /// The values in this register are in units of ic_clk period. The value programmed in IC_SDA_TX_HOLD must be greater than the minimum hold time in each mode (one cycle in master mode, seven cycles in slave mode) for the value to be implemented.
    /// The programmed SDA hold time during transmit (IC_SDA_TX_HOLD) cannot exceed at any time the duration of the low part of scl. Therefore the programmed value cannot be larger than N_SCL_LOW-2, where N_SCL_LOW is the duration of the low part of the scl period measured in ic_clk cycles.
    @RegisterBank(offset: 0x007c)
    public var ic_sda_hold: Register<IC_SDA_HOLD>

    @Register(bitWidth: 32)
    public struct IC_SDA_HOLD {
        /// Sets the required SDA hold time in units of ic_clk period, when DW_apb_i2c acts as a receiver.
        /// Reset value: IC_DEFAULT_SDA_HOLD[23:16].
        @ReadWrite(bits: 16..<24, as: BitField8.self)
        public var ic_sda_rx_hold: IC_SDA_RX_HOLD_Field

        /// Sets the required SDA hold time in units of ic_clk period, when DW_apb_i2c acts as a transmitter.
        /// Reset value: IC_DEFAULT_SDA_HOLD[15:0].
        @ReadWrite(bits: 0..<16, as: BitField16.self)
        public var ic_sda_tx_hold: IC_SDA_TX_HOLD_Field
    }

    /// I2C Transmit Abort Source Register
    /// This register has 32 bits that indicate the source of the TX_ABRT bit. Except for Bit 9, this register is cleared whenever the IC_CLR_TX_ABRT register or the IC_CLR_INTR register is read. To clear Bit 9, the source of the ABRT_SBYTE_NORSTRT must be fixed first; RESTART must be enabled (IC_CON[5]=1), the SPECIAL bit must be cleared (IC_TAR[11]), or the GC_OR_START bit must be cleared (IC_TAR[10]).
    /// Once the source of the ABRT_SBYTE_NORSTRT is fixed, then this bit can be cleared in the same manner as other bits in this register. If the source of the ABRT_SBYTE_NORSTRT is not fixed before attempting to clear this bit, Bit 9 clears for one cycle and is then re-asserted.
    @RegisterBank(offset: 0x0080)
    public var ic_tx_abrt_source: Register<IC_TX_ABRT_SOURCE>

    @Register(bitWidth: 32)
    public struct IC_TX_ABRT_SOURCE {
        /// This field indicates the number of Tx FIFO Data Commands which are flushed due to TX_ABRT interrupt. It is cleared whenever I2C is disabled.
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Master-Transmitter or Slave-Transmitter
        @ReadOnly(bits: 23..<32, as: BitField9.self)
        public var tx_flush_cnt: TX_FLUSH_CNT_Field

        /// This is a master-mode-only bit. Master has detected the transfer abort (IC_ENABLE[1])
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Master-Transmitter
        @ReadOnly(bits: 16..<17, as: ABRT_USER_ABRT_Values.self)
        public var abrt_user_abrt: ABRT_USER_ABRT_Field

        public enum ABRT_USER_ABRT_Values: UInt, BitFieldProjectable {
            /// Transfer abort detected by master- scenario not present
            case ABRT_USER_ABRT_ABRT_USER_ABRT_VOID = 0
            /// Transfer abort detected by master
            case ABRT_USER_ABRT_ABRT_USER_ABRT_GENERATED = 1

            public static var bitWidth: Int { 1 }
        }

        /// 1: When the processor side responds to a slave mode request for data to be transmitted to a remote master and user writes a 1 in CMD (bit 8) of IC_DATA_CMD register.
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Slave-Transmitter
        @ReadOnly(bits: 15..<16, as: ABRT_SLVRD_INTX_Values.self)
        public var abrt_slvrd_intx: ABRT_SLVRD_INTX_Field

        public enum ABRT_SLVRD_INTX_Values: UInt, BitFieldProjectable {
            /// Slave trying to transmit to remote master in read mode- scenario not present
            case ABRT_SLVRD_INTX_ABRT_SLVRD_INTX_VOID = 0
            /// Slave trying to transmit to remote master in read mode
            case ABRT_SLVRD_INTX_ABRT_SLVRD_INTX_GENERATED = 1

            public static var bitWidth: Int { 1 }
        }

        /// This field indicates that a Slave has lost the bus while transmitting data to a remote master. IC_TX_ABRT_SOURCE[12] is set at the same time. Note:  Even though the slave never 'owns' the bus, something could go wrong on the bus. This is a fail safe check. For instance, during a data transmission at the low-to-high transition of SCL, if what is on the data bus is not what is supposed to be transmitted, then DW_apb_i2c no longer own the bus.
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Slave-Transmitter
        @ReadOnly(bits: 14..<15, as: ABRT_SLV_ARBLOST_Values.self)
        public var abrt_slv_arblost: ABRT_SLV_ARBLOST_Field

        public enum ABRT_SLV_ARBLOST_Values: UInt, BitFieldProjectable {
            /// Slave lost arbitration to remote master- scenario not present
            case ABRT_SLV_ARBLOST_ABRT_SLV_ARBLOST_VOID = 0
            /// Slave lost arbitration to remote master
            case ABRT_SLV_ARBLOST_ABRT_SLV_ARBLOST_GENERATED = 1

            public static var bitWidth: Int { 1 }
        }

        /// This field specifies that the Slave has received a read command and some data exists in the TX FIFO, so the slave issues a TX_ABRT interrupt to flush old data in TX FIFO.
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Slave-Transmitter
        @ReadOnly(bits: 13..<14, as: ABRT_SLVFLUSH_TXFIFO_Values.self)
        public var abrt_slvflush_txfifo: ABRT_SLVFLUSH_TXFIFO_Field

        public enum ABRT_SLVFLUSH_TXFIFO_Values: UInt, BitFieldProjectable {
            /// Slave flushes existing data in TX-FIFO upon getting read command- scenario not present
            case ABRT_SLVFLUSH_TXFIFO_ABRT_SLVFLUSH_TXFIFO_VOID = 0
            /// Slave flushes existing data in TX-FIFO upon getting read command
            case ABRT_SLVFLUSH_TXFIFO_ABRT_SLVFLUSH_TXFIFO_GENERATED = 1

            public static var bitWidth: Int { 1 }
        }

        /// This field specifies that the Master has lost arbitration, or if IC_TX_ABRT_SOURCE[14] is also set, then the slave transmitter has lost arbitration.
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Master-Transmitter or Slave-Transmitter
        @ReadOnly(bits: 12..<13, as: ARB_LOST_Values.self)
        public var arb_lost: ARB_LOST_Field

        public enum ARB_LOST_Values: UInt, BitFieldProjectable {
            /// Master or Slave-Transmitter lost arbitration- scenario not present
            case ARB_LOST_ABRT_LOST_VOID = 0
            /// Master or Slave-Transmitter lost arbitration
            case ARB_LOST_ABRT_LOST_GENERATED = 1

            public static var bitWidth: Int { 1 }
        }

        /// This field indicates that the User tries to initiate a Master operation with the Master mode disabled.
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Master-Transmitter or Master-Receiver
        @ReadOnly(bits: 11..<12, as: ABRT_MASTER_DIS_Values.self)
        public var abrt_master_dis: ABRT_MASTER_DIS_Field

        public enum ABRT_MASTER_DIS_Values: UInt, BitFieldProjectable {
            /// User initiating master operation when MASTER disabled- scenario not present
            case ABRT_MASTER_DIS_ABRT_MASTER_DIS_VOID = 0
            /// User initiating master operation when MASTER disabled
            case ABRT_MASTER_DIS_ABRT_MASTER_DIS_GENERATED = 1

            public static var bitWidth: Int { 1 }
        }

        /// This field indicates that the restart is disabled (IC_RESTART_EN bit (IC_CON[5]) =0) and the master sends a read command in 10-bit addressing mode.
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Master-Receiver
        @ReadOnly(bits: 10..<11, as: ABRT_10B_RD_NORSTRT_Values.self)
        public var abrt_10b_rd_norstrt: ABRT_10B_RD_NORSTRT_Field

        public enum ABRT_10B_RD_NORSTRT_Values: UInt, BitFieldProjectable {
            /// Master not trying to read in 10Bit addressing mode when RESTART disabled
            case ABRT_10B_RD_NORSTRT_ABRT_10B_RD_VOID = 0
            /// Master trying to read in 10Bit addressing mode when RESTART disabled
            case ABRT_10B_RD_NORSTRT_ABRT_10B_RD_GENERATED = 1

            public static var bitWidth: Int { 1 }
        }

        /// To clear Bit 9, the source of the ABRT_SBYTE_NORSTRT must be fixed first; restart must be enabled (IC_CON[5]=1), the SPECIAL bit must be cleared (IC_TAR[11]), or the GC_OR_START bit must be cleared (IC_TAR[10]). Once the source of the ABRT_SBYTE_NORSTRT is fixed, then this bit can be cleared in the same manner as other bits in this register. If the source of the ABRT_SBYTE_NORSTRT is not fixed before attempting to clear this bit, bit 9 clears for one cycle and then gets reasserted. When this field is set to 1, the restart is disabled (IC_RESTART_EN bit (IC_CON[5]) =0) and the user is trying to send a START Byte.
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Master
        @ReadOnly(bits: 9..<10, as: ABRT_SBYTE_NORSTRT_Values.self)
        public var abrt_sbyte_norstrt: ABRT_SBYTE_NORSTRT_Field

        public enum ABRT_SBYTE_NORSTRT_Values: UInt, BitFieldProjectable {
            /// User trying to send START byte when RESTART disabled- scenario not present
            case ABRT_SBYTE_NORSTRT_ABRT_SBYTE_NORSTRT_VOID = 0
            /// User trying to send START byte when RESTART disabled
            case ABRT_SBYTE_NORSTRT_ABRT_SBYTE_NORSTRT_GENERATED = 1

            public static var bitWidth: Int { 1 }
        }

        /// This field indicates that the restart is disabled (IC_RESTART_EN bit (IC_CON[5]) =0) and the user is trying to use the master to transfer data in High Speed mode.
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Master-Transmitter or Master-Receiver
        @ReadOnly(bits: 8..<9, as: ABRT_HS_NORSTRT_Values.self)
        public var abrt_hs_norstrt: ABRT_HS_NORSTRT_Field

        public enum ABRT_HS_NORSTRT_Values: UInt, BitFieldProjectable {
            /// User trying to switch Master to HS mode when RESTART disabled- scenario not present
            case ABRT_HS_NORSTRT_ABRT_HS_NORSTRT_VOID = 0
            /// User trying to switch Master to HS mode when RESTART disabled
            case ABRT_HS_NORSTRT_ABRT_HS_NORSTRT_GENERATED = 1

            public static var bitWidth: Int { 1 }
        }

        /// This field indicates that the Master has sent a START Byte and the START Byte was acknowledged (wrong behavior).
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Master
        @ReadOnly(bits: 7..<8, as: ABRT_SBYTE_ACKDET_Values.self)
        public var abrt_sbyte_ackdet: ABRT_SBYTE_ACKDET_Field

        public enum ABRT_SBYTE_ACKDET_Values: UInt, BitFieldProjectable {
            /// ACK detected for START byte- scenario not present
            case ABRT_SBYTE_ACKDET_ABRT_SBYTE_ACKDET_VOID = 0
            /// ACK detected for START byte
            case ABRT_SBYTE_ACKDET_ABRT_SBYTE_ACKDET_GENERATED = 1

            public static var bitWidth: Int { 1 }
        }

        /// This field indicates that the Master is in High Speed mode and the High Speed Master code was acknowledged (wrong behavior).
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Master
        @ReadOnly(bits: 6..<7, as: ABRT_HS_ACKDET_Values.self)
        public var abrt_hs_ackdet: ABRT_HS_ACKDET_Field

        public enum ABRT_HS_ACKDET_Values: UInt, BitFieldProjectable {
            /// HS Master code ACKed in HS Mode- scenario not present
            case ABRT_HS_ACKDET_ABRT_HS_ACK_VOID = 0
            /// HS Master code ACKed in HS Mode
            case ABRT_HS_ACKDET_ABRT_HS_ACK_GENERATED = 1

            public static var bitWidth: Int { 1 }
        }

        /// This field indicates that DW_apb_i2c in the master mode has sent a General Call but the user programmed the byte following the General Call to be a read from the bus (IC_DATA_CMD[9] is set to 1).
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Master-Transmitter
        @ReadOnly(bits: 5..<6, as: ABRT_GCALL_READ_Values.self)
        public var abrt_gcall_read: ABRT_GCALL_READ_Field

        public enum ABRT_GCALL_READ_Values: UInt, BitFieldProjectable {
            /// GCALL is followed by read from bus-scenario not present
            case ABRT_GCALL_READ_ABRT_GCALL_READ_VOID = 0
            /// GCALL is followed by read from bus
            case ABRT_GCALL_READ_ABRT_GCALL_READ_GENERATED = 1

            public static var bitWidth: Int { 1 }
        }

        /// This field indicates that DW_apb_i2c in master mode has sent a General Call and no slave on the bus acknowledged the General Call.
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Master-Transmitter
        @ReadOnly(bits: 4..<5, as: ABRT_GCALL_NOACK_Values.self)
        public var abrt_gcall_noack: ABRT_GCALL_NOACK_Field

        public enum ABRT_GCALL_NOACK_Values: UInt, BitFieldProjectable {
            /// GCALL not ACKed by any slave-scenario not present
            case ABRT_GCALL_NOACK_ABRT_GCALL_NOACK_VOID = 0
            /// GCALL not ACKed by any slave
            case ABRT_GCALL_NOACK_ABRT_GCALL_NOACK_GENERATED = 1

            public static var bitWidth: Int { 1 }
        }

        /// This field indicates the master-mode only bit. When the master receives an acknowledgement for the address, but when it sends data byte(s) following the address, it did not receive an acknowledge from the remote slave(s).
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Master-Transmitter
        @ReadOnly(bits: 3..<4, as: ABRT_TXDATA_NOACK_Values.self)
        public var abrt_txdata_noack: ABRT_TXDATA_NOACK_Field

        public enum ABRT_TXDATA_NOACK_Values: UInt, BitFieldProjectable {
            /// Transmitted data non-ACKed by addressed slave-scenario not present
            case ABRT_TXDATA_NOACK_ABRT_TXDATA_NOACK_VOID = 0
            /// Transmitted data not ACKed by addressed slave
            case ABRT_TXDATA_NOACK_ABRT_TXDATA_NOACK_GENERATED = 1

            public static var bitWidth: Int { 1 }
        }

        /// This field indicates that the Master is in 10-bit address mode and that the second address byte of the 10-bit address was not acknowledged by any slave.
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Master-Transmitter or Master-Receiver
        @ReadOnly(bits: 2..<3, as: ABRT_10ADDR2_NOACK_Values.self)
        public var abrt_10addr2_noack: ABRT_10ADDR2_NOACK_Field

        public enum ABRT_10ADDR2_NOACK_Values: UInt, BitFieldProjectable {
            /// This abort is not generated
            case ABRT_10ADDR2_NOACK_INACTIVE = 0
            /// Byte 2 of 10Bit Address not ACKed by any slave
            case ABRT_10ADDR2_NOACK_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        /// This field indicates that the Master is in 10-bit address mode and the first 10-bit address byte was not acknowledged by any slave.
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Master-Transmitter or Master-Receiver
        @ReadOnly(bits: 1..<2, as: ABRT_10ADDR1_NOACK_Values.self)
        public var abrt_10addr1_noack: ABRT_10ADDR1_NOACK_Field

        public enum ABRT_10ADDR1_NOACK_Values: UInt, BitFieldProjectable {
            /// This abort is not generated
            case ABRT_10ADDR1_NOACK_INACTIVE = 0
            /// Byte 1 of 10Bit Address not ACKed by any slave
            case ABRT_10ADDR1_NOACK_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        /// This field indicates that the Master is in 7-bit addressing mode and the address sent was not acknowledged by any slave.
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Master-Transmitter or Master-Receiver
        @ReadOnly(bits: 0..<1, as: ABRT_7B_ADDR_NOACK_Values.self)
        public var abrt_7b_addr_noack: ABRT_7B_ADDR_NOACK_Field

        public enum ABRT_7B_ADDR_NOACK_Values: UInt, BitFieldProjectable {
            /// This abort is not generated
            case ABRT_7B_ADDR_NOACK_INACTIVE = 0
            /// This abort is generated because of NOACK for 7-bit address
            case ABRT_7B_ADDR_NOACK_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
    }

    /// Generate Slave Data NACK Register
    /// The register is used to generate a NACK for the data part of a transfer when DW_apb_i2c is acting as a slave-receiver. This register only exists when the IC_SLV_DATA_NACK_ONLY parameter is set to 1. When this parameter disabled, this register does not exist and writing to the register's address has no effect.
    /// A write can occur on this register if both of the following conditions are met: - DW_apb_i2c is disabled (IC_ENABLE[0] = 0) - Slave part is inactive (IC_STATUS[6] = 0) Note: The IC_STATUS[6] is a register read-back location for the internal slv_activity signal; the user should poll this before writing the ic_slv_data_nack_only bit.
    @RegisterBank(offset: 0x0084)
    public var ic_slv_data_nack_only: Register<IC_SLV_DATA_NACK_ONLY>

    @Register(bitWidth: 32)
    public struct IC_SLV_DATA_NACK_ONLY {
        /// Generate NACK. This NACK generation only occurs when DW_apb_i2c is a slave-receiver. If this register is set to a value of 1, it can only generate a NACK after a data byte is received; hence, the data transfer is aborted and the data received is not pushed to the receive buffer.
        /// When the register is set to a value of 0, it generates NACK/ACK, depending on normal criteria. - 1: generate NACK after data byte received - 0: generate NACK/ACK normally Reset value: 0x0
        @ReadWrite(bits: 0..<1, as: NACK_Values.self)
        public var nack: NACK_Field

        public enum NACK_Values: UInt, BitFieldProjectable {
            /// Slave receiver generates NACK normally
            case NACK_DISABLED = 0
            /// Slave receiver generates NACK upon data reception only
            case NACK_ENABLED = 1

            public static var bitWidth: Int { 1 }
        }
    }

    /// DMA Control Register
    /// The register is used to enable the DMA Controller interface operation. There is a separate bit for transmit and receive. This can be programmed regardless of the state of IC_ENABLE.
    @RegisterBank(offset: 0x0088)
    public var ic_dma_cr: Register<IC_DMA_CR>

    @Register(bitWidth: 32)
    public struct IC_DMA_CR {
        /// Transmit DMA Enable. This bit enables/disables the transmit FIFO DMA channel. Reset value: 0x0
        @ReadWrite(bits: 1..<2, as: TDMAE_Values.self)
        public var tdmae: TDMAE_Field

        public enum TDMAE_Values: UInt, BitFieldProjectable {
            /// transmit FIFO DMA channel disabled
            case TDMAE_DISABLED = 0
            /// Transmit FIFO DMA channel enabled
            case TDMAE_ENABLED = 1

            public static var bitWidth: Int { 1 }
        }

        /// Receive DMA Enable. This bit enables/disables the receive FIFO DMA channel. Reset value: 0x0
        @ReadWrite(bits: 0..<1, as: RDMAE_Values.self)
        public var rdmae: RDMAE_Field

        public enum RDMAE_Values: UInt, BitFieldProjectable {
            /// Receive FIFO DMA channel disabled
            case RDMAE_DISABLED = 0
            /// Receive FIFO DMA channel enabled
            case RDMAE_ENABLED = 1

            public static var bitWidth: Int { 1 }
        }
    }

    /// DMA Transmit Data Level Register
    @RegisterBank(offset: 0x008c)
    public var ic_dma_tdlr: Register<IC_DMA_TDLR>

    @Register(bitWidth: 32)
    public struct IC_DMA_TDLR {
        /// Transmit Data Level. This bit field controls the level at which a DMA request is made by the transmit logic. It is equal to the watermark level; that is, the dma_tx_req signal is generated when the number of valid data entries in the transmit FIFO is equal to or below this field value, and TDMAE = 1.
        /// Reset value: 0x0
        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var dmatdl: DMATDL_Field
    }

    /// I2C Receive Data Level Register
    @RegisterBank(offset: 0x0090)
    public var ic_dma_rdlr: Register<IC_DMA_RDLR>

    @Register(bitWidth: 32)
    public struct IC_DMA_RDLR {
        /// Receive Data Level. This bit field controls the level at which a DMA request is made by the receive logic. The watermark level = DMARDL+1; that is, dma_rx_req is generated when the number of valid data entries in the receive FIFO is equal to or more than this field value + 1, and RDMAE =1. For instance, when DMARDL is 0, then dma_rx_req is asserted when 1 or more data entries are present in the receive FIFO.
        /// Reset value: 0x0
        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var dmardl: DMARDL_Field
    }

    /// I2C SDA Setup Register
    /// This register controls the amount of time delay (in terms of number of ic_clk clock periods) introduced in the rising edge of SCL - relative to SDA changing - when DW_apb_i2c services a read request in a slave-transmitter operation. The relevant I2C requirement is tSU:DAT (note 4) as detailed in the I2C Bus Specification. This register must be programmed with a value equal to or greater than 2.
    /// Writes to this register succeed only when IC_ENABLE[0] = 0.
    /// Note: The length of setup time is calculated using [(IC_SDA_SETUP - 1) * (ic_clk_period)], so if the user requires 10 ic_clk periods of setup time, they should program a value of 11. The IC_SDA_SETUP register is only used by the DW_apb_i2c when operating as a slave transmitter.
    @RegisterBank(offset: 0x0094)
    public var ic_sda_setup: Register<IC_SDA_SETUP>

    @Register(bitWidth: 32)
    public struct IC_SDA_SETUP {
        /// SDA Setup. It is recommended that if the required delay is 1000ns, then for an ic_clk frequency of 10 MHz, IC_SDA_SETUP should be programmed to a value of 11. IC_SDA_SETUP must be programmed with a minimum value of 2.
        @ReadWrite(bits: 0..<8, as: BitField8.self)
        public var sda_setup: SDA_SETUP_Field
    }

    /// I2C ACK General Call Register
    /// The register controls whether DW_apb_i2c responds with a ACK or NACK when it receives an I2C General Call address.
    /// This register is applicable only when the DW_apb_i2c is in slave mode.
    @RegisterBank(offset: 0x0098)
    public var ic_ack_general_call: Register<IC_ACK_GENERAL_CALL>

    @Register(bitWidth: 32)
    public struct IC_ACK_GENERAL_CALL {
        /// ACK General Call. When set to 1, DW_apb_i2c responds with a ACK (by asserting ic_data_oe) when it receives a General Call. Otherwise, DW_apb_i2c responds with a NACK (by negating ic_data_oe).
        @ReadWrite(bits: 0..<1, as: ACK_GEN_CALL_Values.self)
        public var ack_gen_call: ACK_GEN_CALL_Field

        public enum ACK_GEN_CALL_Values: UInt, BitFieldProjectable {
            /// Generate NACK for a General Call
            case ACK_GEN_CALL_DISABLED = 0
            /// Generate ACK for a General Call
            case ACK_GEN_CALL_ENABLED = 1

            public static var bitWidth: Int { 1 }
        }
    }

    /// I2C Enable Status Register
    /// The register is used to report the DW_apb_i2c hardware status when the IC_ENABLE[0] register is set from 1 to 0; that is, when DW_apb_i2c is disabled.
    /// If IC_ENABLE[0] has been set to 1, bits 2:1 are forced to 0, and bit 0 is forced to 1.
    /// If IC_ENABLE[0] has been set to 0, bits 2:1 is only be valid as soon as bit 0 is read as '0'.
    /// Note: When IC_ENABLE[0] has been set to 0, a delay occurs for bit 0 to be read as 0 because disabling the DW_apb_i2c depends on I2C bus activities.
    @RegisterBank(offset: 0x009c)
    public var ic_enable_status: Register<IC_ENABLE_STATUS>

    @Register(bitWidth: 32)
    public struct IC_ENABLE_STATUS {
        /// Slave Received Data Lost. This bit indicates if a Slave-Receiver operation has been aborted with at least one data byte received from an I2C transfer due to the setting bit 0 of IC_ENABLE from 1 to 0. When read as 1, DW_apb_i2c is deemed to have been actively engaged in an aborted I2C transfer (with matching address) and the data phase of the I2C transfer has been entered, even though a data byte has been responded with a NACK.
        /// Note:  If the remote I2C master terminates the transfer with a STOP condition before the DW_apb_i2c has a chance to NACK a transfer, and IC_ENABLE[0] has been set to 0, then this bit is also set to 1.
        /// When read as 0, DW_apb_i2c is deemed to have been disabled without being actively involved in the data phase of a Slave-Receiver transfer.
        /// Note:  The CPU can safely read this bit when IC_EN (bit 0) is read as 0.
        /// Reset value: 0x0
        @ReadOnly(bits: 2..<3, as: SLV_RX_DATA_LOST_Values.self)
        public var slv_rx_data_lost: SLV_RX_DATA_LOST_Field

        public enum SLV_RX_DATA_LOST_Values: UInt, BitFieldProjectable {
            /// Slave RX Data is not lost
            case SLV_RX_DATA_LOST_INACTIVE = 0
            /// Slave RX Data is lost
            case SLV_RX_DATA_LOST_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        /// Slave Disabled While Busy (Transmit, Receive). This bit indicates if a potential or active Slave operation has been aborted due to the setting bit 0 of the IC_ENABLE register from 1 to 0. This bit is set when the CPU writes a 0 to the IC_ENABLE register while:
        /// (a) DW_apb_i2c is receiving the address byte of the Slave-Transmitter operation from a remote master;
        /// OR,
        /// (b) address and data bytes of the Slave-Receiver operation from a remote master.
        /// When read as 1, DW_apb_i2c is deemed to have forced a NACK during any part of an I2C transfer, irrespective of whether the I2C address matches the slave address set in DW_apb_i2c (IC_SAR register) OR if the transfer is completed before IC_ENABLE is set to 0 but has not taken effect.
        /// Note:  If the remote I2C master terminates the transfer with a STOP condition before the DW_apb_i2c has a chance to NACK a transfer, and IC_ENABLE[0] has been set to 0, then this bit will also be set to 1.
        /// When read as 0, DW_apb_i2c is deemed to have been disabled when there is master activity, or when the I2C bus is idle.
        /// Note:  The CPU can safely read this bit when IC_EN (bit 0) is read as 0.
        /// Reset value: 0x0
        @ReadOnly(bits: 1..<2, as: SLV_DISABLED_WHILE_BUSY_Values.self)
        public var slv_disabled_while_busy: SLV_DISABLED_WHILE_BUSY_Field

        public enum SLV_DISABLED_WHILE_BUSY_Values: UInt, BitFieldProjectable {
            /// Slave is disabled when it is idle
            case SLV_DISABLED_WHILE_BUSY_INACTIVE = 0
            /// Slave is disabled when it is active
            case SLV_DISABLED_WHILE_BUSY_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        /// ic_en Status. This bit always reflects the value driven on the output port ic_en. - When read as 1, DW_apb_i2c is deemed to be in an enabled state. - When read as 0, DW_apb_i2c is deemed completely inactive. Note:  The CPU can safely read this bit anytime. When this bit is read as 0, the CPU can safely read SLV_RX_DATA_LOST (bit 2) and SLV_DISABLED_WHILE_BUSY (bit 1).
        /// Reset value: 0x0
        @ReadOnly(bits: 0..<1, as: IC_EN_Values.self)
        public var ic_en: IC_EN_Field

        public enum IC_EN_Values: UInt, BitFieldProjectable {
            /// I2C disabled
            case IC_EN_DISABLED = 0
            /// I2C enabled
            case IC_EN_ENABLED = 1

            public static var bitWidth: Int { 1 }
        }
    }

    /// I2C SS, FS or FM+ spike suppression limit
    /// This register is used to store the duration, measured in ic_clk cycles, of the longest spike that is filtered out by the spike suppression logic when the component is operating in SS, FS or FM+ modes. The relevant I2C requirement is tSP (table 4) as detailed in the I2C Bus Specification. This register must be programmed with a minimum value of 1.
    @RegisterBank(offset: 0x00a0)
    public var ic_fs_spklen: Register<IC_FS_SPKLEN>

    @Register(bitWidth: 32)
    public struct IC_FS_SPKLEN {
        /// This register must be set before any I2C bus transaction can take place to ensure stable operation. This register sets the duration, measured in ic_clk cycles, of the longest spike in the SCL or SDA lines that will be filtered out by the spike suppression logic. This register can be written only when the I2C interface is disabled which corresponds to the IC_ENABLE[0] register being set to 0. Writes at other times have no effect. The minimum valid value is 1; hardware prevents values less than this being written, and if attempted results in 1 being set. or more information, refer to 'Spike Suppression'.
        @ReadWrite(bits: 0..<8, as: BitField8.self)
        public var ic_fs_spklen: IC_FS_SPKLEN_Field
    }

    /// Clear RESTART_DET Interrupt Register
    @RegisterBank(offset: 0x00a8)
    public var ic_clr_restart_det: Register<IC_CLR_RESTART_DET>

    @Register(bitWidth: 32)
    public struct IC_CLR_RESTART_DET {
        /// Read this register to clear the RESTART_DET interrupt (bit 12) of IC_RAW_INTR_STAT register.
        /// Reset value: 0x0
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var clr_restart_det: CLR_RESTART_DET_Field
    }

    /// Component Parameter Register 1
    /// Note This register is not implemented and therefore reads as 0. If it was implemented it would be a constant read-only register that contains encoded information about the component's parameter settings. Fields shown below are the settings for those parameters
    @RegisterBank(offset: 0x00f4)
    public var ic_comp_param_1: Register<IC_COMP_PARAM_1>

    @Register(bitWidth: 32)
    public struct IC_COMP_PARAM_1 {
        /// TX Buffer Depth = 16
        @ReadOnly(bits: 16..<24, as: BitField8.self)
        public var tx_buffer_depth: TX_BUFFER_DEPTH_Field

        /// RX Buffer Depth = 16
        @ReadOnly(bits: 8..<16, as: BitField8.self)
        public var rx_buffer_depth: RX_BUFFER_DEPTH_Field

        /// Encoded parameters not visible
        @ReadOnly(bits: 7..<8, as: Bool.self)
        public var add_encoded_params: ADD_ENCODED_PARAMS_Field

        /// DMA handshaking signals are enabled
        @ReadOnly(bits: 6..<7, as: Bool.self)
        public var has_dma: HAS_DMA_Field

        /// COMBINED Interrupt outputs
        @ReadOnly(bits: 5..<6, as: Bool.self)
        public var intr_io: INTR_IO_Field

        /// Programmable count values for each mode.
        @ReadOnly(bits: 4..<5, as: Bool.self)
        public var hc_count_values: HC_COUNT_VALUES_Field

        /// MAX SPEED MODE = FAST MODE
        @ReadOnly(bits: 2..<4, as: BitField2.self)
        public var max_speed_mode: MAX_SPEED_MODE_Field

        /// APB data bus width is 32 bits
        @ReadOnly(bits: 0..<2, as: BitField2.self)
        public var apb_data_width: APB_DATA_WIDTH_Field
    }

    /// I2C Component Version Register
    @RegisterBank(offset: 0x00f8)
    public var ic_comp_version: Register<IC_COMP_VERSION>

    @Register(bitWidth: 32)
    public struct IC_COMP_VERSION {
        @ReadOnly(bits: 0..<32, as: BitField32.self)
        public var ic_comp_version: IC_COMP_VERSION_Field
    }

    /// I2C Component Type Register
    @RegisterBank(offset: 0x00fc)
    public var ic_comp_type: Register<IC_COMP_TYPE>

    @Register(bitWidth: 32)
    public struct IC_COMP_TYPE {
        /// Designware Component Type number = 0x44_57_01_40. This assigned unique hex value is constant and is derived from the two ASCII letters 'DW' followed by a 16-bit unsigned number.
        @ReadOnly(bits: 0..<32, as: BitField32.self)
        public var ic_comp_type: IC_COMP_TYPE_Field
    }
}