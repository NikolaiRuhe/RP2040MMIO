import MMIO

extension RawRepresentable where RawValue: FixedWidthInteger & UnsignedInteger {
    public init<Storage>(storage: Storage) where Storage: FixedWidthInteger & UnsignedInteger {
        guard let value = Self(rawValue: RawValue(storage)) else {
            preconditionFailure("unexpected field value: \(storage)")
        }
        self = value
    }

    public func storage<Storage>(_: Storage.Type) -> Storage where Storage: FixedWidthInteger & UnsignedInteger {
        Storage(rawValue)
    }
}
