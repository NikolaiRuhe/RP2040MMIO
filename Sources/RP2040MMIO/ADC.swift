import MMIO
import MMIOExtensions

/// Control and data interface to SAR ADC
@RegisterBank
public struct ADC {

    public static var `default`: Self { .init(unsafeAddress: 0x4004c000) }

    /// ADC Control and Status
    @RegisterBank(offset: 0x0000)
    public var CS: Register<CS_Descriptor>


    @Register(bitWidth: 32)
    public struct CS_Descriptor {
        /// Round-robin sampling. 1 bit per channel. Set all bits to 0 to disable.
        /// Otherwise, the ADC will cycle through each enabled channel in a round-robin fashion.
        /// The first channel to be sampled will be the one currently indicated by AINSEL.
        /// AINSEL will be updated after each conversion with the newly-selected channel.
        @ReadWrite(bits: 16..<21, as: BitField5.self)
        public var RROBIN: RROBIN_Field

        /// Select analog mux input. Updated automatically in round-robin mode.
        @ReadWrite(bits: 12..<15, as: BitField3.self)
        public var AINSEL: AINSEL_Field

        /// Some past ADC conversion encountered an error. Write 1 to clear.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var ERR_STICKY: ERR_STICKY_Field

        /// The most recent ADC conversion encountered an error; result is undefined or noisy.
        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var ERR: ERR_Field

        /// 1 if the ADC is ready to start a new conversion. Implies any previous conversion has completed.
        /// 0 whilst conversion in progress.
        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var READY: READY_Field

        /// Continuously perform conversions whilst this bit is 1. A new conversion will start immediately after the previous finishes.
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var START_MANY: START_MANY_Field

        /// Start a single conversion. Self-clearing. Ignored if start_many is asserted.
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var START_ONCE: START_ONCE_Field

        /// Power on temperature sensor. 1 - enabled. 0 - disabled.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var TS_EN: TS_EN_Field

        /// Power on ADC and enable its clock.
        /// 1 - enabled. 0 - disabled.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var EN: EN_Field
    }

    /// Result of most recent ADC conversion
    @RegisterBank(offset: 0x0004)
    public var RESULT: Register<RESULT_Descriptor>


    @Register(bitWidth: 32)
    public struct RESULT_Descriptor {
        @ReadOnly(bits: 0..<12, as: BitField12.self)
        public var RESULT: RESULT_Field
    }

    /// FIFO control and status
    @RegisterBank(offset: 0x0008)
    public var FCS: Register<FCS_Descriptor>


    @Register(bitWidth: 32)
    public struct FCS_Descriptor {
        /// DREQ/IRQ asserted when level >= threshold
        @ReadWrite(bits: 24..<28, as: BitField4.self)
        public var THRESH: THRESH_Field

        /// The number of conversion results currently waiting in the FIFO
        @ReadOnly(bits: 16..<20, as: BitField4.self)
        public var LEVEL: LEVEL_Field

        /// 1 if the FIFO has been overflowed. Write 1 to clear.
        @ReadWrite(bits: 11..<12, as: Bool.self)
        public var OVER: OVER_Field

        /// 1 if the FIFO has been underflowed. Write 1 to clear.
        @ReadWrite(bits: 10..<11, as: Bool.self)
        public var UNDER: UNDER_Field

        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var FULL: FULL_Field

        @ReadOnly(bits: 8..<9, as: Bool.self)
        public var EMPTY: EMPTY_Field

        /// If 1: assert DMA requests when FIFO contains data
        @ReadWrite(bits: 3..<4, as: Bool.self)
        public var DREQ_EN: DREQ_EN_Field

        /// If 1: conversion error bit appears in the FIFO alongside the result
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var ERR: ERR_Field

        /// If 1: FIFO results are right-shifted to be one byte in size. Enables DMA to byte buffers.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var SHIFT: SHIFT_Field

        /// If 1: write result to the FIFO after each conversion.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var EN: EN_Field
    }

    /// Conversion result FIFO
    @RegisterBank(offset: 0x000c)
    public var FIFO: Register<FIFO_Descriptor>


    @Register(bitWidth: 32)
    public struct FIFO_Descriptor {
        /// 1 if this particular sample experienced a conversion error. Remains in the same location if the sample is shifted.
        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var ERR: ERR_Field

        @ReadOnly(bits: 0..<12, as: BitField12.self)
        public var VAL: VAL_Field
    }

    /// Clock divider. If non-zero, CS_START_MANY will start conversions
    /// at regular intervals rather than back-to-back.
    /// The divider is reset when either of these fields are written.
    /// Total period is 1 + INT + FRAC / 256
    @RegisterBank(offset: 0x0010)
    public var DIV: Register<DIV_Descriptor>


    @Register(bitWidth: 32)
    public struct DIV_Descriptor {
        /// Integer part of clock divisor.
        @ReadWrite(bits: 8..<24, as: BitField16.self)
        public var INT: INT_Field

        /// Fractional part of clock divisor. First-order delta-sigma.
        @ReadWrite(bits: 0..<8, as: BitField8.self)
        public var FRAC: FRAC_Field
    }

    /// Raw Interrupts
    @RegisterBank(offset: 0x0014)
    public var INTR: Register<INTR_Descriptor>


    @Register(bitWidth: 32)
    public struct INTR_Descriptor {
        /// Triggered when the sample FIFO reaches a certain level.
        /// This level can be programmed via the FCS_THRESH field.
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var FIFO: FIFO_Field
    }

    /// Interrupt Enable
    @RegisterBank(offset: 0x0018)
    public var INTE: Register<INTE_Descriptor>


    @Register(bitWidth: 32)
    public struct INTE_Descriptor {
        /// Triggered when the sample FIFO reaches a certain level.
        /// This level can be programmed via the FCS_THRESH field.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var FIFO: FIFO_Field
    }

    /// Interrupt Force
    @RegisterBank(offset: 0x001c)
    public var INTF: Register<INTF_Descriptor>


    @Register(bitWidth: 32)
    public struct INTF_Descriptor {
        /// Triggered when the sample FIFO reaches a certain level.
        /// This level can be programmed via the FCS_THRESH field.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var FIFO: FIFO_Field
    }

    /// Interrupt status after masking & forcing
    @RegisterBank(offset: 0x0020)
    public var INTS: Register<INTS_Descriptor>


    @Register(bitWidth: 32)
    public struct INTS_Descriptor {
        /// Triggered when the sample FIFO reaches a certain level.
        /// This level can be programmed via the FCS_THRESH field.
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var FIFO: FIFO_Field
    }
}
