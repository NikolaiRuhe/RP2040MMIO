import MMIO
import MMIOExtensions

@RegisterBank
public struct PPB {

    public static var `default`: Self { .init(unsafeAddress: 0xe0000000) }

    /// Use the SysTick Control and Status Register to enable the SysTick features.
    @RegisterBank(offset: 0xe010)
    public var syst_csr: Register<SYST_CSR>

    @Register(bitWidth: 32)
    public struct SYST_CSR {
        /// Returns 1 if timer counted to 0 since last time this was read. Clears on read by application or debugger.
        @ReadOnly(bits: 16..<17, as: Bool.self)
        public var countflag: COUNTFLAG_Field

        /// SysTick clock source. Always reads as one if SYST_CALIB reports NOREF.
        /// Selects the SysTick timer clock source:
        /// 0 = External reference clock.
        /// 1 = Processor clock.
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var clksource: CLKSOURCE_Field

        /// Enables SysTick exception request:
        /// 0 = Counting down to zero does not assert the SysTick exception request.
        /// 1 = Counting down to zero to asserts the SysTick exception request.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var tickint: TICKINT_Field

        /// Enable SysTick counter:
        /// 0 = Counter disabled.
        /// 1 = Counter enabled.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var enable: ENABLE_Field
    }

    /// Use the SysTick Reload Value Register to specify the start value to load into the current value register when the counter reaches 0. It can be any value between 0 and 0x00FFFFFF. A start value of 0 is possible, but has no effect because the SysTick interrupt and COUNTFLAG are activated when counting from 1 to 0. The reset value of this register is UNKNOWN.
    /// To generate a multi-shot timer with a period of N processor clock cycles, use a RELOAD value of N-1. For example, if the SysTick interrupt is required every 100 clock pulses, set RELOAD to 99.
    @RegisterBank(offset: 0xe014)
    public var syst_rvr: Register<SYST_RVR>

    @Register(bitWidth: 32)
    public struct SYST_RVR {
        /// Value to load into the SysTick Current Value Register when the counter reaches 0.
        @ReadWrite(bits: 0..<24, as: BitField24.self)
        public var reload: RELOAD_Field
    }

    /// Use the SysTick Current Value Register to find the current value in the register. The reset value of this register is UNKNOWN.
    @RegisterBank(offset: 0xe018)
    public var syst_cvr: Register<SYST_CVR>

    @Register(bitWidth: 32)
    public struct SYST_CVR {
        /// Reads return the current value of the SysTick counter. This register is write-clear. Writing to it with any value clears the register to 0. Clearing this register also clears the COUNTFLAG bit of the SysTick Control and Status Register.
        @ReadWrite(bits: 0..<24, as: BitField24.self)
        public var current: CURRENT_Field
    }

    /// Use the SysTick Calibration Value Register to enable software to scale to any required speed using divide and multiply.
    @RegisterBank(offset: 0xe01c)
    public var syst_calib: Register<SYST_CALIB>

    @Register(bitWidth: 32)
    public struct SYST_CALIB {
        /// If reads as 1, the Reference clock is not provided - the CLKSOURCE bit of the SysTick Control and Status register will be forced to 1 and cannot be cleared to 0.
        @ReadOnly(bits: 31..<32, as: Bool.self)
        public var noref: NOREF_Field

        /// If reads as 1, the calibration value for 10ms is inexact (due to clock frequency).
        @ReadOnly(bits: 30..<31, as: Bool.self)
        public var skew: SKEW_Field

        /// An optional Reload value to be used for 10ms (100Hz) timing, subject to system clock skew errors. If the value reads as 0, the calibration value is not known.
        @ReadOnly(bits: 0..<24, as: BitField24.self)
        public var tenms: TENMS_Field
    }

    /// Use the Interrupt Set-Enable Register to enable interrupts and determine which interrupts are currently enabled.
    /// If a pending interrupt is enabled, the NVIC activates the interrupt based on its priority. If an interrupt is not enabled, asserting its interrupt signal changes the interrupt state to pending, but the NVIC never activates the interrupt, regardless of its priority.
    @RegisterBank(offset: 0xe100)
    public var nvic_iser: Register<NVIC_ISER>

