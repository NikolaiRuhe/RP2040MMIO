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
public struct I2C0 {

    public static var `default`: Self { .init(unsafeAddress: 0x40044000) }

    /// I2C Control Register. This register can be written only when the DW_apb_i2c is disabled, which corresponds to the IC_ENABLE[0] register being set to 0. Writes at other times have no effect.
    /// Read/Write Access: - bit 10 is read only. - bit 11 is read only - bit 16 is read only - bit 17 is read only - bits 18 and 19 are read only.
    public var IC_CON: Register<IC_CON_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0000), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0000))
          #endif
        }
    }
    public struct IC_CON_Descriptor {
        @available(*, unavailable)
        /// Master issues the STOP_DET interrupt irrespective of whether master is active or not
        public var STOP_DET_IF_MASTER_ACTIVE: STOP_DET_IF_MASTER_ACTIVE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This bit controls whether DW_apb_i2c should hold the bus when the Rx FIFO is physically full to its RX_BUFFER_DEPTH, as described in the IC_RX_FULL_HLD_BUS_EN parameter.
        /// Reset value: 0x0.
        public var RX_FIFO_FULL_HLD_CTRL: RX_FIFO_FULL_HLD_CTRL_Field {
            get {
                fatalError()
            }
        }

        public enum RX_FIFO_FULL_HLD_CTRL_Values: UInt, BitFieldProjectable {
            /// Overflow when RX_FIFO is full
            case RX_FIFO_FULL_HLD_CTRL_DISABLED = 0
            /// Hold bus when RX_FIFO is full
            case RX_FIFO_FULL_HLD_CTRL_ENABLED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This bit controls the generation of the TX_EMPTY interrupt, as described in the IC_RAW_INTR_STAT register.
        /// Reset value: 0x0.
        public var TX_EMPTY_CTRL: TX_EMPTY_CTRL_Field {
            get {
                fatalError()
            }
        }

        public enum TX_EMPTY_CTRL_Values: UInt, BitFieldProjectable {
            /// Default behaviour of TX_EMPTY interrupt
            case TX_EMPTY_CTRL_DISABLED = 0
            /// Controlled generation of TX_EMPTY interrupt
            case TX_EMPTY_CTRL_ENABLED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// In slave mode: - 1'b1:  issues the STOP_DET interrupt only when it is addressed. - 1'b0:  issues the STOP_DET irrespective of whether it's addressed or not. Reset value: 0x0
        /// NOTE: During a general call address, this slave does not issue the STOP_DET interrupt if STOP_DET_IF_ADDRESSED = 1'b1, even if the slave responds to the general call address by generating ACK. The STOP_DET interrupt is generated only when the transmitted address matches the slave address (SAR).
        public var STOP_DET_IFADDRESSED: STOP_DET_IFADDRESSED_Field {
            get {
                fatalError()
            }
        }

        public enum STOP_DET_IFADDRESSED_Values: UInt, BitFieldProjectable {
            /// slave issues STOP_DET intr always
            case STOP_DET_IFADDRESSED_DISABLED = 0
            /// slave issues STOP_DET intr only if addressed
            case STOP_DET_IFADDRESSED_ENABLED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This bit controls whether I2C has its slave disabled, which means once the presetn signal is applied, then this bit is set and the slave is disabled.
        /// If this bit is set (slave is disabled), DW_apb_i2c functions only as a master and does not perform any action that requires a slave.
        /// NOTE: Software should ensure that if this bit is written with 0, then bit 0 should also be written with a 0.
        public var IC_SLAVE_DISABLE: IC_SLAVE_DISABLE_Field {
            get {
                fatalError()
            }
        }

        public enum IC_SLAVE_DISABLE_Values: UInt, BitFieldProjectable {
            /// Slave mode is enabled
            case IC_SLAVE_DISABLE_SLAVE_ENABLED = 0
            /// Slave mode is disabled
            case IC_SLAVE_DISABLE_SLAVE_DISABLED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// Determines whether RESTART conditions may be sent when acting as a master. Some older slaves do not support handling RESTART conditions; however, RESTART conditions are used in several DW_apb_i2c operations. When RESTART is disabled, the master is prohibited from performing the following functions: - Sending a START BYTE - Performing any high-speed mode operation - High-speed mode operation - Performing direction changes in combined format mode - Performing a read operation with a 10-bit address By replacing RESTART condition followed by a STOP and a subsequent START condition, split operations are broken down into multiple DW_apb_i2c transfers. If the above operations are performed, it will result in setting bit 6 (TX_ABRT) of the IC_RAW_INTR_STAT register.
        /// Reset value: ENABLED
        public var IC_RESTART_EN: IC_RESTART_EN_Field {
            get {
                fatalError()
            }
        }

        public enum IC_RESTART_EN_Values: UInt, BitFieldProjectable {
            /// Master restart disabled
            case IC_RESTART_EN_DISABLED = 0
            /// Master restart enabled
            case IC_RESTART_EN_ENABLED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// Controls whether the DW_apb_i2c starts its transfers in 7- or 10-bit addressing mode when acting as a master. - 0: 7-bit addressing - 1: 10-bit addressing
        public var IC_10BITADDR_MASTER: IC_10BITADDR_MASTER_Field {
            get {
                fatalError()
            }
        }

        public enum IC_10BITADDR_MASTER_Values: UInt, BitFieldProjectable {
            /// Master 7Bit addressing mode
            case IC_10BITADDR_MASTER_ADDR_7BITS = 0
            /// Master 10Bit addressing mode
            case IC_10BITADDR_MASTER_ADDR_10BITS = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// When acting as a slave, this bit controls whether the DW_apb_i2c responds to 7- or 10-bit addresses. - 0: 7-bit addressing. The DW_apb_i2c ignores transactions that involve 10-bit addressing; for 7-bit addressing, only the lower 7 bits of the IC_SAR register are compared. - 1: 10-bit addressing. The DW_apb_i2c responds to only 10-bit addressing transfers that match the full 10 bits of the IC_SAR register.
        public var IC_10BITADDR_SLAVE: IC_10BITADDR_SLAVE_Field {
            get {
                fatalError()
            }
        }

        public enum IC_10BITADDR_SLAVE_Values: UInt, BitFieldProjectable {
            /// Slave 7Bit addressing
            case IC_10BITADDR_SLAVE_ADDR_7BITS = 0
            /// Slave 10Bit addressing
            case IC_10BITADDR_SLAVE_ADDR_10BITS = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// These bits control at which speed the DW_apb_i2c operates; its setting is relevant only if one is operating the DW_apb_i2c in master mode. Hardware protects against illegal values being programmed by software. These bits must be programmed appropriately for slave mode also, as it is used to capture correct value of spike filter as per the speed mode.
        /// This register should be programmed only with a value in the range of 1 to IC_MAX_SPEED_MODE; otherwise, hardware updates this register with the value of IC_MAX_SPEED_MODE.
        /// 1: standard mode (100 kbit/s)
        /// 2: fast mode (<=400 kbit/s) or fast mode plus (<=1000Kbit/s)
        /// 3: high speed mode (3.4 Mbit/s)
        /// Note: This field is not applicable when IC_ULTRA_FAST_MODE=1
        public var SPEED: SPEED_Field {
            get {
                fatalError()
            }
        }

        public enum SPEED_Values: UInt, BitFieldProjectable {
            /// Standard Speed mode of operation
            case SPEED_STANDARD = 1
            /// Fast or Fast Plus mode of operation
            case SPEED_FAST = 2
            /// High Speed mode of operation
            case SPEED_HIGH = 3

            public static var bitWidth: Int { 2 }
        }
        @available(*, unavailable)

        /// This bit controls whether the DW_apb_i2c master is enabled.
        /// NOTE: Software should ensure that if this bit is written with '1' then bit 6 should also be written with a '1'.
        public var MASTER_MODE: MASTER_MODE_Field {
            get {
                fatalError()
            }
        }

        public enum MASTER_MODE_Values: UInt, BitFieldProjectable {
            /// Master mode is disabled
            case MASTER_MODE_DISABLED = 0
            /// Master mode is enabled
            case MASTER_MODE_ENABLED = 1

            public static var bitWidth: Int { 1 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum STOP_DET_IF_MASTER_ACTIVE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum RX_FIFO_FULL_HLD_CTRL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum TX_EMPTY_CTRL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum STOP_DET_IFADDRESSED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum IC_SLAVE_DISABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum IC_RESTART_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum IC_10BITADDR_MASTER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum IC_10BITADDR_SLAVE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum SPEED_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 3
        }

        public enum MASTER_MODE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_CON_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.Read) {
                self.storage = value.storage
                }

                  public  init(_ value: Value.Write) {
            self.storage = value.storage
              }
                public var STOP_DET_IF_MASTER_ACTIVE: UInt32 {
                @inlinable @inline(__always) get {
                    STOP_DET_IF_MASTER_ACTIVE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    STOP_DET_IF_MASTER_ACTIVE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var RX_FIFO_FULL_HLD_CTRL: UInt32 {
                @inlinable @inline(__always) get {
                  RX_FIFO_FULL_HLD_CTRL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RX_FIFO_FULL_HLD_CTRL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TX_EMPTY_CTRL: UInt32 {
                @inlinable @inline(__always) get {
                  TX_EMPTY_CTRL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TX_EMPTY_CTRL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var STOP_DET_IFADDRESSED: UInt32 {
                @inlinable @inline(__always) get {
                  STOP_DET_IFADDRESSED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  STOP_DET_IFADDRESSED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IC_SLAVE_DISABLE: UInt32 {
                @inlinable @inline(__always) get {
                  IC_SLAVE_DISABLE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IC_SLAVE_DISABLE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IC_RESTART_EN: UInt32 {
                @inlinable @inline(__always) get {
                  IC_RESTART_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IC_RESTART_EN_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IC_10BITADDR_MASTER: UInt32 {
                @inlinable @inline(__always) get {
                  IC_10BITADDR_MASTER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IC_10BITADDR_MASTER_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IC_10BITADDR_SLAVE: UInt32 {
                @inlinable @inline(__always) get {
                  IC_10BITADDR_SLAVE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IC_10BITADDR_SLAVE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var SPEED: UInt32 {
                @inlinable @inline(__always) get {
                  SPEED_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SPEED_Field.insert(newValue, into: &self.storage)
                }
              }
              public var MASTER_MODE: UInt32 {
                @inlinable @inline(__always) get {
                  MASTER_MODE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  MASTER_MODE_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = IC_CON_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var STOP_DET_IF_MASTER_ACTIVE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(STOP_DET_IF_MASTER_ACTIVE_Field.self, Bool.self)
                    return Bool(storage: self.raw.STOP_DET_IF_MASTER_ACTIVE)
                }
                }
              public var RX_FIFO_FULL_HLD_CTRL: RX_FIFO_FULL_HLD_CTRL_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RX_FIFO_FULL_HLD_CTRL_Field.self, RX_FIFO_FULL_HLD_CTRL_Values.self)
                  return RX_FIFO_FULL_HLD_CTRL_Values(storage: self.raw.RX_FIFO_FULL_HLD_CTRL)
                }
              }
              public var TX_EMPTY_CTRL: TX_EMPTY_CTRL_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TX_EMPTY_CTRL_Field.self, TX_EMPTY_CTRL_Values.self)
                  return TX_EMPTY_CTRL_Values(storage: self.raw.TX_EMPTY_CTRL)
                }
              }
              public var STOP_DET_IFADDRESSED: STOP_DET_IFADDRESSED_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(STOP_DET_IFADDRESSED_Field.self, STOP_DET_IFADDRESSED_Values.self)
                  return STOP_DET_IFADDRESSED_Values(storage: self.raw.STOP_DET_IFADDRESSED)
                }
              }
              public var IC_SLAVE_DISABLE: IC_SLAVE_DISABLE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IC_SLAVE_DISABLE_Field.self, IC_SLAVE_DISABLE_Values.self)
                  return IC_SLAVE_DISABLE_Values(storage: self.raw.IC_SLAVE_DISABLE)
                }
              }
              public var IC_RESTART_EN: IC_RESTART_EN_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IC_RESTART_EN_Field.self, IC_RESTART_EN_Values.self)
                  return IC_RESTART_EN_Values(storage: self.raw.IC_RESTART_EN)
                }
              }
              public var IC_10BITADDR_MASTER: IC_10BITADDR_MASTER_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IC_10BITADDR_MASTER_Field.self, IC_10BITADDR_MASTER_Values.self)
                  return IC_10BITADDR_MASTER_Values(storage: self.raw.IC_10BITADDR_MASTER)
                }
              }
              public var IC_10BITADDR_SLAVE: IC_10BITADDR_SLAVE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IC_10BITADDR_SLAVE_Field.self, IC_10BITADDR_SLAVE_Values.self)
                  return IC_10BITADDR_SLAVE_Values(storage: self.raw.IC_10BITADDR_SLAVE)
                }
              }
              public var SPEED: SPEED_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SPEED_Field.self, SPEED_Values.self)
                  return SPEED_Values(storage: self.raw.SPEED)
                }
              }
              public var MASTER_MODE: MASTER_MODE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(MASTER_MODE_Field.self, MASTER_MODE_Values.self)
                  return MASTER_MODE_Values(storage: self.raw.MASTER_MODE)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = IC_CON_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var RX_FIFO_FULL_HLD_CTRL: RX_FIFO_FULL_HLD_CTRL_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(RX_FIFO_FULL_HLD_CTRL_Field.self, RX_FIFO_FULL_HLD_CTRL_Values.self)
                    return RX_FIFO_FULL_HLD_CTRL_Values(storage: self.raw.RX_FIFO_FULL_HLD_CTRL)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(RX_FIFO_FULL_HLD_CTRL_Field.self, RX_FIFO_FULL_HLD_CTRL_Values.self)
                    self.raw.RX_FIFO_FULL_HLD_CTRL = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var TX_EMPTY_CTRL: TX_EMPTY_CTRL_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TX_EMPTY_CTRL_Field.self, TX_EMPTY_CTRL_Values.self)
                  return TX_EMPTY_CTRL_Values(storage: self.raw.TX_EMPTY_CTRL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(TX_EMPTY_CTRL_Field.self, TX_EMPTY_CTRL_Values.self)
                  self.raw.TX_EMPTY_CTRL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var STOP_DET_IFADDRESSED: STOP_DET_IFADDRESSED_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(STOP_DET_IFADDRESSED_Field.self, STOP_DET_IFADDRESSED_Values.self)
                  return STOP_DET_IFADDRESSED_Values(storage: self.raw.STOP_DET_IFADDRESSED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(STOP_DET_IFADDRESSED_Field.self, STOP_DET_IFADDRESSED_Values.self)
                  self.raw.STOP_DET_IFADDRESSED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IC_SLAVE_DISABLE: IC_SLAVE_DISABLE_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IC_SLAVE_DISABLE_Field.self, IC_SLAVE_DISABLE_Values.self)
                  return IC_SLAVE_DISABLE_Values(storage: self.raw.IC_SLAVE_DISABLE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IC_SLAVE_DISABLE_Field.self, IC_SLAVE_DISABLE_Values.self)
                  self.raw.IC_SLAVE_DISABLE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IC_RESTART_EN: IC_RESTART_EN_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IC_RESTART_EN_Field.self, IC_RESTART_EN_Values.self)
                  return IC_RESTART_EN_Values(storage: self.raw.IC_RESTART_EN)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IC_RESTART_EN_Field.self, IC_RESTART_EN_Values.self)
                  self.raw.IC_RESTART_EN = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IC_10BITADDR_MASTER: IC_10BITADDR_MASTER_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IC_10BITADDR_MASTER_Field.self, IC_10BITADDR_MASTER_Values.self)
                  return IC_10BITADDR_MASTER_Values(storage: self.raw.IC_10BITADDR_MASTER)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IC_10BITADDR_MASTER_Field.self, IC_10BITADDR_MASTER_Values.self)
                  self.raw.IC_10BITADDR_MASTER = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IC_10BITADDR_SLAVE: IC_10BITADDR_SLAVE_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IC_10BITADDR_SLAVE_Field.self, IC_10BITADDR_SLAVE_Values.self)
                  return IC_10BITADDR_SLAVE_Values(storage: self.raw.IC_10BITADDR_SLAVE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IC_10BITADDR_SLAVE_Field.self, IC_10BITADDR_SLAVE_Values.self)
                  self.raw.IC_10BITADDR_SLAVE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var SPEED: SPEED_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SPEED_Field.self, SPEED_Values.self)
                  return SPEED_Values(storage: self.raw.SPEED)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(SPEED_Field.self, SPEED_Values.self)
                  self.raw.SPEED = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var MASTER_MODE: MASTER_MODE_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(MASTER_MODE_Field.self, MASTER_MODE_Values.self)
                  return MASTER_MODE_Values(storage: self.raw.MASTER_MODE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(MASTER_MODE_Field.self, MASTER_MODE_Values.self)
                  self.raw.MASTER_MODE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// I2C Target Address Register
    /// This register is 12 bits wide, and bits 31:12 are reserved. This register can be written to only when IC_ENABLE[0] is set to 0.
    /// Note: If the software or application is aware that the DW_apb_i2c is not using the TAR address for the pending commands in the Tx FIFO, then it is possible to update the TAR address even while the Tx FIFO has entries (IC_STATUS[2]= 0). - It is not necessary to perform any write to this register if DW_apb_i2c is enabled as an I2C slave only.
    public var IC_TAR: Register<IC_TAR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0004), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0004))
          #endif
        }
    }
    public struct IC_TAR_Descriptor {
        @available(*, unavailable)
        /// This bit indicates whether software performs a Device-ID or General Call or START BYTE command. - 0: ignore bit 10 GC_OR_START and use IC_TAR normally - 1: perform special I2C command as specified in Device_ID or GC_OR_START bit Reset value: 0x0
        public var SPECIAL: SPECIAL_Field {
            get {
                fatalError()
            }
        }

        public enum SPECIAL_Values: UInt, BitFieldProjectable {
            /// Disables programming of GENERAL_CALL or START_BYTE transmission
            case SPECIAL_DISABLED = 0
            /// Enables programming of GENERAL_CALL or START_BYTE transmission
            case SPECIAL_ENABLED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// If bit 11 (SPECIAL) is set to 1 and bit 13(Device-ID) is set to 0, then this bit indicates whether a General Call or START byte command is to be performed by the DW_apb_i2c. - 0: General Call Address - after issuing a General Call, only writes may be performed. Attempting to issue a read command results in setting bit 6 (TX_ABRT) of the IC_RAW_INTR_STAT register. The DW_apb_i2c remains in General Call mode until the SPECIAL bit value (bit 11) is cleared. - 1: START BYTE Reset value: 0x0
        public var GC_OR_START: GC_OR_START_Field {
            get {
                fatalError()
            }
        }

        public enum GC_OR_START_Values: UInt, BitFieldProjectable {
            /// GENERAL_CALL byte transmission
            case GC_OR_START_GENERAL_CALL = 0
            /// START byte transmission
            case GC_OR_START_START_BYTE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This is the target address for any master transaction. When transmitting a General Call, these bits are ignored. To generate a START BYTE, the CPU needs to write only once into these bits.
        /// If the IC_TAR and IC_SAR are the same, loopback exists but the FIFOs are shared between master and slave, so full loopback is not feasible. Only one direction loopback mode is supported (simplex), not duplex. A master cannot transmit to itself; it can transmit to only a slave.
        public var IC_TAR: IC_TAR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SPECIAL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum GC_OR_START_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum IC_TAR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_TAR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var SPECIAL: UInt32 {
                @inlinable @inline(__always) get {
                    SPECIAL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SPECIAL_Field.insert(newValue, into: &self.storage)
                }
                }
              public var GC_OR_START: UInt32 {
                @inlinable @inline(__always) get {
                  GC_OR_START_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GC_OR_START_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IC_TAR: UInt32 {
                @inlinable @inline(__always) get {
                  IC_TAR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IC_TAR_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = IC_TAR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var SPECIAL: SPECIAL_Values {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SPECIAL_Field.self, SPECIAL_Values.self)
                    return SPECIAL_Values(storage: self.raw.SPECIAL)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(SPECIAL_Field.self, SPECIAL_Values.self)
                    self.raw.SPECIAL = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var GC_OR_START: GC_OR_START_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GC_OR_START_Field.self, GC_OR_START_Values.self)
                  return GC_OR_START_Values(storage: self.raw.GC_OR_START)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(GC_OR_START_Field.self, GC_OR_START_Values.self)
                  self.raw.GC_OR_START = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var IC_TAR: BitField10 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IC_TAR_Field.self, BitField10.self)
                  return BitField10(storage: self.raw.IC_TAR)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IC_TAR_Field.self, BitField10.self)
                  self.raw.IC_TAR = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// I2C Slave Address Register
    public var IC_SAR: Register<IC_SAR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0008), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0008))
          #endif
        }
    }
    public struct IC_SAR_Descriptor {
        @available(*, unavailable)
        /// The IC_SAR holds the slave address when the I2C is operating as a slave. For 7-bit addressing, only IC_SAR[6:0] is used.
        /// This register can be written only when the I2C interface is disabled, which corresponds to the IC_ENABLE[0] register being set to 0. Writes at other times have no effect.
        /// Note: The default values cannot be any of the reserved address locations: that is, 0x00 to 0x07, or 0x78 to 0x7f. The correct operation of the device is not guaranteed if you program the IC_SAR or IC_TAR to a reserved value. Refer to <<table_I2C_firstbyte_bit_defs>> for a complete list of these reserved values.
        public var IC_SAR: IC_SAR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IC_SAR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 10
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_SAR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var IC_SAR: UInt32 {
                @inlinable @inline(__always) get {
                    IC_SAR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IC_SAR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = IC_SAR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var IC_SAR: BitField10 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IC_SAR_Field.self, BitField10.self)
                    return BitField10(storage: self.raw.IC_SAR)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(IC_SAR_Field.self, BitField10.self)
                    self.raw.IC_SAR = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// I2C Rx/Tx Data Buffer and Command Register; this is the register the CPU writes to when filling the TX FIFO and the CPU reads from when retrieving bytes from RX FIFO.
    /// The size of the register changes as follows:
    /// Write: - 11 bits when IC_EMPTYFIFO_HOLD_MASTER_EN=1 - 9 bits when IC_EMPTYFIFO_HOLD_MASTER_EN=0 Read: - 12 bits when IC_FIRST_DATA_BYTE_STATUS = 1 - 8 bits when IC_FIRST_DATA_BYTE_STATUS = 0 Note: In order for the DW_apb_i2c to continue acknowledging reads, a read command should be written for every byte that is to be received; otherwise the DW_apb_i2c will stop acknowledging.
    public var IC_DATA_CMD: Register<IC_DATA_CMD_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0010), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0010))
          #endif
        }
    }
    public struct IC_DATA_CMD_Descriptor {
        @available(*, unavailable)
        /// Indicates the first data byte received after the address phase for receive transfer in Master receiver or Slave receiver mode.
        /// Reset value : 0x0
        /// NOTE:  In case of APB_DATA_WIDTH=8,
        /// 1. The user has to perform two APB Reads to IC_DATA_CMD in order to get status on 11 bit.
        /// 2. In order to read the 11 bit, the user has to perform the first data byte read [7:0] (offset 0x10) and then perform the second read [15:8] (offset 0x11) in order to know the status of 11 bit (whether the data received in previous read is a first data byte or not).
        /// 3. The 11th bit is an optional read field, user can ignore 2nd byte read [15:8] (offset 0x11) if not interested in FIRST_DATA_BYTE status.
        public var FIRST_DATA_BYTE: FIRST_DATA_BYTE_Field {
            get {
                fatalError()
            }
        }

        public enum FIRST_DATA_BYTE_Values: UInt, BitFieldProjectable {
            /// Sequential data byte received
            case FIRST_DATA_BYTE_INACTIVE = 0
            /// Non sequential data byte received
            case FIRST_DATA_BYTE_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This bit controls whether a RESTART is issued before the byte is sent or received.
        /// 1 - If IC_RESTART_EN is 1, a RESTART is issued before the data is sent/received (according to the value of CMD), regardless of whether or not the transfer direction is changing from the previous command; if IC_RESTART_EN is 0, a STOP followed by a START is issued instead.
        /// 0 - If IC_RESTART_EN is 1, a RESTART is issued only if the transfer direction is changing from the previous command; if IC_RESTART_EN is 0, a STOP followed by a START is issued instead.
        /// Reset value: 0x0
        public var RESTART: RESTART_Field {
            get {
                fatalError()
            }
        }

        public enum RESTART_Values: UInt, BitFieldProjectable {
            /// Don't Issue RESTART before this command
            case RESTART_DISABLE = 0
            /// Issue RESTART before this command
            case RESTART_ENABLE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This bit controls whether a STOP is issued after the byte is sent or received.
        /// - 1 - STOP is issued after this byte, regardless of whether or not the Tx FIFO is empty. If the Tx FIFO is not empty, the master immediately tries to start a new transfer by issuing a START and arbitrating for the bus. - 0 - STOP is not issued after this byte, regardless of whether or not the Tx FIFO is empty. If the Tx FIFO is not empty, the master continues the current transfer by sending/receiving data bytes according to the value of the CMD bit. If the Tx FIFO is empty, the master holds the SCL line low and stalls the bus until a new command is available in the Tx FIFO. Reset value: 0x0
        public var STOP: STOP_Field {
            get {
                fatalError()
            }
        }

        public enum STOP_Values: UInt, BitFieldProjectable {
            /// Don't Issue STOP after this command
            case STOP_DISABLE = 0
            /// Issue STOP after this command
            case STOP_ENABLE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This bit controls whether a read or a write is performed. This bit does not control the direction when the DW_apb_i2con acts as a slave. It controls only the direction when it acts as a master.
        /// When a command is entered in the TX FIFO, this bit distinguishes the write and read commands. In slave-receiver mode, this bit is a 'don't care' because writes to this register are not required. In slave-transmitter mode, a '0' indicates that the data in IC_DATA_CMD is to be transmitted.
        /// When programming this bit, you should remember the following: attempting to perform a read operation after a General Call command has been sent results in a TX_ABRT interrupt (bit 6 of the IC_RAW_INTR_STAT register), unless bit 11 (SPECIAL) in the IC_TAR register has been cleared. If a '1' is written to this bit after receiving a RD_REQ interrupt, then a TX_ABRT interrupt occurs.
        /// Reset value: 0x0
        public var CMD: CMD_Field {
            get {
                fatalError()
            }
        }

        public enum CMD_Values: UInt, BitFieldProjectable {
            /// Master Write Command
            case CMD_WRITE = 0
            /// Master Read Command
            case CMD_READ = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This register contains the data to be transmitted or received on the I2C bus. If you are writing to this register and want to perform a read, bits 7:0 (DAT) are ignored by the DW_apb_i2c. However, when you read this register, these bits return the value of data received on the DW_apb_i2c interface.
        /// Reset value: 0x0
        public var DAT: DAT_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum FIRST_DATA_BYTE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum RESTART_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum STOP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum CMD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum DAT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_DATA_CMD_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.Read) {
                self.storage = value.storage
                }

                  public  init(_ value: Value.Write) {
            self.storage = value.storage
              }
                public var FIRST_DATA_BYTE: UInt32 {
                @inlinable @inline(__always) get {
                    FIRST_DATA_BYTE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    FIRST_DATA_BYTE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var RESTART: UInt32 {
                @inlinable @inline(__always) get {
                  RESTART_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RESTART_Field.insert(newValue, into: &self.storage)
                }
              }
              public var STOP: UInt32 {
                @inlinable @inline(__always) get {
                  STOP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  STOP_Field.insert(newValue, into: &self.storage)
                }
              }
              public var CMD: UInt32 {
                @inlinable @inline(__always) get {
                  CMD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  CMD_Field.insert(newValue, into: &self.storage)
                }
              }
              public var DAT: UInt32 {
                @inlinable @inline(__always) get {
                  DAT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  DAT_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = IC_DATA_CMD_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var FIRST_DATA_BYTE: FIRST_DATA_BYTE_Values {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(FIRST_DATA_BYTE_Field.self, FIRST_DATA_BYTE_Values.self)
                    return FIRST_DATA_BYTE_Values(storage: self.raw.FIRST_DATA_BYTE)
                }
                }
              public var RESTART: RESTART_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RESTART_Field.self, RESTART_Values.self)
                  return RESTART_Values(storage: self.raw.RESTART)
                }
              }
              public var STOP: STOP_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(STOP_Field.self, STOP_Values.self)
                  return STOP_Values(storage: self.raw.STOP)
                }
              }
              public var CMD: CMD_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CMD_Field.self, CMD_Values.self)
                  return CMD_Values(storage: self.raw.CMD)
                }
              }
              public var DAT: BitField8 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DAT_Field.self, BitField8.self)
                  return BitField8(storage: self.raw.DAT)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = IC_DATA_CMD_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }
                public var RESTART: RESTART_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(RESTART_Field.self, RESTART_Values.self)
                    return RESTART_Values(storage: self.raw.RESTART)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(RESTART_Field.self, RESTART_Values.self)
                    self.raw.RESTART = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var STOP: STOP_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(STOP_Field.self, STOP_Values.self)
                  return STOP_Values(storage: self.raw.STOP)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(STOP_Field.self, STOP_Values.self)
                  self.raw.STOP = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var CMD: CMD_Values {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(CMD_Field.self, CMD_Values.self)
                  return CMD_Values(storage: self.raw.CMD)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(CMD_Field.self, CMD_Values.self)
                  self.raw.CMD = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var DAT: BitField8 {
                @available(*, deprecated, message: "API misuse; read from write view returns the value to be written, not the value initially read.")
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(DAT_Field.self, BitField8.self)
                  return BitField8(storage: self.raw.DAT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(DAT_Field.self, BitField8.self)
                  self.raw.DAT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Standard Speed I2C Clock SCL High Count Register
    public var IC_SS_SCL_HCNT: Register<IC_SS_SCL_HCNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0014), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0014))
          #endif
        }
    }
    public struct IC_SS_SCL_HCNT_Descriptor {
        @available(*, unavailable)
        /// This register must be set before any I2C bus transaction can take place to ensure proper I/O timing. This register sets the SCL clock high-period count for standard speed. For more information, refer to 'IC_CLK Frequency Configuration'.
        /// This register can be written only when the I2C interface is disabled which corresponds to the IC_ENABLE[0] register being set to 0. Writes at other times have no effect.
        /// The minimum valid value is 6; hardware prevents values less than this being written, and if attempted results in 6 being set. For designs with APB_DATA_WIDTH = 8, the order of programming is important to ensure the correct operation of the DW_apb_i2c. The lower byte must be programmed first. Then the upper byte is programmed.
        /// NOTE: This register must not be programmed to a value higher than 65525, because DW_apb_i2c uses a 16-bit counter to flag an I2C bus idle condition when this counter reaches a value of IC_SS_SCL_HCNT + 10.
        public var IC_SS_SCL_HCNT: IC_SS_SCL_HCNT_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IC_SS_SCL_HCNT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_SS_SCL_HCNT_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var IC_SS_SCL_HCNT: UInt32 {
                @inlinable @inline(__always) get {
                    IC_SS_SCL_HCNT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IC_SS_SCL_HCNT_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = IC_SS_SCL_HCNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var IC_SS_SCL_HCNT: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IC_SS_SCL_HCNT_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.IC_SS_SCL_HCNT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(IC_SS_SCL_HCNT_Field.self, BitField16.self)
                    self.raw.IC_SS_SCL_HCNT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Standard Speed I2C Clock SCL Low Count Register
    public var IC_SS_SCL_LCNT: Register<IC_SS_SCL_LCNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0018), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0018))
          #endif
        }
    }
    public struct IC_SS_SCL_LCNT_Descriptor {
        @available(*, unavailable)
        /// This register must be set before any I2C bus transaction can take place to ensure proper I/O timing. This register sets the SCL clock low period count for standard speed. For more information, refer to 'IC_CLK Frequency Configuration'
        /// This register can be written only when the I2C interface is disabled which corresponds to the IC_ENABLE[0] register being set to 0. Writes at other times have no effect.
        /// The minimum valid value is 8; hardware prevents values less than this being written, and if attempted, results in 8 being set. For designs with APB_DATA_WIDTH = 8, the order of programming is important to ensure the correct operation of DW_apb_i2c. The lower byte must be programmed first, and then the upper byte is programmed.
        public var IC_SS_SCL_LCNT: IC_SS_SCL_LCNT_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IC_SS_SCL_LCNT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_SS_SCL_LCNT_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var IC_SS_SCL_LCNT: UInt32 {
                @inlinable @inline(__always) get {
                    IC_SS_SCL_LCNT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IC_SS_SCL_LCNT_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = IC_SS_SCL_LCNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var IC_SS_SCL_LCNT: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IC_SS_SCL_LCNT_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.IC_SS_SCL_LCNT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(IC_SS_SCL_LCNT_Field.self, BitField16.self)
                    self.raw.IC_SS_SCL_LCNT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Fast Mode or Fast Mode Plus I2C Clock SCL High Count Register
    public var IC_FS_SCL_HCNT: Register<IC_FS_SCL_HCNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x001c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x001c))
          #endif
        }
    }
    public struct IC_FS_SCL_HCNT_Descriptor {
        @available(*, unavailable)
        /// This register must be set before any I2C bus transaction can take place to ensure proper I/O timing. This register sets the SCL clock high-period count for fast mode or fast mode plus. It is used in high-speed mode to send the Master Code and START BYTE or General CALL. For more information, refer to 'IC_CLK Frequency Configuration'.
        /// This register goes away and becomes read-only returning 0s if IC_MAX_SPEED_MODE = standard. This register can be written only when the I2C interface is disabled, which corresponds to the IC_ENABLE[0] register being set to 0. Writes at other times have no effect.
        /// The minimum valid value is 6; hardware prevents values less than this being written, and if attempted results in 6 being set. For designs with APB_DATA_WIDTH == 8 the order of programming is important to ensure the correct operation of the DW_apb_i2c. The lower byte must be programmed first. Then the upper byte is programmed.
        public var IC_FS_SCL_HCNT: IC_FS_SCL_HCNT_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IC_FS_SCL_HCNT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_FS_SCL_HCNT_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var IC_FS_SCL_HCNT: UInt32 {
                @inlinable @inline(__always) get {
                    IC_FS_SCL_HCNT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IC_FS_SCL_HCNT_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = IC_FS_SCL_HCNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var IC_FS_SCL_HCNT: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IC_FS_SCL_HCNT_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.IC_FS_SCL_HCNT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(IC_FS_SCL_HCNT_Field.self, BitField16.self)
                    self.raw.IC_FS_SCL_HCNT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Fast Mode or Fast Mode Plus I2C Clock SCL Low Count Register
    public var IC_FS_SCL_LCNT: Register<IC_FS_SCL_LCNT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0020), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0020))
          #endif
        }
    }
    public struct IC_FS_SCL_LCNT_Descriptor {
        @available(*, unavailable)
        /// This register must be set before any I2C bus transaction can take place to ensure proper I/O timing. This register sets the SCL clock low period count for fast speed. It is used in high-speed mode to send the Master Code and START BYTE or General CALL. For more information, refer to 'IC_CLK Frequency Configuration'.
        /// This register goes away and becomes read-only returning 0s if IC_MAX_SPEED_MODE = standard.
        /// This register can be written only when the I2C interface is disabled, which corresponds to the IC_ENABLE[0] register being set to 0. Writes at other times have no effect.
        /// The minimum valid value is 8; hardware prevents values less than this being written, and if attempted results in 8 being set. For designs with APB_DATA_WIDTH = 8 the order of programming is important to ensure the correct operation of the DW_apb_i2c. The lower byte must be programmed first. Then the upper byte is programmed. If the value is less than 8 then the count value gets changed to 8.
        public var IC_FS_SCL_LCNT: IC_FS_SCL_LCNT_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IC_FS_SCL_LCNT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_FS_SCL_LCNT_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var IC_FS_SCL_LCNT: UInt32 {
                @inlinable @inline(__always) get {
                    IC_FS_SCL_LCNT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IC_FS_SCL_LCNT_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = IC_FS_SCL_LCNT_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var IC_FS_SCL_LCNT: BitField16 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IC_FS_SCL_LCNT_Field.self, BitField16.self)
                    return BitField16(storage: self.raw.IC_FS_SCL_LCNT)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(IC_FS_SCL_LCNT_Field.self, BitField16.self)
                    self.raw.IC_FS_SCL_LCNT = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// I2C Interrupt Status Register
    /// Each bit in this register has a corresponding mask bit in the IC_INTR_MASK register. These bits are cleared by reading the matching interrupt clear register. The unmasked raw versions of these bits are available in the IC_RAW_INTR_STAT register.
    public var IC_INTR_STAT: Register<IC_INTR_STAT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x002c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x002c))
          #endif
        }
    }
    public struct IC_INTR_STAT_Descriptor {
        @available(*, unavailable)
        /// See IC_RAW_INTR_STAT for a detailed description of R_RESTART_DET bit.
        /// Reset value: 0x0
        public var R_RESTART_DET: R_RESTART_DET_Field {
            get {
                fatalError()
            }
        }

        public enum R_RESTART_DET_Values: UInt, BitFieldProjectable {
            /// R_RESTART_DET interrupt is inactive
            case R_RESTART_DET_INACTIVE = 0
            /// R_RESTART_DET interrupt is active
            case R_RESTART_DET_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// See IC_RAW_INTR_STAT for a detailed description of R_GEN_CALL bit.
        /// Reset value: 0x0
        public var R_GEN_CALL: R_GEN_CALL_Field {
            get {
                fatalError()
            }
        }

        public enum R_GEN_CALL_Values: UInt, BitFieldProjectable {
            /// R_GEN_CALL interrupt is inactive
            case R_GEN_CALL_INACTIVE = 0
            /// R_GEN_CALL interrupt is active
            case R_GEN_CALL_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// See IC_RAW_INTR_STAT for a detailed description of R_START_DET bit.
        /// Reset value: 0x0
        public var R_START_DET: R_START_DET_Field {
            get {
                fatalError()
            }
        }

        public enum R_START_DET_Values: UInt, BitFieldProjectable {
            /// R_START_DET interrupt is inactive
            case R_START_DET_INACTIVE = 0
            /// R_START_DET interrupt is active
            case R_START_DET_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// See IC_RAW_INTR_STAT for a detailed description of R_STOP_DET bit.
        /// Reset value: 0x0
        public var R_STOP_DET: R_STOP_DET_Field {
            get {
                fatalError()
            }
        }

        public enum R_STOP_DET_Values: UInt, BitFieldProjectable {
            /// R_STOP_DET interrupt is inactive
            case R_STOP_DET_INACTIVE = 0
            /// R_STOP_DET interrupt is active
            case R_STOP_DET_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// See IC_RAW_INTR_STAT for a detailed description of R_ACTIVITY bit.
        /// Reset value: 0x0
        public var R_ACTIVITY: R_ACTIVITY_Field {
            get {
                fatalError()
            }
        }

        public enum R_ACTIVITY_Values: UInt, BitFieldProjectable {
            /// R_ACTIVITY interrupt is inactive
            case R_ACTIVITY_INACTIVE = 0
            /// R_ACTIVITY interrupt is active
            case R_ACTIVITY_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// See IC_RAW_INTR_STAT for a detailed description of R_RX_DONE bit.
        /// Reset value: 0x0
        public var R_RX_DONE: R_RX_DONE_Field {
            get {
                fatalError()
            }
        }

        public enum R_RX_DONE_Values: UInt, BitFieldProjectable {
            /// R_RX_DONE interrupt is inactive
            case R_RX_DONE_INACTIVE = 0
            /// R_RX_DONE interrupt is active
            case R_RX_DONE_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// See IC_RAW_INTR_STAT for a detailed description of R_TX_ABRT bit.
        /// Reset value: 0x0
        public var R_TX_ABRT: R_TX_ABRT_Field {
            get {
                fatalError()
            }
        }

        public enum R_TX_ABRT_Values: UInt, BitFieldProjectable {
            /// R_TX_ABRT interrupt is inactive
            case R_TX_ABRT_INACTIVE = 0
            /// R_TX_ABRT interrupt is active
            case R_TX_ABRT_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// See IC_RAW_INTR_STAT for a detailed description of R_RD_REQ bit.
        /// Reset value: 0x0
        public var R_RD_REQ: R_RD_REQ_Field {
            get {
                fatalError()
            }
        }

        public enum R_RD_REQ_Values: UInt, BitFieldProjectable {
            /// R_RD_REQ interrupt is inactive
            case R_RD_REQ_INACTIVE = 0
            /// R_RD_REQ interrupt is active
            case R_RD_REQ_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// See IC_RAW_INTR_STAT for a detailed description of R_TX_EMPTY bit.
        /// Reset value: 0x0
        public var R_TX_EMPTY: R_TX_EMPTY_Field {
            get {
                fatalError()
            }
        }

        public enum R_TX_EMPTY_Values: UInt, BitFieldProjectable {
            /// R_TX_EMPTY interrupt is inactive
            case R_TX_EMPTY_INACTIVE = 0
            /// R_TX_EMPTY interrupt is active
            case R_TX_EMPTY_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// See IC_RAW_INTR_STAT for a detailed description of R_TX_OVER bit.
        /// Reset value: 0x0
        public var R_TX_OVER: R_TX_OVER_Field {
            get {
                fatalError()
            }
        }

        public enum R_TX_OVER_Values: UInt, BitFieldProjectable {
            /// R_TX_OVER interrupt is inactive
            case R_TX_OVER_INACTIVE = 0
            /// R_TX_OVER interrupt is active
            case R_TX_OVER_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// See IC_RAW_INTR_STAT for a detailed description of R_RX_FULL bit.
        /// Reset value: 0x0
        public var R_RX_FULL: R_RX_FULL_Field {
            get {
                fatalError()
            }
        }

        public enum R_RX_FULL_Values: UInt, BitFieldProjectable {
            /// R_RX_FULL interrupt is inactive
            case R_RX_FULL_INACTIVE = 0
            /// R_RX_FULL interrupt is active
            case R_RX_FULL_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// See IC_RAW_INTR_STAT for a detailed description of R_RX_OVER bit.
        /// Reset value: 0x0
        public var R_RX_OVER: R_RX_OVER_Field {
            get {
                fatalError()
            }
        }

        public enum R_RX_OVER_Values: UInt, BitFieldProjectable {
            /// R_RX_OVER interrupt is inactive
            case R_RX_OVER_INACTIVE = 0
            /// R_RX_OVER interrupt is active
            case R_RX_OVER_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// See IC_RAW_INTR_STAT for a detailed description of R_RX_UNDER bit.
        /// Reset value: 0x0
        public var R_RX_UNDER: R_RX_UNDER_Field {
            get {
                fatalError()
            }
        }

        public enum R_RX_UNDER_Values: UInt, BitFieldProjectable {
            /// RX_UNDER interrupt is inactive
            case R_RX_UNDER_INACTIVE = 0
            /// RX_UNDER interrupt is active
            case R_RX_UNDER_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum R_RESTART_DET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum R_GEN_CALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum R_START_DET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum R_STOP_DET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum R_ACTIVITY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum R_RX_DONE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum R_TX_ABRT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum R_RD_REQ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum R_TX_EMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum R_TX_OVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum R_RX_FULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum R_RX_OVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum R_RX_UNDER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_INTR_STAT_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.Read) {
                self.storage = value.storage
                }

                  public  init(_ value: Value.Write) {
            self.storage = value.storage
              }
                public var R_RESTART_DET: UInt32 {
                @inlinable @inline(__always) get {
                    R_RESTART_DET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    R_RESTART_DET_Field.insert(newValue, into: &self.storage)
                }
                }
              public var R_GEN_CALL: UInt32 {
                @inlinable @inline(__always) get {
                  R_GEN_CALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  R_GEN_CALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var R_START_DET: UInt32 {
                @inlinable @inline(__always) get {
                  R_START_DET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  R_START_DET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var R_STOP_DET: UInt32 {
                @inlinable @inline(__always) get {
                  R_STOP_DET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  R_STOP_DET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var R_ACTIVITY: UInt32 {
                @inlinable @inline(__always) get {
                  R_ACTIVITY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  R_ACTIVITY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var R_RX_DONE: UInt32 {
                @inlinable @inline(__always) get {
                  R_RX_DONE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  R_RX_DONE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var R_TX_ABRT: UInt32 {
                @inlinable @inline(__always) get {
                  R_TX_ABRT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  R_TX_ABRT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var R_RD_REQ: UInt32 {
                @inlinable @inline(__always) get {
                  R_RD_REQ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  R_RD_REQ_Field.insert(newValue, into: &self.storage)
                }
              }
              public var R_TX_EMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  R_TX_EMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  R_TX_EMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var R_TX_OVER: UInt32 {
                @inlinable @inline(__always) get {
                  R_TX_OVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  R_TX_OVER_Field.insert(newValue, into: &self.storage)
                }
              }
              public var R_RX_FULL: UInt32 {
                @inlinable @inline(__always) get {
                  R_RX_FULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  R_RX_FULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var R_RX_OVER: UInt32 {
                @inlinable @inline(__always) get {
                  R_RX_OVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  R_RX_OVER_Field.insert(newValue, into: &self.storage)
                }
              }
              public var R_RX_UNDER: UInt32 {
                @inlinable @inline(__always) get {
                  R_RX_UNDER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  R_RX_UNDER_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = IC_INTR_STAT_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var R_RESTART_DET: R_RESTART_DET_Values {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(R_RESTART_DET_Field.self, R_RESTART_DET_Values.self)
                    return R_RESTART_DET_Values(storage: self.raw.R_RESTART_DET)
                }
                }
              public var R_GEN_CALL: R_GEN_CALL_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(R_GEN_CALL_Field.self, R_GEN_CALL_Values.self)
                  return R_GEN_CALL_Values(storage: self.raw.R_GEN_CALL)
                }
              }
              public var R_START_DET: R_START_DET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(R_START_DET_Field.self, R_START_DET_Values.self)
                  return R_START_DET_Values(storage: self.raw.R_START_DET)
                }
              }
              public var R_STOP_DET: R_STOP_DET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(R_STOP_DET_Field.self, R_STOP_DET_Values.self)
                  return R_STOP_DET_Values(storage: self.raw.R_STOP_DET)
                }
              }
              public var R_ACTIVITY: R_ACTIVITY_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(R_ACTIVITY_Field.self, R_ACTIVITY_Values.self)
                  return R_ACTIVITY_Values(storage: self.raw.R_ACTIVITY)
                }
              }
              public var R_RX_DONE: R_RX_DONE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(R_RX_DONE_Field.self, R_RX_DONE_Values.self)
                  return R_RX_DONE_Values(storage: self.raw.R_RX_DONE)
                }
              }
              public var R_TX_ABRT: R_TX_ABRT_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(R_TX_ABRT_Field.self, R_TX_ABRT_Values.self)
                  return R_TX_ABRT_Values(storage: self.raw.R_TX_ABRT)
                }
              }
              public var R_RD_REQ: R_RD_REQ_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(R_RD_REQ_Field.self, R_RD_REQ_Values.self)
                  return R_RD_REQ_Values(storage: self.raw.R_RD_REQ)
                }
              }
              public var R_TX_EMPTY: R_TX_EMPTY_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(R_TX_EMPTY_Field.self, R_TX_EMPTY_Values.self)
                  return R_TX_EMPTY_Values(storage: self.raw.R_TX_EMPTY)
                }
              }
              public var R_TX_OVER: R_TX_OVER_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(R_TX_OVER_Field.self, R_TX_OVER_Values.self)
                  return R_TX_OVER_Values(storage: self.raw.R_TX_OVER)
                }
              }
              public var R_RX_FULL: R_RX_FULL_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(R_RX_FULL_Field.self, R_RX_FULL_Values.self)
                  return R_RX_FULL_Values(storage: self.raw.R_RX_FULL)
                }
              }
              public var R_RX_OVER: R_RX_OVER_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(R_RX_OVER_Field.self, R_RX_OVER_Values.self)
                  return R_RX_OVER_Values(storage: self.raw.R_RX_OVER)
                }
              }
              public var R_RX_UNDER: R_RX_UNDER_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(R_RX_UNDER_Field.self, R_RX_UNDER_Values.self)
                  return R_RX_UNDER_Values(storage: self.raw.R_RX_UNDER)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = IC_INTR_STAT_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }

        }
    }

    /// I2C Interrupt Mask Register.
    /// These bits mask their corresponding interrupt status bits. This register is active low; a value of 0 masks the interrupt, whereas a value of 1 unmasks the interrupt.
    public var IC_INTR_MASK: Register<IC_INTR_MASK_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0030), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0030))
          #endif
        }
    }
    public struct IC_INTR_MASK_Descriptor {
        @available(*, unavailable)
        /// This bit masks the R_RESTART_DET interrupt in IC_INTR_STAT register.
        /// Reset value: 0x0
        public var M_RESTART_DET: M_RESTART_DET_Field {
            get {
                fatalError()
            }
        }

        public enum M_RESTART_DET_Values: UInt, BitFieldProjectable {
            /// RESTART_DET interrupt is masked
            case M_RESTART_DET_ENABLED = 0
            /// RESTART_DET interrupt is unmasked
            case M_RESTART_DET_DISABLED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This bit masks the R_GEN_CALL interrupt in IC_INTR_STAT register.
        /// Reset value: 0x1
        public var M_GEN_CALL: M_GEN_CALL_Field {
            get {
                fatalError()
            }
        }

        public enum M_GEN_CALL_Values: UInt, BitFieldProjectable {
            /// GEN_CALL interrupt is masked
            case M_GEN_CALL_ENABLED = 0
            /// GEN_CALL interrupt is unmasked
            case M_GEN_CALL_DISABLED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This bit masks the R_START_DET interrupt in IC_INTR_STAT register.
        /// Reset value: 0x0
        public var M_START_DET: M_START_DET_Field {
            get {
                fatalError()
            }
        }

        public enum M_START_DET_Values: UInt, BitFieldProjectable {
            /// START_DET interrupt is masked
            case M_START_DET_ENABLED = 0
            /// START_DET interrupt is unmasked
            case M_START_DET_DISABLED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This bit masks the R_STOP_DET interrupt in IC_INTR_STAT register.
        /// Reset value: 0x0
        public var M_STOP_DET: M_STOP_DET_Field {
            get {
                fatalError()
            }
        }

        public enum M_STOP_DET_Values: UInt, BitFieldProjectable {
            /// STOP_DET interrupt is masked
            case M_STOP_DET_ENABLED = 0
            /// STOP_DET interrupt is unmasked
            case M_STOP_DET_DISABLED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This bit masks the R_ACTIVITY interrupt in IC_INTR_STAT register.
        /// Reset value: 0x0
        public var M_ACTIVITY: M_ACTIVITY_Field {
            get {
                fatalError()
            }
        }

        public enum M_ACTIVITY_Values: UInt, BitFieldProjectable {
            /// ACTIVITY interrupt is masked
            case M_ACTIVITY_ENABLED = 0
            /// ACTIVITY interrupt is unmasked
            case M_ACTIVITY_DISABLED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This bit masks the R_RX_DONE interrupt in IC_INTR_STAT register.
        /// Reset value: 0x1
        public var M_RX_DONE: M_RX_DONE_Field {
            get {
                fatalError()
            }
        }

        public enum M_RX_DONE_Values: UInt, BitFieldProjectable {
            /// RX_DONE interrupt is masked
            case M_RX_DONE_ENABLED = 0
            /// RX_DONE interrupt is unmasked
            case M_RX_DONE_DISABLED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This bit masks the R_TX_ABRT interrupt in IC_INTR_STAT register.
        /// Reset value: 0x1
        public var M_TX_ABRT: M_TX_ABRT_Field {
            get {
                fatalError()
            }
        }

        public enum M_TX_ABRT_Values: UInt, BitFieldProjectable {
            /// TX_ABORT interrupt is masked
            case M_TX_ABRT_ENABLED = 0
            /// TX_ABORT interrupt is unmasked
            case M_TX_ABRT_DISABLED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This bit masks the R_RD_REQ interrupt in IC_INTR_STAT register.
        /// Reset value: 0x1
        public var M_RD_REQ: M_RD_REQ_Field {
            get {
                fatalError()
            }
        }

        public enum M_RD_REQ_Values: UInt, BitFieldProjectable {
            /// RD_REQ interrupt is masked
            case M_RD_REQ_ENABLED = 0
            /// RD_REQ interrupt is unmasked
            case M_RD_REQ_DISABLED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This bit masks the R_TX_EMPTY interrupt in IC_INTR_STAT register.
        /// Reset value: 0x1
        public var M_TX_EMPTY: M_TX_EMPTY_Field {
            get {
                fatalError()
            }
        }

        public enum M_TX_EMPTY_Values: UInt, BitFieldProjectable {
            /// TX_EMPTY interrupt is masked
            case M_TX_EMPTY_ENABLED = 0
            /// TX_EMPTY interrupt is unmasked
            case M_TX_EMPTY_DISABLED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This bit masks the R_TX_OVER interrupt in IC_INTR_STAT register.
        /// Reset value: 0x1
        public var M_TX_OVER: M_TX_OVER_Field {
            get {
                fatalError()
            }
        }

        public enum M_TX_OVER_Values: UInt, BitFieldProjectable {
            /// TX_OVER interrupt is masked
            case M_TX_OVER_ENABLED = 0
            /// TX_OVER interrupt is unmasked
            case M_TX_OVER_DISABLED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This bit masks the R_RX_FULL interrupt in IC_INTR_STAT register.
        /// Reset value: 0x1
        public var M_RX_FULL: M_RX_FULL_Field {
            get {
                fatalError()
            }
        }

        public enum M_RX_FULL_Values: UInt, BitFieldProjectable {
            /// RX_FULL interrupt is masked
            case M_RX_FULL_ENABLED = 0
            /// RX_FULL interrupt is unmasked
            case M_RX_FULL_DISABLED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This bit masks the R_RX_OVER interrupt in IC_INTR_STAT register.
        /// Reset value: 0x1
        public var M_RX_OVER: M_RX_OVER_Field {
            get {
                fatalError()
            }
        }

        public enum M_RX_OVER_Values: UInt, BitFieldProjectable {
            /// RX_OVER interrupt is masked
            case M_RX_OVER_ENABLED = 0
            /// RX_OVER interrupt is unmasked
            case M_RX_OVER_DISABLED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This bit masks the R_RX_UNDER interrupt in IC_INTR_STAT register.
        /// Reset value: 0x1
        public var M_RX_UNDER: M_RX_UNDER_Field {
            get {
                fatalError()
            }
        }

        public enum M_RX_UNDER_Values: UInt, BitFieldProjectable {
            /// RX_UNDER interrupt is masked
            case M_RX_UNDER_ENABLED = 0
            /// RX_UNDER interrupt is unmasked
            case M_RX_UNDER_DISABLED = 1

            public static var bitWidth: Int { 1 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum M_RESTART_DET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum M_GEN_CALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum M_START_DET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum M_STOP_DET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum M_ACTIVITY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum M_RX_DONE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum M_TX_ABRT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum M_RD_REQ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum M_TX_EMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum M_TX_OVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum M_RX_FULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum M_RX_OVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum M_RX_UNDER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_INTR_MASK_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var M_RESTART_DET: UInt32 {
                @inlinable @inline(__always) get {
                    M_RESTART_DET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    M_RESTART_DET_Field.insert(newValue, into: &self.storage)
                }
                }
              public var M_GEN_CALL: UInt32 {
                @inlinable @inline(__always) get {
                  M_GEN_CALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  M_GEN_CALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var M_START_DET: UInt32 {
                @inlinable @inline(__always) get {
                  M_START_DET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  M_START_DET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var M_STOP_DET: UInt32 {
                @inlinable @inline(__always) get {
                  M_STOP_DET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  M_STOP_DET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var M_ACTIVITY: UInt32 {
                @inlinable @inline(__always) get {
                  M_ACTIVITY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  M_ACTIVITY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var M_RX_DONE: UInt32 {
                @inlinable @inline(__always) get {
                  M_RX_DONE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  M_RX_DONE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var M_TX_ABRT: UInt32 {
                @inlinable @inline(__always) get {
                  M_TX_ABRT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  M_TX_ABRT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var M_RD_REQ: UInt32 {
                @inlinable @inline(__always) get {
                  M_RD_REQ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  M_RD_REQ_Field.insert(newValue, into: &self.storage)
                }
              }
              public var M_TX_EMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  M_TX_EMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  M_TX_EMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var M_TX_OVER: UInt32 {
                @inlinable @inline(__always) get {
                  M_TX_OVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  M_TX_OVER_Field.insert(newValue, into: &self.storage)
                }
              }
              public var M_RX_FULL: UInt32 {
                @inlinable @inline(__always) get {
                  M_RX_FULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  M_RX_FULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var M_RX_OVER: UInt32 {
                @inlinable @inline(__always) get {
                  M_RX_OVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  M_RX_OVER_Field.insert(newValue, into: &self.storage)
                }
              }
              public var M_RX_UNDER: UInt32 {
                @inlinable @inline(__always) get {
                  M_RX_UNDER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  M_RX_UNDER_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = IC_INTR_MASK_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var M_RESTART_DET: M_RESTART_DET_Values {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(M_RESTART_DET_Field.self, M_RESTART_DET_Values.self)
                    return M_RESTART_DET_Values(storage: self.raw.M_RESTART_DET)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(M_RESTART_DET_Field.self, M_RESTART_DET_Values.self)
                    self.raw.M_RESTART_DET = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var M_GEN_CALL: M_GEN_CALL_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(M_GEN_CALL_Field.self, M_GEN_CALL_Values.self)
                  return M_GEN_CALL_Values(storage: self.raw.M_GEN_CALL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(M_GEN_CALL_Field.self, M_GEN_CALL_Values.self)
                  self.raw.M_GEN_CALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var M_START_DET: M_START_DET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(M_START_DET_Field.self, M_START_DET_Values.self)
                  return M_START_DET_Values(storage: self.raw.M_START_DET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(M_START_DET_Field.self, M_START_DET_Values.self)
                  self.raw.M_START_DET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var M_STOP_DET: M_STOP_DET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(M_STOP_DET_Field.self, M_STOP_DET_Values.self)
                  return M_STOP_DET_Values(storage: self.raw.M_STOP_DET)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(M_STOP_DET_Field.self, M_STOP_DET_Values.self)
                  self.raw.M_STOP_DET = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var M_ACTIVITY: M_ACTIVITY_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(M_ACTIVITY_Field.self, M_ACTIVITY_Values.self)
                  return M_ACTIVITY_Values(storage: self.raw.M_ACTIVITY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(M_ACTIVITY_Field.self, M_ACTIVITY_Values.self)
                  self.raw.M_ACTIVITY = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var M_RX_DONE: M_RX_DONE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(M_RX_DONE_Field.self, M_RX_DONE_Values.self)
                  return M_RX_DONE_Values(storage: self.raw.M_RX_DONE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(M_RX_DONE_Field.self, M_RX_DONE_Values.self)
                  self.raw.M_RX_DONE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var M_TX_ABRT: M_TX_ABRT_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(M_TX_ABRT_Field.self, M_TX_ABRT_Values.self)
                  return M_TX_ABRT_Values(storage: self.raw.M_TX_ABRT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(M_TX_ABRT_Field.self, M_TX_ABRT_Values.self)
                  self.raw.M_TX_ABRT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var M_RD_REQ: M_RD_REQ_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(M_RD_REQ_Field.self, M_RD_REQ_Values.self)
                  return M_RD_REQ_Values(storage: self.raw.M_RD_REQ)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(M_RD_REQ_Field.self, M_RD_REQ_Values.self)
                  self.raw.M_RD_REQ = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var M_TX_EMPTY: M_TX_EMPTY_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(M_TX_EMPTY_Field.self, M_TX_EMPTY_Values.self)
                  return M_TX_EMPTY_Values(storage: self.raw.M_TX_EMPTY)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(M_TX_EMPTY_Field.self, M_TX_EMPTY_Values.self)
                  self.raw.M_TX_EMPTY = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var M_TX_OVER: M_TX_OVER_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(M_TX_OVER_Field.self, M_TX_OVER_Values.self)
                  return M_TX_OVER_Values(storage: self.raw.M_TX_OVER)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(M_TX_OVER_Field.self, M_TX_OVER_Values.self)
                  self.raw.M_TX_OVER = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var M_RX_FULL: M_RX_FULL_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(M_RX_FULL_Field.self, M_RX_FULL_Values.self)
                  return M_RX_FULL_Values(storage: self.raw.M_RX_FULL)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(M_RX_FULL_Field.self, M_RX_FULL_Values.self)
                  self.raw.M_RX_FULL = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var M_RX_OVER: M_RX_OVER_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(M_RX_OVER_Field.self, M_RX_OVER_Values.self)
                  return M_RX_OVER_Values(storage: self.raw.M_RX_OVER)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(M_RX_OVER_Field.self, M_RX_OVER_Values.self)
                  self.raw.M_RX_OVER = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var M_RX_UNDER: M_RX_UNDER_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(M_RX_UNDER_Field.self, M_RX_UNDER_Values.self)
                  return M_RX_UNDER_Values(storage: self.raw.M_RX_UNDER)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(M_RX_UNDER_Field.self, M_RX_UNDER_Values.self)
                  self.raw.M_RX_UNDER = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// I2C Raw Interrupt Status Register
    /// Unlike the IC_INTR_STAT register, these bits are not masked so they always show the true status of the DW_apb_i2c.
    public var IC_RAW_INTR_STAT: Register<IC_RAW_INTR_STAT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0034), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0034))
          #endif
        }
    }
    public struct IC_RAW_INTR_STAT_Descriptor {
        @available(*, unavailable)
        /// Indicates whether a RESTART condition has occurred on the I2C interface when DW_apb_i2c is operating in Slave mode and the slave is being addressed. Enabled only when IC_SLV_RESTART_DET_EN=1.
        /// Note: However, in high-speed mode or during a START BYTE transfer, the RESTART comes before the address field as per the I2C protocol. In this case, the slave is not the addressed slave when the RESTART is issued, therefore DW_apb_i2c does not generate the RESTART_DET interrupt.
        /// Reset value: 0x0
        public var RESTART_DET: RESTART_DET_Field {
            get {
                fatalError()
            }
        }

        public enum RESTART_DET_Values: UInt, BitFieldProjectable {
            /// RESTART_DET interrupt is inactive
            case RESTART_DET_INACTIVE = 0
            /// RESTART_DET interrupt is active
            case RESTART_DET_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// Set only when a General Call address is received and it is acknowledged. It stays set until it is cleared either by disabling DW_apb_i2c or when the CPU reads bit 0 of the IC_CLR_GEN_CALL register. DW_apb_i2c stores the received data in the Rx buffer.
        /// Reset value: 0x0
        public var GEN_CALL: GEN_CALL_Field {
            get {
                fatalError()
            }
        }

        public enum GEN_CALL_Values: UInt, BitFieldProjectable {
            /// GEN_CALL interrupt is inactive
            case GEN_CALL_INACTIVE = 0
            /// GEN_CALL interrupt is active
            case GEN_CALL_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// Indicates whether a START or RESTART condition has occurred on the I2C interface regardless of whether DW_apb_i2c is operating in slave or master mode.
        /// Reset value: 0x0
        public var START_DET: START_DET_Field {
            get {
                fatalError()
            }
        }

        public enum START_DET_Values: UInt, BitFieldProjectable {
            /// START_DET interrupt is inactive
            case START_DET_INACTIVE = 0
            /// START_DET interrupt is active
            case START_DET_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// Indicates whether a STOP condition has occurred on the I2C interface regardless of whether DW_apb_i2c is operating in slave or master mode.
        /// In Slave Mode: - If IC_CON[7]=1'b1  (STOP_DET_IFADDRESSED), the STOP_DET interrupt will be issued only if slave is addressed. Note: During a general call address, this slave does not issue a STOP_DET interrupt if STOP_DET_IF_ADDRESSED=1'b1, even if the slave responds to the general call address by generating ACK. The STOP_DET interrupt is generated only when the transmitted address matches the slave address (SAR). - If IC_CON[7]=1'b0 (STOP_DET_IFADDRESSED), the STOP_DET interrupt is issued irrespective of whether it is being addressed. In Master Mode: - If IC_CON[10]=1'b1  (STOP_DET_IF_MASTER_ACTIVE),the STOP_DET interrupt will be issued only if Master is active. - If IC_CON[10]=1'b0  (STOP_DET_IFADDRESSED),the STOP_DET interrupt will be issued irrespective of whether master is active or not. Reset value: 0x0
        public var STOP_DET: STOP_DET_Field {
            get {
                fatalError()
            }
        }

        public enum STOP_DET_Values: UInt, BitFieldProjectable {
            /// STOP_DET interrupt is inactive
            case STOP_DET_INACTIVE = 0
            /// STOP_DET interrupt is active
            case STOP_DET_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This bit captures DW_apb_i2c activity and stays set until it is cleared. There are four ways to clear it: - Disabling the DW_apb_i2c - Reading the IC_CLR_ACTIVITY register - Reading the IC_CLR_INTR register - System reset Once this bit is set, it stays set unless one of the four methods is used to clear it. Even if the DW_apb_i2c module is idle, this bit remains set until cleared, indicating that there was activity on the bus.
        /// Reset value: 0x0
        public var ACTIVITY: ACTIVITY_Field {
            get {
                fatalError()
            }
        }

        public enum ACTIVITY_Values: UInt, BitFieldProjectable {
            /// RAW_INTR_ACTIVITY interrupt is inactive
            case ACTIVITY_INACTIVE = 0
            /// RAW_INTR_ACTIVITY interrupt is active
            case ACTIVITY_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// When the DW_apb_i2c is acting as a slave-transmitter, this bit is set to 1 if the master does not acknowledge a transmitted byte. This occurs on the last byte of the transmission, indicating that the transmission is done.
        /// Reset value: 0x0
        public var RX_DONE: RX_DONE_Field {
            get {
                fatalError()
            }
        }

        public enum RX_DONE_Values: UInt, BitFieldProjectable {
            /// RX_DONE interrupt is inactive
            case RX_DONE_INACTIVE = 0
            /// RX_DONE interrupt is active
            case RX_DONE_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This bit indicates if DW_apb_i2c, as an I2C transmitter, is unable to complete the intended actions on the contents of the transmit FIFO. This situation can occur both as an I2C master or an I2C slave, and is referred to as a 'transmit abort'. When this bit is set to 1, the IC_TX_ABRT_SOURCE register indicates the reason why the transmit abort takes places.
        /// Note:  The DW_apb_i2c flushes/resets/empties the TX_FIFO and RX_FIFO whenever there is a transmit abort caused by any of the events tracked by the IC_TX_ABRT_SOURCE register. The FIFOs remains in this flushed state until the register IC_CLR_TX_ABRT is read. Once this read is performed, the Tx FIFO is then ready to accept more data bytes from the APB interface.
        /// Reset value: 0x0
        public var TX_ABRT: TX_ABRT_Field {
            get {
                fatalError()
            }
        }

        public enum TX_ABRT_Values: UInt, BitFieldProjectable {
            /// TX_ABRT interrupt is inactive
            case TX_ABRT_INACTIVE = 0
            /// TX_ABRT interrupt is active
            case TX_ABRT_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This bit is set to 1 when DW_apb_i2c is acting as a slave and another I2C master is attempting to read data from DW_apb_i2c. The DW_apb_i2c holds the I2C bus in a wait state (SCL=0) until this interrupt is serviced, which means that the slave has been addressed by a remote master that is asking for data to be transferred. The processor must respond to this interrupt and then write the requested data to the IC_DATA_CMD register. This bit is set to 0 just after the processor reads the IC_CLR_RD_REQ register.
        /// Reset value: 0x0
        public var RD_REQ: RD_REQ_Field {
            get {
                fatalError()
            }
        }

        public enum RD_REQ_Values: UInt, BitFieldProjectable {
            /// RD_REQ interrupt is inactive
            case RD_REQ_INACTIVE = 0
            /// RD_REQ interrupt is active
            case RD_REQ_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// The behavior of the TX_EMPTY interrupt status differs based on the TX_EMPTY_CTRL selection in the IC_CON register. - When TX_EMPTY_CTRL = 0: This bit is set to 1 when the transmit buffer is at or below the threshold value set in the IC_TX_TL register. - When TX_EMPTY_CTRL = 1: This bit is set to 1 when the transmit buffer is at or below the threshold value set in the IC_TX_TL register and the transmission of the address/data from the internal shift register for the most recently popped command is completed. It is automatically cleared by hardware when the buffer level goes above the threshold. When IC_ENABLE[0] is set to 0, the TX FIFO is flushed and held in reset. There the TX FIFO looks like it has no data within it, so this bit is set to 1, provided there is activity in the master or slave state machines. When there is no longer any activity, then with ic_en=0, this bit is set to 0.
        /// Reset value: 0x0.
        public var TX_EMPTY: TX_EMPTY_Field {
            get {
                fatalError()
            }
        }

        public enum TX_EMPTY_Values: UInt, BitFieldProjectable {
            /// TX_EMPTY interrupt is inactive
            case TX_EMPTY_INACTIVE = 0
            /// TX_EMPTY interrupt is active
            case TX_EMPTY_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// Set during transmit if the transmit buffer is filled to IC_TX_BUFFER_DEPTH and the processor attempts to issue another I2C command by writing to the IC_DATA_CMD register. When the module is disabled, this bit keeps its level until the master or slave state machines go into idle, and when ic_en goes to 0, this interrupt is cleared.
        /// Reset value: 0x0
        public var TX_OVER: TX_OVER_Field {
            get {
                fatalError()
            }
        }

        public enum TX_OVER_Values: UInt, BitFieldProjectable {
            /// TX_OVER interrupt is inactive
            case TX_OVER_INACTIVE = 0
            /// TX_OVER interrupt is active
            case TX_OVER_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// Set when the receive buffer reaches or goes above the RX_TL threshold in the IC_RX_TL register. It is automatically cleared by hardware when buffer level goes below the threshold. If the module is disabled (IC_ENABLE[0]=0), the RX FIFO is flushed and held in reset; therefore the RX FIFO is not full. So this bit is cleared once the IC_ENABLE bit 0 is programmed with a 0, regardless of the activity that continues.
        /// Reset value: 0x0
        public var RX_FULL: RX_FULL_Field {
            get {
                fatalError()
            }
        }

        public enum RX_FULL_Values: UInt, BitFieldProjectable {
            /// RX_FULL interrupt is inactive
            case RX_FULL_INACTIVE = 0
            /// RX_FULL interrupt is active
            case RX_FULL_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// Set if the receive buffer is completely filled to IC_RX_BUFFER_DEPTH and an additional byte is received from an external I2C device. The DW_apb_i2c acknowledges this, but any data bytes received after the FIFO is full are lost. If the module is disabled (IC_ENABLE[0]=0), this bit keeps its level until the master or slave state machines go into idle, and when ic_en goes to 0, this interrupt is cleared.
        /// Note:  If bit 9 of the IC_CON register (RX_FIFO_FULL_HLD_CTRL) is programmed to HIGH, then the RX_OVER interrupt never occurs, because the Rx FIFO never overflows.
        /// Reset value: 0x0
        public var RX_OVER: RX_OVER_Field {
            get {
                fatalError()
            }
        }

        public enum RX_OVER_Values: UInt, BitFieldProjectable {
            /// RX_OVER interrupt is inactive
            case RX_OVER_INACTIVE = 0
            /// RX_OVER interrupt is active
            case RX_OVER_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// Set if the processor attempts to read the receive buffer when it is empty by reading from the IC_DATA_CMD register. If the module is disabled (IC_ENABLE[0]=0), this bit keeps its level until the master or slave state machines go into idle, and when ic_en goes to 0, this interrupt is cleared.
        /// Reset value: 0x0
        public var RX_UNDER: RX_UNDER_Field {
            get {
                fatalError()
            }
        }

        public enum RX_UNDER_Values: UInt, BitFieldProjectable {
            /// RX_UNDER interrupt is inactive
            case RX_UNDER_INACTIVE = 0
            /// RX_UNDER interrupt is active
            case RX_UNDER_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum RESTART_DET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum GEN_CALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum START_DET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum STOP_DET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum ACTIVITY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum RX_DONE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum TX_ABRT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum RD_REQ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum TX_EMPTY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum TX_OVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum RX_FULL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum RX_OVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum RX_UNDER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_RAW_INTR_STAT_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.Read) {
                self.storage = value.storage
                }

                  public  init(_ value: Value.Write) {
            self.storage = value.storage
              }
                public var RESTART_DET: UInt32 {
                @inlinable @inline(__always) get {
                    RESTART_DET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    RESTART_DET_Field.insert(newValue, into: &self.storage)
                }
                }
              public var GEN_CALL: UInt32 {
                @inlinable @inline(__always) get {
                  GEN_CALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  GEN_CALL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var START_DET: UInt32 {
                @inlinable @inline(__always) get {
                  START_DET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  START_DET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var STOP_DET: UInt32 {
                @inlinable @inline(__always) get {
                  STOP_DET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  STOP_DET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ACTIVITY: UInt32 {
                @inlinable @inline(__always) get {
                  ACTIVITY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ACTIVITY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RX_DONE: UInt32 {
                @inlinable @inline(__always) get {
                  RX_DONE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RX_DONE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TX_ABRT: UInt32 {
                @inlinable @inline(__always) get {
                  TX_ABRT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TX_ABRT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RD_REQ: UInt32 {
                @inlinable @inline(__always) get {
                  RD_REQ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RD_REQ_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TX_EMPTY: UInt32 {
                @inlinable @inline(__always) get {
                  TX_EMPTY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TX_EMPTY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TX_OVER: UInt32 {
                @inlinable @inline(__always) get {
                  TX_OVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TX_OVER_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RX_FULL: UInt32 {
                @inlinable @inline(__always) get {
                  RX_FULL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RX_FULL_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RX_OVER: UInt32 {
                @inlinable @inline(__always) get {
                  RX_OVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RX_OVER_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RX_UNDER: UInt32 {
                @inlinable @inline(__always) get {
                  RX_UNDER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RX_UNDER_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = IC_RAW_INTR_STAT_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var RESTART_DET: RESTART_DET_Values {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(RESTART_DET_Field.self, RESTART_DET_Values.self)
                    return RESTART_DET_Values(storage: self.raw.RESTART_DET)
                }
                }
              public var GEN_CALL: GEN_CALL_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(GEN_CALL_Field.self, GEN_CALL_Values.self)
                  return GEN_CALL_Values(storage: self.raw.GEN_CALL)
                }
              }
              public var START_DET: START_DET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(START_DET_Field.self, START_DET_Values.self)
                  return START_DET_Values(storage: self.raw.START_DET)
                }
              }
              public var STOP_DET: STOP_DET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(STOP_DET_Field.self, STOP_DET_Values.self)
                  return STOP_DET_Values(storage: self.raw.STOP_DET)
                }
              }
              public var ACTIVITY: ACTIVITY_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ACTIVITY_Field.self, ACTIVITY_Values.self)
                  return ACTIVITY_Values(storage: self.raw.ACTIVITY)
                }
              }
              public var RX_DONE: RX_DONE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RX_DONE_Field.self, RX_DONE_Values.self)
                  return RX_DONE_Values(storage: self.raw.RX_DONE)
                }
              }
              public var TX_ABRT: TX_ABRT_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TX_ABRT_Field.self, TX_ABRT_Values.self)
                  return TX_ABRT_Values(storage: self.raw.TX_ABRT)
                }
              }
              public var RD_REQ: RD_REQ_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RD_REQ_Field.self, RD_REQ_Values.self)
                  return RD_REQ_Values(storage: self.raw.RD_REQ)
                }
              }
              public var TX_EMPTY: TX_EMPTY_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TX_EMPTY_Field.self, TX_EMPTY_Values.self)
                  return TX_EMPTY_Values(storage: self.raw.TX_EMPTY)
                }
              }
              public var TX_OVER: TX_OVER_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TX_OVER_Field.self, TX_OVER_Values.self)
                  return TX_OVER_Values(storage: self.raw.TX_OVER)
                }
              }
              public var RX_FULL: RX_FULL_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RX_FULL_Field.self, RX_FULL_Values.self)
                  return RX_FULL_Values(storage: self.raw.RX_FULL)
                }
              }
              public var RX_OVER: RX_OVER_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RX_OVER_Field.self, RX_OVER_Values.self)
                  return RX_OVER_Values(storage: self.raw.RX_OVER)
                }
              }
              public var RX_UNDER: RX_UNDER_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RX_UNDER_Field.self, RX_UNDER_Values.self)
                  return RX_UNDER_Values(storage: self.raw.RX_UNDER)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = IC_RAW_INTR_STAT_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }

        }
    }

    /// I2C Receive FIFO Threshold Register
    public var IC_RX_TL: Register<IC_RX_TL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0038), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0038))
          #endif
        }
    }
    public struct IC_RX_TL_Descriptor {
        @available(*, unavailable)
        /// Receive FIFO Threshold Level.
        /// Controls the level of entries (or above) that triggers the RX_FULL interrupt (bit 2 in IC_RAW_INTR_STAT register). The valid range is 0-255, with the additional restriction that hardware does not allow this value to be set to a value larger than the depth of the buffer. If an attempt is made to do that, the actual value set will be the maximum depth of the buffer. A value of 0 sets the threshold for 1 entry, and a value of 255 sets the threshold for 256 entries.
        public var RX_TL: RX_TL_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum RX_TL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_RX_TL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var RX_TL: UInt32 {
                @inlinable @inline(__always) get {
                    RX_TL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    RX_TL_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = IC_RX_TL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var RX_TL: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(RX_TL_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.RX_TL)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(RX_TL_Field.self, BitField8.self)
                    self.raw.RX_TL = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// I2C Transmit FIFO Threshold Register
    public var IC_TX_TL: Register<IC_TX_TL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x003c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x003c))
          #endif
        }
    }
    public struct IC_TX_TL_Descriptor {
        @available(*, unavailable)
        /// Transmit FIFO Threshold Level.
        /// Controls the level of entries (or below) that trigger the TX_EMPTY interrupt (bit 4 in IC_RAW_INTR_STAT register). The valid range is 0-255, with the additional restriction that it may not be set to value larger than the depth of the buffer. If an attempt is made to do that, the actual value set will be the maximum depth of the buffer. A value of 0 sets the threshold for 0 entries, and a value of 255 sets the threshold for 255 entries.
        public var TX_TL: TX_TL_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum TX_TL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_TX_TL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var TX_TL: UInt32 {
                @inlinable @inline(__always) get {
                    TX_TL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    TX_TL_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = IC_TX_TL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var TX_TL: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(TX_TL_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.TX_TL)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(TX_TL_Field.self, BitField8.self)
                    self.raw.TX_TL = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Clear Combined and Individual Interrupt Register
    public var IC_CLR_INTR: Register<IC_CLR_INTR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0040), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0040))
          #endif
        }
    }
    public struct IC_CLR_INTR_Descriptor {
        @available(*, unavailable)
        /// Read this register to clear the combined interrupt, all individual interrupts, and the IC_TX_ABRT_SOURCE register. This bit does not clear hardware clearable interrupts but software clearable interrupts. Refer to Bit 9 of the IC_TX_ABRT_SOURCE register for an exception to clearing IC_TX_ABRT_SOURCE.
        /// Reset value: 0x0
        public var CLR_INTR: CLR_INTR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CLR_INTR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_CLR_INTR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.Read) {
                self.storage = value.storage
                }

                  public  init(_ value: Value.Write) {
            self.storage = value.storage
              }
                public var CLR_INTR: UInt32 {
                @inlinable @inline(__always) get {
                    CLR_INTR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CLR_INTR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = IC_CLR_INTR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var CLR_INTR: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CLR_INTR_Field.self, Bool.self)
                    return Bool(storage: self.raw.CLR_INTR)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = IC_CLR_INTR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }

        }
    }

    /// Clear RX_UNDER Interrupt Register
    public var IC_CLR_RX_UNDER: Register<IC_CLR_RX_UNDER_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0044), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0044))
          #endif
        }
    }
    public struct IC_CLR_RX_UNDER_Descriptor {
        @available(*, unavailable)
        /// Read this register to clear the RX_UNDER interrupt (bit 0) of the IC_RAW_INTR_STAT register.
        /// Reset value: 0x0
        public var CLR_RX_UNDER: CLR_RX_UNDER_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CLR_RX_UNDER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_CLR_RX_UNDER_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.Read) {
                self.storage = value.storage
                }

                  public  init(_ value: Value.Write) {
            self.storage = value.storage
              }
                public var CLR_RX_UNDER: UInt32 {
                @inlinable @inline(__always) get {
                    CLR_RX_UNDER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CLR_RX_UNDER_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = IC_CLR_RX_UNDER_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var CLR_RX_UNDER: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CLR_RX_UNDER_Field.self, Bool.self)
                    return Bool(storage: self.raw.CLR_RX_UNDER)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = IC_CLR_RX_UNDER_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }

        }
    }

    /// Clear RX_OVER Interrupt Register
    public var IC_CLR_RX_OVER: Register<IC_CLR_RX_OVER_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0048), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0048))
          #endif
        }
    }
    public struct IC_CLR_RX_OVER_Descriptor {
        @available(*, unavailable)
        /// Read this register to clear the RX_OVER interrupt (bit 1) of the IC_RAW_INTR_STAT register.
        /// Reset value: 0x0
        public var CLR_RX_OVER: CLR_RX_OVER_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CLR_RX_OVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_CLR_RX_OVER_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.Read) {
                self.storage = value.storage
                }

                  public  init(_ value: Value.Write) {
            self.storage = value.storage
              }
                public var CLR_RX_OVER: UInt32 {
                @inlinable @inline(__always) get {
                    CLR_RX_OVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CLR_RX_OVER_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = IC_CLR_RX_OVER_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var CLR_RX_OVER: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CLR_RX_OVER_Field.self, Bool.self)
                    return Bool(storage: self.raw.CLR_RX_OVER)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = IC_CLR_RX_OVER_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }

        }
    }

    /// Clear TX_OVER Interrupt Register
    public var IC_CLR_TX_OVER: Register<IC_CLR_TX_OVER_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x004c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x004c))
          #endif
        }
    }
    public struct IC_CLR_TX_OVER_Descriptor {
        @available(*, unavailable)
        /// Read this register to clear the TX_OVER interrupt (bit 3) of the IC_RAW_INTR_STAT register.
        /// Reset value: 0x0
        public var CLR_TX_OVER: CLR_TX_OVER_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CLR_TX_OVER_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_CLR_TX_OVER_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.Read) {
                self.storage = value.storage
                }

                  public  init(_ value: Value.Write) {
            self.storage = value.storage
              }
                public var CLR_TX_OVER: UInt32 {
                @inlinable @inline(__always) get {
                    CLR_TX_OVER_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CLR_TX_OVER_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = IC_CLR_TX_OVER_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var CLR_TX_OVER: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CLR_TX_OVER_Field.self, Bool.self)
                    return Bool(storage: self.raw.CLR_TX_OVER)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = IC_CLR_TX_OVER_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }

        }
    }

    /// Clear RD_REQ Interrupt Register
    public var IC_CLR_RD_REQ: Register<IC_CLR_RD_REQ_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0050), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0050))
          #endif
        }
    }
    public struct IC_CLR_RD_REQ_Descriptor {
        @available(*, unavailable)
        /// Read this register to clear the RD_REQ interrupt (bit 5) of the IC_RAW_INTR_STAT register.
        /// Reset value: 0x0
        public var CLR_RD_REQ: CLR_RD_REQ_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CLR_RD_REQ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_CLR_RD_REQ_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.Read) {
                self.storage = value.storage
                }

                  public  init(_ value: Value.Write) {
            self.storage = value.storage
              }
                public var CLR_RD_REQ: UInt32 {
                @inlinable @inline(__always) get {
                    CLR_RD_REQ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CLR_RD_REQ_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = IC_CLR_RD_REQ_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var CLR_RD_REQ: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CLR_RD_REQ_Field.self, Bool.self)
                    return Bool(storage: self.raw.CLR_RD_REQ)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = IC_CLR_RD_REQ_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }

        }
    }

    /// Clear TX_ABRT Interrupt Register
    public var IC_CLR_TX_ABRT: Register<IC_CLR_TX_ABRT_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0054), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0054))
          #endif
        }
    }
    public struct IC_CLR_TX_ABRT_Descriptor {
        @available(*, unavailable)
        /// Read this register to clear the TX_ABRT interrupt (bit 6) of the IC_RAW_INTR_STAT register, and the IC_TX_ABRT_SOURCE register. This also releases the TX FIFO from the flushed/reset state, allowing more writes to the TX FIFO. Refer to Bit 9 of the IC_TX_ABRT_SOURCE register for an exception to clearing IC_TX_ABRT_SOURCE.
        /// Reset value: 0x0
        public var CLR_TX_ABRT: CLR_TX_ABRT_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CLR_TX_ABRT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_CLR_TX_ABRT_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.Read) {
                self.storage = value.storage
                }

                  public  init(_ value: Value.Write) {
            self.storage = value.storage
              }
                public var CLR_TX_ABRT: UInt32 {
                @inlinable @inline(__always) get {
                    CLR_TX_ABRT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CLR_TX_ABRT_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = IC_CLR_TX_ABRT_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var CLR_TX_ABRT: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CLR_TX_ABRT_Field.self, Bool.self)
                    return Bool(storage: self.raw.CLR_TX_ABRT)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = IC_CLR_TX_ABRT_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }

        }
    }

    /// Clear RX_DONE Interrupt Register
    public var IC_CLR_RX_DONE: Register<IC_CLR_RX_DONE_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0058), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0058))
          #endif
        }
    }
    public struct IC_CLR_RX_DONE_Descriptor {
        @available(*, unavailable)
        /// Read this register to clear the RX_DONE interrupt (bit 7) of the IC_RAW_INTR_STAT register.
        /// Reset value: 0x0
        public var CLR_RX_DONE: CLR_RX_DONE_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CLR_RX_DONE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_CLR_RX_DONE_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.Read) {
                self.storage = value.storage
                }

                  public  init(_ value: Value.Write) {
            self.storage = value.storage
              }
                public var CLR_RX_DONE: UInt32 {
                @inlinable @inline(__always) get {
                    CLR_RX_DONE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CLR_RX_DONE_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = IC_CLR_RX_DONE_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var CLR_RX_DONE: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CLR_RX_DONE_Field.self, Bool.self)
                    return Bool(storage: self.raw.CLR_RX_DONE)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = IC_CLR_RX_DONE_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }

        }
    }

    /// Clear ACTIVITY Interrupt Register
    public var IC_CLR_ACTIVITY: Register<IC_CLR_ACTIVITY_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x005c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x005c))
          #endif
        }
    }
    public struct IC_CLR_ACTIVITY_Descriptor {
        @available(*, unavailable)
        /// Reading this register clears the ACTIVITY interrupt if the I2C is not active anymore. If the I2C module is still active on the bus, the ACTIVITY interrupt bit continues to be set. It is automatically cleared by hardware if the module is disabled and if there is no further activity on the bus. The value read from this register to get status of the ACTIVITY interrupt (bit 8) of the IC_RAW_INTR_STAT register.
        /// Reset value: 0x0
        public var CLR_ACTIVITY: CLR_ACTIVITY_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CLR_ACTIVITY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_CLR_ACTIVITY_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.Read) {
                self.storage = value.storage
                }

                  public  init(_ value: Value.Write) {
            self.storage = value.storage
              }
                public var CLR_ACTIVITY: UInt32 {
                @inlinable @inline(__always) get {
                    CLR_ACTIVITY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CLR_ACTIVITY_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = IC_CLR_ACTIVITY_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var CLR_ACTIVITY: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CLR_ACTIVITY_Field.self, Bool.self)
                    return Bool(storage: self.raw.CLR_ACTIVITY)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = IC_CLR_ACTIVITY_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }

        }
    }

    /// Clear STOP_DET Interrupt Register
    public var IC_CLR_STOP_DET: Register<IC_CLR_STOP_DET_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0060), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0060))
          #endif
        }
    }
    public struct IC_CLR_STOP_DET_Descriptor {
        @available(*, unavailable)
        /// Read this register to clear the STOP_DET interrupt (bit 9) of the IC_RAW_INTR_STAT register.
        /// Reset value: 0x0
        public var CLR_STOP_DET: CLR_STOP_DET_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CLR_STOP_DET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_CLR_STOP_DET_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.Read) {
                self.storage = value.storage
                }

                  public  init(_ value: Value.Write) {
            self.storage = value.storage
              }
                public var CLR_STOP_DET: UInt32 {
                @inlinable @inline(__always) get {
                    CLR_STOP_DET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CLR_STOP_DET_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = IC_CLR_STOP_DET_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var CLR_STOP_DET: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CLR_STOP_DET_Field.self, Bool.self)
                    return Bool(storage: self.raw.CLR_STOP_DET)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = IC_CLR_STOP_DET_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }

        }
    }

    /// Clear START_DET Interrupt Register
    public var IC_CLR_START_DET: Register<IC_CLR_START_DET_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0064), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0064))
          #endif
        }
    }
    public struct IC_CLR_START_DET_Descriptor {
        @available(*, unavailable)
        /// Read this register to clear the START_DET interrupt (bit 10) of the IC_RAW_INTR_STAT register.
        /// Reset value: 0x0
        public var CLR_START_DET: CLR_START_DET_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CLR_START_DET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_CLR_START_DET_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.Read) {
                self.storage = value.storage
                }

                  public  init(_ value: Value.Write) {
            self.storage = value.storage
              }
                public var CLR_START_DET: UInt32 {
                @inlinable @inline(__always) get {
                    CLR_START_DET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CLR_START_DET_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = IC_CLR_START_DET_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var CLR_START_DET: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CLR_START_DET_Field.self, Bool.self)
                    return Bool(storage: self.raw.CLR_START_DET)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = IC_CLR_START_DET_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }

        }
    }

    /// Clear GEN_CALL Interrupt Register
    public var IC_CLR_GEN_CALL: Register<IC_CLR_GEN_CALL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0068), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0068))
          #endif
        }
    }
    public struct IC_CLR_GEN_CALL_Descriptor {
        @available(*, unavailable)
        /// Read this register to clear the GEN_CALL interrupt (bit 11) of IC_RAW_INTR_STAT register.
        /// Reset value: 0x0
        public var CLR_GEN_CALL: CLR_GEN_CALL_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CLR_GEN_CALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_CLR_GEN_CALL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.Read) {
                self.storage = value.storage
                }

                  public  init(_ value: Value.Write) {
            self.storage = value.storage
              }
                public var CLR_GEN_CALL: UInt32 {
                @inlinable @inline(__always) get {
                    CLR_GEN_CALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CLR_GEN_CALL_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = IC_CLR_GEN_CALL_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var CLR_GEN_CALL: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CLR_GEN_CALL_Field.self, Bool.self)
                    return Bool(storage: self.raw.CLR_GEN_CALL)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = IC_CLR_GEN_CALL_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }

        }
    }

    /// I2C Enable Register
    public var IC_ENABLE: Register<IC_ENABLE_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x006c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x006c))
          #endif
        }
    }
    public struct IC_ENABLE_Descriptor {
        @available(*, unavailable)
        /// In Master mode: - 1'b1: Blocks the transmission of data on I2C bus even if Tx FIFO has data to transmit. - 1'b0: The transmission of data starts on I2C bus automatically, as soon as the first data is available in the Tx FIFO. Note: To block the execution of Master commands, set the TX_CMD_BLOCK bit only when Tx FIFO is empty (IC_STATUS[2]==1) and Master is in Idle state (IC_STATUS[5] == 0). Any further commands put in the Tx FIFO are not executed until TX_CMD_BLOCK bit is unset. Reset value:  IC_TX_CMD_BLOCK_DEFAULT
        public var TX_CMD_BLOCK: TX_CMD_BLOCK_Field {
            get {
                fatalError()
            }
        }

        public enum TX_CMD_BLOCK_Values: UInt, BitFieldProjectable {
            /// Tx Command execution not blocked
            case TX_CMD_BLOCK_NOT_BLOCKED = 0
            /// Tx Command execution blocked
            case TX_CMD_BLOCK_BLOCKED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// When set, the controller initiates the transfer abort. - 0: ABORT not initiated or ABORT done - 1: ABORT operation in progress The software can abort the I2C transfer in master mode by setting this bit. The software can set this bit only when ENABLE is already set; otherwise, the controller ignores any write to ABORT bit. The software cannot clear the ABORT bit once set. In response to an ABORT, the controller issues a STOP and flushes the Tx FIFO after completing the current transfer, then sets the TX_ABORT interrupt after the abort operation. The ABORT bit is cleared automatically after the abort operation.
        /// For a detailed description on how to abort I2C transfers, refer to 'Aborting I2C Transfers'.
        /// Reset value: 0x0
        public var ABORT: ABORT_Field {
            get {
                fatalError()
            }
        }

        public enum ABORT_Values: UInt, BitFieldProjectable {
            /// ABORT operation not in progress
            case ABORT_DISABLE = 0
            /// ABORT operation in progress
            case ABORT_ENABLED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// Controls whether the DW_apb_i2c is enabled. - 0: Disables DW_apb_i2c (TX and RX FIFOs are held in an erased state) - 1: Enables DW_apb_i2c Software can disable DW_apb_i2c while it is active. However, it is important that care be taken to ensure that DW_apb_i2c is disabled properly. A recommended procedure is described in 'Disabling DW_apb_i2c'.
        /// When DW_apb_i2c is disabled, the following occurs: - The TX FIFO and RX FIFO get flushed. - Status bits in the IC_INTR_STAT register are still active until DW_apb_i2c goes into IDLE state. If the module is transmitting, it stops as well as deletes the contents of the transmit buffer after the current transfer is complete. If the module is receiving, the DW_apb_i2c stops the current transfer at the end of the current byte and does not acknowledge the transfer.
        /// In systems with asynchronous pclk and ic_clk when IC_CLK_TYPE parameter set to asynchronous (1), there is a two ic_clk delay when enabling or disabling the DW_apb_i2c. For a detailed description on how to disable DW_apb_i2c, refer to 'Disabling DW_apb_i2c'
        /// Reset value: 0x0
        public var ENABLE: ENABLE_Field {
            get {
                fatalError()
            }
        }

        public enum ENABLE_Values: UInt, BitFieldProjectable {
            /// I2C is disabled
            case ENABLE_DISABLED = 0
            /// I2C is enabled
            case ENABLE_ENABLED = 1

            public static var bitWidth: Int { 1 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum TX_CMD_BLOCK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum ABORT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum ENABLE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_ENABLE_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var TX_CMD_BLOCK: UInt32 {
                @inlinable @inline(__always) get {
                    TX_CMD_BLOCK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    TX_CMD_BLOCK_Field.insert(newValue, into: &self.storage)
                }
                }
              public var ABORT: UInt32 {
                @inlinable @inline(__always) get {
                  ABORT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ABORT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ENABLE: UInt32 {
                @inlinable @inline(__always) get {
                  ENABLE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ENABLE_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = IC_ENABLE_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var TX_CMD_BLOCK: TX_CMD_BLOCK_Values {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(TX_CMD_BLOCK_Field.self, TX_CMD_BLOCK_Values.self)
                    return TX_CMD_BLOCK_Values(storage: self.raw.TX_CMD_BLOCK)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(TX_CMD_BLOCK_Field.self, TX_CMD_BLOCK_Values.self)
                    self.raw.TX_CMD_BLOCK = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var ABORT: ABORT_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ABORT_Field.self, ABORT_Values.self)
                  return ABORT_Values(storage: self.raw.ABORT)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ABORT_Field.self, ABORT_Values.self)
                  self.raw.ABORT = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var ENABLE: ENABLE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ENABLE_Field.self, ENABLE_Values.self)
                  return ENABLE_Values(storage: self.raw.ENABLE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(ENABLE_Field.self, ENABLE_Values.self)
                  self.raw.ENABLE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// I2C Status Register
    /// This is a read-only register used to indicate the current transfer status and FIFO status. The status register may be read at any time. None of the bits in this register request an interrupt.
    /// When the I2C is disabled by writing 0 in bit 0 of the IC_ENABLE register: - Bits 1 and 2 are set to 1 - Bits 3 and 10 are set to 0 When the master or slave state machines goes to idle and ic_en=0: - Bits 5 and 6 are set to 0
    public var IC_STATUS: Register<IC_STATUS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0070), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0070))
          #endif
        }
    }
    public struct IC_STATUS_Descriptor {
        @available(*, unavailable)
        /// Slave FSM Activity Status. When the Slave Finite State Machine (FSM) is not in the IDLE state, this bit is set. - 0: Slave FSM is in IDLE state so the Slave part of DW_apb_i2c is not Active - 1: Slave FSM is not in IDLE state so the Slave part of DW_apb_i2c is Active Reset value: 0x0
        public var SLV_ACTIVITY: SLV_ACTIVITY_Field {
            get {
                fatalError()
            }
        }

        public enum SLV_ACTIVITY_Values: UInt, BitFieldProjectable {
            /// Slave is idle
            case SLV_ACTIVITY_IDLE = 0
            /// Slave not idle
            case SLV_ACTIVITY_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// Master FSM Activity Status. When the Master Finite State Machine (FSM) is not in the IDLE state, this bit is set. - 0: Master FSM is in IDLE state so the Master part of DW_apb_i2c is not Active - 1: Master FSM is not in IDLE state so the Master part of DW_apb_i2c is Active Note: IC_STATUS[0]-that is, ACTIVITY bit-is the OR of SLV_ACTIVITY and MST_ACTIVITY bits.
        /// Reset value: 0x0
        public var MST_ACTIVITY: MST_ACTIVITY_Field {
            get {
                fatalError()
            }
        }

        public enum MST_ACTIVITY_Values: UInt, BitFieldProjectable {
            /// Master is idle
            case MST_ACTIVITY_IDLE = 0
            /// Master not idle
            case MST_ACTIVITY_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// Receive FIFO Completely Full. When the receive FIFO is completely full, this bit is set. When the receive FIFO contains one or more empty location, this bit is cleared. - 0: Receive FIFO is not full - 1: Receive FIFO is full Reset value: 0x0
        public var RFF: RFF_Field {
            get {
                fatalError()
            }
        }

        public enum RFF_Values: UInt, BitFieldProjectable {
            /// Rx FIFO not full
            case RFF_NOT_FULL = 0
            /// Rx FIFO is full
            case RFF_FULL = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// Receive FIFO Not Empty. This bit is set when the receive FIFO contains one or more entries; it is cleared when the receive FIFO is empty. - 0: Receive FIFO is empty - 1: Receive FIFO is not empty Reset value: 0x0
        public var RFNE: RFNE_Field {
            get {
                fatalError()
            }
        }

        public enum RFNE_Values: UInt, BitFieldProjectable {
            /// Rx FIFO is empty
            case RFNE_EMPTY = 0
            /// Rx FIFO not empty
            case RFNE_NOT_EMPTY = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// Transmit FIFO Completely Empty. When the transmit FIFO is completely empty, this bit is set. When it contains one or more valid entries, this bit is cleared. This bit field does not request an interrupt. - 0: Transmit FIFO is not empty - 1: Transmit FIFO is empty Reset value: 0x1
        public var TFE: TFE_Field {
            get {
                fatalError()
            }
        }

        public enum TFE_Values: UInt, BitFieldProjectable {
            /// Tx FIFO not empty
            case TFE_NON_EMPTY = 0
            /// Tx FIFO is empty
            case TFE_EMPTY = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// Transmit FIFO Not Full. Set when the transmit FIFO contains one or more empty locations, and is cleared when the FIFO is full. - 0: Transmit FIFO is full - 1: Transmit FIFO is not full Reset value: 0x1
        public var TFNF: TFNF_Field {
            get {
                fatalError()
            }
        }

        public enum TFNF_Values: UInt, BitFieldProjectable {
            /// Tx FIFO is full
            case TFNF_FULL = 0
            /// Tx FIFO not full
            case TFNF_NOT_FULL = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// I2C Activity Status. Reset value: 0x0
        public var ACTIVITY: ACTIVITY_Field {
            get {
                fatalError()
            }
        }

        public enum ACTIVITY_Values: UInt, BitFieldProjectable {
            /// I2C is idle
            case ACTIVITY_INACTIVE = 0
            /// I2C is active
            case ACTIVITY_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SLV_ACTIVITY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum MST_ACTIVITY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum RFF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum RFNE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum TFE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum TFNF_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum ACTIVITY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_STATUS_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.Read) {
                self.storage = value.storage
                }

                  public  init(_ value: Value.Write) {
            self.storage = value.storage
              }
                public var SLV_ACTIVITY: UInt32 {
                @inlinable @inline(__always) get {
                    SLV_ACTIVITY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SLV_ACTIVITY_Field.insert(newValue, into: &self.storage)
                }
                }
              public var MST_ACTIVITY: UInt32 {
                @inlinable @inline(__always) get {
                  MST_ACTIVITY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  MST_ACTIVITY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RFF: UInt32 {
                @inlinable @inline(__always) get {
                  RFF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RFF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var RFNE: UInt32 {
                @inlinable @inline(__always) get {
                  RFNE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RFNE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TFE: UInt32 {
                @inlinable @inline(__always) get {
                  TFE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TFE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var TFNF: UInt32 {
                @inlinable @inline(__always) get {
                  TFNF_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  TFNF_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ACTIVITY: UInt32 {
                @inlinable @inline(__always) get {
                  ACTIVITY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ACTIVITY_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = IC_STATUS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var SLV_ACTIVITY: SLV_ACTIVITY_Values {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SLV_ACTIVITY_Field.self, SLV_ACTIVITY_Values.self)
                    return SLV_ACTIVITY_Values(storage: self.raw.SLV_ACTIVITY)
                }
                }
              public var MST_ACTIVITY: MST_ACTIVITY_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(MST_ACTIVITY_Field.self, MST_ACTIVITY_Values.self)
                  return MST_ACTIVITY_Values(storage: self.raw.MST_ACTIVITY)
                }
              }
              public var RFF: RFF_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RFF_Field.self, RFF_Values.self)
                  return RFF_Values(storage: self.raw.RFF)
                }
              }
              public var RFNE: RFNE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RFNE_Field.self, RFNE_Values.self)
                  return RFNE_Values(storage: self.raw.RFNE)
                }
              }
              public var TFE: TFE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TFE_Field.self, TFE_Values.self)
                  return TFE_Values(storage: self.raw.TFE)
                }
              }
              public var TFNF: TFNF_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(TFNF_Field.self, TFNF_Values.self)
                  return TFNF_Values(storage: self.raw.TFNF)
                }
              }
              public var ACTIVITY: ACTIVITY_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ACTIVITY_Field.self, ACTIVITY_Values.self)
                  return ACTIVITY_Values(storage: self.raw.ACTIVITY)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = IC_STATUS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }

        }
    }

    /// I2C Transmit FIFO Level Register This register contains the number of valid data entries in the transmit FIFO buffer. It is cleared whenever: - The I2C is disabled - There is a transmit abort - that is, TX_ABRT bit is set in the IC_RAW_INTR_STAT register - The slave bulk transmit mode is aborted The register increments whenever data is placed into the transmit FIFO and decrements when data is taken from the transmit FIFO.
    public var IC_TXFLR: Register<IC_TXFLR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0074), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0074))
          #endif
        }
    }
    public struct IC_TXFLR_Descriptor {
        @available(*, unavailable)
        /// Transmit FIFO Level. Contains the number of valid data entries in the transmit FIFO.
        /// Reset value: 0x0
        public var TXFLR: TXFLR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum TXFLR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 5
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_TXFLR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.Read) {
                self.storage = value.storage
                }

                  public  init(_ value: Value.Write) {
            self.storage = value.storage
              }
                public var TXFLR: UInt32 {
                @inlinable @inline(__always) get {
                    TXFLR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    TXFLR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = IC_TXFLR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var TXFLR: BitField5 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(TXFLR_Field.self, BitField5.self)
                    return BitField5(storage: self.raw.TXFLR)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = IC_TXFLR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }

        }
    }

    /// I2C Receive FIFO Level Register This register contains the number of valid data entries in the receive FIFO buffer. It is cleared whenever: - The I2C is disabled - Whenever there is a transmit abort caused by any of the events tracked in IC_TX_ABRT_SOURCE The register increments whenever data is placed into the receive FIFO and decrements when data is taken from the receive FIFO.
    public var IC_RXFLR: Register<IC_RXFLR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0078), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0078))
          #endif
        }
    }
    public struct IC_RXFLR_Descriptor {
        @available(*, unavailable)
        /// Receive FIFO Level. Contains the number of valid data entries in the receive FIFO.
        /// Reset value: 0x0
        public var RXFLR: RXFLR_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum RXFLR_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 5
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_RXFLR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.Read) {
                self.storage = value.storage
                }

                  public  init(_ value: Value.Write) {
            self.storage = value.storage
              }
                public var RXFLR: UInt32 {
                @inlinable @inline(__always) get {
                    RXFLR_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    RXFLR_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = IC_RXFLR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var RXFLR: BitField5 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(RXFLR_Field.self, BitField5.self)
                    return BitField5(storage: self.raw.RXFLR)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = IC_RXFLR_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }

        }
    }

    /// I2C SDA Hold Time Length Register
    /// The bits [15:0] of this register are used to control the hold time of SDA during transmit in both slave and master mode (after SCL goes from HIGH to LOW).
    /// The bits [23:16] of this register are used to extend the SDA transition (if any) whenever SCL is HIGH in the receiver in either master or slave mode.
    /// Writes to this register succeed only when IC_ENABLE[0]=0.
    /// The values in this register are in units of ic_clk period. The value programmed in IC_SDA_TX_HOLD must be greater than the minimum hold time in each mode (one cycle in master mode, seven cycles in slave mode) for the value to be implemented.
    /// The programmed SDA hold time during transmit (IC_SDA_TX_HOLD) cannot exceed at any time the duration of the low part of scl. Therefore the programmed value cannot be larger than N_SCL_LOW-2, where N_SCL_LOW is the duration of the low part of the scl period measured in ic_clk cycles.
    public var IC_SDA_HOLD: Register<IC_SDA_HOLD_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x007c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x007c))
          #endif
        }
    }
    public struct IC_SDA_HOLD_Descriptor {
        @available(*, unavailable)
        /// Sets the required SDA hold time in units of ic_clk period, when DW_apb_i2c acts as a receiver.
        /// Reset value: IC_DEFAULT_SDA_HOLD[23:16].
        public var IC_SDA_RX_HOLD: IC_SDA_RX_HOLD_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Sets the required SDA hold time in units of ic_clk period, when DW_apb_i2c acts as a transmitter.
        /// Reset value: IC_DEFAULT_SDA_HOLD[15:0].
        public var IC_SDA_TX_HOLD: IC_SDA_TX_HOLD_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IC_SDA_RX_HOLD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 24
        }

        public enum IC_SDA_TX_HOLD_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 16
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_SDA_HOLD_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var IC_SDA_RX_HOLD: UInt32 {
                @inlinable @inline(__always) get {
                    IC_SDA_RX_HOLD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IC_SDA_RX_HOLD_Field.insert(newValue, into: &self.storage)
                }
                }
              public var IC_SDA_TX_HOLD: UInt32 {
                @inlinable @inline(__always) get {
                  IC_SDA_TX_HOLD_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IC_SDA_TX_HOLD_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = IC_SDA_HOLD_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var IC_SDA_RX_HOLD: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IC_SDA_RX_HOLD_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.IC_SDA_RX_HOLD)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(IC_SDA_RX_HOLD_Field.self, BitField8.self)
                    self.raw.IC_SDA_RX_HOLD = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var IC_SDA_TX_HOLD: BitField16 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IC_SDA_TX_HOLD_Field.self, BitField16.self)
                  return BitField16(storage: self.raw.IC_SDA_TX_HOLD)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(IC_SDA_TX_HOLD_Field.self, BitField16.self)
                  self.raw.IC_SDA_TX_HOLD = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// I2C Transmit Abort Source Register
    /// This register has 32 bits that indicate the source of the TX_ABRT bit. Except for Bit 9, this register is cleared whenever the IC_CLR_TX_ABRT register or the IC_CLR_INTR register is read. To clear Bit 9, the source of the ABRT_SBYTE_NORSTRT must be fixed first; RESTART must be enabled (IC_CON[5]=1), the SPECIAL bit must be cleared (IC_TAR[11]), or the GC_OR_START bit must be cleared (IC_TAR[10]).
    /// Once the source of the ABRT_SBYTE_NORSTRT is fixed, then this bit can be cleared in the same manner as other bits in this register. If the source of the ABRT_SBYTE_NORSTRT is not fixed before attempting to clear this bit, Bit 9 clears for one cycle and is then re-asserted.
    public var IC_TX_ABRT_SOURCE: Register<IC_TX_ABRT_SOURCE_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0080), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0080))
          #endif
        }
    }
    public struct IC_TX_ABRT_SOURCE_Descriptor {
        @available(*, unavailable)
        /// This field indicates the number of Tx FIFO Data Commands which are flushed due to TX_ABRT interrupt. It is cleared whenever I2C is disabled.
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Master-Transmitter or Slave-Transmitter
        public var TX_FLUSH_CNT: TX_FLUSH_CNT_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// This is a master-mode-only bit. Master has detected the transfer abort (IC_ENABLE[1])
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Master-Transmitter
        public var ABRT_USER_ABRT: ABRT_USER_ABRT_Field {
            get {
                fatalError()
            }
        }

        public enum ABRT_USER_ABRT_Values: UInt, BitFieldProjectable {
            /// Transfer abort detected by master- scenario not present
            case ABRT_USER_ABRT_ABRT_USER_ABRT_VOID = 0
            /// Transfer abort detected by master
            case ABRT_USER_ABRT_ABRT_USER_ABRT_GENERATED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// 1: When the processor side responds to a slave mode request for data to be transmitted to a remote master and user writes a 1 in CMD (bit 8) of IC_DATA_CMD register.
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Slave-Transmitter
        public var ABRT_SLVRD_INTX: ABRT_SLVRD_INTX_Field {
            get {
                fatalError()
            }
        }

        public enum ABRT_SLVRD_INTX_Values: UInt, BitFieldProjectable {
            /// Slave trying to transmit to remote master in read mode- scenario not present
            case ABRT_SLVRD_INTX_ABRT_SLVRD_INTX_VOID = 0
            /// Slave trying to transmit to remote master in read mode
            case ABRT_SLVRD_INTX_ABRT_SLVRD_INTX_GENERATED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This field indicates that a Slave has lost the bus while transmitting data to a remote master. IC_TX_ABRT_SOURCE[12] is set at the same time. Note:  Even though the slave never 'owns' the bus, something could go wrong on the bus. This is a fail safe check. For instance, during a data transmission at the low-to-high transition of SCL, if what is on the data bus is not what is supposed to be transmitted, then DW_apb_i2c no longer own the bus.
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Slave-Transmitter
        public var ABRT_SLV_ARBLOST: ABRT_SLV_ARBLOST_Field {
            get {
                fatalError()
            }
        }

        public enum ABRT_SLV_ARBLOST_Values: UInt, BitFieldProjectable {
            /// Slave lost arbitration to remote master- scenario not present
            case ABRT_SLV_ARBLOST_ABRT_SLV_ARBLOST_VOID = 0
            /// Slave lost arbitration to remote master
            case ABRT_SLV_ARBLOST_ABRT_SLV_ARBLOST_GENERATED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This field specifies that the Slave has received a read command and some data exists in the TX FIFO, so the slave issues a TX_ABRT interrupt to flush old data in TX FIFO.
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Slave-Transmitter
        public var ABRT_SLVFLUSH_TXFIFO: ABRT_SLVFLUSH_TXFIFO_Field {
            get {
                fatalError()
            }
        }

        public enum ABRT_SLVFLUSH_TXFIFO_Values: UInt, BitFieldProjectable {
            /// Slave flushes existing data in TX-FIFO upon getting read command- scenario not present
            case ABRT_SLVFLUSH_TXFIFO_ABRT_SLVFLUSH_TXFIFO_VOID = 0
            /// Slave flushes existing data in TX-FIFO upon getting read command
            case ABRT_SLVFLUSH_TXFIFO_ABRT_SLVFLUSH_TXFIFO_GENERATED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This field specifies that the Master has lost arbitration, or if IC_TX_ABRT_SOURCE[14] is also set, then the slave transmitter has lost arbitration.
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Master-Transmitter or Slave-Transmitter
        public var ARB_LOST: ARB_LOST_Field {
            get {
                fatalError()
            }
        }

        public enum ARB_LOST_Values: UInt, BitFieldProjectable {
            /// Master or Slave-Transmitter lost arbitration- scenario not present
            case ARB_LOST_ABRT_LOST_VOID = 0
            /// Master or Slave-Transmitter lost arbitration
            case ARB_LOST_ABRT_LOST_GENERATED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This field indicates that the User tries to initiate a Master operation with the Master mode disabled.
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Master-Transmitter or Master-Receiver
        public var ABRT_MASTER_DIS: ABRT_MASTER_DIS_Field {
            get {
                fatalError()
            }
        }

        public enum ABRT_MASTER_DIS_Values: UInt, BitFieldProjectable {
            /// User initiating master operation when MASTER disabled- scenario not present
            case ABRT_MASTER_DIS_ABRT_MASTER_DIS_VOID = 0
            /// User initiating master operation when MASTER disabled
            case ABRT_MASTER_DIS_ABRT_MASTER_DIS_GENERATED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This field indicates that the restart is disabled (IC_RESTART_EN bit (IC_CON[5]) =0) and the master sends a read command in 10-bit addressing mode.
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Master-Receiver
        public var ABRT_10B_RD_NORSTRT: ABRT_10B_RD_NORSTRT_Field {
            get {
                fatalError()
            }
        }

        public enum ABRT_10B_RD_NORSTRT_Values: UInt, BitFieldProjectable {
            /// Master not trying to read in 10Bit addressing mode when RESTART disabled
            case ABRT_10B_RD_NORSTRT_ABRT_10B_RD_VOID = 0
            /// Master trying to read in 10Bit addressing mode when RESTART disabled
            case ABRT_10B_RD_NORSTRT_ABRT_10B_RD_GENERATED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// To clear Bit 9, the source of the ABRT_SBYTE_NORSTRT must be fixed first; restart must be enabled (IC_CON[5]=1), the SPECIAL bit must be cleared (IC_TAR[11]), or the GC_OR_START bit must be cleared (IC_TAR[10]). Once the source of the ABRT_SBYTE_NORSTRT is fixed, then this bit can be cleared in the same manner as other bits in this register. If the source of the ABRT_SBYTE_NORSTRT is not fixed before attempting to clear this bit, bit 9 clears for one cycle and then gets reasserted. When this field is set to 1, the restart is disabled (IC_RESTART_EN bit (IC_CON[5]) =0) and the user is trying to send a START Byte.
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Master
        public var ABRT_SBYTE_NORSTRT: ABRT_SBYTE_NORSTRT_Field {
            get {
                fatalError()
            }
        }

        public enum ABRT_SBYTE_NORSTRT_Values: UInt, BitFieldProjectable {
            /// User trying to send START byte when RESTART disabled- scenario not present
            case ABRT_SBYTE_NORSTRT_ABRT_SBYTE_NORSTRT_VOID = 0
            /// User trying to send START byte when RESTART disabled
            case ABRT_SBYTE_NORSTRT_ABRT_SBYTE_NORSTRT_GENERATED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This field indicates that the restart is disabled (IC_RESTART_EN bit (IC_CON[5]) =0) and the user is trying to use the master to transfer data in High Speed mode.
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Master-Transmitter or Master-Receiver
        public var ABRT_HS_NORSTRT: ABRT_HS_NORSTRT_Field {
            get {
                fatalError()
            }
        }

        public enum ABRT_HS_NORSTRT_Values: UInt, BitFieldProjectable {
            /// User trying to switch Master to HS mode when RESTART disabled- scenario not present
            case ABRT_HS_NORSTRT_ABRT_HS_NORSTRT_VOID = 0
            /// User trying to switch Master to HS mode when RESTART disabled
            case ABRT_HS_NORSTRT_ABRT_HS_NORSTRT_GENERATED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This field indicates that the Master has sent a START Byte and the START Byte was acknowledged (wrong behavior).
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Master
        public var ABRT_SBYTE_ACKDET: ABRT_SBYTE_ACKDET_Field {
            get {
                fatalError()
            }
        }

        public enum ABRT_SBYTE_ACKDET_Values: UInt, BitFieldProjectable {
            /// ACK detected for START byte- scenario not present
            case ABRT_SBYTE_ACKDET_ABRT_SBYTE_ACKDET_VOID = 0
            /// ACK detected for START byte
            case ABRT_SBYTE_ACKDET_ABRT_SBYTE_ACKDET_GENERATED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This field indicates that the Master is in High Speed mode and the High Speed Master code was acknowledged (wrong behavior).
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Master
        public var ABRT_HS_ACKDET: ABRT_HS_ACKDET_Field {
            get {
                fatalError()
            }
        }

        public enum ABRT_HS_ACKDET_Values: UInt, BitFieldProjectable {
            /// HS Master code ACKed in HS Mode- scenario not present
            case ABRT_HS_ACKDET_ABRT_HS_ACK_VOID = 0
            /// HS Master code ACKed in HS Mode
            case ABRT_HS_ACKDET_ABRT_HS_ACK_GENERATED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This field indicates that DW_apb_i2c in the master mode has sent a General Call but the user programmed the byte following the General Call to be a read from the bus (IC_DATA_CMD[9] is set to 1).
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Master-Transmitter
        public var ABRT_GCALL_READ: ABRT_GCALL_READ_Field {
            get {
                fatalError()
            }
        }

        public enum ABRT_GCALL_READ_Values: UInt, BitFieldProjectable {
            /// GCALL is followed by read from bus-scenario not present
            case ABRT_GCALL_READ_ABRT_GCALL_READ_VOID = 0
            /// GCALL is followed by read from bus
            case ABRT_GCALL_READ_ABRT_GCALL_READ_GENERATED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This field indicates that DW_apb_i2c in master mode has sent a General Call and no slave on the bus acknowledged the General Call.
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Master-Transmitter
        public var ABRT_GCALL_NOACK: ABRT_GCALL_NOACK_Field {
            get {
                fatalError()
            }
        }

        public enum ABRT_GCALL_NOACK_Values: UInt, BitFieldProjectable {
            /// GCALL not ACKed by any slave-scenario not present
            case ABRT_GCALL_NOACK_ABRT_GCALL_NOACK_VOID = 0
            /// GCALL not ACKed by any slave
            case ABRT_GCALL_NOACK_ABRT_GCALL_NOACK_GENERATED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This field indicates the master-mode only bit. When the master receives an acknowledgement for the address, but when it sends data byte(s) following the address, it did not receive an acknowledge from the remote slave(s).
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Master-Transmitter
        public var ABRT_TXDATA_NOACK: ABRT_TXDATA_NOACK_Field {
            get {
                fatalError()
            }
        }

        public enum ABRT_TXDATA_NOACK_Values: UInt, BitFieldProjectable {
            /// Transmitted data non-ACKed by addressed slave-scenario not present
            case ABRT_TXDATA_NOACK_ABRT_TXDATA_NOACK_VOID = 0
            /// Transmitted data not ACKed by addressed slave
            case ABRT_TXDATA_NOACK_ABRT_TXDATA_NOACK_GENERATED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This field indicates that the Master is in 10-bit address mode and that the second address byte of the 10-bit address was not acknowledged by any slave.
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Master-Transmitter or Master-Receiver
        public var ABRT_10ADDR2_NOACK: ABRT_10ADDR2_NOACK_Field {
            get {
                fatalError()
            }
        }

        public enum ABRT_10ADDR2_NOACK_Values: UInt, BitFieldProjectable {
            /// This abort is not generated
            case ABRT_10ADDR2_NOACK_INACTIVE = 0
            /// Byte 2 of 10Bit Address not ACKed by any slave
            case ABRT_10ADDR2_NOACK_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This field indicates that the Master is in 10-bit address mode and the first 10-bit address byte was not acknowledged by any slave.
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Master-Transmitter or Master-Receiver
        public var ABRT_10ADDR1_NOACK: ABRT_10ADDR1_NOACK_Field {
            get {
                fatalError()
            }
        }

        public enum ABRT_10ADDR1_NOACK_Values: UInt, BitFieldProjectable {
            /// This abort is not generated
            case ABRT_10ADDR1_NOACK_INACTIVE = 0
            /// Byte 1 of 10Bit Address not ACKed by any slave
            case ABRT_10ADDR1_NOACK_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// This field indicates that the Master is in 7-bit addressing mode and the address sent was not acknowledged by any slave.
        /// Reset value: 0x0
        /// Role of DW_apb_i2c:  Master-Transmitter or Master-Receiver
        public var ABRT_7B_ADDR_NOACK: ABRT_7B_ADDR_NOACK_Field {
            get {
                fatalError()
            }
        }

        public enum ABRT_7B_ADDR_NOACK_Values: UInt, BitFieldProjectable {
            /// This abort is not generated
            case ABRT_7B_ADDR_NOACK_INACTIVE = 0
            /// This abort is generated because of NOACK for 7-bit address
            case ABRT_7B_ADDR_NOACK_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum TX_FLUSH_CNT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 23 ..< 32
        }

        public enum ABRT_USER_ABRT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum ABRT_SLVRD_INTX_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum ABRT_SLV_ARBLOST_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum ABRT_SLVFLUSH_TXFIFO_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum ARB_LOST_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum ABRT_MASTER_DIS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum ABRT_10B_RD_NORSTRT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum ABRT_SBYTE_NORSTRT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum ABRT_HS_NORSTRT_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum ABRT_SBYTE_ACKDET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum ABRT_HS_ACKDET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum ABRT_GCALL_READ_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum ABRT_GCALL_NOACK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum ABRT_TXDATA_NOACK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum ABRT_10ADDR2_NOACK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum ABRT_10ADDR1_NOACK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum ABRT_7B_ADDR_NOACK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_TX_ABRT_SOURCE_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.Read) {
                self.storage = value.storage
                }

                  public  init(_ value: Value.Write) {
            self.storage = value.storage
              }
                public var TX_FLUSH_CNT: UInt32 {
                @inlinable @inline(__always) get {
                    TX_FLUSH_CNT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    TX_FLUSH_CNT_Field.insert(newValue, into: &self.storage)
                }
                }
              public var ABRT_USER_ABRT: UInt32 {
                @inlinable @inline(__always) get {
                  ABRT_USER_ABRT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ABRT_USER_ABRT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ABRT_SLVRD_INTX: UInt32 {
                @inlinable @inline(__always) get {
                  ABRT_SLVRD_INTX_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ABRT_SLVRD_INTX_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ABRT_SLV_ARBLOST: UInt32 {
                @inlinable @inline(__always) get {
                  ABRT_SLV_ARBLOST_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ABRT_SLV_ARBLOST_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ABRT_SLVFLUSH_TXFIFO: UInt32 {
                @inlinable @inline(__always) get {
                  ABRT_SLVFLUSH_TXFIFO_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ABRT_SLVFLUSH_TXFIFO_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ARB_LOST: UInt32 {
                @inlinable @inline(__always) get {
                  ARB_LOST_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ARB_LOST_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ABRT_MASTER_DIS: UInt32 {
                @inlinable @inline(__always) get {
                  ABRT_MASTER_DIS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ABRT_MASTER_DIS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ABRT_10B_RD_NORSTRT: UInt32 {
                @inlinable @inline(__always) get {
                  ABRT_10B_RD_NORSTRT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ABRT_10B_RD_NORSTRT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ABRT_SBYTE_NORSTRT: UInt32 {
                @inlinable @inline(__always) get {
                  ABRT_SBYTE_NORSTRT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ABRT_SBYTE_NORSTRT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ABRT_HS_NORSTRT: UInt32 {
                @inlinable @inline(__always) get {
                  ABRT_HS_NORSTRT_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ABRT_HS_NORSTRT_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ABRT_SBYTE_ACKDET: UInt32 {
                @inlinable @inline(__always) get {
                  ABRT_SBYTE_ACKDET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ABRT_SBYTE_ACKDET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ABRT_HS_ACKDET: UInt32 {
                @inlinable @inline(__always) get {
                  ABRT_HS_ACKDET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ABRT_HS_ACKDET_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ABRT_GCALL_READ: UInt32 {
                @inlinable @inline(__always) get {
                  ABRT_GCALL_READ_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ABRT_GCALL_READ_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ABRT_GCALL_NOACK: UInt32 {
                @inlinable @inline(__always) get {
                  ABRT_GCALL_NOACK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ABRT_GCALL_NOACK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ABRT_TXDATA_NOACK: UInt32 {
                @inlinable @inline(__always) get {
                  ABRT_TXDATA_NOACK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ABRT_TXDATA_NOACK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ABRT_10ADDR2_NOACK: UInt32 {
                @inlinable @inline(__always) get {
                  ABRT_10ADDR2_NOACK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ABRT_10ADDR2_NOACK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ABRT_10ADDR1_NOACK: UInt32 {
                @inlinable @inline(__always) get {
                  ABRT_10ADDR1_NOACK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ABRT_10ADDR1_NOACK_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ABRT_7B_ADDR_NOACK: UInt32 {
                @inlinable @inline(__always) get {
                  ABRT_7B_ADDR_NOACK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ABRT_7B_ADDR_NOACK_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = IC_TX_ABRT_SOURCE_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var TX_FLUSH_CNT: BitField9 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(TX_FLUSH_CNT_Field.self, BitField9.self)
                    return BitField9(storage: self.raw.TX_FLUSH_CNT)
                }
                }
              public var ABRT_USER_ABRT: ABRT_USER_ABRT_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ABRT_USER_ABRT_Field.self, ABRT_USER_ABRT_Values.self)
                  return ABRT_USER_ABRT_Values(storage: self.raw.ABRT_USER_ABRT)
                }
              }
              public var ABRT_SLVRD_INTX: ABRT_SLVRD_INTX_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ABRT_SLVRD_INTX_Field.self, ABRT_SLVRD_INTX_Values.self)
                  return ABRT_SLVRD_INTX_Values(storage: self.raw.ABRT_SLVRD_INTX)
                }
              }
              public var ABRT_SLV_ARBLOST: ABRT_SLV_ARBLOST_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ABRT_SLV_ARBLOST_Field.self, ABRT_SLV_ARBLOST_Values.self)
                  return ABRT_SLV_ARBLOST_Values(storage: self.raw.ABRT_SLV_ARBLOST)
                }
              }
              public var ABRT_SLVFLUSH_TXFIFO: ABRT_SLVFLUSH_TXFIFO_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ABRT_SLVFLUSH_TXFIFO_Field.self, ABRT_SLVFLUSH_TXFIFO_Values.self)
                  return ABRT_SLVFLUSH_TXFIFO_Values(storage: self.raw.ABRT_SLVFLUSH_TXFIFO)
                }
              }
              public var ARB_LOST: ARB_LOST_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ARB_LOST_Field.self, ARB_LOST_Values.self)
                  return ARB_LOST_Values(storage: self.raw.ARB_LOST)
                }
              }
              public var ABRT_MASTER_DIS: ABRT_MASTER_DIS_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ABRT_MASTER_DIS_Field.self, ABRT_MASTER_DIS_Values.self)
                  return ABRT_MASTER_DIS_Values(storage: self.raw.ABRT_MASTER_DIS)
                }
              }
              public var ABRT_10B_RD_NORSTRT: ABRT_10B_RD_NORSTRT_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ABRT_10B_RD_NORSTRT_Field.self, ABRT_10B_RD_NORSTRT_Values.self)
                  return ABRT_10B_RD_NORSTRT_Values(storage: self.raw.ABRT_10B_RD_NORSTRT)
                }
              }
              public var ABRT_SBYTE_NORSTRT: ABRT_SBYTE_NORSTRT_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ABRT_SBYTE_NORSTRT_Field.self, ABRT_SBYTE_NORSTRT_Values.self)
                  return ABRT_SBYTE_NORSTRT_Values(storage: self.raw.ABRT_SBYTE_NORSTRT)
                }
              }
              public var ABRT_HS_NORSTRT: ABRT_HS_NORSTRT_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ABRT_HS_NORSTRT_Field.self, ABRT_HS_NORSTRT_Values.self)
                  return ABRT_HS_NORSTRT_Values(storage: self.raw.ABRT_HS_NORSTRT)
                }
              }
              public var ABRT_SBYTE_ACKDET: ABRT_SBYTE_ACKDET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ABRT_SBYTE_ACKDET_Field.self, ABRT_SBYTE_ACKDET_Values.self)
                  return ABRT_SBYTE_ACKDET_Values(storage: self.raw.ABRT_SBYTE_ACKDET)
                }
              }
              public var ABRT_HS_ACKDET: ABRT_HS_ACKDET_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ABRT_HS_ACKDET_Field.self, ABRT_HS_ACKDET_Values.self)
                  return ABRT_HS_ACKDET_Values(storage: self.raw.ABRT_HS_ACKDET)
                }
              }
              public var ABRT_GCALL_READ: ABRT_GCALL_READ_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ABRT_GCALL_READ_Field.self, ABRT_GCALL_READ_Values.self)
                  return ABRT_GCALL_READ_Values(storage: self.raw.ABRT_GCALL_READ)
                }
              }
              public var ABRT_GCALL_NOACK: ABRT_GCALL_NOACK_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ABRT_GCALL_NOACK_Field.self, ABRT_GCALL_NOACK_Values.self)
                  return ABRT_GCALL_NOACK_Values(storage: self.raw.ABRT_GCALL_NOACK)
                }
              }
              public var ABRT_TXDATA_NOACK: ABRT_TXDATA_NOACK_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ABRT_TXDATA_NOACK_Field.self, ABRT_TXDATA_NOACK_Values.self)
                  return ABRT_TXDATA_NOACK_Values(storage: self.raw.ABRT_TXDATA_NOACK)
                }
              }
              public var ABRT_10ADDR2_NOACK: ABRT_10ADDR2_NOACK_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ABRT_10ADDR2_NOACK_Field.self, ABRT_10ADDR2_NOACK_Values.self)
                  return ABRT_10ADDR2_NOACK_Values(storage: self.raw.ABRT_10ADDR2_NOACK)
                }
              }
              public var ABRT_10ADDR1_NOACK: ABRT_10ADDR1_NOACK_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ABRT_10ADDR1_NOACK_Field.self, ABRT_10ADDR1_NOACK_Values.self)
                  return ABRT_10ADDR1_NOACK_Values(storage: self.raw.ABRT_10ADDR1_NOACK)
                }
              }
              public var ABRT_7B_ADDR_NOACK: ABRT_7B_ADDR_NOACK_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ABRT_7B_ADDR_NOACK_Field.self, ABRT_7B_ADDR_NOACK_Values.self)
                  return ABRT_7B_ADDR_NOACK_Values(storage: self.raw.ABRT_7B_ADDR_NOACK)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = IC_TX_ABRT_SOURCE_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }

        }
    }

    /// Generate Slave Data NACK Register
    /// The register is used to generate a NACK for the data part of a transfer when DW_apb_i2c is acting as a slave-receiver. This register only exists when the IC_SLV_DATA_NACK_ONLY parameter is set to 1. When this parameter disabled, this register does not exist and writing to the register's address has no effect.
    /// A write can occur on this register if both of the following conditions are met: - DW_apb_i2c is disabled (IC_ENABLE[0] = 0) - Slave part is inactive (IC_STATUS[6] = 0) Note: The IC_STATUS[6] is a register read-back location for the internal slv_activity signal; the user should poll this before writing the ic_slv_data_nack_only bit.
    public var IC_SLV_DATA_NACK_ONLY: Register<IC_SLV_DATA_NACK_ONLY_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0084), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0084))
          #endif
        }
    }
    public struct IC_SLV_DATA_NACK_ONLY_Descriptor {
        @available(*, unavailable)
        /// Generate NACK. This NACK generation only occurs when DW_apb_i2c is a slave-receiver. If this register is set to a value of 1, it can only generate a NACK after a data byte is received; hence, the data transfer is aborted and the data received is not pushed to the receive buffer.
        /// When the register is set to a value of 0, it generates NACK/ACK, depending on normal criteria. - 1: generate NACK after data byte received - 0: generate NACK/ACK normally Reset value: 0x0
        public var NACK: NACK_Field {
            get {
                fatalError()
            }
        }

        public enum NACK_Values: UInt, BitFieldProjectable {
            /// Slave receiver generates NACK normally
            case NACK_DISABLED = 0
            /// Slave receiver generates NACK upon data reception only
            case NACK_ENABLED = 1

            public static var bitWidth: Int { 1 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum NACK_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_SLV_DATA_NACK_ONLY_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var NACK: UInt32 {
                @inlinable @inline(__always) get {
                    NACK_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    NACK_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = IC_SLV_DATA_NACK_ONLY_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var NACK: NACK_Values {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(NACK_Field.self, NACK_Values.self)
                    return NACK_Values(storage: self.raw.NACK)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(NACK_Field.self, NACK_Values.self)
                    self.raw.NACK = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// DMA Control Register
    /// The register is used to enable the DMA Controller interface operation. There is a separate bit for transmit and receive. This can be programmed regardless of the state of IC_ENABLE.
    public var IC_DMA_CR: Register<IC_DMA_CR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0088), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0088))
          #endif
        }
    }
    public struct IC_DMA_CR_Descriptor {
        @available(*, unavailable)
        /// Transmit DMA Enable. This bit enables/disables the transmit FIFO DMA channel. Reset value: 0x0
        public var TDMAE: TDMAE_Field {
            get {
                fatalError()
            }
        }

        public enum TDMAE_Values: UInt, BitFieldProjectable {
            /// transmit FIFO DMA channel disabled
            case TDMAE_DISABLED = 0
            /// Transmit FIFO DMA channel enabled
            case TDMAE_ENABLED = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// Receive DMA Enable. This bit enables/disables the receive FIFO DMA channel. Reset value: 0x0
        public var RDMAE: RDMAE_Field {
            get {
                fatalError()
            }
        }

        public enum RDMAE_Values: UInt, BitFieldProjectable {
            /// Receive FIFO DMA channel disabled
            case RDMAE_DISABLED = 0
            /// Receive FIFO DMA channel enabled
            case RDMAE_ENABLED = 1

            public static var bitWidth: Int { 1 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum TDMAE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum RDMAE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_DMA_CR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var TDMAE: UInt32 {
                @inlinable @inline(__always) get {
                    TDMAE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    TDMAE_Field.insert(newValue, into: &self.storage)
                }
                }
              public var RDMAE: UInt32 {
                @inlinable @inline(__always) get {
                  RDMAE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RDMAE_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = IC_DMA_CR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var TDMAE: TDMAE_Values {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(TDMAE_Field.self, TDMAE_Values.self)
                    return TDMAE_Values(storage: self.raw.TDMAE)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(TDMAE_Field.self, TDMAE_Values.self)
                    self.raw.TDMAE = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var RDMAE: RDMAE_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RDMAE_Field.self, RDMAE_Values.self)
                  return RDMAE_Values(storage: self.raw.RDMAE)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(RDMAE_Field.self, RDMAE_Values.self)
                  self.raw.RDMAE = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// DMA Transmit Data Level Register
    public var IC_DMA_TDLR: Register<IC_DMA_TDLR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x008c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x008c))
          #endif
        }
    }
    public struct IC_DMA_TDLR_Descriptor {
        @available(*, unavailable)
        /// Transmit Data Level. This bit field controls the level at which a DMA request is made by the transmit logic. It is equal to the watermark level; that is, the dma_tx_req signal is generated when the number of valid data entries in the transmit FIFO is equal to or below this field value, and TDMAE = 1.
        /// Reset value: 0x0
        public var DMATDL: DMATDL_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum DMATDL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 4
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_DMA_TDLR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var DMATDL: UInt32 {
                @inlinable @inline(__always) get {
                    DMATDL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    DMATDL_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = IC_DMA_TDLR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var DMATDL: BitField4 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(DMATDL_Field.self, BitField4.self)
                    return BitField4(storage: self.raw.DMATDL)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(DMATDL_Field.self, BitField4.self)
                    self.raw.DMATDL = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// I2C Receive Data Level Register
    public var IC_DMA_RDLR: Register<IC_DMA_RDLR_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0090), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0090))
          #endif
        }
    }
    public struct IC_DMA_RDLR_Descriptor {
        @available(*, unavailable)
        /// Receive Data Level. This bit field controls the level at which a DMA request is made by the receive logic. The watermark level = DMARDL+1; that is, dma_rx_req is generated when the number of valid data entries in the receive FIFO is equal to or more than this field value + 1, and RDMAE =1. For instance, when DMARDL is 0, then dma_rx_req is asserted when 1 or more data entries are present in the receive FIFO.
        /// Reset value: 0x0
        public var DMARDL: DMARDL_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum DMARDL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 4
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_DMA_RDLR_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var DMARDL: UInt32 {
                @inlinable @inline(__always) get {
                    DMARDL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    DMARDL_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = IC_DMA_RDLR_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var DMARDL: BitField4 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(DMARDL_Field.self, BitField4.self)
                    return BitField4(storage: self.raw.DMARDL)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(DMARDL_Field.self, BitField4.self)
                    self.raw.DMARDL = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// I2C SDA Setup Register
    /// This register controls the amount of time delay (in terms of number of ic_clk clock periods) introduced in the rising edge of SCL - relative to SDA changing - when DW_apb_i2c services a read request in a slave-transmitter operation. The relevant I2C requirement is tSU:DAT (note 4) as detailed in the I2C Bus Specification. This register must be programmed with a value equal to or greater than 2.
    /// Writes to this register succeed only when IC_ENABLE[0] = 0.
    /// Note: The length of setup time is calculated using [(IC_SDA_SETUP - 1) * (ic_clk_period)], so if the user requires 10 ic_clk periods of setup time, they should program a value of 11. The IC_SDA_SETUP register is only used by the DW_apb_i2c when operating as a slave transmitter.
    public var IC_SDA_SETUP: Register<IC_SDA_SETUP_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0094), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0094))
          #endif
        }
    }
    public struct IC_SDA_SETUP_Descriptor {
        @available(*, unavailable)
        /// SDA Setup. It is recommended that if the required delay is 1000ns, then for an ic_clk frequency of 10 MHz, IC_SDA_SETUP should be programmed to a value of 11. IC_SDA_SETUP must be programmed with a minimum value of 2.
        public var SDA_SETUP: SDA_SETUP_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SDA_SETUP_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_SDA_SETUP_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var SDA_SETUP: UInt32 {
                @inlinable @inline(__always) get {
                    SDA_SETUP_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SDA_SETUP_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = IC_SDA_SETUP_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var SDA_SETUP: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SDA_SETUP_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.SDA_SETUP)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(SDA_SETUP_Field.self, BitField8.self)
                    self.raw.SDA_SETUP = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// I2C ACK General Call Register
    /// The register controls whether DW_apb_i2c responds with a ACK or NACK when it receives an I2C General Call address.
    /// This register is applicable only when the DW_apb_i2c is in slave mode.
    public var IC_ACK_GENERAL_CALL: Register<IC_ACK_GENERAL_CALL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0098), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0098))
          #endif
        }
    }
    public struct IC_ACK_GENERAL_CALL_Descriptor {
        @available(*, unavailable)
        /// ACK General Call. When set to 1, DW_apb_i2c responds with a ACK (by asserting ic_data_oe) when it receives a General Call. Otherwise, DW_apb_i2c responds with a NACK (by negating ic_data_oe).
        public var ACK_GEN_CALL: ACK_GEN_CALL_Field {
            get {
                fatalError()
            }
        }

        public enum ACK_GEN_CALL_Values: UInt, BitFieldProjectable {
            /// Generate NACK for a General Call
            case ACK_GEN_CALL_DISABLED = 0
            /// Generate ACK for a General Call
            case ACK_GEN_CALL_ENABLED = 1

            public static var bitWidth: Int { 1 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum ACK_GEN_CALL_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_ACK_GENERAL_CALL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var ACK_GEN_CALL: UInt32 {
                @inlinable @inline(__always) get {
                    ACK_GEN_CALL_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    ACK_GEN_CALL_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = IC_ACK_GENERAL_CALL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var ACK_GEN_CALL: ACK_GEN_CALL_Values {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(ACK_GEN_CALL_Field.self, ACK_GEN_CALL_Values.self)
                    return ACK_GEN_CALL_Values(storage: self.raw.ACK_GEN_CALL)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(ACK_GEN_CALL_Field.self, ACK_GEN_CALL_Values.self)
                    self.raw.ACK_GEN_CALL = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// I2C Enable Status Register
    /// The register is used to report the DW_apb_i2c hardware status when the IC_ENABLE[0] register is set from 1 to 0; that is, when DW_apb_i2c is disabled.
    /// If IC_ENABLE[0] has been set to 1, bits 2:1 are forced to 0, and bit 0 is forced to 1.
    /// If IC_ENABLE[0] has been set to 0, bits 2:1 is only be valid as soon as bit 0 is read as '0'.
    /// Note: When IC_ENABLE[0] has been set to 0, a delay occurs for bit 0 to be read as 0 because disabling the DW_apb_i2c depends on I2C bus activities.
    public var IC_ENABLE_STATUS: Register<IC_ENABLE_STATUS_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x009c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x009c))
          #endif
        }
    }
    public struct IC_ENABLE_STATUS_Descriptor {
        @available(*, unavailable)
        /// Slave Received Data Lost. This bit indicates if a Slave-Receiver operation has been aborted with at least one data byte received from an I2C transfer due to the setting bit 0 of IC_ENABLE from 1 to 0. When read as 1, DW_apb_i2c is deemed to have been actively engaged in an aborted I2C transfer (with matching address) and the data phase of the I2C transfer has been entered, even though a data byte has been responded with a NACK.
        /// Note:  If the remote I2C master terminates the transfer with a STOP condition before the DW_apb_i2c has a chance to NACK a transfer, and IC_ENABLE[0] has been set to 0, then this bit is also set to 1.
        /// When read as 0, DW_apb_i2c is deemed to have been disabled without being actively involved in the data phase of a Slave-Receiver transfer.
        /// Note:  The CPU can safely read this bit when IC_EN (bit 0) is read as 0.
        /// Reset value: 0x0
        public var SLV_RX_DATA_LOST: SLV_RX_DATA_LOST_Field {
            get {
                fatalError()
            }
        }

        public enum SLV_RX_DATA_LOST_Values: UInt, BitFieldProjectable {
            /// Slave RX Data is not lost
            case SLV_RX_DATA_LOST_INACTIVE = 0
            /// Slave RX Data is lost
            case SLV_RX_DATA_LOST_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// Slave Disabled While Busy (Transmit, Receive). This bit indicates if a potential or active Slave operation has been aborted due to the setting bit 0 of the IC_ENABLE register from 1 to 0. This bit is set when the CPU writes a 0 to the IC_ENABLE register while:
        /// (a) DW_apb_i2c is receiving the address byte of the Slave-Transmitter operation from a remote master;
        /// OR,
        /// (b) address and data bytes of the Slave-Receiver operation from a remote master.
        /// When read as 1, DW_apb_i2c is deemed to have forced a NACK during any part of an I2C transfer, irrespective of whether the I2C address matches the slave address set in DW_apb_i2c (IC_SAR register) OR if the transfer is completed before IC_ENABLE is set to 0 but has not taken effect.
        /// Note:  If the remote I2C master terminates the transfer with a STOP condition before the DW_apb_i2c has a chance to NACK a transfer, and IC_ENABLE[0] has been set to 0, then this bit will also be set to 1.
        /// When read as 0, DW_apb_i2c is deemed to have been disabled when there is master activity, or when the I2C bus is idle.
        /// Note:  The CPU can safely read this bit when IC_EN (bit 0) is read as 0.
        /// Reset value: 0x0
        public var SLV_DISABLED_WHILE_BUSY: SLV_DISABLED_WHILE_BUSY_Field {
            get {
                fatalError()
            }
        }

        public enum SLV_DISABLED_WHILE_BUSY_Values: UInt, BitFieldProjectable {
            /// Slave is disabled when it is idle
            case SLV_DISABLED_WHILE_BUSY_INACTIVE = 0
            /// Slave is disabled when it is active
            case SLV_DISABLED_WHILE_BUSY_ACTIVE = 1

            public static var bitWidth: Int { 1 }
        }
        @available(*, unavailable)

        /// ic_en Status. This bit always reflects the value driven on the output port ic_en. - When read as 1, DW_apb_i2c is deemed to be in an enabled state. - When read as 0, DW_apb_i2c is deemed completely inactive. Note:  The CPU can safely read this bit anytime. When this bit is read as 0, the CPU can safely read SLV_RX_DATA_LOST (bit 2) and SLV_DISABLED_WHILE_BUSY (bit 1).
        /// Reset value: 0x0
        public var IC_EN: IC_EN_Field {
            get {
                fatalError()
            }
        }

        public enum IC_EN_Values: UInt, BitFieldProjectable {
            /// I2C disabled
            case IC_EN_DISABLED = 0
            /// I2C enabled
            case IC_EN_ENABLED = 1

            public static var bitWidth: Int { 1 }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum SLV_RX_DATA_LOST_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum SLV_DISABLED_WHILE_BUSY_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum IC_EN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_ENABLE_STATUS_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.Read) {
                self.storage = value.storage
                }

                  public  init(_ value: Value.Write) {
            self.storage = value.storage
              }
                public var SLV_RX_DATA_LOST: UInt32 {
                @inlinable @inline(__always) get {
                    SLV_RX_DATA_LOST_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    SLV_RX_DATA_LOST_Field.insert(newValue, into: &self.storage)
                }
                }
              public var SLV_DISABLED_WHILE_BUSY: UInt32 {
                @inlinable @inline(__always) get {
                  SLV_DISABLED_WHILE_BUSY_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  SLV_DISABLED_WHILE_BUSY_Field.insert(newValue, into: &self.storage)
                }
              }
              public var IC_EN: UInt32 {
                @inlinable @inline(__always) get {
                  IC_EN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  IC_EN_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = IC_ENABLE_STATUS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var SLV_RX_DATA_LOST: SLV_RX_DATA_LOST_Values {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(SLV_RX_DATA_LOST_Field.self, SLV_RX_DATA_LOST_Values.self)
                    return SLV_RX_DATA_LOST_Values(storage: self.raw.SLV_RX_DATA_LOST)
                }
                }
              public var SLV_DISABLED_WHILE_BUSY: SLV_DISABLED_WHILE_BUSY_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(SLV_DISABLED_WHILE_BUSY_Field.self, SLV_DISABLED_WHILE_BUSY_Values.self)
                  return SLV_DISABLED_WHILE_BUSY_Values(storage: self.raw.SLV_DISABLED_WHILE_BUSY)
                }
              }
              public var IC_EN: IC_EN_Values {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(IC_EN_Field.self, IC_EN_Values.self)
                  return IC_EN_Values(storage: self.raw.IC_EN)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = IC_ENABLE_STATUS_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }

        }
    }

    /// I2C SS, FS or FM+ spike suppression limit
    /// This register is used to store the duration, measured in ic_clk cycles, of the longest spike that is filtered out by the spike suppression logic when the component is operating in SS, FS or FM+ modes. The relevant I2C requirement is tSP (table 4) as detailed in the I2C Bus Specification. This register must be programmed with a minimum value of 1.
    public var IC_FS_SPKLEN: Register<IC_FS_SPKLEN_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00a0), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00a0))
          #endif
        }
    }
    public struct IC_FS_SPKLEN_Descriptor {
        @available(*, unavailable)
        /// This register must be set before any I2C bus transaction can take place to ensure stable operation. This register sets the duration, measured in ic_clk cycles, of the longest spike in the SCL or SDA lines that will be filtered out by the spike suppression logic. This register can be written only when the I2C interface is disabled which corresponds to the IC_ENABLE[0] register being set to 0. Writes at other times have no effect. The minimum valid value is 1; hardware prevents values less than this being written, and if attempted results in 1 being set. or more information, refer to 'Spike Suppression'.
        public var IC_FS_SPKLEN: IC_FS_SPKLEN_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IC_FS_SPKLEN_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 8
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_FS_SPKLEN_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var IC_FS_SPKLEN: UInt32 {
                @inlinable @inline(__always) get {
                    IC_FS_SPKLEN_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IC_FS_SPKLEN_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = IC_FS_SPKLEN_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var IC_FS_SPKLEN: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IC_FS_SPKLEN_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.IC_FS_SPKLEN)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(IC_FS_SPKLEN_Field.self, BitField8.self)
                    self.raw.IC_FS_SPKLEN = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
        }
    }

    /// Clear RESTART_DET Interrupt Register
    public var IC_CLR_RESTART_DET: Register<IC_CLR_RESTART_DET_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00a8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00a8))
          #endif
        }
    }
    public struct IC_CLR_RESTART_DET_Descriptor {
        @available(*, unavailable)
        /// Read this register to clear the RESTART_DET interrupt (bit 12) of IC_RAW_INTR_STAT register.
        /// Reset value: 0x0
        public var CLR_RESTART_DET: CLR_RESTART_DET_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum CLR_RESTART_DET_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_CLR_RESTART_DET_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.Read) {
                self.storage = value.storage
                }

                  public  init(_ value: Value.Write) {
            self.storage = value.storage
              }
                public var CLR_RESTART_DET: UInt32 {
                @inlinable @inline(__always) get {
                    CLR_RESTART_DET_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    CLR_RESTART_DET_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = IC_CLR_RESTART_DET_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var CLR_RESTART_DET: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(CLR_RESTART_DET_Field.self, Bool.self)
                    return Bool(storage: self.raw.CLR_RESTART_DET)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = IC_CLR_RESTART_DET_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }

        }
    }

    /// Component Parameter Register 1
    /// Note This register is not implemented and therefore reads as 0. If it was implemented it would be a constant read-only register that contains encoded information about the component's parameter settings. Fields shown below are the settings for those parameters
    public var IC_COMP_PARAM_1: Register<IC_COMP_PARAM_1_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00f4), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00f4))
          #endif
        }
    }
    public struct IC_COMP_PARAM_1_Descriptor {
        @available(*, unavailable)
        /// TX Buffer Depth = 16
        public var TX_BUFFER_DEPTH: TX_BUFFER_DEPTH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// RX Buffer Depth = 16
        public var RX_BUFFER_DEPTH: RX_BUFFER_DEPTH_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Encoded parameters not visible
        public var ADD_ENCODED_PARAMS: ADD_ENCODED_PARAMS_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// DMA handshaking signals are enabled
        public var HAS_DMA: HAS_DMA_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// COMBINED Interrupt outputs
        public var INTR_IO: INTR_IO_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// Programmable count values for each mode.
        public var HC_COUNT_VALUES: HC_COUNT_VALUES_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// MAX SPEED MODE = FAST MODE
        public var MAX_SPEED_MODE: MAX_SPEED_MODE_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)

        /// APB data bus width is 32 bits
        public var APB_DATA_WIDTH: APB_DATA_WIDTH_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum TX_BUFFER_DEPTH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 24
        }

        public enum RX_BUFFER_DEPTH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 16
        }

        public enum ADD_ENCODED_PARAMS_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum HAS_DMA_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum INTR_IO_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum HC_COUNT_VALUES_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum MAX_SPEED_MODE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 4
        }

        public enum APB_DATA_WIDTH_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 2
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_COMP_PARAM_1_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.Read) {
                self.storage = value.storage
                }

                  public  init(_ value: Value.Write) {
            self.storage = value.storage
              }
                public var TX_BUFFER_DEPTH: UInt32 {
                @inlinable @inline(__always) get {
                    TX_BUFFER_DEPTH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    TX_BUFFER_DEPTH_Field.insert(newValue, into: &self.storage)
                }
                }
              public var RX_BUFFER_DEPTH: UInt32 {
                @inlinable @inline(__always) get {
                  RX_BUFFER_DEPTH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  RX_BUFFER_DEPTH_Field.insert(newValue, into: &self.storage)
                }
              }
              public var ADD_ENCODED_PARAMS: UInt32 {
                @inlinable @inline(__always) get {
                  ADD_ENCODED_PARAMS_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  ADD_ENCODED_PARAMS_Field.insert(newValue, into: &self.storage)
                }
              }
              public var HAS_DMA: UInt32 {
                @inlinable @inline(__always) get {
                  HAS_DMA_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HAS_DMA_Field.insert(newValue, into: &self.storage)
                }
              }
              public var INTR_IO: UInt32 {
                @inlinable @inline(__always) get {
                  INTR_IO_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  INTR_IO_Field.insert(newValue, into: &self.storage)
                }
              }
              public var HC_COUNT_VALUES: UInt32 {
                @inlinable @inline(__always) get {
                  HC_COUNT_VALUES_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  HC_COUNT_VALUES_Field.insert(newValue, into: &self.storage)
                }
              }
              public var MAX_SPEED_MODE: UInt32 {
                @inlinable @inline(__always) get {
                  MAX_SPEED_MODE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  MAX_SPEED_MODE_Field.insert(newValue, into: &self.storage)
                }
              }
              public var APB_DATA_WIDTH: UInt32 {
                @inlinable @inline(__always) get {
                  APB_DATA_WIDTH_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  APB_DATA_WIDTH_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = IC_COMP_PARAM_1_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var TX_BUFFER_DEPTH: BitField8 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(TX_BUFFER_DEPTH_Field.self, BitField8.self)
                    return BitField8(storage: self.raw.TX_BUFFER_DEPTH)
                }
                }
              public var RX_BUFFER_DEPTH: BitField8 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(RX_BUFFER_DEPTH_Field.self, BitField8.self)
                  return BitField8(storage: self.raw.RX_BUFFER_DEPTH)
                }
              }
              public var ADD_ENCODED_PARAMS: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(ADD_ENCODED_PARAMS_Field.self, Bool.self)
                  return Bool(storage: self.raw.ADD_ENCODED_PARAMS)
                }
              }
              public var HAS_DMA: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HAS_DMA_Field.self, Bool.self)
                  return Bool(storage: self.raw.HAS_DMA)
                }
              }
              public var INTR_IO: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(INTR_IO_Field.self, Bool.self)
                  return Bool(storage: self.raw.INTR_IO)
                }
              }
              public var HC_COUNT_VALUES: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(HC_COUNT_VALUES_Field.self, Bool.self)
                  return Bool(storage: self.raw.HC_COUNT_VALUES)
                }
              }
              public var MAX_SPEED_MODE: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(MAX_SPEED_MODE_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.MAX_SPEED_MODE)
                }
              }
              public var APB_DATA_WIDTH: BitField2 {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(APB_DATA_WIDTH_Field.self, BitField2.self)
                  return BitField2(storage: self.raw.APB_DATA_WIDTH)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = IC_COMP_PARAM_1_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }

        }
    }

    /// I2C Component Version Register
    public var IC_COMP_VERSION: Register<IC_COMP_VERSION_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00f8), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00f8))
          #endif
        }
    }
    public struct IC_COMP_VERSION_Descriptor {
        @available(*, unavailable)
        public var IC_COMP_VERSION: IC_COMP_VERSION_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IC_COMP_VERSION_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 32
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_COMP_VERSION_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.Read) {
                self.storage = value.storage
                }

                  public  init(_ value: Value.Write) {
            self.storage = value.storage
              }
                public var IC_COMP_VERSION: UInt32 {
                @inlinable @inline(__always) get {
                    IC_COMP_VERSION_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IC_COMP_VERSION_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = IC_COMP_VERSION_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var IC_COMP_VERSION: BitField32 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IC_COMP_VERSION_Field.self, BitField32.self)
                    return BitField32(storage: self.raw.IC_COMP_VERSION)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = IC_COMP_VERSION_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }

        }
    }

    /// I2C Component Type Register
    public var IC_COMP_TYPE: Register<IC_COMP_TYPE_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x00fc), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x00fc))
          #endif
        }
    }
    public struct IC_COMP_TYPE_Descriptor {
        @available(*, unavailable)
        /// Designware Component Type number = 0x44_57_01_40. This assigned unique hex value is constant and is derived from the two ASCII letters 'DW' followed by a 16-bit unsigned number.
        public var IC_COMP_TYPE: IC_COMP_TYPE_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum IC_COMP_TYPE_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 32
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = IC_COMP_TYPE_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.Read) {
                self.storage = value.storage
                }

                  public  init(_ value: Value.Write) {
            self.storage = value.storage
              }
                public var IC_COMP_TYPE: UInt32 {
                @inlinable @inline(__always) get {
                    IC_COMP_TYPE_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    IC_COMP_TYPE_Field.insert(newValue, into: &self.storage)
                }
                }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = IC_COMP_TYPE_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var IC_COMP_TYPE: BitField32 {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(IC_COMP_TYPE_Field.self, BitField32.self)
                    return BitField32(storage: self.raw.IC_COMP_TYPE)
                }
                }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = IC_COMP_TYPE_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }

                    public  init(_ value: Read) {
                // FIXME: mask off bits
                self.storage = value.storage
                }

        }
    }

    public  let unsafeAddress: UInt

    #if FEATURE_INTERPOSABLE
    var interposer: (any MMIOInterposer)?
    #endif

    #if FEATURE_INTERPOSABLE
    @inlinable @inline(__always)
    public init(unsafeAddress: UInt, interposer: (any MMIOInterposer)?) {
      self.unsafeAddress = unsafeAddress
      self.interposer = interposer
    }
    #else
    @inlinable @inline(__always)
    public init(unsafeAddress: UInt) {
      self.unsafeAddress = unsafeAddress
    }
    #endif
}

