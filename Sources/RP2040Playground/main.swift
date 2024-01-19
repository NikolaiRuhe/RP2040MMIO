import MMIO
import MMIOExtensions
import RP2040MMIO


// Not sure how to get the size of a register bank.
let registerCount = Int(RP2040MMIO.XOSC(unsafeAddress: 0).COUNT.unsafeAddress) / 4 + 1
let mockRegisterBank = UnsafeMutableBufferPointer<UInt32>.allocate(capacity: registerCount)
mockRegisterBank.initialize(repeating: 0)

// Initialize to reset values.
mockRegisterBank[0] = 0x00fabaa0

let XOSC = RP2040MMIO.XOSC(unsafeAddress: UInt(bitPattern: mockRegisterBank.baseAddress!))

// Modify some value
XOSC.COUNT.modify { $0.COUNT = 127 }

// Print various register field contents
print("XOSC.CTRL.ENABLE: \(XOSC.CTRL.read().ENABLE)")
print("XOSC.CTRL.FREQ_RANGE: \(XOSC.CTRL.read().FREQ_RANGE)")
print("XOSC.STATUS.BADWRITE: \(XOSC.STATUS.read().BADWRITE)")
print("XOSC.STATUS.ENABLED: \(XOSC.STATUS.read().ENABLED)")
print("XOSC.STATUS.STABLE: \(XOSC.STATUS.read().STABLE)")
print("XOSC.STATUS.FREQ_RANGE: \(XOSC.STATUS.read().FREQ_RANGE)")
print("XOSC.COUNT.COUNT: \(XOSC.COUNT.read().COUNT)")

mockRegisterBank.deinitialize()
mockRegisterBank.deallocate()