    @Register(bitWidth: 32)
    public struct NVIC_ISER {
        /// Interrupt set-enable bits.
        /// Write:
        /// 0 = No effect.
        /// 1 = Enable interrupt.
        /// Read:
        /// 0 = Interrupt disabled.
        /// 1 = Interrupt enabled.
        @ReadWrite(bits: 0..<32, as: BitField32.self)
        public var setena: SETENA_Field
    }

    /// Use the Interrupt Clear-Enable Registers to disable interrupts and determine which interrupts are currently enabled.
    @RegisterBank(offset: 0xe180)
    public var nvic_icer: Register<NVIC_ICER>

    @Register(bitWidth: 32)
    public struct NVIC_ICER {
        /// Interrupt clear-enable bits.
        /// Write:
        /// 0 = No effect.
        /// 1 = Disable interrupt.
        /// Read:
        /// 0 = Interrupt disabled.
        /// 1 = Interrupt enabled.
        @ReadWrite(bits: 0..<32, as: BitField32.self)
        public var clrena: CLRENA_Field
    }

    /// The NVIC_ISPR forces interrupts into the pending state, and shows which interrupts are pending.
    @RegisterBank(offset: 0xe200)
    public var nvic_ispr: Register<NVIC_ISPR>

    @Register(bitWidth: 32)
    public struct NVIC_ISPR {
        /// Interrupt set-pending bits.
        /// Write:
        /// 0 = No effect.
        /// 1 = Changes interrupt state to pending.
        /// Read:
        /// 0 = Interrupt is not pending.
        /// 1 = Interrupt is pending.
        /// Note: Writing 1 to the NVIC_ISPR bit corresponding to:
        /// An interrupt that is pending has no effect.
        /// A disabled interrupt sets the state of that interrupt to pending.
        @ReadWrite(bits: 0..<32, as: BitField32.self)
        public var setpend: SETPEND_Field
    }

    /// Use the Interrupt Clear-Pending Register to clear pending interrupts and determine which interrupts are currently pending.
    @RegisterBank(offset: 0xe280)
    public var nvic_icpr: Register<NVIC_ICPR>

    @Register(bitWidth: 32)
    public struct NVIC_ICPR {
        /// Interrupt clear-pending bits.
        /// Write:
        /// 0 = No effect.
        /// 1 = Removes pending state and interrupt.
        /// Read:
        /// 0 = Interrupt is not pending.
        /// 1 = Interrupt is pending.
        @ReadWrite(bits: 0..<32, as: BitField32.self)
        public var clrpend: CLRPEND_Field
    }

    /// Use the Interrupt Priority Registers to assign a priority from 0 to 3 to each of the available interrupts. 0 is the highest priority, and 3 is the lowest.
    /// Note: Writing 1 to an NVIC_ICPR bit does not affect the active state of the corresponding interrupt.
    /// These registers are only word-accessible
    @RegisterBank(offset: 0xe400)
    public var nvic_ipr0: Register<NVIC_IPR0>

    @Register(bitWidth: 32)
    public struct NVIC_IPR0 {
        /// Priority of interrupt 3
        @ReadWrite(bits: 30..<32, as: BitField2.self)
        public var ip_3: IP_3_Field

        /// Priority of interrupt 2
        @ReadWrite(bits: 22..<24, as: BitField2.self)
        public var ip_2: IP_2_Field

        /// Priority of interrupt 1
        @ReadWrite(bits: 14..<16, as: BitField2.self)
        public var ip_1: IP_1_Field

        /// Priority of interrupt 0
        @ReadWrite(bits: 6..<8, as: BitField2.self)
        public var ip_0: IP_0_Field
    }

    /// Use the Interrupt Priority Registers to assign a priority from 0 to 3 to each of the available interrupts. 0 is the highest priority, and 3 is the lowest.
    @RegisterBank(offset: 0xe404)
    public var nvic_ipr1: Register<NVIC_IPR1>

    @Register(bitWidth: 32)
    public struct NVIC_IPR1 {
        /// Priority of interrupt 7
        @ReadWrite(bits: 30..<32, as: BitField2.self)
        public var ip_7: IP_7_Field

        /// Priority of interrupt 6
        @ReadWrite(bits: 22..<24, as: BitField2.self)
        public var ip_6: IP_6_Field

        /// Priority of interrupt 5
        @ReadWrite(bits: 14..<16, as: BitField2.self)
        public var ip_5: IP_5_Field

        /// Priority of interrupt 4
        @ReadWrite(bits: 6..<8, as: BitField2.self)
        public var ip_4: IP_4_Field
    }