extension I2C0.IC_CON_Descriptor: RegisterValue {
}

extension I2C0.IC_TAR_Descriptor: RegisterValue {
}

extension I2C0.IC_SAR_Descriptor: RegisterValue {
}

extension I2C0.IC_DATA_CMD_Descriptor: RegisterValue {
}

extension I2C0.IC_SS_SCL_HCNT_Descriptor: RegisterValue {
}

extension I2C0.IC_SS_SCL_LCNT_Descriptor: RegisterValue {
}

extension I2C0.IC_FS_SCL_HCNT_Descriptor: RegisterValue {
}

extension I2C0.IC_FS_SCL_LCNT_Descriptor: RegisterValue {
}

extension I2C0.IC_INTR_STAT_Descriptor: RegisterValue {
}

extension I2C0.IC_INTR_MASK_Descriptor: RegisterValue {
}

extension I2C0.IC_RAW_INTR_STAT_Descriptor: RegisterValue {
}

extension I2C0.IC_RX_TL_Descriptor: RegisterValue {
}

extension I2C0.IC_TX_TL_Descriptor: RegisterValue {
}

extension I2C0.IC_CLR_INTR_Descriptor: RegisterValue {
}

extension I2C0.IC_CLR_RX_UNDER_Descriptor: RegisterValue {
}

