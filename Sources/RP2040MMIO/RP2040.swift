// RP2040 System View Description

import MMIO
import MMIOExtensions

/// Dual-core Arm Cortex-M0+ processor, flexible clock running up to 133 MHz
/// 264KB on-chip SRAM
/// 2 x UART, 2 x SPI controllers, 2 x I2C controllers, 16 x PWM channels
/// 1 x USB 1.1 controller and PHY, with host and device support
/// 8 x Programmable I/O (PIO) state machines for custom peripheral support
/// Supported input power 1.8-5.5V DC
/// Operating temperature -20C to +85C
/// Drag-and-drop programming using mass storage over USB
/// Low-power sleep and dormant modes
/// Accurate on-chip clock
/// Temperature sensor
/// Accelerated integer and floating-point libraries on-chip

public enum RP2040 {}