    /// Use the Interrupt Priority Registers to assign a priority from 0 to 3 to each of the available interrupts. 0 is the highest priority, and 3 is the lowest.
    @RegisterBank(offset: 0xe408)
    public var nvic_ipr2: Register<NVIC_IPR2>

    @Register(bitWidth: 32)
    public struct NVIC_IPR2 {
        /// Priority of interrupt 11
        @ReadWrite(bits: 30..<32, as: BitField2.self)
        public var ip_11: IP_11_Field

        /// Priority of interrupt 10
        @ReadWrite(bits: 22..<24, as: BitField2.self)
        public var ip_10: IP_10_Field

        /// Priority of interrupt 9
        @ReadWrite(bits: 14..<16, as: BitField2.self)
        public var ip_9: IP_9_Field

        /// Priority of interrupt 8
        @ReadWrite(bits: 6..<8, as: BitField2.self)
        public var ip_8: IP_8_Field
    }

    /// Use the Interrupt Priority Registers to assign a priority from 0 to 3 to each of the available interrupts. 0 is the highest priority, and 3 is the lowest.
    @RegisterBank(offset: 0xe40c)
    public var nvic_ipr3: Register<NVIC_IPR3>

    @Register(bitWidth: 32)
    public struct NVIC_IPR3 {
        /// Priority of interrupt 15
        @ReadWrite(bits: 30..<32, as: BitField2.self)
        public var ip_15: IP_15_Field

        /// Priority of interrupt 14
        @ReadWrite(bits: 22..<24, as: BitField2.self)
        public var ip_14: IP_14_Field

        /// Priority of interrupt 13
        @ReadWrite(bits: 14..<16, as: BitField2.self)
        public var ip_13: IP_13_Field

        /// Priority of interrupt 12
        @ReadWrite(bits: 6..<8, as: BitField2.self)
        public var ip_12: IP_12_Field
    }

    /// Use the Interrupt Priority Registers to assign a priority from 0 to 3 to each of the available interrupts. 0 is the highest priority, and 3 is the lowest.
    @RegisterBank(offset: 0xe410)
    public var nvic_ipr4: Register<NVIC_IPR4>

    @Register(bitWidth: 32)
    public struct NVIC_IPR4 {
        /// Priority of interrupt 19
        @ReadWrite(bits: 30..<32, as: BitField2.self)
        public var ip_19: IP_19_Field

        /// Priority of interrupt 18
        @ReadWrite(bits: 22..<24, as: BitField2.self)
        public var ip_18: IP_18_Field

        /// Priority of interrupt 17
        @ReadWrite(bits: 14..<16, as: BitField2.self)
        public var ip_17: IP_17_Field

        /// Priority of interrupt 16
        @ReadWrite(bits: 6..<8, as: BitField2.self)
        public var ip_16: IP_16_Field
    }

    /// Use the Interrupt Priority Registers to assign a priority from 0 to 3 to each of the available interrupts. 0 is the highest priority, and 3 is the lowest.
    @RegisterBank(offset: 0xe414)
    public var nvic_ipr5: Register<NVIC_IPR5>

    @Register(bitWidth: 32)
    public struct NVIC_IPR5 {
        /// Priority of interrupt 23
        @ReadWrite(bits: 30..<32, as: BitField2.self)
        public var ip_23: IP_23_Field

        /// Priority of interrupt 22
        @ReadWrite(bits: 22..<24, as: BitField2.self)
        public var ip_22: IP_22_Field

        /// Priority of interrupt 21
        @ReadWrite(bits: 14..<16, as: BitField2.self)
        public var ip_21: IP_21_Field

        /// Priority of interrupt 20
        @ReadWrite(bits: 6..<8, as: BitField2.self)
        public var ip_20: IP_20_Field
    }

    /// Use the Interrupt Priority Registers to assign a priority from 0 to 3 to each of the available interrupts. 0 is the highest priority, and 3 is the lowest.
    @RegisterBank(offset: 0xe418)
    public var nvic_ipr6: Register<NVIC_IPR6>

    @Register(bitWidth: 32)
    public struct NVIC_IPR6 {
        /// Priority of interrupt 27
        @ReadWrite(bits: 30..<32, as: BitField2.self)
        public var ip_27: IP_27_Field

        /// Priority of interrupt 26
        @ReadWrite(bits: 22..<24, as: BitField2.self)
        public var ip_26: IP_26_Field