extension I2C0.IC_CLR_RX_OVER_Descriptor: RegisterValue {
}

extension I2C0.IC_CLR_TX_OVER_Descriptor: RegisterValue {
}

extension I2C0.IC_CLR_RD_REQ_Descriptor: RegisterValue {
}

extension I2C0.IC_CLR_TX_ABRT_Descriptor: RegisterValue {
}

extension I2C0.IC_CLR_RX_DONE_Descriptor: RegisterValue {
}

extension I2C0.IC_CLR_ACTIVITY_Descriptor: RegisterValue {
}

extension I2C0.IC_CLR_STOP_DET_Descriptor: RegisterValue {
}

extension I2C0.IC_CLR_START_DET_Descriptor: RegisterValue {
}

extension I2C0.IC_CLR_GEN_CALL_Descriptor: RegisterValue {
}

extension I2C0.IC_ENABLE_Descriptor: RegisterValue {
}

extension I2C0.IC_STATUS_Descriptor: RegisterValue {
}

extension I2C0.IC_TXFLR_Descriptor: RegisterValue {
}

extension I2C0.IC_RXFLR_Descriptor: RegisterValue {
}

extension I2C0.IC_SDA_HOLD_Descriptor: RegisterValue {
}

extension I2C0.IC_TX_ABRT_SOURCE_Descriptor: RegisterValue {
}

extension I2C0.IC_SLV_DATA_NACK_ONLY_Descriptor: RegisterValue {
}

extension I2C0.IC_DMA_CR_Descriptor: RegisterValue {
}

extension I2C0.IC_DMA_TDLR_Descriptor: RegisterValue {
}

extension I2C0.IC_DMA_RDLR_Descriptor: RegisterValue {
}

extension I2C0.IC_SDA_SETUP_Descriptor: RegisterValue {
}

extension I2C0.IC_ACK_GENERAL_CALL_Descriptor: RegisterValue {
}

extension I2C0.IC_ENABLE_STATUS_Descriptor: RegisterValue {
}

extension I2C0.IC_FS_SPKLEN_Descriptor: RegisterValue {
}

extension I2C0.IC_CLR_RESTART_DET_Descriptor: RegisterValue {
}

extension I2C0.IC_COMP_PARAM_1_Descriptor: RegisterValue {
}

extension I2C0.IC_COMP_VERSION_Descriptor: RegisterValue {
}

extension I2C0.IC_COMP_TYPE_Descriptor: RegisterValue {
}
