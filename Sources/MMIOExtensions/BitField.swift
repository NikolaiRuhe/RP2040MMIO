import MMIO

/// A bitfield value type. Serves as a value for register bit fields.
/// Provides bitwise access.
public struct BitField<Config: BitFieldWidth>: RawRepresentable, BitFieldProjectable, ExpressibleByIntegerLiteral, CustomStringConvertible, Equatable, Hashable, Codable {
    public var rawValue: UInt
    public init?(rawValue: UInt) { self.init(integerLiteral: rawValue) }

    public init(integerLiteral value: UInt) {
        if UInt.bitWidth - value.leadingZeroBitCount > Self.bitWidth {
            preconditionFailure("integer literal out of range: \(value)")
        }
        self.rawValue = UInt(value)
    }

    public static var bitWidth: Int { Config.bitWidth }

    public var description: String {
        let hex = String(rawValue, radix: 16)
        let paddingZeroCount = max(0, hex.count - (Self.bitWidth + 3) / 4)
        return "0x" + String(repeating: "0", count: paddingZeroCount) + hex
    }

    /// Bitwise access to the field's bits. Bit numbers start at 0, even when
    /// the original registers's field does not start at bit 0.
    public subscript(_ bitNum: Int) -> Bool {
        get {
            precondition((0 ... Self.bitWidth).contains(bitNum), "BitField index out of range: \(bitNum)")
            return rawValue & (1 << bitNum) != 0
        }
        set {
            precondition((0 ... Self.bitWidth).contains(bitNum), "BitField index out of range: \(bitNum)")
            if newValue {
                rawValue |= 1 << bitNum
            } else {
                rawValue &= ~(1 << bitNum)
            }
        }
    }
}


public protocol BitFieldWidth {
    static var bitWidth: Int { get }
}

public enum BitFieldWidth1: BitFieldWidth { public static var bitWidth: Int { 1 } }
public typealias BitField1 = BitField<BitFieldWidth1>
public enum BitFieldWidth2: BitFieldWidth { public static var bitWidth: Int { 2 } }
public typealias BitField2 = BitField<BitFieldWidth2>
public enum BitFieldWidth3: BitFieldWidth { public static var bitWidth: Int { 3 } }
public typealias BitField3 = BitField<BitFieldWidth3>
public enum BitFieldWidth4: BitFieldWidth { public static var bitWidth: Int { 4 } }
public typealias BitField4 = BitField<BitFieldWidth4>
public enum BitFieldWidth5: BitFieldWidth { public static var bitWidth: Int { 5 } }
public typealias BitField5 = BitField<BitFieldWidth5>
public enum BitFieldWidth6: BitFieldWidth { public static var bitWidth: Int { 6 } }
public typealias BitField6 = BitField<BitFieldWidth6>
public enum BitFieldWidth7: BitFieldWidth { public static var bitWidth: Int { 7 } }
public typealias BitField7 = BitField<BitFieldWidth7>
public enum BitFieldWidth8: BitFieldWidth { public static var bitWidth: Int { 8 } }
public typealias BitField8 = BitField<BitFieldWidth8>
public enum BitFieldWidth9: BitFieldWidth { public static var bitWidth: Int { 9 } }
public typealias BitField9 = BitField<BitFieldWidth9>
public enum BitFieldWidth10: BitFieldWidth { public static var bitWidth: Int { 10 } }
public typealias BitField10 = BitField<BitFieldWidth10>
public enum BitFieldWidth11: BitFieldWidth { public static var bitWidth: Int { 11 } }
public typealias BitField11 = BitField<BitFieldWidth11>
public enum BitFieldWidth12: BitFieldWidth { public static var bitWidth: Int { 12 } }
public typealias BitField12 = BitField<BitFieldWidth12>
public enum BitFieldWidth13: BitFieldWidth { public static var bitWidth: Int { 13 } }
public typealias BitField13 = BitField<BitFieldWidth13>
public enum BitFieldWidth14: BitFieldWidth { public static var bitWidth: Int { 14 } }
public typealias BitField14 = BitField<BitFieldWidth14>
public enum BitFieldWidth15: BitFieldWidth { public static var bitWidth: Int { 15 } }
public typealias BitField15 = BitField<BitFieldWidth15>
public enum BitFieldWidth16: BitFieldWidth { public static var bitWidth: Int { 16 } }
public typealias BitField16 = BitField<BitFieldWidth16>
public enum BitFieldWidth17: BitFieldWidth { public static var bitWidth: Int { 17 } }
public typealias BitField17 = BitField<BitFieldWidth17>
public enum BitFieldWidth18: BitFieldWidth { public static var bitWidth: Int { 18 } }
public typealias BitField18 = BitField<BitFieldWidth18>
public enum BitFieldWidth19: BitFieldWidth { public static var bitWidth: Int { 19 } }
public typealias BitField19 = BitField<BitFieldWidth19>
public enum BitFieldWidth20: BitFieldWidth { public static var bitWidth: Int { 20 } }
public typealias BitField20 = BitField<BitFieldWidth20>
public enum BitFieldWidth21: BitFieldWidth { public static var bitWidth: Int { 21 } }
public typealias BitField21 = BitField<BitFieldWidth21>
public enum BitFieldWidth22: BitFieldWidth { public static var bitWidth: Int { 22 } }
public typealias BitField22 = BitField<BitFieldWidth22>
public enum BitFieldWidth23: BitFieldWidth { public static var bitWidth: Int { 23 } }
public typealias BitField23 = BitField<BitFieldWidth23>
public enum BitFieldWidth24: BitFieldWidth { public static var bitWidth: Int { 24 } }
public typealias BitField24 = BitField<BitFieldWidth24>
public enum BitFieldWidth25: BitFieldWidth { public static var bitWidth: Int { 25 } }
public typealias BitField25 = BitField<BitFieldWidth25>
public enum BitFieldWidth26: BitFieldWidth { public static var bitWidth: Int { 26 } }
public typealias BitField26 = BitField<BitFieldWidth26>
public enum BitFieldWidth27: BitFieldWidth { public static var bitWidth: Int { 27 } }
public typealias BitField27 = BitField<BitFieldWidth27>
public enum BitFieldWidth28: BitFieldWidth { public static var bitWidth: Int { 28 } }
public typealias BitField28 = BitField<BitFieldWidth28>
public enum BitFieldWidth29: BitFieldWidth { public static var bitWidth: Int { 29 } }
public typealias BitField29 = BitField<BitFieldWidth29>
public enum BitFieldWidth30: BitFieldWidth { public static var bitWidth: Int { 30 } }
public typealias BitField30 = BitField<BitFieldWidth30>
public enum BitFieldWidth31: BitFieldWidth { public static var bitWidth: Int { 31 } }
public typealias BitField31 = BitField<BitFieldWidth31>
public enum BitFieldWidth32: BitFieldWidth { public static var bitWidth: Int { 32 } }
public typealias BitField32 = BitField<BitFieldWidth32>