        /// Priority of interrupt 25
        @ReadWrite(bits: 14..<16, as: BitField2.self)
        public var ip_25: IP_25_Field

        /// Priority of interrupt 24
        @ReadWrite(bits: 6..<8, as: BitField2.self)
        public var ip_24: IP_24_Field
    }

    /// Use the Interrupt Priority Registers to assign a priority from 0 to 3 to each of the available interrupts. 0 is the highest priority, and 3 is the lowest.
    @RegisterBank(offset: 0xe41c)
    public var nvic_ipr7: Register<NVIC_IPR7>

    @Register(bitWidth: 32)
    public struct NVIC_IPR7 {
        /// Priority of interrupt 31
        @ReadWrite(bits: 30..<32, as: BitField2.self)
        public var ip_31: IP_31_Field

        /// Priority of interrupt 30
        @ReadWrite(bits: 22..<24, as: BitField2.self)
        public var ip_30: IP_30_Field

        /// Priority of interrupt 29
        @ReadWrite(bits: 14..<16, as: BitField2.self)
        public var ip_29: IP_29_Field

        /// Priority of interrupt 28
        @ReadWrite(bits: 6..<8, as: BitField2.self)
        public var ip_28: IP_28_Field
    }

    /// Read the CPU ID Base Register to determine: the ID number of the processor core, the version number of the processor core, the implementation details of the processor core.
    @RegisterBank(offset: 0xed00)
    public var cpuid: Register<CPUID>

    @Register(bitWidth: 32)
    public struct CPUID {
        /// Implementor code: 0x41 = ARM
        @ReadOnly(bits: 24..<32, as: BitField8.self)
        public var implementer: IMPLEMENTER_Field

        /// Major revision number n in the rnpm revision status:
        /// 0x0 = Revision 0.
        @ReadOnly(bits: 20..<24, as: BitField4.self)
        public var variant: VARIANT_Field

        /// Constant that defines the architecture of the processor:
        /// 0xC = ARMv6-M architecture.
        @ReadOnly(bits: 16..<20, as: BitField4.self)
        public var architecture: ARCHITECTURE_Field

        /// Number of processor within family: 0xC60 = Cortex-M0+
        @ReadOnly(bits: 4..<16, as: BitField12.self)
        public var partno: PARTNO_Field

        /// Minor revision number m in the rnpm revision status:
        /// 0x1 = Patch 1.
        @ReadOnly(bits: 0..<4, as: BitField4.self)
        public var revision: REVISION_Field
    }

    /// Use the Interrupt Control State Register to set a pending Non-Maskable Interrupt (NMI), set or clear a pending PendSV, set or clear a pending SysTick, check for pending exceptions, check the vector number of the highest priority pended exception, check the vector number of the active exception.
    @RegisterBank(offset: 0xed04)
    public var icsr: Register<ICSR>

    @Register(bitWidth: 32)
    public struct ICSR {
        /// Setting this bit will activate an NMI. Since NMI is the highest priority exception, it will activate as soon as it is registered.
        /// NMI set-pending bit.
        /// Write:
        /// 0 = No effect.
        /// 1 = Changes NMI exception state to pending.
        /// Read:
        /// 0 = NMI exception is not pending.
        /// 1 = NMI exception is pending.
        /// Because NMI is the highest-priority exception, normally the processor enters the NMI
        /// exception handler as soon as it detects a write of 1 to this bit. Entering the handler then clears
        /// this bit to 0. This means a read of this bit by the NMI exception handler returns 1 only if the
        /// NMI signal is reasserted while the processor is executing that handler.
        @ReadWrite(bits: 31..<32, as: Bool.self)
        public var nmipendset: NMIPENDSET_Field

        /// PendSV set-pending bit.
        /// Write:
        /// 0 = No effect.
        /// 1 = Changes PendSV exception state to pending.
        /// Read:
        /// 0 = PendSV exception is not pending.
        /// 1 = PendSV exception is pending.
        /// Writing 1 to this bit is the only way to set the PendSV exception state to pending.
        @ReadWrite(bits: 28..<29, as: Bool.self)
        public var pendsvset: PENDSVSET_Field

        /// PendSV clear-pending bit.
        /// Write:
        /// 0 = No effect.
        /// 1 = Removes the pending state from the PendSV exception.
        @ReadWrite(bits: 27..<28, as: Bool.self)
        public var pendsvclr: PENDSVCLR_Field

