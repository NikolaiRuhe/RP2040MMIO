### RP2040MMIO

Raspberry Pi RP2040 Peripheral Access Package based on Swift MMIO.

This currently is a playground for me to test Swift access to memory mapped
registers on the RP2040. It contains an MMIO based interface to all of RP2040's
registers. The interface files in Sources/RP2040MMIO are generated from the
RP2040's SVD file.

Here's the code generation tool: https://github.com/NikolaiRuhe/SVDSwiftMMIO
