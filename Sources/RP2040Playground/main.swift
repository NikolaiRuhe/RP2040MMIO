import MMIO
import MMIOExtensions
import RP2040MMIO


// Not sure how to get the size of a register bank.
let registerCount = Int(XOSC(unsafeAddress: 0).count.unsafeAddress) / 4 + 1
let mockRegisterBank = UnsafeMutableBufferPointer<UInt32>.allocate(capacity: registerCount)
mockRegisterBank.initialize(repeating: 0)

// Initialize to reset values.
mockRegisterBank[0] = 0x00fabaa0

let xosc = XOSC(unsafeAddress: UInt(bitPattern: mockRegisterBank.baseAddress!))

// Modify some value
xosc.count.modify { $0.count = 127 }

// Print various register field contents
print("XOSC.ctrl.enable: \(xosc.ctrl.read().enable)")
print("XOSC.ctrl.freq_range: \(xosc.ctrl.read().freq_range)")
print("XOSC.status.badwrite: \(xosc.status.read().badwrite)")
print("XOSC.status.enabled: \(xosc.status.read().enabled)")
print("XOSC.status.stable: \(xosc.status.read().stable)")
print("XOSC.status.freq_range: \(xosc.status.read().freq_range)")
print("XOSC.count.count: \(xosc.count.read().count)")

mockRegisterBank.deinitialize()
mockRegisterBank.deallocate()