        /// SysTick exception set-pending bit.
        /// Write:
        /// 0 = No effect.
        /// 1 = Changes SysTick exception state to pending.
        /// Read:
        /// 0 = SysTick exception is not pending.
        /// 1 = SysTick exception is pending.
        @ReadWrite(bits: 26..<27, as: Bool.self)
        public var pendstset: PENDSTSET_Field

        /// SysTick exception clear-pending bit.
        /// Write:
        /// 0 = No effect.
        /// 1 = Removes the pending state from the SysTick exception.
        /// This bit is WO. On a register read its value is Unknown.
        @ReadWrite(bits: 25..<26, as: Bool.self)
        public var pendstclr: PENDSTCLR_Field

        /// The system can only access this bit when the core is halted. It indicates that a pending interrupt is to be taken in the next running cycle. If C_MASKINTS is clear in the Debug Halting Control and Status Register, the interrupt is serviced.
        @ReadOnly(bits: 23..<24, as: Bool.self)
        public var isrpreempt: ISRPREEMPT_Field

        /// External interrupt pending flag
        @ReadOnly(bits: 22..<23, as: Bool.self)
        public var isrpending: ISRPENDING_Field

        /// Indicates the exception number for the highest priority pending exception: 0 = no pending exceptions. Non zero = The pending state includes the effect of memory-mapped enable and mask registers. It does not include the PRIMASK special-purpose register qualifier.
        @ReadOnly(bits: 12..<21, as: BitField9.self)
        public var vectpending: VECTPENDING_Field

        /// Active exception number field. Reset clears the VECTACTIVE field.
        @ReadOnly(bits: 0..<9, as: BitField9.self)
        public var vectactive: VECTACTIVE_Field
    }

    /// The VTOR holds the vector table offset address.
    @RegisterBank(offset: 0xed08)
    public var vtor: Register<VTOR>

    @Register(bitWidth: 32)
    public struct VTOR {
        /// Bits [31:8] of the indicate the vector table offset address.
        @ReadWrite(bits: 8..<32, as: BitField24.self)
        public var tbloff: TBLOFF_Field
    }

    /// Use the Application Interrupt and Reset Control Register to: determine data endianness, clear all active state information from debug halt mode, request a system reset.
    @RegisterBank(offset: 0xed0c)
    public var aircr: Register<AIRCR>

    @Register(bitWidth: 32)
    public struct AIRCR {
        /// Register key:
        /// Reads as Unknown
        /// On writes, write 0x05FA to VECTKEY, otherwise the write is ignored.
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var vectkey: VECTKEY_Field

        /// Data endianness implemented:
        /// 0 = Little-endian.
        @ReadOnly(bits: 15..<16, as: Bool.self)
        public var endianess: ENDIANESS_Field

        /// Writing 1 to this bit causes the SYSRESETREQ signal to the outer system to be asserted to request a reset. The intention is to force a large system reset of all major components except for debug. The C_HALT bit in the DHCSR is cleared as a result of the system reset requested. The debugger does not lose contact with the device.
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var sysresetreq: SYSRESETREQ_Field

        /// Clears all active state information for fixed and configurable exceptions. This bit: is self-clearing, can only be set by the DAP when the core is halted.  When set: clears all active exception status of the processor, forces a return to Thread mode, forces an IPSR of 0. A debugger must re-initialize the stack.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var vectclractive: VECTCLRACTIVE_Field
    }

    /// System Control Register. Use the System Control Register for power-management functions: signal to the system when the processor can enter a low power state, control how the processor enters and exits low power states.
    @RegisterBank(offset: 0xed10)
    public var scr: Register<SCR>

    @Register(bitWidth: 32)
    public struct SCR {
        /// Send Event on Pending bit:
        /// 0 = Only enabled interrupts or events can wakeup the processor, disabled interrupts are excluded.
        /// 1 = Enabled events and all interrupts, including disabled interrupts, can wakeup the processor.
        /// When an event or interrupt becomes pending, the event signal wakes up the processor from WFE. If the
        /// processor is not waiting for an event, the event is registered and affects the next WFE.
        /// The processor also wakes up on execution of an SEV instruction or an external event.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var sevonpend: SEVONPEND_Field

