import MMIO
import MMIOExtensions
public struct PSM {

    public static var `default`: Self { .init(unsafeAddress: 0x40010000) }

    /// Force block out of reset (i.e. power it on)
    public var FRCE_ON: Register<FRCE_ON_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0000), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0000))
          #endif
        }
    }
    public struct FRCE_ON_Descriptor {
        @available(*, unavailable)
        public var proc1: proc1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var proc0: proc0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var sio: sio_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var vreg_and_chip_reset: vreg_and_chip_reset_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var xip: xip_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var sram5: sram5_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var sram4: sram4_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var sram3: sram3_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var sram2: sram2_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var sram1: sram1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var sram0: sram0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var rom: rom_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var busfabric: busfabric_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var resets: resets_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clocks: clocks_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var xosc: xosc_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var rosc: rosc_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum proc1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum proc0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum sio_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum vreg_and_chip_reset_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum xip_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum sram5_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum sram4_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum sram3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum sram2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum sram1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum sram0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum rom_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum busfabric_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum resets_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum clocks_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum xosc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum rosc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = FRCE_ON_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var proc1: UInt32 {
                @inlinable @inline(__always) get {
                    proc1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    proc1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var proc0: UInt32 {
                @inlinable @inline(__always) get {
                  proc0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  proc0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var sio: UInt32 {
                @inlinable @inline(__always) get {
                  sio_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  sio_Field.insert(newValue, into: &self.storage)
                }
              }
              public var vreg_and_chip_reset: UInt32 {
                @inlinable @inline(__always) get {
                  vreg_and_chip_reset_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  vreg_and_chip_reset_Field.insert(newValue, into: &self.storage)
                }
              }
              public var xip: UInt32 {
                @inlinable @inline(__always) get {
                  xip_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  xip_Field.insert(newValue, into: &self.storage)
                }
              }
              public var sram5: UInt32 {
                @inlinable @inline(__always) get {
                  sram5_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  sram5_Field.insert(newValue, into: &self.storage)
                }
              }
              public var sram4: UInt32 {
                @inlinable @inline(__always) get {
                  sram4_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  sram4_Field.insert(newValue, into: &self.storage)
                }
              }
              public var sram3: UInt32 {
                @inlinable @inline(__always) get {
                  sram3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  sram3_Field.insert(newValue, into: &self.storage)
                }
              }
              public var sram2: UInt32 {
                @inlinable @inline(__always) get {
                  sram2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  sram2_Field.insert(newValue, into: &self.storage)
                }
              }
              public var sram1: UInt32 {
                @inlinable @inline(__always) get {
                  sram1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  sram1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var sram0: UInt32 {
                @inlinable @inline(__always) get {
                  sram0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  sram0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var rom: UInt32 {
                @inlinable @inline(__always) get {
                  rom_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  rom_Field.insert(newValue, into: &self.storage)
                }
              }
              public var busfabric: UInt32 {
                @inlinable @inline(__always) get {
                  busfabric_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  busfabric_Field.insert(newValue, into: &self.storage)
                }
              }
              public var resets: UInt32 {
                @inlinable @inline(__always) get {
                  resets_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  resets_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clocks: UInt32 {
                @inlinable @inline(__always) get {
                  clocks_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clocks_Field.insert(newValue, into: &self.storage)
                }
              }
              public var xosc: UInt32 {
                @inlinable @inline(__always) get {
                  xosc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  xosc_Field.insert(newValue, into: &self.storage)
                }
              }
              public var rosc: UInt32 {
                @inlinable @inline(__always) get {
                  rosc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  rosc_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = FRCE_ON_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var proc1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(proc1_Field.self, Bool.self)
                    return Bool(storage: self.raw.proc1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(proc1_Field.self, Bool.self)
                    self.raw.proc1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var proc0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(proc0_Field.self, Bool.self)
                  return Bool(storage: self.raw.proc0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(proc0_Field.self, Bool.self)
                  self.raw.proc0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var sio: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(sio_Field.self, Bool.self)
                  return Bool(storage: self.raw.sio)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(sio_Field.self, Bool.self)
                  self.raw.sio = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var vreg_and_chip_reset: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(vreg_and_chip_reset_Field.self, Bool.self)
                  return Bool(storage: self.raw.vreg_and_chip_reset)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(vreg_and_chip_reset_Field.self, Bool.self)
                  self.raw.vreg_and_chip_reset = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var xip: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(xip_Field.self, Bool.self)
                  return Bool(storage: self.raw.xip)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(xip_Field.self, Bool.self)
                  self.raw.xip = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var sram5: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(sram5_Field.self, Bool.self)
                  return Bool(storage: self.raw.sram5)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(sram5_Field.self, Bool.self)
                  self.raw.sram5 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var sram4: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(sram4_Field.self, Bool.self)
                  return Bool(storage: self.raw.sram4)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(sram4_Field.self, Bool.self)
                  self.raw.sram4 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var sram3: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(sram3_Field.self, Bool.self)
                  return Bool(storage: self.raw.sram3)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(sram3_Field.self, Bool.self)
                  self.raw.sram3 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var sram2: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(sram2_Field.self, Bool.self)
                  return Bool(storage: self.raw.sram2)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(sram2_Field.self, Bool.self)
                  self.raw.sram2 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var sram1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(sram1_Field.self, Bool.self)
                  return Bool(storage: self.raw.sram1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(sram1_Field.self, Bool.self)
                  self.raw.sram1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var sram0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(sram0_Field.self, Bool.self)
                  return Bool(storage: self.raw.sram0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(sram0_Field.self, Bool.self)
                  self.raw.sram0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var rom: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(rom_Field.self, Bool.self)
                  return Bool(storage: self.raw.rom)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(rom_Field.self, Bool.self)
                  self.raw.rom = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var busfabric: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(busfabric_Field.self, Bool.self)
                  return Bool(storage: self.raw.busfabric)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(busfabric_Field.self, Bool.self)
                  self.raw.busfabric = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var resets: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(resets_Field.self, Bool.self)
                  return Bool(storage: self.raw.resets)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(resets_Field.self, Bool.self)
                  self.raw.resets = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clocks: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clocks_Field.self, Bool.self)
                  return Bool(storage: self.raw.clocks)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clocks_Field.self, Bool.self)
                  self.raw.clocks = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var xosc: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(xosc_Field.self, Bool.self)
                  return Bool(storage: self.raw.xosc)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(xosc_Field.self, Bool.self)
                  self.raw.xosc = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var rosc: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(rosc_Field.self, Bool.self)
                  return Bool(storage: self.raw.rosc)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(rosc_Field.self, Bool.self)
                  self.raw.rosc = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Force into reset (i.e. power it off)
    public var FRCE_OFF: Register<FRCE_OFF_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0004), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0004))
          #endif
        }
    }
    public struct FRCE_OFF_Descriptor {
        @available(*, unavailable)
        public var proc1: proc1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var proc0: proc0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var sio: sio_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var vreg_and_chip_reset: vreg_and_chip_reset_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var xip: xip_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var sram5: sram5_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var sram4: sram4_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var sram3: sram3_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var sram2: sram2_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var sram1: sram1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var sram0: sram0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var rom: rom_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var busfabric: busfabric_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var resets: resets_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clocks: clocks_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var xosc: xosc_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var rosc: rosc_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum proc1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum proc0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum sio_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum vreg_and_chip_reset_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum xip_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum sram5_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum sram4_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum sram3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum sram2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum sram1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum sram0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum rom_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum busfabric_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum resets_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum clocks_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum xosc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum rosc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = FRCE_OFF_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var proc1: UInt32 {
                @inlinable @inline(__always) get {
                    proc1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    proc1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var proc0: UInt32 {
                @inlinable @inline(__always) get {
                  proc0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  proc0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var sio: UInt32 {
                @inlinable @inline(__always) get {
                  sio_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  sio_Field.insert(newValue, into: &self.storage)
                }
              }
              public var vreg_and_chip_reset: UInt32 {
                @inlinable @inline(__always) get {
                  vreg_and_chip_reset_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  vreg_and_chip_reset_Field.insert(newValue, into: &self.storage)
                }
              }
              public var xip: UInt32 {
                @inlinable @inline(__always) get {
                  xip_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  xip_Field.insert(newValue, into: &self.storage)
                }
              }
              public var sram5: UInt32 {
                @inlinable @inline(__always) get {
                  sram5_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  sram5_Field.insert(newValue, into: &self.storage)
                }
              }
              public var sram4: UInt32 {
                @inlinable @inline(__always) get {
                  sram4_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  sram4_Field.insert(newValue, into: &self.storage)
                }
              }
              public var sram3: UInt32 {
                @inlinable @inline(__always) get {
                  sram3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  sram3_Field.insert(newValue, into: &self.storage)
                }
              }
              public var sram2: UInt32 {
                @inlinable @inline(__always) get {
                  sram2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  sram2_Field.insert(newValue, into: &self.storage)
                }
              }
              public var sram1: UInt32 {
                @inlinable @inline(__always) get {
                  sram1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  sram1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var sram0: UInt32 {
                @inlinable @inline(__always) get {
                  sram0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  sram0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var rom: UInt32 {
                @inlinable @inline(__always) get {
                  rom_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  rom_Field.insert(newValue, into: &self.storage)
                }
              }
              public var busfabric: UInt32 {
                @inlinable @inline(__always) get {
                  busfabric_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  busfabric_Field.insert(newValue, into: &self.storage)
                }
              }
              public var resets: UInt32 {
                @inlinable @inline(__always) get {
                  resets_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  resets_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clocks: UInt32 {
                @inlinable @inline(__always) get {
                  clocks_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clocks_Field.insert(newValue, into: &self.storage)
                }
              }
              public var xosc: UInt32 {
                @inlinable @inline(__always) get {
                  xosc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  xosc_Field.insert(newValue, into: &self.storage)
                }
              }
              public var rosc: UInt32 {
                @inlinable @inline(__always) get {
                  rosc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  rosc_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = FRCE_OFF_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var proc1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(proc1_Field.self, Bool.self)
                    return Bool(storage: self.raw.proc1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(proc1_Field.self, Bool.self)
                    self.raw.proc1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var proc0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(proc0_Field.self, Bool.self)
                  return Bool(storage: self.raw.proc0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(proc0_Field.self, Bool.self)
                  self.raw.proc0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var sio: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(sio_Field.self, Bool.self)
                  return Bool(storage: self.raw.sio)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(sio_Field.self, Bool.self)
                  self.raw.sio = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var vreg_and_chip_reset: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(vreg_and_chip_reset_Field.self, Bool.self)
                  return Bool(storage: self.raw.vreg_and_chip_reset)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(vreg_and_chip_reset_Field.self, Bool.self)
                  self.raw.vreg_and_chip_reset = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var xip: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(xip_Field.self, Bool.self)
                  return Bool(storage: self.raw.xip)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(xip_Field.self, Bool.self)
                  self.raw.xip = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var sram5: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(sram5_Field.self, Bool.self)
                  return Bool(storage: self.raw.sram5)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(sram5_Field.self, Bool.self)
                  self.raw.sram5 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var sram4: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(sram4_Field.self, Bool.self)
                  return Bool(storage: self.raw.sram4)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(sram4_Field.self, Bool.self)
                  self.raw.sram4 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var sram3: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(sram3_Field.self, Bool.self)
                  return Bool(storage: self.raw.sram3)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(sram3_Field.self, Bool.self)
                  self.raw.sram3 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var sram2: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(sram2_Field.self, Bool.self)
                  return Bool(storage: self.raw.sram2)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(sram2_Field.self, Bool.self)
                  self.raw.sram2 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var sram1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(sram1_Field.self, Bool.self)
                  return Bool(storage: self.raw.sram1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(sram1_Field.self, Bool.self)
                  self.raw.sram1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var sram0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(sram0_Field.self, Bool.self)
                  return Bool(storage: self.raw.sram0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(sram0_Field.self, Bool.self)
                  self.raw.sram0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var rom: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(rom_Field.self, Bool.self)
                  return Bool(storage: self.raw.rom)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(rom_Field.self, Bool.self)
                  self.raw.rom = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var busfabric: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(busfabric_Field.self, Bool.self)
                  return Bool(storage: self.raw.busfabric)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(busfabric_Field.self, Bool.self)
                  self.raw.busfabric = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var resets: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(resets_Field.self, Bool.self)
                  return Bool(storage: self.raw.resets)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(resets_Field.self, Bool.self)
                  self.raw.resets = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clocks: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clocks_Field.self, Bool.self)
                  return Bool(storage: self.raw.clocks)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clocks_Field.self, Bool.self)
                  self.raw.clocks = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var xosc: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(xosc_Field.self, Bool.self)
                  return Bool(storage: self.raw.xosc)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(xosc_Field.self, Bool.self)
                  self.raw.xosc = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var rosc: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(rosc_Field.self, Bool.self)
                  return Bool(storage: self.raw.rosc)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(rosc_Field.self, Bool.self)
                  self.raw.rosc = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Set to 1 if this peripheral should be reset when the watchdog fires.
    public var WDSEL: Register<WDSEL_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x0008), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x0008))
          #endif
        }
    }
    public struct WDSEL_Descriptor {
        @available(*, unavailable)
        public var proc1: proc1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var proc0: proc0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var sio: sio_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var vreg_and_chip_reset: vreg_and_chip_reset_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var xip: xip_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var sram5: sram5_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var sram4: sram4_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var sram3: sram3_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var sram2: sram2_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var sram1: sram1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var sram0: sram0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var rom: rom_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var busfabric: busfabric_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var resets: resets_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clocks: clocks_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var xosc: xosc_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var rosc: rosc_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum proc1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum proc0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum sio_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum vreg_and_chip_reset_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum xip_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum sram5_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum sram4_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum sram3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum sram2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum sram1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum sram0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum rom_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum busfabric_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum resets_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum clocks_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum xosc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum rosc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = WDSEL_Descriptor

                    public  typealias Storage = UInt32

                    public  var storage: Storage

                    public  init(_ storage: Storage) {
                self.storage = storage
                }

                    public  init(_ value: Value.ReadWrite) {
                self.storage = value.storage
                }
                public var proc1: UInt32 {
                @inlinable @inline(__always) get {
                    proc1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    proc1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var proc0: UInt32 {
                @inlinable @inline(__always) get {
                  proc0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  proc0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var sio: UInt32 {
                @inlinable @inline(__always) get {
                  sio_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  sio_Field.insert(newValue, into: &self.storage)
                }
              }
              public var vreg_and_chip_reset: UInt32 {
                @inlinable @inline(__always) get {
                  vreg_and_chip_reset_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  vreg_and_chip_reset_Field.insert(newValue, into: &self.storage)
                }
              }
              public var xip: UInt32 {
                @inlinable @inline(__always) get {
                  xip_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  xip_Field.insert(newValue, into: &self.storage)
                }
              }
              public var sram5: UInt32 {
                @inlinable @inline(__always) get {
                  sram5_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  sram5_Field.insert(newValue, into: &self.storage)
                }
              }
              public var sram4: UInt32 {
                @inlinable @inline(__always) get {
                  sram4_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  sram4_Field.insert(newValue, into: &self.storage)
                }
              }
              public var sram3: UInt32 {
                @inlinable @inline(__always) get {
                  sram3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  sram3_Field.insert(newValue, into: &self.storage)
                }
              }
              public var sram2: UInt32 {
                @inlinable @inline(__always) get {
                  sram2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  sram2_Field.insert(newValue, into: &self.storage)
                }
              }
              public var sram1: UInt32 {
                @inlinable @inline(__always) get {
                  sram1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  sram1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var sram0: UInt32 {
                @inlinable @inline(__always) get {
                  sram0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  sram0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var rom: UInt32 {
                @inlinable @inline(__always) get {
                  rom_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  rom_Field.insert(newValue, into: &self.storage)
                }
              }
              public var busfabric: UInt32 {
                @inlinable @inline(__always) get {
                  busfabric_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  busfabric_Field.insert(newValue, into: &self.storage)
                }
              }
              public var resets: UInt32 {
                @inlinable @inline(__always) get {
                  resets_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  resets_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clocks: UInt32 {
                @inlinable @inline(__always) get {
                  clocks_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clocks_Field.insert(newValue, into: &self.storage)
                }
              }
              public var xosc: UInt32 {
                @inlinable @inline(__always) get {
                  xosc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  xosc_Field.insert(newValue, into: &self.storage)
                }
              }
              public var rosc: UInt32 {
                @inlinable @inline(__always) get {
                  rosc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  rosc_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  typealias Read = ReadWrite

        public  typealias Write = ReadWrite

        public  struct ReadWrite: RegisterValueRead, RegisterValueWrite {

                    public  typealias Value = WDSEL_Descriptor
                var storage: UInt32

                    public  init(_ value: ReadWrite) {
                self.storage = value.storage
                }

                    public  init(_ value: Raw) {
                self.storage = value.storage
                }
                public var proc1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(proc1_Field.self, Bool.self)
                    return Bool(storage: self.raw.proc1)
                }
                @inlinable @inline(__always) set {
                    preconditionMatchingBitWidth(proc1_Field.self, Bool.self)
                    self.raw.proc1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
                }
              public var proc0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(proc0_Field.self, Bool.self)
                  return Bool(storage: self.raw.proc0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(proc0_Field.self, Bool.self)
                  self.raw.proc0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var sio: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(sio_Field.self, Bool.self)
                  return Bool(storage: self.raw.sio)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(sio_Field.self, Bool.self)
                  self.raw.sio = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var vreg_and_chip_reset: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(vreg_and_chip_reset_Field.self, Bool.self)
                  return Bool(storage: self.raw.vreg_and_chip_reset)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(vreg_and_chip_reset_Field.self, Bool.self)
                  self.raw.vreg_and_chip_reset = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var xip: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(xip_Field.self, Bool.self)
                  return Bool(storage: self.raw.xip)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(xip_Field.self, Bool.self)
                  self.raw.xip = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var sram5: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(sram5_Field.self, Bool.self)
                  return Bool(storage: self.raw.sram5)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(sram5_Field.self, Bool.self)
                  self.raw.sram5 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var sram4: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(sram4_Field.self, Bool.self)
                  return Bool(storage: self.raw.sram4)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(sram4_Field.self, Bool.self)
                  self.raw.sram4 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var sram3: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(sram3_Field.self, Bool.self)
                  return Bool(storage: self.raw.sram3)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(sram3_Field.self, Bool.self)
                  self.raw.sram3 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var sram2: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(sram2_Field.self, Bool.self)
                  return Bool(storage: self.raw.sram2)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(sram2_Field.self, Bool.self)
                  self.raw.sram2 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var sram1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(sram1_Field.self, Bool.self)
                  return Bool(storage: self.raw.sram1)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(sram1_Field.self, Bool.self)
                  self.raw.sram1 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var sram0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(sram0_Field.self, Bool.self)
                  return Bool(storage: self.raw.sram0)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(sram0_Field.self, Bool.self)
                  self.raw.sram0 = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var rom: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(rom_Field.self, Bool.self)
                  return Bool(storage: self.raw.rom)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(rom_Field.self, Bool.self)
                  self.raw.rom = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var busfabric: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(busfabric_Field.self, Bool.self)
                  return Bool(storage: self.raw.busfabric)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(busfabric_Field.self, Bool.self)
                  self.raw.busfabric = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var resets: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(resets_Field.self, Bool.self)
                  return Bool(storage: self.raw.resets)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(resets_Field.self, Bool.self)
                  self.raw.resets = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var clocks: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clocks_Field.self, Bool.self)
                  return Bool(storage: self.raw.clocks)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(clocks_Field.self, Bool.self)
                  self.raw.clocks = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var xosc: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(xosc_Field.self, Bool.self)
                  return Bool(storage: self.raw.xosc)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(xosc_Field.self, Bool.self)
                  self.raw.xosc = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
              public var rosc: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(rosc_Field.self, Bool.self)
                  return Bool(storage: self.raw.rosc)
                }
                @inlinable @inline(__always) set {
                  preconditionMatchingBitWidth(rosc_Field.self, Bool.self)
                  self.raw.rosc = newValue.storage(Self.Value.Raw.Storage.self)
                }
              }
        }
    }

    /// Indicates the peripheral's registers are ready to access.
    public var DONE: Register<DONE_Descriptor> {
        @inlinable @inline(__always) get {
          #if FEATURE_INTERPOSABLE
          return .init(unsafeAddress: self.unsafeAddress + (0x000c), interposer: self.interposer)
          #else
          return .init(unsafeAddress: self.unsafeAddress + (0x000c))
          #endif
        }
    }
    public struct DONE_Descriptor {
        @available(*, unavailable)
        public var proc1: proc1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var proc0: proc0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var sio: sio_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var vreg_and_chip_reset: vreg_and_chip_reset_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var xip: xip_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var sram5: sram5_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var sram4: sram4_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var sram3: sram3_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var sram2: sram2_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var sram1: sram1_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var sram0: sram0_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var rom: rom_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var busfabric: busfabric_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var resets: resets_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var clocks: clocks_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var xosc: xosc_Field {
            get {
                fatalError()
            }
        }
        @available(*, unavailable)
        public var rosc: rosc_Field {
            get {
                fatalError()
            }
        }

        private init() {
            fatalError()
        }

        private var _never: Never

        public enum proc1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 16 ..< 17
        }

        public enum proc0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 15 ..< 16
        }

        public enum sio_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 14 ..< 15
        }

        public enum vreg_and_chip_reset_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 13 ..< 14
        }

        public enum xip_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 12 ..< 13
        }

        public enum sram5_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 11 ..< 12
        }

        public enum sram4_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 10 ..< 11
        }

        public enum sram3_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 9 ..< 10
        }

        public enum sram2_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 8 ..< 9
        }

        public enum sram1_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 7 ..< 8
        }

        public enum sram0_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 6 ..< 7
        }

        public enum rom_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 5 ..< 6
        }

        public enum busfabric_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 4 ..< 5
        }

        public enum resets_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 3 ..< 4
        }

        public enum clocks_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 2 ..< 3
        }

        public enum xosc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 1 ..< 2
        }

        public enum rosc_Field: ContiguousBitField {
          public typealias Storage = UInt32
          public static let bitRange = 0 ..< 1
        }

        public  struct Raw: RegisterValueRaw {

                    public  typealias Value = DONE_Descriptor

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
                public var proc1: UInt32 {
                @inlinable @inline(__always) get {
                    proc1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                    proc1_Field.insert(newValue, into: &self.storage)
                }
                }
              public var proc0: UInt32 {
                @inlinable @inline(__always) get {
                  proc0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  proc0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var sio: UInt32 {
                @inlinable @inline(__always) get {
                  sio_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  sio_Field.insert(newValue, into: &self.storage)
                }
              }
              public var vreg_and_chip_reset: UInt32 {
                @inlinable @inline(__always) get {
                  vreg_and_chip_reset_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  vreg_and_chip_reset_Field.insert(newValue, into: &self.storage)
                }
              }
              public var xip: UInt32 {
                @inlinable @inline(__always) get {
                  xip_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  xip_Field.insert(newValue, into: &self.storage)
                }
              }
              public var sram5: UInt32 {
                @inlinable @inline(__always) get {
                  sram5_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  sram5_Field.insert(newValue, into: &self.storage)
                }
              }
              public var sram4: UInt32 {
                @inlinable @inline(__always) get {
                  sram4_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  sram4_Field.insert(newValue, into: &self.storage)
                }
              }
              public var sram3: UInt32 {
                @inlinable @inline(__always) get {
                  sram3_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  sram3_Field.insert(newValue, into: &self.storage)
                }
              }
              public var sram2: UInt32 {
                @inlinable @inline(__always) get {
                  sram2_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  sram2_Field.insert(newValue, into: &self.storage)
                }
              }
              public var sram1: UInt32 {
                @inlinable @inline(__always) get {
                  sram1_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  sram1_Field.insert(newValue, into: &self.storage)
                }
              }
              public var sram0: UInt32 {
                @inlinable @inline(__always) get {
                  sram0_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  sram0_Field.insert(newValue, into: &self.storage)
                }
              }
              public var rom: UInt32 {
                @inlinable @inline(__always) get {
                  rom_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  rom_Field.insert(newValue, into: &self.storage)
                }
              }
              public var busfabric: UInt32 {
                @inlinable @inline(__always) get {
                  busfabric_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  busfabric_Field.insert(newValue, into: &self.storage)
                }
              }
              public var resets: UInt32 {
                @inlinable @inline(__always) get {
                  resets_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  resets_Field.insert(newValue, into: &self.storage)
                }
              }
              public var clocks: UInt32 {
                @inlinable @inline(__always) get {
                  clocks_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  clocks_Field.insert(newValue, into: &self.storage)
                }
              }
              public var xosc: UInt32 {
                @inlinable @inline(__always) get {
                  xosc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  xosc_Field.insert(newValue, into: &self.storage)
                }
              }
              public var rosc: UInt32 {
                @inlinable @inline(__always) get {
                  rosc_Field.extract(from: self.storage)
                }
                @inlinable @inline(__always) set {
                  rosc_Field.insert(newValue, into: &self.storage)
                }
              }
        }

        public  struct Read: RegisterValueRead {

                    public  typealias Value = DONE_Descriptor
                var storage: UInt32

                    public  init(_ value: Raw) {
                  self.storage = value.storage
              }
                public var proc1: Bool {
                @inlinable @inline(__always) get {
                    preconditionMatchingBitWidth(proc1_Field.self, Bool.self)
                    return Bool(storage: self.raw.proc1)
                }
                }
              public var proc0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(proc0_Field.self, Bool.self)
                  return Bool(storage: self.raw.proc0)
                }
              }
              public var sio: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(sio_Field.self, Bool.self)
                  return Bool(storage: self.raw.sio)
                }
              }
              public var vreg_and_chip_reset: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(vreg_and_chip_reset_Field.self, Bool.self)
                  return Bool(storage: self.raw.vreg_and_chip_reset)
                }
              }
              public var xip: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(xip_Field.self, Bool.self)
                  return Bool(storage: self.raw.xip)
                }
              }
              public var sram5: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(sram5_Field.self, Bool.self)
                  return Bool(storage: self.raw.sram5)
                }
              }
              public var sram4: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(sram4_Field.self, Bool.self)
                  return Bool(storage: self.raw.sram4)
                }
              }
              public var sram3: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(sram3_Field.self, Bool.self)
                  return Bool(storage: self.raw.sram3)
                }
              }
              public var sram2: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(sram2_Field.self, Bool.self)
                  return Bool(storage: self.raw.sram2)
                }
              }
              public var sram1: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(sram1_Field.self, Bool.self)
                  return Bool(storage: self.raw.sram1)
                }
              }
              public var sram0: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(sram0_Field.self, Bool.self)
                  return Bool(storage: self.raw.sram0)
                }
              }
              public var rom: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(rom_Field.self, Bool.self)
                  return Bool(storage: self.raw.rom)
                }
              }
              public var busfabric: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(busfabric_Field.self, Bool.self)
                  return Bool(storage: self.raw.busfabric)
                }
              }
              public var resets: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(resets_Field.self, Bool.self)
                  return Bool(storage: self.raw.resets)
                }
              }
              public var clocks: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(clocks_Field.self, Bool.self)
                  return Bool(storage: self.raw.clocks)
                }
              }
              public var xosc: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(xosc_Field.self, Bool.self)
                  return Bool(storage: self.raw.xosc)
                }
              }
              public var rosc: Bool {
                @inlinable @inline(__always) get {
                  preconditionMatchingBitWidth(rosc_Field.self, Bool.self)
                  return Bool(storage: self.raw.rosc)
                }
              }
        }

        public  struct Write: RegisterValueWrite {

                    public  typealias Value = DONE_Descriptor
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

extension PSM.FRCE_ON_Descriptor: RegisterValue {
}

extension PSM.FRCE_OFF_Descriptor: RegisterValue {
}

extension PSM.WDSEL_Descriptor: RegisterValue {
}

extension PSM.DONE_Descriptor: RegisterValue {
}