        /// Controls whether the processor uses sleep or deep sleep as its low power mode:
        /// 0 = Sleep.
        /// 1 = Deep sleep.
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var sleepdeep: SLEEPDEEP_Field

        /// Indicates sleep-on-exit when returning from Handler mode to Thread mode:
        /// 0 = Do not sleep when returning to Thread mode.
        /// 1 = Enter sleep, or deep sleep, on return from an ISR to Thread mode.
        /// Setting this bit to 1 enables an interrupt driven application to avoid returning to an empty main application.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var sleeponexit: SLEEPONEXIT_Field
    }

    /// The Configuration and Control Register permanently enables stack alignment and causes unaligned accesses to result in a Hard Fault.
    @RegisterBank(offset: 0xed14)
    public var ccr: Register<CCR>

    @Register(bitWidth: 32)
    public struct CCR {
        /// Always reads as one, indicates 8-byte stack alignment on exception entry. On exception entry, the processor uses bit[9] of the stacked PSR to indicate the stack alignment. On return from the exception it uses this stacked bit to restore the correct stack alignment.
        @ReadOnly(bits: 9..<10, as: Bool.self)
        public var stkalign: STKALIGN_Field

        /// Always reads as one, indicates that all unaligned accesses generate a HardFault.
        @ReadOnly(bits: 3..<4, as: Bool.self)
        public var unalign_trp: UNALIGN_TRP_Field
    }

    /// System handlers are a special class of exception handler that can have their priority set to any of the priority levels. Use the System Handler Priority Register 2 to set the priority of SVCall.
    @RegisterBank(offset: 0xed1c)
    public var shpr2: Register<SHPR2>

    @Register(bitWidth: 32)
    public struct SHPR2 {
        /// Priority of system handler 11, SVCall
        @ReadWrite(bits: 30..<32, as: BitField2.self)
        public var pri_11: PRI_11_Field
    }

    /// System handlers are a special class of exception handler that can have their priority set to any of the priority levels. Use the System Handler Priority Register 3 to set the priority of PendSV and SysTick.
    @RegisterBank(offset: 0xed20)
    public var shpr3: Register<SHPR3>

    @Register(bitWidth: 32)
    public struct SHPR3 {
        /// Priority of system handler 15, SysTick
        @ReadWrite(bits: 30..<32, as: BitField2.self)
        public var pri_15: PRI_15_Field

        /// Priority of system handler 14, PendSV
        @ReadWrite(bits: 22..<24, as: BitField2.self)
        public var pri_14: PRI_14_Field
    }

    /// Use the System Handler Control and State Register to determine or clear the pending status of SVCall.
    @RegisterBank(offset: 0xed24)
    public var shcsr: Register<SHCSR>

    @Register(bitWidth: 32)
    public struct SHCSR {
        /// Reads as 1 if SVCall is Pending.  Write 1 to set pending SVCall, write 0 to clear pending SVCall.
        @ReadWrite(bits: 15..<16, as: Bool.self)
        public var svcallpended: SVCALLPENDED_Field
    }

    /// Read the MPU Type Register to determine if the processor implements an MPU, and how many regions the MPU supports.
    @RegisterBank(offset: 0xed90)
    public var mpu_type: Register<MPU_TYPE>

    @Register(bitWidth: 32)
    public struct MPU_TYPE {
        /// Instruction region. Reads as zero as ARMv6-M only supports a unified MPU.
        @ReadOnly(bits: 16..<24, as: BitField8.self)
        public var iregion: IREGION_Field

        /// Number of regions supported by the MPU.
        @ReadOnly(bits: 8..<16, as: BitField8.self)
        public var dregion: DREGION_Field

        /// Indicates support for separate instruction and data address maps. Reads as 0 as ARMv6-M only supports a unified MPU.
        @ReadOnly(bits: 0..<1, as: Bool.self)
        public var separate: SEPARATE_Field
    }

    /// Use the MPU Control Register to enable and disable the MPU, and to control whether the default memory map is enabled as a background region for privileged accesses, and whether the MPU is enabled for HardFaults and NMIs.
    @RegisterBank(offset: 0xed94)
    public var mpu_ctrl: Register<MPU_CTRL>

    @Register(bitWidth: 32)
    public struct MPU_CTRL {
        /// Controls whether the default memory map is enabled as a background region for privileged accesses. This bit is ignored when ENABLE is clear.
        /// 0 = If the MPU is enabled, disables use of the default memory map. Any memory access to a location not
        /// covered by any enabled region causes a fault.
        /// 1 = If the MPU is enabled, enables use of the default memory map as a background region for privileged software accesses.
        /// When enabled, the background region acts as if it is region number -1. Any region that is defined and enabled has priority over this default map.
        @ReadWrite(bits: 2..<3, as: Bool.self)
        public var privdefena: PRIVDEFENA_Field

        /// Controls the use of the MPU for HardFaults and NMIs. Setting this bit when ENABLE is clear results in UNPREDICTABLE behaviour.
        /// When the MPU is enabled:
        /// 0 = MPU is disabled during HardFault and NMI handlers, regardless of the value of the ENABLE bit.
        /// 1 = the MPU is enabled during HardFault and NMI handlers.
        @ReadWrite(bits: 1..<2, as: Bool.self)
        public var hfnmiena: HFNMIENA_Field

        /// Enables the MPU. If the MPU is disabled, privileged and unprivileged accesses use the default memory map.
        /// 0 = MPU disabled.
        /// 1 = MPU enabled.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var enable: ENABLE_Field
    }

    /// Use the MPU Region Number Register to select the region currently accessed by MPU_RBAR and MPU_RASR.
    @RegisterBank(offset: 0xed98)
    public var mpu_rnr: Register<MPU_RNR>

    @Register(bitWidth: 32)
    public struct MPU_RNR {
        /// Indicates the MPU region referenced by the MPU_RBAR and MPU_RASR registers.
        /// The MPU supports 8 memory regions, so the permitted values of this field are 0-7.
        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var region: REGION_Field
    }

    /// Read the MPU Region Base Address Register to determine the base address of the region identified by MPU_RNR. Write to update the base address of said region or that of a specified region, with whose number MPU_RNR will also be updated.
    @RegisterBank(offset: 0xed9c)
    public var mpu_rbar: Register<MPU_RBAR>

    @Register(bitWidth: 32)
    public struct MPU_RBAR {
        /// Base address of the region.
        @ReadWrite(bits: 8..<32, as: BitField24.self)
        public var addr: ADDR_Field

        /// On writes, indicates whether the write must update the base address of the region identified by the REGION field, updating the MPU_RNR to indicate this new region.
        /// Write:
        /// 0 = MPU_RNR not changed, and the processor:
        /// Updates the base address for the region specified in the MPU_RNR.
        /// Ignores the value of the REGION field.
        /// 1 = The processor:
        /// Updates the value of the MPU_RNR to the value of the REGION field.
        /// Updates the base address for the region specified in the REGION field.
        /// Always reads as zero.
        @ReadWrite(bits: 4..<5, as: Bool.self)
        public var valid: VALID_Field

        /// On writes, specifies the number of the region whose base address to update provided VALID is set written as 1. On reads, returns bits [3:0] of MPU_RNR.
        @ReadWrite(bits: 0..<4, as: BitField4.self)
        public var region: REGION_Field
    }

    /// Use the MPU Region Attribute and Size Register to define the size, access behaviour and memory type of the region identified by MPU_RNR, and enable that region.
    @RegisterBank(offset: 0xeda0)
    public var mpu_rasr: Register<MPU_RASR>

    @Register(bitWidth: 32)
    public struct MPU_RASR {
        /// The MPU Region Attribute field. Use to define the region attribute control.
        /// 28 = XN: Instruction access disable bit:
        /// 0 = Instruction fetches enabled.
        /// 1 = Instruction fetches disabled.
        /// 26:24 = AP: Access permission field
        /// 18 = S: Shareable bit
        /// 17 = C: Cacheable bit
        /// 16 = B: Bufferable bit
        @ReadWrite(bits: 16..<32, as: BitField16.self)
        public var attrs: ATTRS_Field

        /// Subregion Disable. For regions of 256 bytes or larger, each bit of this field controls whether one of the eight equal subregions is enabled.
        @ReadWrite(bits: 8..<16, as: BitField8.self)
        public var srd: SRD_Field

        /// Indicates the region size. Region size in bytes = 2^(SIZE+1). The minimum permitted value is 7 (b00111) = 256Bytes
        @ReadWrite(bits: 1..<6, as: BitField5.self)
        public var size: SIZE_Field

        /// Enables the region.
        @ReadWrite(bits: 0..<1, as: Bool.self)
        public var enable: ENABLE_Field
    }
}
