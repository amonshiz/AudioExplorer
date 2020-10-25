sil_stage canonical

import Builtin
import Swift
import SwiftShims

import Foundation

import CoreAudio

import OSLog

extension AudioObjectPropertyAddress : CustomStringConvertible {
  public var description: String { get }
}

internal struct PropertyProviderFunctions {
  @_hasStorage let hasCheck: (UInt32, UnsafePointer<AudioObjectPropertyAddress>) -> Bool { get }
  @_hasStorage let dataSize: (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, UnsafeRawPointer?, UnsafeMutablePointer<UInt32>) -> Int32 { get }
  @_hasStorage let getData: (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, UnsafeRawPointer?, UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) -> Int32 { get }
  @_hasStorage let isSettable: (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UnsafeMutablePointer<DarwinBoolean>) -> Int32 { get }
  @_hasStorage let setData: (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, UnsafeRawPointer?, UInt32, UnsafeRawPointer) -> Int32 { get }
  @_hasStorage let noErrorValue: Int32 { get }
  @_hasStorage @_hasInitialValue static let standard: PropertyProviderFunctions { get }
  init(hasCheck: @escaping (UInt32, UnsafePointer<AudioObjectPropertyAddress>) -> Bool, dataSize: @escaping (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, UnsafeRawPointer?, UnsafeMutablePointer<UInt32>) -> Int32, getData: @escaping (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, UnsafeRawPointer?, UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) -> Int32, isSettable: @escaping (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UnsafeMutablePointer<DarwinBoolean>) -> Int32, setData: @escaping (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, UnsafeRawPointer?, UInt32, UnsafeRawPointer) -> Int32, noErrorValue: Int32)
}

extension DeviceProperty where Base == Output.Element, Output : Collection {
  func outputTransform(_ holder: UnsafeMutablePointer<Base>, count: Int) -> Output?
}

extension DeviceProperty {
  func outputTransform(_ holder: UnsafeMutablePointer<Base>, count: Int) -> Output?
}

@propertyWrapper struct DeviceProperty<Base, Output> {
  @_hasStorage @_hasInitialValue var id: UInt32 { get set }
  @_hasStorage private let description: AudioDevicePropertyDescription<Base> { get }
  @_hasStorage private let providers: PropertyProviderFunctions { get }
  @_hasStorage @_hasInitialValue private let logger: Logger { get }
  init(_ description: AudioDevicePropertyDescription<Base>, providers functions: PropertyProviderFunctions = .standard)
  var wrappedValue: Output? { get }
}

@propertyWrapper struct MutableDeviceProperty<Base, Output> {
  @_hasStorage @_hasInitialValue var id: UInt32 { get set }
  @_hasStorage private let description: AudioDevicePropertyDescription<Base> { get }
  @_hasStorage private let providers: PropertyProviderFunctions { get }
  @_hasStorage @_hasInitialValue private let logger: Logger { get }
  init(_ description: AudioDevicePropertyDescription<Base>, providers functions: PropertyProviderFunctions = .standard)
  var wrappedValue: Output? { get set }
}

// globalinit_026_960A3D0F904E7B0BBE7492682A5ABBDF_token0
sil_global private @globalinit_026_960A3D0F904E7B0BBE7492682A5ABBDF_token0 : $Builtin.Word

// static PropertyProviderFunctions.standard
sil_global [let] @$s13AudioExplorer25PropertyProviderFunctionsV8standardACvpZ : $PropertyProviderFunctions

// __dso_handle
sil_global @__dso_handle : $Builtin.RawPointer

// _swiftEmptyArrayStorage
sil_global @_swiftEmptyArrayStorage : $_SwiftEmptyArrayStorage

// AudioObjectPropertyAddress.description.getter
sil @$sSo26AudioObjectPropertyAddressV0A8ExplorerE11descriptionSSvg : $@convention(method) (AudioObjectPropertyAddress) -> @owned String {
// %0 "self"                                      // users: %45, %37, %21, %1
bb0(%0 : $AudioObjectPropertyAddress):
  debug_value %0 : $AudioObjectPropertyAddress, let, name "self", argno 1 // id: %1
  %2 = alloc_stack $DefaultStringInterpolation, var, name "$interpolation" // users: %58, %20, %26, %36, %41, %44, %49, %57, %11, %60
  %3 = integer_literal $Builtin.Int64, 0          // user: %4
  %4 = struct $UInt64 (%3 : $Builtin.Int64)       // user: %7
  %5 = integer_literal $Builtin.Int64, -2305843009213693952 // user: %6
  %6 = value_to_bridge_object %5 : $Builtin.Int64 // user: %7
  %7 = struct $_StringObject (%4 : $UInt64, %6 : $Builtin.BridgeObject) // user: %8
  %8 = struct $_StringGuts (%7 : $_StringObject)  // user: %9
  %9 = struct $String (%8 : $_StringGuts)         // user: %10
  %10 = struct $DefaultStringInterpolation (%9 : $String) // user: %11
  store %10 to %2 : $*DefaultStringInterpolation  // id: %11
  %12 = integer_literal $Builtin.Int64, 60        // user: %13
  %13 = struct $UInt64 (%12 : $Builtin.Int64)     // user: %16
  %14 = integer_literal $Builtin.Int64, -2233785415175766016 // user: %15
  %15 = value_to_bridge_object %14 : $Builtin.Int64 // users: %54, %16
  %16 = struct $_StringObject (%13 : $UInt64, %15 : $Builtin.BridgeObject) // user: %17
  %17 = struct $_StringGuts (%16 : $_StringObject) // user: %18
  %18 = struct $String (%17 : $_StringGuts)       // user: %20
  // function_ref String.write<A>(to:)
  %19 = function_ref @$sSS5write2toyxz_ts16TextOutputStreamRzlF : $@convention(method) <τ_0_0 where τ_0_0 : TextOutputStream> (@inout τ_0_0, @guaranteed String) -> () // users: %57, %49, %44, %41, %36, %26, %20
  %20 = apply %19<DefaultStringInterpolation>(%2, %18) : $@convention(method) <τ_0_0 where τ_0_0 : TextOutputStream> (@inout τ_0_0, @guaranteed String) -> ()
  %21 = struct_extract %0 : $AudioObjectPropertyAddress, #AudioObjectPropertyAddress.mSelector // user: %23
  %22 = alloc_stack $UInt32                       // users: %28, %25, %23
  store %21 to %22 : $*UInt32                     // id: %23
  // function_ref BinaryInteger.description.getter
  %24 = function_ref @$sSzsE11descriptionSSvg : $@convention(method) <τ_0_0 where τ_0_0 : BinaryInteger> (@in_guaranteed τ_0_0) -> @owned String // users: %48, %40, %25
  %25 = apply %24<UInt32>(%22) : $@convention(method) <τ_0_0 where τ_0_0 : BinaryInteger> (@in_guaranteed τ_0_0) -> @owned String // users: %27, %26
  %26 = apply %19<DefaultStringInterpolation>(%2, %25) : $@convention(method) <τ_0_0 where τ_0_0 : TextOutputStream> (@inout τ_0_0, @guaranteed String) -> ()
  release_value %25 : $String                     // id: %27
  dealloc_stack %22 : $*UInt32                    // id: %28
  %29 = integer_literal $Builtin.Int64, 2112032   // user: %30
  %30 = struct $UInt64 (%29 : $Builtin.Int64)     // user: %33
  %31 = integer_literal $Builtin.Int64, -2089670227099910144 // user: %32
  %32 = value_to_bridge_object %31 : $Builtin.Int64 // user: %33
  %33 = struct $_StringObject (%30 : $UInt64, %32 : $Builtin.BridgeObject) // user: %34
  %34 = struct $_StringGuts (%33 : $_StringObject) // user: %35
  %35 = struct $String (%34 : $_StringGuts)       // users: %44, %36
  %36 = apply %19<DefaultStringInterpolation>(%2, %35) : $@convention(method) <τ_0_0 where τ_0_0 : TextOutputStream> (@inout τ_0_0, @guaranteed String) -> ()
  %37 = struct_extract %0 : $AudioObjectPropertyAddress, #AudioObjectPropertyAddress.mScope // user: %39
  %38 = alloc_stack $UInt32                       // users: %43, %40, %39
  store %37 to %38 : $*UInt32                     // id: %39
  %40 = apply %24<UInt32>(%38) : $@convention(method) <τ_0_0 where τ_0_0 : BinaryInteger> (@in_guaranteed τ_0_0) -> @owned String // users: %42, %41
  %41 = apply %19<DefaultStringInterpolation>(%2, %40) : $@convention(method) <τ_0_0 where τ_0_0 : TextOutputStream> (@inout τ_0_0, @guaranteed String) -> ()
  release_value %40 : $String                     // id: %42
  dealloc_stack %38 : $*UInt32                    // id: %43
  %44 = apply %19<DefaultStringInterpolation>(%2, %35) : $@convention(method) <τ_0_0 where τ_0_0 : TextOutputStream> (@inout τ_0_0, @guaranteed String) -> ()
  %45 = struct_extract %0 : $AudioObjectPropertyAddress, #AudioObjectPropertyAddress.mElement // user: %47
  %46 = alloc_stack $UInt32                       // users: %51, %48, %47
  store %45 to %46 : $*UInt32                     // id: %47
  %48 = apply %24<UInt32>(%46) : $@convention(method) <τ_0_0 where τ_0_0 : BinaryInteger> (@in_guaranteed τ_0_0) -> @owned String // users: %50, %49
  %49 = apply %19<DefaultStringInterpolation>(%2, %48) : $@convention(method) <τ_0_0 where τ_0_0 : TextOutputStream> (@inout τ_0_0, @guaranteed String) -> ()
  release_value %48 : $String                     // id: %50
  dealloc_stack %46 : $*UInt32                    // id: %51
  %52 = integer_literal $Builtin.Int64, 62        // user: %53
  %53 = struct $UInt64 (%52 : $Builtin.Int64)     // user: %54
  %54 = struct $_StringObject (%53 : $UInt64, %15 : $Builtin.BridgeObject) // user: %55
  %55 = struct $_StringGuts (%54 : $_StringObject) // user: %56
  %56 = struct $String (%55 : $_StringGuts)       // user: %57
  %57 = apply %19<DefaultStringInterpolation>(%2, %56) : $@convention(method) <τ_0_0 where τ_0_0 : TextOutputStream> (@inout τ_0_0, @guaranteed String) -> ()
  %58 = struct_element_addr %2 : $*DefaultStringInterpolation, #DefaultStringInterpolation._storage // user: %59
  %59 = load %58 : $*String                       // user: %61
  dealloc_stack %2 : $*DefaultStringInterpolation // id: %60
  return %59 : $String                            // id: %61
} // end sil function '$sSo26AudioObjectPropertyAddressV0A8ExplorerE11descriptionSSvg'

// String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)
sil public_external [always_inline] [readonly] [_semantics "string.makeUTF8"] @$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String {
// %0                                             // users: %131, %75, %26
// %1                                             // user: %4
// %2                                             // user: %122
bb0(%0 : $Builtin.RawPointer, %1 : $Builtin.Word, %2 : $Builtin.Int1, %3 : $@thin String.Type):
  %4 = builtin "sextOrBitCast_Word_Int64"(%1 : $Builtin.Word) : $Builtin.Int64 // users: %16, %125, %123, %116, %62, %52, %14, %11, %8, %6
  %5 = integer_literal $Builtin.Int64, 0          // users: %28, %79, %8, %19, %21, %55, %57, %60, %64, %68, %70, %101, %108, %144, %81, %81, %81, %30, %30, %30, %6
  %6 = builtin "cmp_slt_Int64"(%4 : $Builtin.Int64, %5 : $Builtin.Int64) : $Builtin.Int1 // user: %7
  cond_fail %6 : $Builtin.Int1, "UnsafeBufferPointer with negative count" // id: %7
  %8 = builtin "cmp_eq_Int64"(%4 : $Builtin.Int64, %5 : $Builtin.Int64) : $Builtin.Int1 // user: %9
  cond_br %8, bb30, bb1                           // id: %9

bb1:                                              // Preds: bb0
  %10 = integer_literal $Builtin.Int64, 15        // user: %11
  %11 = builtin "cmp_slt_Int64"(%10 : $Builtin.Int64, %4 : $Builtin.Int64) : $Builtin.Int1 // user: %12
  cond_br %11, bb26, bb2                          // id: %12

bb2:                                              // Preds: bb1
  %13 = integer_literal $Builtin.Int64, 8         // users: %17, %97, %62, %52, %46, %14
  %14 = builtin "cmp_slt_Int64"(%13 : $Builtin.Int64, %4 : $Builtin.Int64) : $Builtin.Int1 // users: %56, %50, %15
  cond_br %14, bb4, bb3                           // id: %15

bb3:                                              // Preds: bb2
  br bb5(%4 : $Builtin.Int64)                     // id: %16

bb4:                                              // Preds: bb2
  br bb5(%13 : $Builtin.Int64)                    // id: %17

// %18                                            // users: %28, %19, %44, %21
bb5(%18 : $Builtin.Int64):                        // Preds: bb3 bb4
  %19 = builtin "cmp_slt_Int64"(%18 : $Builtin.Int64, %5 : $Builtin.Int64) : $Builtin.Int1 // user: %20
  cond_fail %19 : $Builtin.Int1, "Can't form Range with upperBound < lowerBound" // id: %20
  %21 = builtin "cmp_eq_Int64"(%18 : $Builtin.Int64, %5 : $Builtin.Int64) : $Builtin.Int1 // user: %22
  cond_br %21, bb12, bb6                          // id: %22

bb6:                                              // Preds: bb5
  %23 = integer_literal $Builtin.Int1, 0          // users: %52, %46
  %24 = integer_literal $Builtin.Int1, -1         // user: %34
  %25 = integer_literal $Builtin.Int64, 1         // user: %34
  %26 = pointer_to_address %0 : $Builtin.RawPointer to [strict] $*UInt8 // user: %37
  %27 = integer_literal $Builtin.Int64, 63        // user: %41
  %28 = builtin "cmp_sge_Int64"(%5 : $Builtin.Int64, %18 : $Builtin.Int64) : $Builtin.Int1 // user: %29
  cond_fail %28 : $Builtin.Int1, "loop induction variable overflowed" // id: %29
  br bb7(%5 : $Builtin.Int64, %5 : $Builtin.Int64, %5 : $Builtin.Int64) // id: %30

// %31                                            // user: %43
// %32                                            // users: %46, %41
// %33                                            // users: %36, %34
bb7(%31 : $Builtin.Int64, %32 : $Builtin.Int64, %33 : $Builtin.Int64): // Preds: bb8 bb6
  %34 = builtin "sadd_with_overflow_Int64"(%33 : $Builtin.Int64, %25 : $Builtin.Int64, %24 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // user: %35
  %35 = tuple_extract %34 : $(Builtin.Int64, Builtin.Int1), 0 // users: %48, %44
  %36 = builtin "truncOrBitCast_Int64_Word"(%33 : $Builtin.Int64) : $Builtin.Word // user: %37
  %37 = index_addr %26 : $*UInt8, %36 : $Builtin.Word // user: %38
  %38 = struct_element_addr %37 : $*UInt8, #UInt8._value // user: %39
  %39 = load %38 : $*Builtin.Int8                 // user: %40
  %40 = builtin "zextOrBitCast_Int8_Int64"(%39 : $Builtin.Int8) : $Builtin.Int64 // user: %42
  %41 = builtin "and_Int64"(%32 : $Builtin.Int64, %27 : $Builtin.Int64) : $Builtin.Int64 // user: %42
  %42 = builtin "shl_Int64"(%40 : $Builtin.Int64, %41 : $Builtin.Int64) : $Builtin.Int64 // user: %43
  %43 = builtin "or_Int64"(%31 : $Builtin.Int64, %42 : $Builtin.Int64) : $Builtin.Int64 // users: %48, %54, %51, %49
  %44 = builtin "cmp_eq_Int64"(%35 : $Builtin.Int64, %18 : $Builtin.Int64) : $Builtin.Int1 // user: %45
  cond_br %44, bb9, bb8                           // id: %45

bb8:                                              // Preds: bb7
  %46 = builtin "sadd_with_overflow_Int64"(%32 : $Builtin.Int64, %13 : $Builtin.Int64, %23 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // user: %47
  %47 = tuple_extract %46 : $(Builtin.Int64, Builtin.Int1), 0 // user: %48
  br bb7(%43 : $Builtin.Int64, %47 : $Builtin.Int64, %35 : $Builtin.Int64) // id: %48

bb9:                                              // Preds: bb7
  %49 = struct $UInt64 (%43 : $Builtin.Int64)     // users: %54, %51
  cond_br %14, bb11, bb10                         // id: %50

bb10:                                             // Preds: bb9
  br bb14(%43 : $Builtin.Int64, %49 : $UInt64)    // id: %51

bb11:                                             // Preds: bb9
  %52 = builtin "ssub_with_overflow_Int64"(%4 : $Builtin.Int64, %13 : $Builtin.Int64, %23 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // user: %53
  %53 = tuple_extract %52 : $(Builtin.Int64, Builtin.Int1), 0 // user: %54
  br bb16(%43 : $Builtin.Int64, %49 : $UInt64, %53 : $Builtin.Int64) // id: %54

bb12:                                             // Preds: bb5
  %55 = struct $UInt64 (%5 : $Builtin.Int64)      // users: %64, %57
  cond_br %14, bb15, bb13                         // id: %56

bb13:                                             // Preds: bb12
  br bb14(%5 : $Builtin.Int64, %55 : $UInt64)     // id: %57

// %58                                            // user: %60
// %59                                            // user: %60
bb14(%58 : $Builtin.Int64, %59 : $UInt64):        // Preds: bb13 bb10
  br bb22(%5 : $Builtin.Int64, %58 : $Builtin.Int64, %59 : $UInt64) // id: %60

bb15:                                             // Preds: bb12
  %61 = integer_literal $Builtin.Int1, 0          // user: %62
  %62 = builtin "ssub_with_overflow_Int64"(%4 : $Builtin.Int64, %13 : $Builtin.Int64, %61 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // user: %63
  %63 = tuple_extract %62 : $(Builtin.Int64, Builtin.Int1), 0 // user: %64
  br bb16(%5 : $Builtin.Int64, %55 : $UInt64, %63 : $Builtin.Int64) // id: %64

// %65                                            // users: %101, %100
// %66                                            // users: %101, %100
// %67                                            // users: %79, %95, %70, %68
bb16(%65 : $Builtin.Int64, %66 : $UInt64, %67 : $Builtin.Int64): // Preds: bb15 bb11
  %68 = builtin "cmp_slt_Int64"(%67 : $Builtin.Int64, %5 : $Builtin.Int64) : $Builtin.Int1 // user: %69
  cond_fail %68 : $Builtin.Int1, "Can't form Range with upperBound < lowerBound" // id: %69
  %70 = builtin "cmp_eq_Int64"(%67 : $Builtin.Int64, %5 : $Builtin.Int64) : $Builtin.Int1 // user: %71
  cond_br %70, bb21, bb17                         // id: %71

bb17:                                             // Preds: bb16
  %72 = integer_literal $Builtin.Int1, 0          // user: %97
  %73 = integer_literal $Builtin.Int1, -1         // user: %85
  %74 = integer_literal $Builtin.Int64, 1         // user: %85
  %75 = pointer_to_address %0 : $Builtin.RawPointer to [strict] $*UInt8 // user: %77
  %76 = integer_literal $Builtin.Word, 8          // user: %77
  %77 = index_addr %75 : $*UInt8, %76 : $Builtin.Word // user: %88
  %78 = integer_literal $Builtin.Int64, 63        // user: %92
  %79 = builtin "cmp_sge_Int64"(%5 : $Builtin.Int64, %67 : $Builtin.Int64) : $Builtin.Int1 // user: %80
  cond_fail %79 : $Builtin.Int1, "loop induction variable overflowed" // id: %80
  br bb18(%5 : $Builtin.Int64, %5 : $Builtin.Int64, %5 : $Builtin.Int64) // id: %81

// %82                                            // user: %94
// %83                                            // users: %97, %92
// %84                                            // users: %87, %85
bb18(%82 : $Builtin.Int64, %83 : $Builtin.Int64, %84 : $Builtin.Int64): // Preds: bb19 bb17
  %85 = builtin "sadd_with_overflow_Int64"(%84 : $Builtin.Int64, %74 : $Builtin.Int64, %73 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // user: %86
  %86 = tuple_extract %85 : $(Builtin.Int64, Builtin.Int1), 0 // users: %99, %95
  %87 = builtin "truncOrBitCast_Int64_Word"(%84 : $Builtin.Int64) : $Builtin.Word // user: %88
  %88 = index_addr %77 : $*UInt8, %87 : $Builtin.Word // user: %89
  %89 = struct_element_addr %88 : $*UInt8, #UInt8._value // user: %90
  %90 = load %89 : $*Builtin.Int8                 // user: %91
  %91 = builtin "zextOrBitCast_Int8_Int64"(%90 : $Builtin.Int8) : $Builtin.Int64 // user: %93
  %92 = builtin "and_Int64"(%83 : $Builtin.Int64, %78 : $Builtin.Int64) : $Builtin.Int64 // user: %93
  %93 = builtin "shl_Int64"(%91 : $Builtin.Int64, %92 : $Builtin.Int64) : $Builtin.Int64 // user: %94
  %94 = builtin "or_Int64"(%82 : $Builtin.Int64, %93 : $Builtin.Int64) : $Builtin.Int64 // users: %99, %100
  %95 = builtin "cmp_eq_Int64"(%86 : $Builtin.Int64, %67 : $Builtin.Int64) : $Builtin.Int1 // user: %96
  cond_br %95, bb20, bb19                         // id: %96

bb19:                                             // Preds: bb18
  %97 = builtin "sadd_with_overflow_Int64"(%83 : $Builtin.Int64, %13 : $Builtin.Int64, %72 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // user: %98
  %98 = tuple_extract %97 : $(Builtin.Int64, Builtin.Int1), 0 // user: %99
  br bb18(%94 : $Builtin.Int64, %98 : $Builtin.Int64, %86 : $Builtin.Int64) // id: %99

bb20:                                             // Preds: bb18
  br bb22(%94 : $Builtin.Int64, %65 : $Builtin.Int64, %66 : $UInt64) // id: %100

bb21:                                             // Preds: bb16
  br bb22(%5 : $Builtin.Int64, %65 : $Builtin.Int64, %66 : $UInt64) // id: %101

// %102                                           // users: %118, %105
// %103                                           // user: %105
// %104                                           // user: %120
bb22(%102 : $Builtin.Int64, %103 : $Builtin.Int64, %104 : $UInt64): // Preds: bb21 bb20 bb14
  %105 = builtin "or_Int64"(%103 : $Builtin.Int64, %102 : $Builtin.Int64) : $Builtin.Int64 // user: %107
  %106 = integer_literal $Builtin.Int64, -9187201950435737472 // user: %107
  %107 = builtin "and_Int64"(%105 : $Builtin.Int64, %106 : $Builtin.Int64) : $Builtin.Int64 // user: %108
  %108 = builtin "cmp_eq_Int64"(%107 : $Builtin.Int64, %5 : $Builtin.Int64) : $Builtin.Int1 // user: %109
  cond_br %108, bb24, bb23                        // id: %109

bb23:                                             // Preds: bb22
  %110 = integer_literal $Builtin.Int64, -6917529027641081856 // user: %111
  br bb25(%110 : $Builtin.Int64)                  // id: %111

bb24:                                             // Preds: bb22
  %112 = integer_literal $Builtin.Int64, -2305843009213693952 // user: %113
  br bb25(%112 : $Builtin.Int64)                  // id: %113

// %114                                           // user: %117
bb25(%114 : $Builtin.Int64):                      // Preds: bb24 bb23
  %115 = integer_literal $Builtin.Int64, 56       // user: %116
  %116 = builtin "shl_Int64"(%4 : $Builtin.Int64, %115 : $Builtin.Int64) : $Builtin.Int64 // user: %117
  %117 = builtin "or_Int64"(%114 : $Builtin.Int64, %116 : $Builtin.Int64) : $Builtin.Int64 // user: %118
  %118 = builtin "or_Int64"(%102 : $Builtin.Int64, %117 : $Builtin.Int64) : $Builtin.Int64 // user: %119
  %119 = struct $UInt64 (%118 : $Builtin.Int64)   // user: %120
  %120 = tuple (%104 : $UInt64, %119 : $UInt64)   // user: %121
  br bb31(%120 : $(UInt64, UInt64))               // id: %121

bb26:                                             // Preds: bb1
  cond_br %2, bb28, bb27                          // id: %122

bb27:                                             // Preds: bb26
  br bb29(%4 : $Builtin.Int64)                    // id: %123

bb28:                                             // Preds: bb26
  %124 = integer_literal $Builtin.Int64, -4611686018427387904 // user: %125
  %125 = builtin "or_Int64"(%4 : $Builtin.Int64, %124 : $Builtin.Int64) : $Builtin.Int64 // user: %126
  br bb29(%125 : $Builtin.Int64)                  // id: %126

// %127                                           // user: %129
bb29(%127 : $Builtin.Int64):                      // Preds: bb28 bb27
  %128 = integer_literal $Builtin.Int64, 1152921504606846976 // user: %129
  %129 = builtin "or_Int64"(%127 : $Builtin.Int64, %128 : $Builtin.Int64) : $Builtin.Int64 // user: %130
  %130 = struct $UInt64 (%129 : $Builtin.Int64)   // user: %140
  %131 = builtin "ptrtoint_Word"(%0 : $Builtin.RawPointer) : $Builtin.Word // user: %132
  %132 = builtin "zextOrBitCast_Word_Int64"(%131 : $Builtin.Word) : $Builtin.Int64 // user: %135
  %133 = integer_literal $Builtin.Int64, 32       // user: %135
  %134 = integer_literal $Builtin.Int1, 0         // user: %135
  %135 = builtin "usub_with_overflow_Int64"(%132 : $Builtin.Int64, %133 : $Builtin.Int64, %134 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // user: %136
  %136 = tuple_extract %135 : $(Builtin.Int64, Builtin.Int1), 0 // user: %138
  %137 = integer_literal $Builtin.Int64, -9223372036854775808 // user: %138
  %138 = builtin "stringObjectOr_Int64"(%136 : $Builtin.Int64, %137 : $Builtin.Int64) : $Builtin.Int64 // user: %139
  %139 = value_to_bridge_object %138 : $Builtin.Int64 // user: %140
  %140 = struct $_StringObject (%130 : $UInt64, %139 : $Builtin.BridgeObject) // user: %141
  %141 = struct $_StringGuts (%140 : $_StringObject) // user: %142
  %142 = struct $String (%141 : $_StringGuts)     // user: %143
  br bb32(%142 : $String)                         // id: %143

bb30:                                             // Preds: bb0
  %144 = struct $UInt64 (%5 : $Builtin.Int64)     // user: %148
  %145 = integer_literal $Builtin.Int64, -2305843009213693952 // user: %146
  %146 = value_to_bridge_object %145 : $Builtin.Int64 // user: %147
  %147 = unchecked_trivial_bit_cast %146 : $Builtin.BridgeObject to $UInt64 // user: %148
  %148 = tuple (%144 : $UInt64, %147 : $UInt64)   // user: %149
  br bb31(%148 : $(UInt64, UInt64))               // id: %149

// %150                                           // users: %151, %152
bb31(%150 : $(UInt64, UInt64)):                   // Preds: bb30 bb25
  %151 = tuple_extract %150 : $(UInt64, UInt64), 0 // user: %155
  %152 = tuple_extract %150 : $(UInt64, UInt64), 1 // user: %153
  %153 = struct_extract %152 : $UInt64, #UInt64._value // user: %154
  %154 = value_to_bridge_object %153 : $Builtin.Int64 // user: %155
  %155 = struct $_StringObject (%151 : $UInt64, %154 : $Builtin.BridgeObject) // user: %156
  %156 = struct $_StringGuts (%155 : $_StringObject) // user: %157
  %157 = struct $String (%156 : $_StringGuts)     // user: %158
  br bb32(%157 : $String)                         // id: %158

// %159                                           // user: %160
bb32(%159 : $String):                             // Preds: bb31 bb29
  return %159 : $String                           // id: %160
} // end sil function '$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC'

// protocol witness for CustomStringConvertible.description.getter in conformance AudioObjectPropertyAddress
sil shared [transparent] [thunk] @$sSo26AudioObjectPropertyAddressVs23CustomStringConvertible0A8ExplorersACP11descriptionSSvgTW : $@convention(witness_method: CustomStringConvertible) (@in_guaranteed AudioObjectPropertyAddress) -> @owned String {
// %0                                             // user: %1
bb0(%0 : $*AudioObjectPropertyAddress):
  %1 = load %0 : $*AudioObjectPropertyAddress     // user: %3
  // function_ref AudioObjectPropertyAddress.description.getter
  %2 = function_ref @$sSo26AudioObjectPropertyAddressV0A8ExplorerE11descriptionSSvg : $@convention(method) (AudioObjectPropertyAddress) -> @owned String // user: %3
  %3 = apply %2(%1) : $@convention(method) (AudioObjectPropertyAddress) -> @owned String // user: %4
  return %3 : $String                             // id: %4
} // end sil function '$sSo26AudioObjectPropertyAddressVs23CustomStringConvertible0A8ExplorersACP11descriptionSSvgTW'

// PropertyProviderFunctions.hasCheck.getter
sil [transparent] @$s13AudioExplorer25PropertyProviderFunctionsV8hasCheckySbs6UInt32V_SPySo0a6ObjectC7AddressVGtcvg : $@convention(method) (@guaranteed PropertyProviderFunctions) -> @owned @callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>) -> Bool {
// %0 "self"                                      // users: %2, %1
bb0(%0 : $PropertyProviderFunctions):
  debug_value %0 : $PropertyProviderFunctions, let, name "self", argno 1 // id: %1
  %2 = struct_extract %0 : $PropertyProviderFunctions, #PropertyProviderFunctions.hasCheck // users: %4, %3
  strong_retain %2 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>) -> Bool // id: %3
  return %2 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>) -> Bool // id: %4
} // end sil function '$s13AudioExplorer25PropertyProviderFunctionsV8hasCheckySbs6UInt32V_SPySo0a6ObjectC7AddressVGtcvg'

// PropertyProviderFunctions.dataSize.getter
sil [transparent] @$s13AudioExplorer25PropertyProviderFunctionsV8dataSizeys5Int32Vs6UInt32V_SPySo0a6ObjectC7AddressVGAHSVSgSpyAHGtcvg : $@convention(method) (@guaranteed PropertyProviderFunctions) -> @owned @callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>) -> Int32 {
// %0 "self"                                      // users: %2, %1
bb0(%0 : $PropertyProviderFunctions):
  debug_value %0 : $PropertyProviderFunctions, let, name "self", argno 1 // id: %1
  %2 = struct_extract %0 : $PropertyProviderFunctions, #PropertyProviderFunctions.dataSize // users: %4, %3
  strong_retain %2 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>) -> Int32 // id: %3
  return %2 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>) -> Int32 // id: %4
} // end sil function '$s13AudioExplorer25PropertyProviderFunctionsV8dataSizeys5Int32Vs6UInt32V_SPySo0a6ObjectC7AddressVGAHSVSgSpyAHGtcvg'

// PropertyProviderFunctions.getData.getter
sil [transparent] @$s13AudioExplorer25PropertyProviderFunctionsV7getDatays5Int32Vs6UInt32V_SPySo0a6ObjectC7AddressVGAHSVSgSpyAHGSvtcvg : $@convention(method) (@guaranteed PropertyProviderFunctions) -> @owned @callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) -> Int32 {
// %0 "self"                                      // users: %2, %1
bb0(%0 : $PropertyProviderFunctions):
  debug_value %0 : $PropertyProviderFunctions, let, name "self", argno 1 // id: %1
  %2 = struct_extract %0 : $PropertyProviderFunctions, #PropertyProviderFunctions.getData // users: %4, %3
  strong_retain %2 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) -> Int32 // id: %3
  return %2 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) -> Int32 // id: %4
} // end sil function '$s13AudioExplorer25PropertyProviderFunctionsV7getDatays5Int32Vs6UInt32V_SPySo0a6ObjectC7AddressVGAHSVSgSpyAHGSvtcvg'

// PropertyProviderFunctions.isSettable.getter
sil [transparent] @$s13AudioExplorer25PropertyProviderFunctionsV10isSettableys5Int32Vs6UInt32V_SPySo0a6ObjectC7AddressVGSpy6Darwin0L7BooleanVGtcvg : $@convention(method) (@guaranteed PropertyProviderFunctions) -> @owned @callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UnsafeMutablePointer<DarwinBoolean>) -> Int32 {
// %0 "self"                                      // users: %2, %1
bb0(%0 : $PropertyProviderFunctions):
  debug_value %0 : $PropertyProviderFunctions, let, name "self", argno 1 // id: %1
  %2 = struct_extract %0 : $PropertyProviderFunctions, #PropertyProviderFunctions.isSettable // users: %4, %3
  strong_retain %2 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UnsafeMutablePointer<DarwinBoolean>) -> Int32 // id: %3
  return %2 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UnsafeMutablePointer<DarwinBoolean>) -> Int32 // id: %4
} // end sil function '$s13AudioExplorer25PropertyProviderFunctionsV10isSettableys5Int32Vs6UInt32V_SPySo0a6ObjectC7AddressVGSpy6Darwin0L7BooleanVGtcvg'

// PropertyProviderFunctions.setData.getter
sil [transparent] @$s13AudioExplorer25PropertyProviderFunctionsV7setDatays5Int32Vs6UInt32V_SPySo0a6ObjectC7AddressVGAHSVSgAHSVtcvg : $@convention(method) (@guaranteed PropertyProviderFunctions) -> @owned @callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UInt32, UnsafeRawPointer) -> Int32 {
// %0 "self"                                      // users: %2, %1
bb0(%0 : $PropertyProviderFunctions):
  debug_value %0 : $PropertyProviderFunctions, let, name "self", argno 1 // id: %1
  %2 = struct_extract %0 : $PropertyProviderFunctions, #PropertyProviderFunctions.setData // users: %4, %3
  strong_retain %2 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UInt32, UnsafeRawPointer) -> Int32 // id: %3
  return %2 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UInt32, UnsafeRawPointer) -> Int32 // id: %4
} // end sil function '$s13AudioExplorer25PropertyProviderFunctionsV7setDatays5Int32Vs6UInt32V_SPySo0a6ObjectC7AddressVGAHSVSgAHSVtcvg'

// PropertyProviderFunctions.noErrorValue.getter
sil [transparent] @$s13AudioExplorer25PropertyProviderFunctionsV12noErrorValues5Int32Vvg : $@convention(method) (@guaranteed PropertyProviderFunctions) -> Int32 {
// %0 "self"                                      // users: %2, %1
bb0(%0 : $PropertyProviderFunctions):
  debug_value %0 : $PropertyProviderFunctions, let, name "self", argno 1 // id: %1
  %2 = struct_extract %0 : $PropertyProviderFunctions, #PropertyProviderFunctions.noErrorValue // user: %3
  return %2 : $Int32                              // id: %3
} // end sil function '$s13AudioExplorer25PropertyProviderFunctionsV12noErrorValues5Int32Vvg'

// globalinit_026_960A3D0F904E7B0BBE7492682A5ABBDF_func0
sil private @globalinit_026_960A3D0F904E7B0BBE7492682A5ABBDF_func0 : $@convention(c) () -> () {
bb0:
  alloc_global @$s13AudioExplorer25PropertyProviderFunctionsV8standardACvpZ // id: %0
  %1 = global_addr @$s13AudioExplorer25PropertyProviderFunctionsV8standardACvpZ : $*PropertyProviderFunctions // user: %15
  // function_ref @nonobjc AudioObjectHasProperty(_:_:)
  %2 = function_ref @$sSo22AudioObjectHasPropertyySbs6UInt32V_SPySo0abD7AddressVGtFTO : $@convention(thin) (UInt32, UnsafePointer<AudioObjectPropertyAddress>) -> Bool // user: %3
  %3 = thin_to_thick_function %2 : $@convention(thin) (UInt32, UnsafePointer<AudioObjectPropertyAddress>) -> Bool to $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>) -> Bool // user: %14
  // function_ref @nonobjc AudioObjectGetPropertyDataSize(_:_:_:_:_:)
  %4 = function_ref @$sSo30AudioObjectGetPropertyDataSizeys5Int32Vs6UInt32V_SPySo0abD7AddressVGAESVSgSpyAEGtFTO : $@convention(thin) (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>) -> Int32 // user: %5
  %5 = thin_to_thick_function %4 : $@convention(thin) (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>) -> Int32 to $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>) -> Int32 // user: %14
  // function_ref @nonobjc AudioObjectGetPropertyData(_:_:_:_:_:_:)
  %6 = function_ref @$sSo26AudioObjectGetPropertyDatays5Int32Vs6UInt32V_SPySo0abD7AddressVGAESVSgSpyAEGSvtFTO : $@convention(thin) (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) -> Int32 // user: %7
  %7 = thin_to_thick_function %6 : $@convention(thin) (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) -> Int32 to $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) -> Int32 // user: %14
  // function_ref @nonobjc AudioObjectIsPropertySettable(_:_:_:)
  %8 = function_ref @$sSo29AudioObjectIsPropertySettableys5Int32Vs6UInt32V_SPySo0abD7AddressVGSpy6Darwin0I7BooleanVGtFTO : $@convention(thin) (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UnsafeMutablePointer<DarwinBoolean>) -> Int32 // user: %9
  %9 = thin_to_thick_function %8 : $@convention(thin) (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UnsafeMutablePointer<DarwinBoolean>) -> Int32 to $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UnsafeMutablePointer<DarwinBoolean>) -> Int32 // user: %14
  // function_ref @nonobjc AudioObjectSetPropertyData(_:_:_:_:_:_:)
  %10 = function_ref @$sSo26AudioObjectSetPropertyDatays5Int32Vs6UInt32V_SPySo0abD7AddressVGAESVSgAESVtFTO : $@convention(thin) (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UInt32, UnsafeRawPointer) -> Int32 // user: %11
  %11 = thin_to_thick_function %10 : $@convention(thin) (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UInt32, UnsafeRawPointer) -> Int32 to $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UInt32, UnsafeRawPointer) -> Int32 // user: %14
  %12 = integer_literal $Builtin.Int32, 0         // user: %13
  %13 = struct $Int32 (%12 : $Builtin.Int32)      // user: %14
  %14 = struct $PropertyProviderFunctions (%3 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>) -> Bool, %5 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>) -> Int32, %7 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) -> Int32, %9 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UnsafeMutablePointer<DarwinBoolean>) -> Int32, %11 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UInt32, UnsafeRawPointer) -> Int32, %13 : $Int32) // user: %15
  store %14 to %1 : $*PropertyProviderFunctions   // id: %15
  %16 = tuple ()                                  // user: %17
  return %16 : $()                                // id: %17
} // end sil function 'globalinit_026_960A3D0F904E7B0BBE7492682A5ABBDF_func0'

// @nonobjc AudioObjectHasProperty(_:_:)
sil shared [thunk] [available 10.4] @$sSo22AudioObjectHasPropertyySbs6UInt32V_SPySo0abD7AddressVGtFTO : $@convention(thin) (UInt32, UnsafePointer<AudioObjectPropertyAddress>) -> Bool {
// %0 "inObjectID"                                // user: %3
// %1 "inAddress"                                 // user: %3
bb0(%0 : $UInt32, %1 : $UnsafePointer<AudioObjectPropertyAddress>):
  // function_ref AudioObjectHasProperty
  %2 = function_ref @AudioObjectHasProperty : $@convention(c) (UInt32, UnsafePointer<AudioObjectPropertyAddress>) -> DarwinBoolean // user: %3
  %3 = apply %2(%0, %1) : $@convention(c) (UInt32, UnsafePointer<AudioObjectPropertyAddress>) -> DarwinBoolean // user: %4
  %4 = struct_extract %3 : $DarwinBoolean, #DarwinBoolean._value // user: %5
  %5 = struct_extract %4 : $UInt8, #UInt8._value  // user: %7
  %6 = integer_literal $Builtin.Int64, 0          // user: %8
  %7 = builtin "zextOrBitCast_Int8_Int64"(%5 : $Builtin.Int8) : $Builtin.Int64 // user: %8
  %8 = builtin "cmp_eq_Int64"(%7 : $Builtin.Int64, %6 : $Builtin.Int64) : $Builtin.Int1 // user: %10
  %9 = integer_literal $Builtin.Int1, -1          // user: %10
  %10 = builtin "xor_Int1"(%8 : $Builtin.Int1, %9 : $Builtin.Int1) : $Builtin.Int1 // user: %11
  %11 = struct $Bool (%10 : $Builtin.Int1)        // user: %12
  return %11 : $Bool                              // id: %12
} // end sil function '$sSo22AudioObjectHasPropertyySbs6UInt32V_SPySo0abD7AddressVGtFTO'

// AudioObjectHasProperty
sil [available 10.4] [clang AudioObjectHasProperty] @AudioObjectHasProperty : $@convention(c) (UInt32, UnsafePointer<AudioObjectPropertyAddress>) -> DarwinBoolean

// @nonobjc AudioObjectGetPropertyDataSize(_:_:_:_:_:)
sil shared [thunk] [available 10.4] @$sSo30AudioObjectGetPropertyDataSizeys5Int32Vs6UInt32V_SPySo0abD7AddressVGAESVSgSpyAEGtFTO : $@convention(thin) (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>) -> Int32 {
// %0 "inObjectID"                                // user: %6
// %1 "inAddress"                                 // user: %6
// %2 "inQualifierDataSize"                       // user: %6
// %3 "inQualifierData"                           // user: %6
// %4 "outDataSize"                               // user: %6
bb0(%0 : $UInt32, %1 : $UnsafePointer<AudioObjectPropertyAddress>, %2 : $UInt32, %3 : $Optional<UnsafeRawPointer>, %4 : $UnsafeMutablePointer<UInt32>):
  // function_ref AudioObjectGetPropertyDataSize
  %5 = function_ref @AudioObjectGetPropertyDataSize : $@convention(c) (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>) -> Int32 // user: %6
  %6 = apply %5(%0, %1, %2, %3, %4) : $@convention(c) (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>) -> Int32 // user: %7
  return %6 : $Int32                              // id: %7
} // end sil function '$sSo30AudioObjectGetPropertyDataSizeys5Int32Vs6UInt32V_SPySo0abD7AddressVGAESVSgSpyAEGtFTO'

// AudioObjectGetPropertyDataSize
sil [available 10.4] [clang AudioObjectGetPropertyDataSize] @AudioObjectGetPropertyDataSize : $@convention(c) (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>) -> Int32

// @nonobjc AudioObjectGetPropertyData(_:_:_:_:_:_:)
sil shared [thunk] [available 10.4] @$sSo26AudioObjectGetPropertyDatays5Int32Vs6UInt32V_SPySo0abD7AddressVGAESVSgSpyAEGSvtFTO : $@convention(thin) (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) -> Int32 {
// %0 "inObjectID"                                // user: %7
// %1 "inAddress"                                 // user: %7
// %2 "inQualifierDataSize"                       // user: %7
// %3 "inQualifierData"                           // user: %7
// %4 "ioDataSize"                                // user: %7
// %5 "outData"                                   // user: %7
bb0(%0 : $UInt32, %1 : $UnsafePointer<AudioObjectPropertyAddress>, %2 : $UInt32, %3 : $Optional<UnsafeRawPointer>, %4 : $UnsafeMutablePointer<UInt32>, %5 : $UnsafeMutableRawPointer):
  // function_ref AudioObjectGetPropertyData
  %6 = function_ref @AudioObjectGetPropertyData : $@convention(c) (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) -> Int32 // user: %7
  %7 = apply %6(%0, %1, %2, %3, %4, %5) : $@convention(c) (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) -> Int32 // user: %8
  return %7 : $Int32                              // id: %8
} // end sil function '$sSo26AudioObjectGetPropertyDatays5Int32Vs6UInt32V_SPySo0abD7AddressVGAESVSgSpyAEGSvtFTO'

// AudioObjectGetPropertyData
sil [available 10.4] [clang AudioObjectGetPropertyData] @AudioObjectGetPropertyData : $@convention(c) (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) -> Int32

// @nonobjc AudioObjectIsPropertySettable(_:_:_:)
sil shared [thunk] [available 10.4] @$sSo29AudioObjectIsPropertySettableys5Int32Vs6UInt32V_SPySo0abD7AddressVGSpy6Darwin0I7BooleanVGtFTO : $@convention(thin) (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UnsafeMutablePointer<DarwinBoolean>) -> Int32 {
// %0 "inObjectID"                                // user: %4
// %1 "inAddress"                                 // user: %4
// %2 "outIsSettable"                             // user: %4
bb0(%0 : $UInt32, %1 : $UnsafePointer<AudioObjectPropertyAddress>, %2 : $UnsafeMutablePointer<DarwinBoolean>):
  // function_ref AudioObjectIsPropertySettable
  %3 = function_ref @AudioObjectIsPropertySettable : $@convention(c) (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UnsafeMutablePointer<DarwinBoolean>) -> Int32 // user: %4
  %4 = apply %3(%0, %1, %2) : $@convention(c) (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UnsafeMutablePointer<DarwinBoolean>) -> Int32 // user: %5
  return %4 : $Int32                              // id: %5
} // end sil function '$sSo29AudioObjectIsPropertySettableys5Int32Vs6UInt32V_SPySo0abD7AddressVGSpy6Darwin0I7BooleanVGtFTO'

// AudioObjectIsPropertySettable
sil [available 10.4] [clang AudioObjectIsPropertySettable] @AudioObjectIsPropertySettable : $@convention(c) (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UnsafeMutablePointer<DarwinBoolean>) -> Int32

// @nonobjc AudioObjectSetPropertyData(_:_:_:_:_:_:)
sil shared [thunk] [available 10.4] @$sSo26AudioObjectSetPropertyDatays5Int32Vs6UInt32V_SPySo0abD7AddressVGAESVSgAESVtFTO : $@convention(thin) (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UInt32, UnsafeRawPointer) -> Int32 {
// %0 "inObjectID"                                // user: %7
// %1 "inAddress"                                 // user: %7
// %2 "inQualifierDataSize"                       // user: %7
// %3 "inQualifierData"                           // user: %7
// %4 "inDataSize"                                // user: %7
// %5 "inData"                                    // user: %7
bb0(%0 : $UInt32, %1 : $UnsafePointer<AudioObjectPropertyAddress>, %2 : $UInt32, %3 : $Optional<UnsafeRawPointer>, %4 : $UInt32, %5 : $UnsafeRawPointer):
  // function_ref AudioObjectSetPropertyData
  %6 = function_ref @AudioObjectSetPropertyData : $@convention(c) (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UInt32, UnsafeRawPointer) -> Int32 // user: %7
  %7 = apply %6(%0, %1, %2, %3, %4, %5) : $@convention(c) (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UInt32, UnsafeRawPointer) -> Int32 // user: %8
  return %7 : $Int32                              // id: %8
} // end sil function '$sSo26AudioObjectSetPropertyDatays5Int32Vs6UInt32V_SPySo0abD7AddressVGAESVSgAESVtFTO'

// AudioObjectSetPropertyData
sil [available 10.4] [clang AudioObjectSetPropertyData] @AudioObjectSetPropertyData : $@convention(c) (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UInt32, UnsafeRawPointer) -> Int32

// PropertyProviderFunctions.init(hasCheck:dataSize:getData:isSettable:setData:noErrorValue:)
sil @$s13AudioExplorer25PropertyProviderFunctionsV8hasCheck8dataSize7getData10isSettable03setK012noErrorValueACSbs6UInt32V_SPySo0a6ObjectC7AddressVGtc_s5Int32VAK_AnKSVSgSpyAKGtcApK_AnkqRSvtcApK_ANSpy6Darwin0V7BooleanVGtcApK_AnkqKSVtcAPtcfC : $@convention(method) (@owned @callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>) -> Bool, @owned @callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>) -> Int32, @owned @callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) -> Int32, @owned @callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UnsafeMutablePointer<DarwinBoolean>) -> Int32, @owned @callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UInt32, UnsafeRawPointer) -> Int32, Int32, @thin PropertyProviderFunctions.Type) -> @owned PropertyProviderFunctions {
// %0 "$implicit_value"                           // user: %7
// %1 "$implicit_value"                           // user: %7
// %2 "$implicit_value"                           // user: %7
// %3 "$implicit_value"                           // user: %7
// %4 "$implicit_value"                           // user: %7
// %5 "$implicit_value"                           // user: %7
// %6 "$metatype"
bb0(%0 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>) -> Bool, %1 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>) -> Int32, %2 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) -> Int32, %3 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UnsafeMutablePointer<DarwinBoolean>) -> Int32, %4 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UInt32, UnsafeRawPointer) -> Int32, %5 : $Int32, %6 : $@thin PropertyProviderFunctions.Type):
  %7 = struct $PropertyProviderFunctions (%0 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>) -> Bool, %1 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>) -> Int32, %2 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) -> Int32, %3 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UnsafeMutablePointer<DarwinBoolean>) -> Int32, %4 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UInt32, UnsafeRawPointer) -> Int32, %5 : $Int32) // user: %8
  return %7 : $PropertyProviderFunctions          // id: %8
} // end sil function '$s13AudioExplorer25PropertyProviderFunctionsV8hasCheck8dataSize7getData10isSettable03setK012noErrorValueACSbs6UInt32V_SPySo0a6ObjectC7AddressVGtc_s5Int32VAK_AnKSVSgSpyAKGtcApK_AnkqRSvtcApK_ANSpy6Darwin0V7BooleanVGtcApK_AnkqKSVtcAPtcfC'

// PropertyProviderFunctions.standard.unsafeMutableAddressor
sil [global_init] @$s13AudioExplorer25PropertyProviderFunctionsV8standardACvau : $@convention(thin) () -> Builtin.RawPointer {
bb0:
  %0 = global_addr @globalinit_026_960A3D0F904E7B0BBE7492682A5ABBDF_token0 : $*Builtin.Word // user: %1
  %1 = address_to_pointer %0 : $*Builtin.Word to $Builtin.RawPointer // user: %3
  // function_ref globalinit_026_960A3D0F904E7B0BBE7492682A5ABBDF_func0
  %2 = function_ref @globalinit_026_960A3D0F904E7B0BBE7492682A5ABBDF_func0 : $@convention(c) () -> () // user: %3
  %3 = builtin "once"(%1 : $Builtin.RawPointer, %2 : $@convention(c) () -> ()) : $()
  %4 = global_addr @$s13AudioExplorer25PropertyProviderFunctionsV8standardACvpZ : $*PropertyProviderFunctions // user: %5
  %5 = address_to_pointer %4 : $*PropertyProviderFunctions to $Builtin.RawPointer // user: %6
  return %5 : $Builtin.RawPointer                 // id: %6
} // end sil function '$s13AudioExplorer25PropertyProviderFunctionsV8standardACvau'

// static PropertyProviderFunctions.standard.getter
sil [transparent] @$s13AudioExplorer25PropertyProviderFunctionsV8standardACvgZ : $@convention(method) (@thin PropertyProviderFunctions.Type) -> @owned PropertyProviderFunctions {
// %0 "self"
bb0(%0 : $@thin PropertyProviderFunctions.Type):
  %1 = global_addr @globalinit_026_960A3D0F904E7B0BBE7492682A5ABBDF_token0 : $*Builtin.Word // user: %2
  %2 = address_to_pointer %1 : $*Builtin.Word to $Builtin.RawPointer // user: %4
  // function_ref globalinit_026_960A3D0F904E7B0BBE7492682A5ABBDF_func0
  %3 = function_ref @globalinit_026_960A3D0F904E7B0BBE7492682A5ABBDF_func0 : $@convention(c) () -> () // user: %4
  %4 = builtin "once"(%2 : $Builtin.RawPointer, %3 : $@convention(c) () -> ()) : $()
  %5 = global_addr @$s13AudioExplorer25PropertyProviderFunctionsV8standardACvpZ : $*PropertyProviderFunctions // user: %6
  %6 = load %5 : $*PropertyProviderFunctions      // users: %11, %10, %9, %8, %7, %17
  %7 = struct_extract %6 : $PropertyProviderFunctions, #PropertyProviderFunctions.hasCheck // user: %12
  %8 = struct_extract %6 : $PropertyProviderFunctions, #PropertyProviderFunctions.dataSize // user: %13
  %9 = struct_extract %6 : $PropertyProviderFunctions, #PropertyProviderFunctions.getData // user: %14
  %10 = struct_extract %6 : $PropertyProviderFunctions, #PropertyProviderFunctions.isSettable // user: %15
  %11 = struct_extract %6 : $PropertyProviderFunctions, #PropertyProviderFunctions.setData // user: %16
  strong_retain %7 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>) -> Bool // id: %12
  strong_retain %8 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>) -> Int32 // id: %13
  strong_retain %9 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) -> Int32 // id: %14
  strong_retain %10 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UnsafeMutablePointer<DarwinBoolean>) -> Int32 // id: %15
  strong_retain %11 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UInt32, UnsafeRawPointer) -> Int32 // id: %16
  return %6 : $PropertyProviderFunctions          // id: %17
} // end sil function '$s13AudioExplorer25PropertyProviderFunctionsV8standardACvgZ'

// DeviceProperty<>.outputTransform(_:count:)
sil @$s13AudioExplorer14DevicePropertyVAA7ElementQy_RszSlR_rlE15outputTransform_5countq_SgSpyxG_SitF : $@convention(method) <Base, Output where Base == Output.Element, Output : Collection> (UnsafeMutablePointer<Base>, Int, @in_guaranteed DeviceProperty<Base, Output>) -> @out Optional<Output> {
// %0 "$return_value"                             // users: %30, %27, %21
// %1 "holder"                                    // users: %8, %4
// %2 "count"                                     // users: %12, %5
// %3 "self"
bb0(%0 : $*Optional<Output>, %1 : $UnsafeMutablePointer<Base>, %2 : $Int, %3 : $*DeviceProperty<Base, Output>):
  debug_value %1 : $UnsafeMutablePointer<Base>, let, name "holder", argno 1 // id: %4
  debug_value %2 : $Int, let, name "count", argno 2 // id: %5
  %6 = metatype $@thin Array<Base>.Type           // user: %16
  %7 = metatype $@thin UnsafeBufferPointer<Base>.Type // user: %12
  %8 = struct_extract %1 : $UnsafeMutablePointer<Base>, #UnsafeMutablePointer._rawValue // user: %9
  %9 = struct $UnsafePointer<Base> (%8 : $Builtin.RawPointer) // user: %10
  %10 = enum $Optional<UnsafePointer<Base>>, #Optional.some!enumelt, %9 : $UnsafePointer<Base> // user: %12
  // function_ref UnsafeBufferPointer.init(start:count:)
  %11 = function_ref @$sSR5start5countSRyxGSPyxGSg_SitcfC : $@convention(method) <τ_0_0> (Optional<UnsafePointer<τ_0_0>>, Int, @thin UnsafeBufferPointer<τ_0_0>.Type) -> UnsafeBufferPointer<τ_0_0> // user: %12
  %12 = apply %11<Base>(%10, %2, %7) : $@convention(method) <τ_0_0> (Optional<UnsafePointer<τ_0_0>>, Int, @thin UnsafeBufferPointer<τ_0_0>.Type) -> UnsafeBufferPointer<τ_0_0> // user: %14
  %13 = alloc_stack $UnsafeBufferPointer<Base>    // users: %14, %17, %16
  store %12 to %13 : $*UnsafeBufferPointer<Base>  // id: %14
  // function_ref Array.init<A>(_:)
  %15 = function_ref @$sSaySayxGqd__c7ElementQyd__RszSTRd__lufC : $@convention(method) <τ_0_0><τ_1_0 where τ_0_0 == τ_1_0.Element, τ_1_0 : Sequence> (@in τ_1_0, @thin Array<τ_0_0>.Type) -> @owned Array<τ_0_0> // user: %16
  %16 = apply %15<Base, UnsafeBufferPointer<Base>>(%13, %6) : $@convention(method) <τ_0_0><τ_1_0 where τ_0_0 == τ_1_0.Element, τ_1_0 : Sequence> (@in τ_1_0, @thin Array<τ_0_0>.Type) -> @owned Array<τ_0_0> // users: %31, %28, %22, %20, %18
  dealloc_stack %13 : $*UnsafeBufferPointer<Base> // id: %17
  debug_value %16 : $Array<Base>, let, name "value" // id: %18
  %19 = alloc_stack $Array<Base>                  // users: %20, %33, %26
  store %16 to %19 : $*Array<Base>                // id: %20
  %21 = init_enum_data_addr %0 : $*Optional<Output>, #Optional.some!enumelt // user: %26
  %22 = struct_extract %16 : $Array<Base>, #Array._buffer // user: %23
  %23 = struct_extract %22 : $_ArrayBuffer<Base>, #_ArrayBuffer._storage // user: %24
  %24 = struct_extract %23 : $_BridgeStorage<__ContiguousArrayStorageBase>, #_BridgeStorage.rawValue // user: %25
  strong_retain %24 : $Builtin.BridgeObject       // id: %25
  checked_cast_addr_br take_always Array<Base> in %19 : $*Array<Base> to Output in %21 : $*Output, bb1, bb2 // id: %26

bb1:                                              // Preds: bb0
  inject_enum_addr %0 : $*Optional<Output>, #Optional.some!enumelt // id: %27
  release_value %16 : $Array<Base>                // id: %28
  br bb3                                          // id: %29

bb2:                                              // Preds: bb0
  inject_enum_addr %0 : $*Optional<Output>, #Optional.none!enumelt // id: %30
  release_value %16 : $Array<Base>                // id: %31
  br bb3                                          // id: %32

bb3:                                              // Preds: bb2 bb1
  dealloc_stack %19 : $*Array<Base>               // id: %33
  %34 = tuple ()                                  // user: %35
  return %34 : $()                                // id: %35
} // end sil function '$s13AudioExplorer14DevicePropertyVAA7ElementQy_RszSlR_rlE15outputTransform_5countq_SgSpyxG_SitF'

// UnsafeBufferPointer.init(start:count:)
sil public_external @$sSR5start5countSRyxGSPyxGSg_SitcfC : $@convention(method) <Element> (Optional<UnsafePointer<Element>>, Int, @thin UnsafeBufferPointer<Element>.Type) -> UnsafeBufferPointer<Element> {
// %0                                             // users: %15, %10
// %1                                             // users: %15, %4
bb0(%0 : $Optional<UnsafePointer<Element>>, %1 : $Int, %2 : $@thin UnsafeBufferPointer<Element>.Type):
  %3 = integer_literal $Builtin.Int64, 0          // users: %7, %5
  %4 = struct_extract %1 : $Int, #Int._value      // users: %7, %5
  %5 = builtin "cmp_slt_Int64"(%4 : $Builtin.Int64, %3 : $Builtin.Int64) : $Builtin.Int1 // user: %6
  cond_fail %5 : $Builtin.Int1, "UnsafeBufferPointer with negative count" // id: %6
  %7 = builtin "cmp_eq_Int64"(%4 : $Builtin.Int64, %3 : $Builtin.Int64) : $Builtin.Int1 // user: %8
  cond_br %7, bb1, bb2                            // id: %8

bb1:                                              // Preds: bb0
  br bb5                                          // id: %9

bb2:                                              // Preds: bb0
  switch_enum %0 : $Optional<UnsafePointer<Element>>, case #Optional.some!enumelt: bb4, case #Optional.none!enumelt: bb3 // id: %10

bb3:                                              // Preds: bb2
  %11 = integer_literal $Builtin.Int1, -1         // user: %12
  cond_fail %11 : $Builtin.Int1, "UnsafeBufferPointer has a nil start and nonzero count" // id: %12
  unreachable                                     // id: %13

bb4:                                              // Preds: bb2
  br bb5                                          // id: %14

bb5:                                              // Preds: bb1 bb4
  %15 = struct $UnsafeBufferPointer<Element> (%0 : $Optional<UnsafePointer<Element>>, %1 : $Int) // user: %16
  return %15 : $UnsafeBufferPointer<Element>      // id: %16
} // end sil function '$sSR5start5countSRyxGSPyxGSg_SitcfC'

// Array.init<A>(_:)
sil public_external @$sSaySayxGqd__c7ElementQyd__RszSTRd__lufC : $@convention(method) <Element><S where Element == S.Element, S : Sequence> (@in S, @thin Array<Element>.Type) -> @owned Array<Element> {
// %0                                             // user: %3
// %1                                             // user: %8
bb0(%0 : $*S, %1 : $@thin Array<Element>.Type):
  %2 = witness_method $S, #Sequence._copyToContiguousArray : <Self where Self : Sequence> (__owned Self) -> () -> ContiguousArray<Self.Element> : $@convention(witness_method: Sequence) <τ_0_0 where τ_0_0 : Sequence> (@in τ_0_0) -> @owned ContiguousArray<τ_0_0.Element> // user: %3
  %3 = apply %2<S>(%0) : $@convention(witness_method: Sequence) <τ_0_0 where τ_0_0 : Sequence> (@in τ_0_0) -> @owned ContiguousArray<τ_0_0.Element> // user: %4
  %4 = struct_extract %3 : $ContiguousArray<Element>, #ContiguousArray._buffer // user: %6
  // function_ref specialized _ArrayBuffer.init(_buffer:shiftedToStartIndex:)
  %5 = function_ref @$ss12_ArrayBufferV7_buffer19shiftedToStartIndexAByxGs011_ContiguousaB0VyxG_SitcfCTf4ndd_n : $@convention(thin) <τ_0_0> (@owned _ContiguousArrayBuffer<τ_0_0>) -> @owned _ArrayBuffer<τ_0_0> // user: %6
  %6 = apply %5<Element>(%4) : $@convention(thin) <τ_0_0> (@owned _ContiguousArrayBuffer<τ_0_0>) -> @owned _ArrayBuffer<τ_0_0> // user: %8
  // function_ref Array.init(_buffer:)
  %7 = function_ref @$sSa7_bufferSayxGs12_ArrayBufferVyxG_tcfC : $@convention(method) <τ_0_0> (@owned _ArrayBuffer<τ_0_0>, @thin Array<τ_0_0>.Type) -> @owned Array<τ_0_0> // user: %8
  %8 = apply %7<Element>(%6, %1) : $@convention(method) <τ_0_0> (@owned _ArrayBuffer<τ_0_0>, @thin Array<τ_0_0>.Type) -> @owned Array<τ_0_0> // user: %9
  return %8 : $Array<Element>                     // id: %9
} // end sil function '$sSaySayxGqd__c7ElementQyd__RszSTRd__lufC'

// DeviceProperty.outputTransform(_:count:)
sil @$s13AudioExplorer14DevicePropertyV15outputTransform_5countq_SgSpyxG_SitF : $@convention(method) <Base, Output> (UnsafeMutablePointer<Base>, Int, @in_guaranteed DeviceProperty<Base, Output>) -> @out Optional<Output> {
// %0 "$return_value"                             // users: %13, %11, %9
// %1 "holder"                                    // users: %5, %4
// %2 "count"
// %3 "self"
bb0(%0 : $*Optional<Output>, %1 : $UnsafeMutablePointer<Base>, %2 : $Int, %3 : $*DeviceProperty<Base, Output>):
  debug_value %1 : $UnsafeMutablePointer<Base>, let, name "holder", argno 1 // id: %4
  %5 = struct_extract %1 : $UnsafeMutablePointer<Base>, #UnsafeMutablePointer._rawValue // user: %6
  %6 = pointer_to_address %5 : $Builtin.RawPointer to [strict] $*Base // user: %8
  %7 = alloc_stack $Base                          // users: %15, %10, %8
  copy_addr %6 to [initialization] %7 : $*Base    // id: %8
  %9 = init_enum_data_addr %0 : $*Optional<Output>, #Optional.some!enumelt // user: %10
  checked_cast_addr_br take_always Base in %7 : $*Base to Output in %9 : $*Output, bb1, bb2 // id: %10

bb1:                                              // Preds: bb0
  inject_enum_addr %0 : $*Optional<Output>, #Optional.some!enumelt // id: %11
  br bb3                                          // id: %12

bb2:                                              // Preds: bb0
  inject_enum_addr %0 : $*Optional<Output>, #Optional.none!enumelt // id: %13
  br bb3                                          // id: %14

bb3:                                              // Preds: bb2 bb1
  dealloc_stack %7 : $*Base                       // id: %15
  %16 = tuple ()                                  // user: %17
  return %16 : $()                                // id: %17
} // end sil function '$s13AudioExplorer14DevicePropertyV15outputTransform_5countq_SgSpyxG_SitF'

// variable initialization expression of DeviceProperty.id
sil [transparent] [signature_optimized_thunk] [always_inline] @$s13AudioExplorer14DevicePropertyV2ids6UInt32Vvpfi : $@convention(thin) <Base, Output> () -> UInt32 {
bb0:
  %0 = integer_literal $Builtin.Int32, 0          // user: %1
  %1 = struct $UInt32 (%0 : $Builtin.Int32)       // user: %2
  return %1 : $UInt32                             // id: %2
} // end sil function '$s13AudioExplorer14DevicePropertyV2ids6UInt32Vvpfi'

// DeviceProperty.id.getter
sil [transparent] @$s13AudioExplorer14DevicePropertyV2ids6UInt32Vvg : $@convention(method) <Base, Output> (@in_guaranteed DeviceProperty<Base, Output>) -> UInt32 {
// %0 "self"                                      // users: %2, %1
bb0(%0 : $*DeviceProperty<Base, Output>):
  debug_value_addr %0 : $*DeviceProperty<Base, Output>, let, name "self", argno 1 // id: %1
  %2 = struct_element_addr %0 : $*DeviceProperty<Base, Output>, #DeviceProperty.id // user: %3
  %3 = load %2 : $*UInt32                         // user: %4
  return %3 : $UInt32                             // id: %4
} // end sil function '$s13AudioExplorer14DevicePropertyV2ids6UInt32Vvg'

// DeviceProperty.id.setter
sil [transparent] @$s13AudioExplorer14DevicePropertyV2ids6UInt32Vvs : $@convention(method) <Base, Output> (UInt32, @inout DeviceProperty<Base, Output>) -> () {
// %0 "value"                                     // users: %5, %2
// %1 "self"                                      // users: %4, %3
bb0(%0 : $UInt32, %1 : $*DeviceProperty<Base, Output>):
  debug_value %0 : $UInt32, let, name "value", argno 1 // id: %2
  debug_value_addr %1 : $*DeviceProperty<Base, Output>, var, name "self", argno 2 // id: %3
  %4 = struct_element_addr %1 : $*DeviceProperty<Base, Output>, #DeviceProperty.id // user: %5
  store %0 to %4 : $*UInt32                       // id: %5
  %6 = tuple ()                                   // user: %7
  return %6 : $()                                 // id: %7
} // end sil function '$s13AudioExplorer14DevicePropertyV2ids6UInt32Vvs'

// DeviceProperty.id.modify
sil [transparent] @$s13AudioExplorer14DevicePropertyV2ids6UInt32VvM : $@yield_once @convention(method) <Base, Output> (@inout DeviceProperty<Base, Output>) -> @yields @inout UInt32 {
// %0 "self"                                      // users: %2, %1
bb0(%0 : $*DeviceProperty<Base, Output>):
  debug_value_addr %0 : $*DeviceProperty<Base, Output>, var, name "self", argno 1 // id: %1
  %2 = struct_element_addr %0 : $*DeviceProperty<Base, Output>, #DeviceProperty.id // user: %3
  yield %2 : $*UInt32, resume bb1, unwind bb2     // id: %3

bb1:                                              // Preds: bb0
  %4 = tuple ()                                   // user: %5
  return %4 : $()                                 // id: %5

bb2:                                              // Preds: bb0
  unwind                                          // id: %6
} // end sil function '$s13AudioExplorer14DevicePropertyV2ids6UInt32VvM'

// variable initialization expression of DeviceProperty.logger
sil [transparent] @$s13AudioExplorer14DevicePropertyV6logger026_960A3D0F904E7B0BBE7492682F5ABBDFLL2os6LoggerVvpfi : $@convention(thin) <Base, Output> () -> @out Logger {
// %0 "$return_value"                             // user: %25
bb0(%0 : $*Logger):
  %1 = metatype $@thin Logger.Type                // user: %25
  %2 = string_literal utf8 "com.amonshiz.audioexplorer.deviceproperty" // user: %5
  %3 = integer_literal $Builtin.Int64, -3458764513820540887 // user: %4
  %4 = struct $UInt64 (%3 : $Builtin.Int64)       // user: %14
  %5 = builtin "ptrtoint_Word"(%2 : $Builtin.RawPointer) : $Builtin.Word // user: %6
  %6 = builtin "zextOrBitCast_Word_Int64"(%5 : $Builtin.Word) : $Builtin.Int64 // user: %9
  %7 = integer_literal $Builtin.Int64, 32         // user: %9
  %8 = integer_literal $Builtin.Int1, 0           // user: %9
  %9 = builtin "usub_with_overflow_Int64"(%6 : $Builtin.Int64, %7 : $Builtin.Int64, %8 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // user: %10
  %10 = tuple_extract %9 : $(Builtin.Int64, Builtin.Int1), 0 // user: %12
  %11 = integer_literal $Builtin.Int64, -9223372036854775808 // user: %12
  %12 = builtin "stringObjectOr_Int64"(%10 : $Builtin.Int64, %11 : $Builtin.Int64) : $Builtin.Int64 // user: %13
  %13 = value_to_bridge_object %12 : $Builtin.Int64 // user: %14
  %14 = struct $_StringObject (%4 : $UInt64, %13 : $Builtin.BridgeObject) // user: %15
  %15 = struct $_StringGuts (%14 : $_StringObject) // user: %16
  %16 = struct $String (%15 : $_StringGuts)       // user: %25
  %17 = integer_literal $Builtin.Int64, 491496043109 // user: %18
  %18 = struct $UInt64 (%17 : $Builtin.Int64)     // user: %21
  %19 = integer_literal $Builtin.Int64, -1945555039024054272 // user: %20
  %20 = value_to_bridge_object %19 : $Builtin.Int64 // user: %21
  %21 = struct $_StringObject (%18 : $UInt64, %20 : $Builtin.BridgeObject) // user: %22
  %22 = struct $_StringGuts (%21 : $_StringObject) // user: %23
  %23 = struct $String (%22 : $_StringGuts)       // user: %25
  // function_ref Logger.init(subsystem:category:)
  %24 = function_ref @$s2os6LoggerV9subsystem8categoryACSS_SStcfC : $@convention(method) (@owned String, @owned String, @thin Logger.Type) -> @out Logger // user: %25
  %25 = apply %24(%0, %16, %23, %1) : $@convention(method) (@owned String, @owned String, @thin Logger.Type) -> @out Logger
  %26 = tuple ()                                  // user: %27
  return %26 : $()                                // id: %27
} // end sil function '$s13AudioExplorer14DevicePropertyV6logger026_960A3D0F904E7B0BBE7492682F5ABBDFLL2os6LoggerVvpfi'

// Logger.init(subsystem:category:)
sil [available 11.0] @$s2os6LoggerV9subsystem8categoryACSS_SStcfC : $@convention(method) (@owned String, @owned String, @thin Logger.Type) -> @out Logger

// default argument 1 of DeviceProperty.init(_:providers:)
sil [signature_optimized_thunk] [always_inline] @$s13AudioExplorer14DevicePropertyV_9providersACyxq_GAA0acD11DescriptionVyxG_AA0D17ProviderFunctionsVtcfcfA0_ : $@convention(thin) <Base, Output> () -> @owned PropertyProviderFunctions {
bb0:
  %0 = global_addr @globalinit_026_960A3D0F904E7B0BBE7492682A5ABBDF_token0 : $*Builtin.Word // user: %1
  %1 = address_to_pointer %0 : $*Builtin.Word to $Builtin.RawPointer // user: %3
  // function_ref globalinit_026_960A3D0F904E7B0BBE7492682A5ABBDF_func0
  %2 = function_ref @globalinit_026_960A3D0F904E7B0BBE7492682A5ABBDF_func0 : $@convention(c) () -> () // user: %3
  %3 = builtin "once"(%1 : $Builtin.RawPointer, %2 : $@convention(c) () -> ()) : $()
  %4 = global_addr @$s13AudioExplorer25PropertyProviderFunctionsV8standardACvpZ : $*PropertyProviderFunctions // user: %5
  %5 = load %4 : $*PropertyProviderFunctions      // users: %16, %10, %9, %8, %7, %6
  %6 = struct_extract %5 : $PropertyProviderFunctions, #PropertyProviderFunctions.hasCheck // user: %11
  %7 = struct_extract %5 : $PropertyProviderFunctions, #PropertyProviderFunctions.dataSize // user: %12
  %8 = struct_extract %5 : $PropertyProviderFunctions, #PropertyProviderFunctions.getData // user: %13
  %9 = struct_extract %5 : $PropertyProviderFunctions, #PropertyProviderFunctions.isSettable // user: %14
  %10 = struct_extract %5 : $PropertyProviderFunctions, #PropertyProviderFunctions.setData // user: %15
  strong_retain %6 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>) -> Bool // id: %11
  strong_retain %7 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>) -> Int32 // id: %12
  strong_retain %8 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) -> Int32 // id: %13
  strong_retain %9 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UnsafeMutablePointer<DarwinBoolean>) -> Int32 // id: %14
  strong_retain %10 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UInt32, UnsafeRawPointer) -> Int32 // id: %15
  return %5 : $PropertyProviderFunctions          // id: %16
} // end sil function '$s13AudioExplorer14DevicePropertyV_9providersACyxq_GAA0acD11DescriptionVyxG_AA0D17ProviderFunctionsVtcfcfA0_'

// DeviceProperty.init(_:providers:)
sil @$s13AudioExplorer14DevicePropertyV_9providersACyxq_GAA0acD11DescriptionVyxG_AA0D17ProviderFunctionsVtcfC : $@convention(method) <Base, Output> (AudioDevicePropertyDescription<Base>, @owned PropertyProviderFunctions, @thin DeviceProperty<Base, Output>.Type) -> @out DeviceProperty<Base, Output> {
// %0 "$return_value"                             // users: %8, %36, %41, %39
// %1 "description"                               // users: %40, %4
// %2 "functions"                                 // users: %42, %5
// %3 "$metatype"
bb0(%0 : $*DeviceProperty<Base, Output>, %1 : $AudioDevicePropertyDescription<Base>, %2 : $PropertyProviderFunctions, %3 : $@thin DeviceProperty<Base, Output>.Type):
  debug_value %1 : $AudioDevicePropertyDescription<Base>, let, name "description", argno 1 // id: %4
  debug_value %2 : $PropertyProviderFunctions, let, name "functions", argno 2 // id: %5
  %6 = integer_literal $Builtin.Int32, 0          // user: %7
  %7 = struct $UInt32 (%6 : $Builtin.Int32)       // user: %9
  %8 = struct_element_addr %0 : $*DeviceProperty<Base, Output>, #DeviceProperty.id // user: %9
  store %7 to %8 : $*UInt32                       // id: %9
  %10 = alloc_stack $Logger                       // users: %35, %38, %37
  %11 = metatype $@thin Logger.Type               // user: %35
  %12 = string_literal utf8 "com.amonshiz.audioexplorer.deviceproperty" // user: %15
  %13 = integer_literal $Builtin.Int64, -3458764513820540887 // user: %14
  %14 = struct $UInt64 (%13 : $Builtin.Int64)     // user: %24
  %15 = builtin "ptrtoint_Word"(%12 : $Builtin.RawPointer) : $Builtin.Word // user: %16
  %16 = builtin "zextOrBitCast_Word_Int64"(%15 : $Builtin.Word) : $Builtin.Int64 // user: %19
  %17 = integer_literal $Builtin.Int64, 32        // user: %19
  %18 = integer_literal $Builtin.Int1, 0          // user: %19
  %19 = builtin "usub_with_overflow_Int64"(%16 : $Builtin.Int64, %17 : $Builtin.Int64, %18 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // user: %20
  %20 = tuple_extract %19 : $(Builtin.Int64, Builtin.Int1), 0 // user: %22
  %21 = integer_literal $Builtin.Int64, -9223372036854775808 // user: %22
  %22 = builtin "stringObjectOr_Int64"(%20 : $Builtin.Int64, %21 : $Builtin.Int64) : $Builtin.Int64 // user: %23
  %23 = value_to_bridge_object %22 : $Builtin.Int64 // user: %24
  %24 = struct $_StringObject (%14 : $UInt64, %23 : $Builtin.BridgeObject) // user: %25
  %25 = struct $_StringGuts (%24 : $_StringObject) // user: %26
  %26 = struct $String (%25 : $_StringGuts)       // user: %35
  %27 = integer_literal $Builtin.Int64, 491496043109 // user: %28
  %28 = struct $UInt64 (%27 : $Builtin.Int64)     // user: %31
  %29 = integer_literal $Builtin.Int64, -1945555039024054272 // user: %30
  %30 = value_to_bridge_object %29 : $Builtin.Int64 // user: %31
  %31 = struct $_StringObject (%28 : $UInt64, %30 : $Builtin.BridgeObject) // user: %32
  %32 = struct $_StringGuts (%31 : $_StringObject) // user: %33
  %33 = struct $String (%32 : $_StringGuts)       // user: %35
  // function_ref Logger.init(subsystem:category:)
  %34 = function_ref @$s2os6LoggerV9subsystem8categoryACSS_SStcfC : $@convention(method) (@owned String, @owned String, @thin Logger.Type) -> @out Logger // user: %35
  %35 = apply %34(%10, %26, %33, %11) : $@convention(method) (@owned String, @owned String, @thin Logger.Type) -> @out Logger
  %36 = struct_element_addr %0 : $*DeviceProperty<Base, Output>, #DeviceProperty.logger // user: %37
  copy_addr [take] %10 to [initialization] %36 : $*Logger // id: %37
  dealloc_stack %10 : $*Logger                    // id: %38
  %39 = struct_element_addr %0 : $*DeviceProperty<Base, Output>, #DeviceProperty.description // user: %40
  store %1 to %39 : $*AudioDevicePropertyDescription<Base> // id: %40
  %41 = struct_element_addr %0 : $*DeviceProperty<Base, Output>, #DeviceProperty.providers // user: %42
  store %2 to %41 : $*PropertyProviderFunctions   // id: %42
  %43 = tuple ()                                  // user: %44
  return %43 : $()                                // id: %44
} // end sil function '$s13AudioExplorer14DevicePropertyV_9providersACyxq_GAA0acD11DescriptionVyxG_AA0D17ProviderFunctionsVtcfC'

// DeviceProperty.wrappedValue.getter
sil @$s13AudioExplorer14DevicePropertyV12wrappedValueq_Sgvg : $@convention(method) <Base, Output> (@in_guaranteed DeviceProperty<Base, Output>) -> @out Optional<Output> {
// %0 "$return_value"                             // users: %65, %197, %330, %463
// %1 "self"                                      // users: %65, %68, %200, %12, %9, %333, %4, %2
bb0(%0 : $*Optional<Output>, %1 : $*DeviceProperty<Base, Output>):
  debug_value_addr %1 : $*DeviceProperty<Base, Output>, let, name "self", argno 1 // id: %2
  %3 = alloc_stack $AudioObjectPropertyAddress, var, name "address" // users: %465, %14, %8, %137, %136, %269, %268, %402, %401
  %4 = struct_element_addr %1 : $*DeviceProperty<Base, Output>, #DeviceProperty.description // users: %39, %5
  %5 = load %4 : $*AudioDevicePropertyDescription<Base> // user: %7
  // function_ref AudioDevicePropertyDescription.address.getter
  %6 = function_ref @$s13AudioExplorer0A25DevicePropertyDescriptionV7addressSo0a6ObjectD7AddressVvg : $@convention(method) <τ_0_0> (AudioDevicePropertyDescription<τ_0_0>) -> AudioObjectPropertyAddress // user: %7
  %7 = apply %6<Base>(%5) : $@convention(method) <τ_0_0> (AudioDevicePropertyDescription<τ_0_0>) -> AudioObjectPropertyAddress // user: %8
  store %7 to %3 : $*AudioObjectPropertyAddress   // id: %8
  %9 = struct_element_addr %1 : $*DeviceProperty<Base, Output>, #DeviceProperty.providers // users: %53, %31, %23, %10
  %10 = struct_element_addr %9 : $*PropertyProviderFunctions, #PropertyProviderFunctions.hasCheck // user: %11
  %11 = load %10 : $*@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>) -> Bool // user: %16
  %12 = struct_element_addr %1 : $*DeviceProperty<Base, Output>, #DeviceProperty.id // users: %55, %25, %13
  %13 = load %12 : $*UInt32                       // user: %16
  %14 = address_to_pointer %3 : $*AudioObjectPropertyAddress to $Builtin.RawPointer // user: %15
  %15 = struct $UnsafePointer<AudioObjectPropertyAddress> (%14 : $Builtin.RawPointer) // users: %58, %29, %16
  %16 = apply %11(%13, %15) : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>) -> Bool // user: %17
  %17 = struct_extract %16 : $Bool, #Bool._value  // user: %18
  cond_br %17, bb1, bb30                          // id: %18

bb1:                                              // Preds: bb0
  %19 = alloc_stack $UInt32, var, name "propertySize" // users: %37, %22, %27, %66, %198, %331
  %20 = integer_literal $Builtin.Int32, 0         // users: %42, %21
  %21 = struct $UInt32 (%20 : $Builtin.Int32)     // users: %58, %29, %22
  store %21 to %19 : $*UInt32                     // id: %22
  %23 = struct_element_addr %9 : $*PropertyProviderFunctions, #PropertyProviderFunctions.dataSize // user: %24
  %24 = load %23 : $*@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>) -> Int32 // user: %29
  %25 = load %12 : $*UInt32                       // user: %29
  %26 = enum $Optional<UnsafeRawPointer>, #Optional.none!enumelt // users: %58, %29
  %27 = address_to_pointer %19 : $*UInt32 to $Builtin.RawPointer // user: %28
  %28 = struct $UnsafeMutablePointer<UInt32> (%27 : $Builtin.RawPointer) // users: %58, %29
  %29 = apply %24(%25, %15, %21, %26, %28) : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>) -> Int32 // users: %34, %30
  debug_value %29 : $Int32, let, name "sizeStatus" // id: %30
  %31 = struct_element_addr %9 : $*PropertyProviderFunctions, #PropertyProviderFunctions.noErrorValue // user: %32
  %32 = struct_element_addr %31 : $*Int32, #Int32._value // users: %60, %33
  %33 = load %32 : $*Builtin.Int32                // user: %35
  %34 = struct_extract %29 : $Int32, #Int32._value // user: %35
  %35 = builtin "cmp_eq_Int32"(%34 : $Builtin.Int32, %33 : $Builtin.Int32) : $Builtin.Int1 // user: %36
  cond_br %35, bb2, bb17                          // id: %36

bb2:                                              // Preds: bb1
  %37 = struct_element_addr %19 : $*UInt32, #UInt32._value // user: %38
  %38 = load %37 : $*Builtin.Int32                // user: %46
  %39 = struct_element_addr %4 : $*AudioDevicePropertyDescription<Base>, #AudioDevicePropertyDescription.elementSize // user: %40
  %40 = struct_element_addr %39 : $*UInt32, #UInt32._value // user: %41
  %41 = load %40 : $*Builtin.Int32                // users: %46, %42
  %42 = builtin "cmp_eq_Int32"(%41 : $Builtin.Int32, %20 : $Builtin.Int32) : $Builtin.Int1 // user: %44
  %43 = integer_literal $Builtin.Int1, 0          // users: %154, %162, %177, %44
  %44 = builtin "int_expect_Int1"(%42 : $Builtin.Int1, %43 : $Builtin.Int1) : $Builtin.Int1 // user: %45
  cond_fail %44 : $Builtin.Int1, "Division by zero" // id: %45
  %46 = builtin "udiv_Int32"(%38 : $Builtin.Int32, %41 : $Builtin.Int32) : $Builtin.Int32 // user: %48
  %47 = metatype $@thin UnsafeMutablePointer<Base>.Type // user: %51
  %48 = builtin "zextOrBitCast_Int32_Int64"(%46 : $Builtin.Int32) : $Builtin.Int64 // user: %49
  %49 = struct $Int (%48 : $Builtin.Int64)        // users: %65, %51
  // function_ref static UnsafeMutablePointer.allocate(capacity:)
  %50 = function_ref @$sSp8allocate8capacitySpyxGSi_tFZ : $@convention(method) <τ_0_0> (Int, @thin UnsafeMutablePointer<τ_0_0>.Type) -> UnsafeMutablePointer<τ_0_0> // user: %51
  %51 = apply %50<Base>(%49, %47) : $@convention(method) <τ_0_0> (Int, @thin UnsafeMutablePointer<τ_0_0>.Type) -> UnsafeMutablePointer<τ_0_0> // users: %56, %65, %52
  debug_value %51 : $UnsafeMutablePointer<Base>, let, name "holder" // id: %52
  %53 = struct_element_addr %9 : $*PropertyProviderFunctions, #PropertyProviderFunctions.getData // user: %54
  %54 = load %53 : $*@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) -> Int32 // user: %58
  %55 = load %12 : $*UInt32                       // user: %58
  %56 = struct_extract %51 : $UnsafeMutablePointer<Base>, #UnsafeMutablePointer._rawValue // user: %57
  %57 = struct $UnsafeMutableRawPointer (%56 : $Builtin.RawPointer) // user: %58
  %58 = apply %54(%55, %15, %21, %26, %28, %57) : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) -> Int32 // users: %61, %59
  debug_value %58 : $Int32, let, name "accessStatus" // id: %59
  %60 = load %32 : $*Builtin.Int32                // user: %62
  %61 = struct_extract %58 : $Int32, #Int32._value // user: %62
  %62 = builtin "cmp_eq_Int32"(%61 : $Builtin.Int32, %60 : $Builtin.Int32) : $Builtin.Int1 // user: %63
  cond_br %62, bb3, bb4                           // id: %63

bb3:                                              // Preds: bb2
  // function_ref DeviceProperty.outputTransform(_:count:)
  %64 = function_ref @$s13AudioExplorer14DevicePropertyV15outputTransform_5countq_SgSpyxG_SitF : $@convention(method) <τ_0_0, τ_0_1> (UnsafeMutablePointer<τ_0_0>, Int, @in_guaranteed DeviceProperty<τ_0_0, τ_0_1>) -> @out Optional<τ_0_1> // user: %65
  %65 = apply %64<Base, Output>(%0, %51, %49, %1) : $@convention(method) <τ_0_0, τ_0_1> (UnsafeMutablePointer<τ_0_0>, Int, @in_guaranteed DeviceProperty<τ_0_0, τ_0_1>) -> @out Optional<τ_0_1>
  dealloc_stack %19 : $*UInt32                    // id: %66
  br bb43                                         // id: %67

bb4:                                              // Preds: bb2
  %68 = struct_element_addr %1 : $*DeviceProperty<Base, Output>, #DeviceProperty.logger // user: %70
  %69 = alloc_stack $Logger                       // users: %72, %195, %196, %70
  copy_addr %68 to [initialization] %69 : $*Logger // id: %70
  // function_ref Logger.logObject.getter
  %71 = function_ref @$s2os6LoggerV9logObjectSo03OS_a1_C0Cvg : $@convention(method) (@in_guaranteed Logger) -> @owned OSLog // user: %72
  %72 = apply %71(%69) : $@convention(method) (@in_guaranteed Logger) -> @owned OSLog // users: %80, %189, %77, %183
  %73 = metatype $@thin OSLogType.Type            // user: %75
  // function_ref static os_log_type_t.error.getter
  %74 = function_ref @$sSo13os_log_type_ta0A0E5errorABvgZ : $@convention(method) (@thin OSLogType.Type) -> OSLogType // user: %75
  %75 = apply %74(%73) : $@convention(method) (@thin OSLogType.Type) -> OSLogType // users: %183, %77
  // function_ref os_log_type_enabled
  %76 = function_ref @os_log_type_enabled : $@convention(c) (OSLog, OSLogType) -> Bool // user: %77
  %77 = apply %76(%72, %75) : $@convention(c) (OSLog, OSLogType) -> Bool // user: %78
  %78 = struct_extract %77 : $Bool, #Bool._value  // user: %79
  cond_br %78, bb6, bb5                           // id: %79

bb5:                                              // Preds: bb4
  strong_release %72 : $OSLog                     // id: %80
  br bb16                                         // id: %81

bb6:                                              // Preds: bb4
  %82 = integer_literal $Builtin.Int64, 12        // user: %87
  %83 = metatype $@thick UInt8.Type               // users: %90, %84
  %84 = builtin "strideof"<UInt8>(%83 : $@thick UInt8.Type) : $Builtin.Word // user: %85
  %85 = builtin "sextOrBitCast_Word_Int64"(%84 : $Builtin.Word) : $Builtin.Int64 // users: %153, %161, %174, %87
  %86 = integer_literal $Builtin.Int1, -1         // user: %87
  %87 = builtin "smul_with_overflow_Int64"(%85 : $Builtin.Int64, %82 : $Builtin.Int64, %86 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // users: %88, %99
  %88 = tuple_extract %87 : $(Builtin.Int64, Builtin.Int1), 1 // user: %89
  cond_fail %88 : $Builtin.Int1, "arithmetic overflow" // id: %89
  %90 = builtin "alignof"<UInt8>(%83 : $@thick UInt8.Type) : $Builtin.Word // users: %95, %91
  %91 = builtin "sextOrBitCast_Word_Int64"(%90 : $Builtin.Word) : $Builtin.Int64 // user: %93
  %92 = integer_literal $Builtin.Int64, 16        // users: %107, %93
  %93 = builtin "cmp_slt_Int64"(%92 : $Builtin.Int64, %91 : $Builtin.Int64) : $Builtin.Int1 // user: %94
  cond_br %93, bb7, bb8                           // id: %94

bb7:                                              // Preds: bb6
  br bb9(%90 : $Builtin.Word)                     // id: %95

bb8:                                              // Preds: bb6
  %96 = integer_literal $Builtin.Word, 0          // user: %97
  br bb9(%96 : $Builtin.Word)                     // id: %97

// %98                                            // user: %101
bb9(%98 : $Builtin.Word):                         // Preds: bb7 bb8
  %99 = tuple_extract %87 : $(Builtin.Int64, Builtin.Int1), 0 // user: %100
  %100 = builtin "truncOrBitCast_Int64_Word"(%99 : $Builtin.Int64) : $Builtin.Word // user: %101
  %101 = builtin "allocRaw"(%100 : $Builtin.Word, %98 : $Builtin.Word) : $Builtin.RawPointer // users: %128, %188, %169, %103
  %102 = integer_literal $Builtin.Word, 12        // user: %103
  bind_memory %101 : $Builtin.RawPointer, %102 : $Builtin.Word to $*UInt8 // id: %103
  %104 = metatype $@thick Any.Protocol            // users: %184, %105, %121
  %105 = builtin "alignof"<Any>(%104 : $@thick Any.Protocol) : $Builtin.Word // users: %192, %106
  %106 = builtin "sextOrBitCast_Word_Int64"(%105 : $Builtin.Word) : $Builtin.Int64 // user: %107
  %107 = builtin "cmp_slt_Int64"(%92 : $Builtin.Int64, %106 : $Builtin.Int64) : $Builtin.Int1 // user: %108
  cond_br %107, bb14, bb15                        // id: %108

// %109                                           // user: %122
bb10(%109 : $Builtin.Word):                       // Preds: bb14 bb15
  %110 = integer_literal $Builtin.Int8, 2         // user: %111
  %111 = struct $UInt8 (%110 : $Builtin.Int8)     // user: %129
  %112 = integer_literal $Builtin.Int8, 1         // user: %113
  %113 = struct $UInt8 (%112 : $Builtin.Int8)     // user: %131
  %114 = integer_literal $Builtin.Int8, 34        // user: %115
  %115 = struct $UInt8 (%114 : $Builtin.Int8)     // user: %133
  %116 = integer_literal $Builtin.Int8, 8         // user: %117
  %117 = struct $UInt8 (%116 : $Builtin.Int8)     // user: %135
  %118 = integer_literal $Builtin.Word, 3         // user: %134
  %119 = integer_literal $Builtin.Word, 1         // users: %184, %130, %123
  %120 = integer_literal $Builtin.Word, 2         // user: %132
  %121 = builtin "strideof"<Any>(%104 : $@thick Any.Protocol) : $Builtin.Word // user: %122
  %122 = builtin "allocRaw"(%121 : $Builtin.Word, %109 : $Builtin.Word) : $Builtin.RawPointer // users: %187, %184, %124, %123
  bind_memory %122 : $Builtin.RawPointer, %119 : $Builtin.Word to $*Any // id: %123
  %124 = struct $UnsafeMutablePointer<Any> (%122 : $Builtin.RawPointer) // user: %125
  %125 = enum $Optional<UnsafeMutablePointer<Any>>, #Optional.some!enumelt, %124 : $UnsafeMutablePointer<Any> // user: %127
  %126 = alloc_stack $Optional<UnsafeMutablePointer<Any>> // users: %143, %127, %190
  store %125 to %126 : $*Optional<UnsafeMutablePointer<Any>> // id: %127
  %128 = pointer_to_address %101 : $Builtin.RawPointer to [strict] $*UInt8 // users: %171, %134, %132, %130, %129
  store %111 to %128 : $*UInt8                    // id: %129
  %130 = index_addr %128 : $*UInt8, %119 : $Builtin.Word // user: %131
  store %113 to %130 : $*UInt8                    // id: %131
  %132 = index_addr %128 : $*UInt8, %120 : $Builtin.Word // user: %133
  store %115 to %132 : $*UInt8                    // id: %133
  %134 = index_addr %128 : $*UInt8, %118 : $Builtin.Word // user: %135
  store %117 to %134 : $*UInt8                    // id: %135
  debug_value_addr %3 : $*AudioObjectPropertyAddress, var, name "address", argno 1 // id: %136
  %137 = begin_access [read] [dynamic] [no_nested_conflict] %3 : $*AudioObjectPropertyAddress // users: %139, %138
  %138 = load %137 : $*AudioObjectPropertyAddress // user: %141
  end_access %137 : $*AudioObjectPropertyAddress  // id: %139
  // function_ref AudioObjectPropertyAddress.description.getter
  %140 = function_ref @$sSo26AudioObjectPropertyAddressV0A8ExplorerE11descriptionSSvg : $@convention(method) (AudioObjectPropertyAddress) -> @owned String // user: %141
  %141 = apply %140(%138) : $@convention(method) (AudioObjectPropertyAddress) -> @owned String // users: %146, %143
  // function_ref getNullTerminatedUTF8Pointer(_:using:)
  %142 = function_ref @$s2os28getNullTerminatedUTF8Pointer_5usingSVSS_SpyypGSgztF : $@convention(thin) (@guaranteed String, @inout Optional<UnsafeMutablePointer<Any>>) -> UnsafeRawPointer // user: %143
  %143 = apply %142(%141, %126) : $@convention(thin) (@guaranteed String, @inout Optional<UnsafeMutablePointer<Any>>) -> UnsafeRawPointer // user: %145
  %144 = alloc_stack $UnsafeRawPointer            // users: %178, %173, %145
  store %143 to %144 : $*UnsafeRawPointer         // id: %145
  release_value %141 : $String                    // id: %146
  %147 = metatype $@thick UnsafeRawPointer.Type   // user: %148
  %148 = builtin "sizeof"<UnsafeRawPointer>(%147 : $@thick UnsafeRawPointer.Type) : $Builtin.Word // user: %149
  %149 = builtin "sextOrBitCast_Word_Int64"(%148 : $Builtin.Word) : $Builtin.Int64 // users: %174, %157, %151
  %150 = integer_literal $Builtin.Int64, 0        // users: %175, %153, %151
  %151 = builtin "cmp_slt_Int64"(%149 : $Builtin.Int64, %150 : $Builtin.Int64) : $Builtin.Int1 // user: %152
  cond_fail %151 : $Builtin.Int1, "UnsafeRawBufferPointer with negative count" // id: %152
  %153 = builtin "cmp_eq_Int64"(%85 : $Builtin.Int64, %150 : $Builtin.Int64) : $Builtin.Int1 // user: %154
  %154 = builtin "int_expect_Int1"(%153 : $Builtin.Int1, %43 : $Builtin.Int1) : $Builtin.Int1 // user: %155
  cond_fail %154 : $Builtin.Int1, "Division by zero" // id: %155
  %156 = integer_literal $Builtin.Int64, -9223372036854775808 // user: %157
  %157 = builtin "cmp_eq_Int64"(%149 : $Builtin.Int64, %156 : $Builtin.Int64) : $Builtin.Int1 // user: %158
  cond_br %157, bb12, bb11                        // id: %158

bb11:                                             // Preds: bb10
  br bb13                                         // id: %159

bb12:                                             // Preds: bb10
  %160 = integer_literal $Builtin.Int64, -1       // user: %161
  %161 = builtin "cmp_eq_Int64"(%85 : $Builtin.Int64, %160 : $Builtin.Int64) : $Builtin.Int1 // user: %162
  %162 = builtin "int_expect_Int1"(%161 : $Builtin.Int1, %43 : $Builtin.Int1) : $Builtin.Int1 // user: %163
  cond_fail %162 : $Builtin.Int1, "Division results in an overflow" // id: %163
  br bb13                                         // id: %164

bb13:                                             // Preds: bb11 bb12
  %165 = string_literal utf8 "unable to access address %{public}s" // user: %168
  %166 = integer_literal $Builtin.Int32, 12       // user: %167
  %167 = struct $UInt32 (%166 : $Builtin.Int32)   // user: %183
  %168 = struct $UnsafePointer<Int8> (%165 : $Builtin.RawPointer) // user: %183
  %169 = struct $UnsafeMutablePointer<UInt8> (%101 : $Builtin.RawPointer) // user: %183
  %170 = integer_literal $Builtin.Word, 4         // user: %171
  %171 = index_addr %128 : $*UInt8, %170 : $Builtin.Word // user: %172
  %172 = address_to_pointer %171 : $*UInt8 to $Builtin.RawPointer // user: %177
  %173 = address_to_pointer %144 : $*UnsafeRawPointer to $Builtin.RawPointer // user: %177
  %174 = builtin "sdiv_Int64"(%149 : $Builtin.Int64, %85 : $Builtin.Int64) : $Builtin.Int64 // users: %177, %175
  %175 = builtin "cmp_slt_Int64"(%174 : $Builtin.Int64, %150 : $Builtin.Int64) : $Builtin.Int1 // user: %176
  cond_fail %175 : $Builtin.Int1, "Negative value is not representable" // id: %176
  %177 = builtin "int_memmove_RawPointer_RawPointer_Int64"(%172 : $Builtin.RawPointer, %173 : $Builtin.RawPointer, %174 : $Builtin.Int64, %43 : $Builtin.Int1) : $()
  dealloc_stack %144 : $*UnsafeRawPointer         // id: %178
  %179 = global_addr @__dso_handle : $*Builtin.RawPointer // user: %180
  %180 = address_to_pointer %179 : $*Builtin.RawPointer to $Builtin.RawPointer // user: %181
  %181 = struct $UnsafeMutableRawPointer (%180 : $Builtin.RawPointer) // user: %183
  // function_ref _os_log_impl
  %182 = function_ref @_os_log_impl : $@convention(c) (UnsafeMutableRawPointer, OSLog, OSLogType, UnsafePointer<Int8>, UnsafeMutablePointer<UInt8>, UInt32) -> () // user: %183
  %183 = apply %182(%181, %72, %75, %168, %169, %167) : $@convention(c) (UnsafeMutableRawPointer, OSLog, OSLogType, UnsafePointer<Int8>, UnsafeMutablePointer<UInt8>, UInt32) -> ()
  %184 = builtin "destroyArray"<Any>(%104 : $@thick Any.Protocol, %122 : $Builtin.RawPointer, %119 : $Builtin.Word) : $()
  %185 = integer_literal $Builtin.Word, -1        // users: %188, %187
  %186 = integer_literal $Builtin.Word, 0         // users: %188, %187
  %187 = builtin "deallocRaw"(%122 : $Builtin.RawPointer, %185 : $Builtin.Word, %186 : $Builtin.Word) : $()
  %188 = builtin "deallocRaw"(%101 : $Builtin.RawPointer, %185 : $Builtin.Word, %186 : $Builtin.Word) : $()
  strong_release %72 : $OSLog                     // id: %189
  dealloc_stack %126 : $*Optional<UnsafeMutablePointer<Any>> // id: %190
  br bb16                                         // id: %191

bb14:                                             // Preds: bb9
  br bb10(%105 : $Builtin.Word)                   // id: %192

bb15:                                             // Preds: bb9
  %193 = integer_literal $Builtin.Word, 0         // user: %194
  br bb10(%193 : $Builtin.Word)                   // id: %194

bb16:                                             // Preds: bb5 bb13
  destroy_addr %69 : $*Logger                     // id: %195
  dealloc_stack %69 : $*Logger                    // id: %196
  inject_enum_addr %0 : $*Optional<Output>, #Optional.none!enumelt // id: %197
  dealloc_stack %19 : $*UInt32                    // id: %198
  br bb43                                         // id: %199

bb17:                                             // Preds: bb1
  %200 = struct_element_addr %1 : $*DeviceProperty<Base, Output>, #DeviceProperty.logger // user: %202
  %201 = alloc_stack $Logger                      // users: %204, %328, %329, %202
  copy_addr %200 to [initialization] %201 : $*Logger // id: %202
  // function_ref Logger.logObject.getter
  %203 = function_ref @$s2os6LoggerV9logObjectSo03OS_a1_C0Cvg : $@convention(method) (@in_guaranteed Logger) -> @owned OSLog // user: %204
  %204 = apply %203(%201) : $@convention(method) (@in_guaranteed Logger) -> @owned OSLog // users: %212, %322, %209, %316
  %205 = metatype $@thin OSLogType.Type           // user: %207
  // function_ref static os_log_type_t.error.getter
  %206 = function_ref @$sSo13os_log_type_ta0A0E5errorABvgZ : $@convention(method) (@thin OSLogType.Type) -> OSLogType // user: %207
  %207 = apply %206(%205) : $@convention(method) (@thin OSLogType.Type) -> OSLogType // users: %316, %209
  // function_ref os_log_type_enabled
  %208 = function_ref @os_log_type_enabled : $@convention(c) (OSLog, OSLogType) -> Bool // user: %209
  %209 = apply %208(%204, %207) : $@convention(c) (OSLog, OSLogType) -> Bool // user: %210
  %210 = struct_extract %209 : $Bool, #Bool._value // user: %211
  cond_br %210, bb19, bb18                        // id: %211

bb18:                                             // Preds: bb17
  strong_release %204 : $OSLog                    // id: %212
  br bb29                                         // id: %213

bb19:                                             // Preds: bb17
  %214 = integer_literal $Builtin.Int64, 12       // user: %219
  %215 = metatype $@thick UInt8.Type              // users: %222, %216
  %216 = builtin "strideof"<UInt8>(%215 : $@thick UInt8.Type) : $Builtin.Word // user: %217
  %217 = builtin "sextOrBitCast_Word_Int64"(%216 : $Builtin.Word) : $Builtin.Int64 // users: %286, %294, %307, %219
  %218 = integer_literal $Builtin.Int1, -1        // user: %219
  %219 = builtin "smul_with_overflow_Int64"(%217 : $Builtin.Int64, %214 : $Builtin.Int64, %218 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // users: %220, %231
  %220 = tuple_extract %219 : $(Builtin.Int64, Builtin.Int1), 1 // user: %221
  cond_fail %220 : $Builtin.Int1, "arithmetic overflow" // id: %221
  %222 = builtin "alignof"<UInt8>(%215 : $@thick UInt8.Type) : $Builtin.Word // users: %227, %223
  %223 = builtin "sextOrBitCast_Word_Int64"(%222 : $Builtin.Word) : $Builtin.Int64 // user: %225
  %224 = integer_literal $Builtin.Int64, 16       // users: %239, %225
  %225 = builtin "cmp_slt_Int64"(%224 : $Builtin.Int64, %223 : $Builtin.Int64) : $Builtin.Int1 // user: %226
  cond_br %225, bb20, bb21                        // id: %226

bb20:                                             // Preds: bb19
  br bb22(%222 : $Builtin.Word)                   // id: %227

bb21:                                             // Preds: bb19
  %228 = integer_literal $Builtin.Word, 0         // user: %229
  br bb22(%228 : $Builtin.Word)                   // id: %229

// %230                                           // user: %233
bb22(%230 : $Builtin.Word):                       // Preds: bb20 bb21
  %231 = tuple_extract %219 : $(Builtin.Int64, Builtin.Int1), 0 // user: %232
  %232 = builtin "truncOrBitCast_Int64_Word"(%231 : $Builtin.Int64) : $Builtin.Word // user: %233
  %233 = builtin "allocRaw"(%232 : $Builtin.Word, %230 : $Builtin.Word) : $Builtin.RawPointer // users: %260, %321, %302, %235
  %234 = integer_literal $Builtin.Word, 12        // user: %235
  bind_memory %233 : $Builtin.RawPointer, %234 : $Builtin.Word to $*UInt8 // id: %235
  %236 = metatype $@thick Any.Protocol            // users: %317, %237, %253
  %237 = builtin "alignof"<Any>(%236 : $@thick Any.Protocol) : $Builtin.Word // users: %325, %238
  %238 = builtin "sextOrBitCast_Word_Int64"(%237 : $Builtin.Word) : $Builtin.Int64 // user: %239
  %239 = builtin "cmp_slt_Int64"(%224 : $Builtin.Int64, %238 : $Builtin.Int64) : $Builtin.Int1 // user: %240
  cond_br %239, bb27, bb28                        // id: %240

// %241                                           // user: %254
bb23(%241 : $Builtin.Word):                       // Preds: bb27 bb28
  %242 = integer_literal $Builtin.Int8, 2         // user: %243
  %243 = struct $UInt8 (%242 : $Builtin.Int8)     // user: %261
  %244 = integer_literal $Builtin.Int8, 1         // user: %245
  %245 = struct $UInt8 (%244 : $Builtin.Int8)     // user: %263
  %246 = integer_literal $Builtin.Int8, 34        // user: %247
  %247 = struct $UInt8 (%246 : $Builtin.Int8)     // user: %265
  %248 = integer_literal $Builtin.Int8, 8         // user: %249
  %249 = struct $UInt8 (%248 : $Builtin.Int8)     // user: %267
  %250 = integer_literal $Builtin.Word, 3         // user: %266
  %251 = integer_literal $Builtin.Word, 1         // users: %317, %262, %255
  %252 = integer_literal $Builtin.Word, 2         // user: %264
  %253 = builtin "strideof"<Any>(%236 : $@thick Any.Protocol) : $Builtin.Word // user: %254
  %254 = builtin "allocRaw"(%253 : $Builtin.Word, %241 : $Builtin.Word) : $Builtin.RawPointer // users: %320, %317, %256, %255
  bind_memory %254 : $Builtin.RawPointer, %251 : $Builtin.Word to $*Any // id: %255
  %256 = struct $UnsafeMutablePointer<Any> (%254 : $Builtin.RawPointer) // user: %257
  %257 = enum $Optional<UnsafeMutablePointer<Any>>, #Optional.some!enumelt, %256 : $UnsafeMutablePointer<Any> // user: %259
  %258 = alloc_stack $Optional<UnsafeMutablePointer<Any>> // users: %275, %259, %323
  store %257 to %258 : $*Optional<UnsafeMutablePointer<Any>> // id: %259
  %260 = pointer_to_address %233 : $Builtin.RawPointer to [strict] $*UInt8 // users: %304, %266, %264, %262, %261
  store %243 to %260 : $*UInt8                    // id: %261
  %262 = index_addr %260 : $*UInt8, %251 : $Builtin.Word // user: %263
  store %245 to %262 : $*UInt8                    // id: %263
  %264 = index_addr %260 : $*UInt8, %252 : $Builtin.Word // user: %265
  store %247 to %264 : $*UInt8                    // id: %265
  %266 = index_addr %260 : $*UInt8, %250 : $Builtin.Word // user: %267
  store %249 to %266 : $*UInt8                    // id: %267
  debug_value_addr %3 : $*AudioObjectPropertyAddress, var, name "address", argno 1 // id: %268
  %269 = begin_access [read] [dynamic] [no_nested_conflict] %3 : $*AudioObjectPropertyAddress // users: %271, %270
  %270 = load %269 : $*AudioObjectPropertyAddress // user: %273
  end_access %269 : $*AudioObjectPropertyAddress  // id: %271
  // function_ref AudioObjectPropertyAddress.description.getter
  %272 = function_ref @$sSo26AudioObjectPropertyAddressV0A8ExplorerE11descriptionSSvg : $@convention(method) (AudioObjectPropertyAddress) -> @owned String // user: %273
  %273 = apply %272(%270) : $@convention(method) (AudioObjectPropertyAddress) -> @owned String // users: %278, %275
  // function_ref getNullTerminatedUTF8Pointer(_:using:)
  %274 = function_ref @$s2os28getNullTerminatedUTF8Pointer_5usingSVSS_SpyypGSgztF : $@convention(thin) (@guaranteed String, @inout Optional<UnsafeMutablePointer<Any>>) -> UnsafeRawPointer // user: %275
  %275 = apply %274(%273, %258) : $@convention(thin) (@guaranteed String, @inout Optional<UnsafeMutablePointer<Any>>) -> UnsafeRawPointer // user: %277
  %276 = alloc_stack $UnsafeRawPointer            // users: %311, %306, %277
  store %275 to %276 : $*UnsafeRawPointer         // id: %277
  release_value %273 : $String                    // id: %278
  %279 = metatype $@thick UnsafeRawPointer.Type   // user: %280
  %280 = builtin "sizeof"<UnsafeRawPointer>(%279 : $@thick UnsafeRawPointer.Type) : $Builtin.Word // user: %281
  %281 = builtin "sextOrBitCast_Word_Int64"(%280 : $Builtin.Word) : $Builtin.Int64 // users: %307, %290, %283
  %282 = integer_literal $Builtin.Int64, 0        // users: %308, %286, %283
  %283 = builtin "cmp_slt_Int64"(%281 : $Builtin.Int64, %282 : $Builtin.Int64) : $Builtin.Int1 // user: %284
  cond_fail %283 : $Builtin.Int1, "UnsafeRawBufferPointer with negative count" // id: %284
  %285 = integer_literal $Builtin.Int1, 0         // users: %310, %295, %287
  %286 = builtin "cmp_eq_Int64"(%217 : $Builtin.Int64, %282 : $Builtin.Int64) : $Builtin.Int1 // user: %287
  %287 = builtin "int_expect_Int1"(%286 : $Builtin.Int1, %285 : $Builtin.Int1) : $Builtin.Int1 // user: %288
  cond_fail %287 : $Builtin.Int1, "Division by zero" // id: %288
  %289 = integer_literal $Builtin.Int64, -9223372036854775808 // user: %290
  %290 = builtin "cmp_eq_Int64"(%281 : $Builtin.Int64, %289 : $Builtin.Int64) : $Builtin.Int1 // user: %291
  cond_br %290, bb25, bb24                        // id: %291

bb24:                                             // Preds: bb23
  br bb26                                         // id: %292

bb25:                                             // Preds: bb23
  %293 = integer_literal $Builtin.Int64, -1       // user: %294
  %294 = builtin "cmp_eq_Int64"(%217 : $Builtin.Int64, %293 : $Builtin.Int64) : $Builtin.Int1 // user: %295
  %295 = builtin "int_expect_Int1"(%294 : $Builtin.Int1, %285 : $Builtin.Int1) : $Builtin.Int1 // user: %296
  cond_fail %295 : $Builtin.Int1, "Division results in an overflow" // id: %296
  br bb26                                         // id: %297

bb26:                                             // Preds: bb24 bb25
  %298 = string_literal utf8 "unable to get size for address %{public}s" // user: %301
  %299 = integer_literal $Builtin.Int32, 12       // user: %300
  %300 = struct $UInt32 (%299 : $Builtin.Int32)   // user: %316
  %301 = struct $UnsafePointer<Int8> (%298 : $Builtin.RawPointer) // user: %316
  %302 = struct $UnsafeMutablePointer<UInt8> (%233 : $Builtin.RawPointer) // user: %316
  %303 = integer_literal $Builtin.Word, 4         // user: %304
  %304 = index_addr %260 : $*UInt8, %303 : $Builtin.Word // user: %305
  %305 = address_to_pointer %304 : $*UInt8 to $Builtin.RawPointer // user: %310
  %306 = address_to_pointer %276 : $*UnsafeRawPointer to $Builtin.RawPointer // user: %310
  %307 = builtin "sdiv_Int64"(%281 : $Builtin.Int64, %217 : $Builtin.Int64) : $Builtin.Int64 // users: %310, %308
  %308 = builtin "cmp_slt_Int64"(%307 : $Builtin.Int64, %282 : $Builtin.Int64) : $Builtin.Int1 // user: %309
  cond_fail %308 : $Builtin.Int1, "Negative value is not representable" // id: %309
  %310 = builtin "int_memmove_RawPointer_RawPointer_Int64"(%305 : $Builtin.RawPointer, %306 : $Builtin.RawPointer, %307 : $Builtin.Int64, %285 : $Builtin.Int1) : $()
  dealloc_stack %276 : $*UnsafeRawPointer         // id: %311
  %312 = global_addr @__dso_handle : $*Builtin.RawPointer // user: %313
  %313 = address_to_pointer %312 : $*Builtin.RawPointer to $Builtin.RawPointer // user: %314
  %314 = struct $UnsafeMutableRawPointer (%313 : $Builtin.RawPointer) // user: %316
  // function_ref _os_log_impl
  %315 = function_ref @_os_log_impl : $@convention(c) (UnsafeMutableRawPointer, OSLog, OSLogType, UnsafePointer<Int8>, UnsafeMutablePointer<UInt8>, UInt32) -> () // user: %316
  %316 = apply %315(%314, %204, %207, %301, %302, %300) : $@convention(c) (UnsafeMutableRawPointer, OSLog, OSLogType, UnsafePointer<Int8>, UnsafeMutablePointer<UInt8>, UInt32) -> ()
  %317 = builtin "destroyArray"<Any>(%236 : $@thick Any.Protocol, %254 : $Builtin.RawPointer, %251 : $Builtin.Word) : $()
  %318 = integer_literal $Builtin.Word, -1        // users: %321, %320
  %319 = integer_literal $Builtin.Word, 0         // users: %321, %320
  %320 = builtin "deallocRaw"(%254 : $Builtin.RawPointer, %318 : $Builtin.Word, %319 : $Builtin.Word) : $()
  %321 = builtin "deallocRaw"(%233 : $Builtin.RawPointer, %318 : $Builtin.Word, %319 : $Builtin.Word) : $()
  strong_release %204 : $OSLog                    // id: %322
  dealloc_stack %258 : $*Optional<UnsafeMutablePointer<Any>> // id: %323
  br bb29                                         // id: %324

bb27:                                             // Preds: bb22
  br bb23(%237 : $Builtin.Word)                   // id: %325

bb28:                                             // Preds: bb22
  %326 = integer_literal $Builtin.Word, 0         // user: %327
  br bb23(%326 : $Builtin.Word)                   // id: %327

bb29:                                             // Preds: bb18 bb26
  destroy_addr %201 : $*Logger                    // id: %328
  dealloc_stack %201 : $*Logger                   // id: %329
  inject_enum_addr %0 : $*Optional<Output>, #Optional.none!enumelt // id: %330
  dealloc_stack %19 : $*UInt32                    // id: %331
  br bb43                                         // id: %332

bb30:                                             // Preds: bb0
  %333 = struct_element_addr %1 : $*DeviceProperty<Base, Output>, #DeviceProperty.logger // user: %335
  %334 = alloc_stack $Logger                      // users: %337, %461, %462, %335
  copy_addr %333 to [initialization] %334 : $*Logger // id: %335
  // function_ref Logger.logObject.getter
  %336 = function_ref @$s2os6LoggerV9logObjectSo03OS_a1_C0Cvg : $@convention(method) (@in_guaranteed Logger) -> @owned OSLog // user: %337
  %337 = apply %336(%334) : $@convention(method) (@in_guaranteed Logger) -> @owned OSLog // users: %345, %455, %342, %449
  %338 = metatype $@thin OSLogType.Type           // user: %340
  // function_ref static os_log_type_t.error.getter
  %339 = function_ref @$sSo13os_log_type_ta0A0E5errorABvgZ : $@convention(method) (@thin OSLogType.Type) -> OSLogType // user: %340
  %340 = apply %339(%338) : $@convention(method) (@thin OSLogType.Type) -> OSLogType // users: %449, %342
  // function_ref os_log_type_enabled
  %341 = function_ref @os_log_type_enabled : $@convention(c) (OSLog, OSLogType) -> Bool // user: %342
  %342 = apply %341(%337, %340) : $@convention(c) (OSLog, OSLogType) -> Bool // user: %343
  %343 = struct_extract %342 : $Bool, #Bool._value // user: %344
  cond_br %343, bb32, bb31                        // id: %344

bb31:                                             // Preds: bb30
  strong_release %337 : $OSLog                    // id: %345
  br bb42                                         // id: %346

bb32:                                             // Preds: bb30
  %347 = integer_literal $Builtin.Int64, 12       // user: %352
  %348 = metatype $@thick UInt8.Type              // users: %355, %349
  %349 = builtin "strideof"<UInt8>(%348 : $@thick UInt8.Type) : $Builtin.Word // user: %350
  %350 = builtin "sextOrBitCast_Word_Int64"(%349 : $Builtin.Word) : $Builtin.Int64 // users: %419, %427, %440, %352
  %351 = integer_literal $Builtin.Int1, -1        // user: %352
  %352 = builtin "smul_with_overflow_Int64"(%350 : $Builtin.Int64, %347 : $Builtin.Int64, %351 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // users: %353, %364
  %353 = tuple_extract %352 : $(Builtin.Int64, Builtin.Int1), 1 // user: %354
  cond_fail %353 : $Builtin.Int1, "arithmetic overflow" // id: %354
  %355 = builtin "alignof"<UInt8>(%348 : $@thick UInt8.Type) : $Builtin.Word // users: %360, %356
  %356 = builtin "sextOrBitCast_Word_Int64"(%355 : $Builtin.Word) : $Builtin.Int64 // user: %358
  %357 = integer_literal $Builtin.Int64, 16       // users: %372, %358
  %358 = builtin "cmp_slt_Int64"(%357 : $Builtin.Int64, %356 : $Builtin.Int64) : $Builtin.Int1 // user: %359
  cond_br %358, bb33, bb34                        // id: %359

bb33:                                             // Preds: bb32
  br bb35(%355 : $Builtin.Word)                   // id: %360

bb34:                                             // Preds: bb32
  %361 = integer_literal $Builtin.Word, 0         // user: %362
  br bb35(%361 : $Builtin.Word)                   // id: %362

// %363                                           // user: %366
bb35(%363 : $Builtin.Word):                       // Preds: bb33 bb34
  %364 = tuple_extract %352 : $(Builtin.Int64, Builtin.Int1), 0 // user: %365
  %365 = builtin "truncOrBitCast_Int64_Word"(%364 : $Builtin.Int64) : $Builtin.Word // user: %366
  %366 = builtin "allocRaw"(%365 : $Builtin.Word, %363 : $Builtin.Word) : $Builtin.RawPointer // users: %393, %454, %435, %368
  %367 = integer_literal $Builtin.Word, 12        // user: %368
  bind_memory %366 : $Builtin.RawPointer, %367 : $Builtin.Word to $*UInt8 // id: %368
  %369 = metatype $@thick Any.Protocol            // users: %450, %370, %386
  %370 = builtin "alignof"<Any>(%369 : $@thick Any.Protocol) : $Builtin.Word // users: %458, %371
  %371 = builtin "sextOrBitCast_Word_Int64"(%370 : $Builtin.Word) : $Builtin.Int64 // user: %372
  %372 = builtin "cmp_slt_Int64"(%357 : $Builtin.Int64, %371 : $Builtin.Int64) : $Builtin.Int1 // user: %373
  cond_br %372, bb40, bb41                        // id: %373

// %374                                           // user: %387
bb36(%374 : $Builtin.Word):                       // Preds: bb40 bb41
  %375 = integer_literal $Builtin.Int8, 2         // user: %376
  %376 = struct $UInt8 (%375 : $Builtin.Int8)     // user: %394
  %377 = integer_literal $Builtin.Int8, 1         // user: %378
  %378 = struct $UInt8 (%377 : $Builtin.Int8)     // user: %396
  %379 = integer_literal $Builtin.Int8, 34        // user: %380
  %380 = struct $UInt8 (%379 : $Builtin.Int8)     // user: %398
  %381 = integer_literal $Builtin.Int8, 8         // user: %382
  %382 = struct $UInt8 (%381 : $Builtin.Int8)     // user: %400
  %383 = integer_literal $Builtin.Word, 3         // user: %399
  %384 = integer_literal $Builtin.Word, 1         // users: %450, %395, %388
  %385 = integer_literal $Builtin.Word, 2         // user: %397
  %386 = builtin "strideof"<Any>(%369 : $@thick Any.Protocol) : $Builtin.Word // user: %387
  %387 = builtin "allocRaw"(%386 : $Builtin.Word, %374 : $Builtin.Word) : $Builtin.RawPointer // users: %453, %450, %389, %388
  bind_memory %387 : $Builtin.RawPointer, %384 : $Builtin.Word to $*Any // id: %388
  %389 = struct $UnsafeMutablePointer<Any> (%387 : $Builtin.RawPointer) // user: %390
  %390 = enum $Optional<UnsafeMutablePointer<Any>>, #Optional.some!enumelt, %389 : $UnsafeMutablePointer<Any> // user: %392
  %391 = alloc_stack $Optional<UnsafeMutablePointer<Any>> // users: %408, %392, %456
  store %390 to %391 : $*Optional<UnsafeMutablePointer<Any>> // id: %392
  %393 = pointer_to_address %366 : $Builtin.RawPointer to [strict] $*UInt8 // users: %437, %399, %397, %395, %394
  store %376 to %393 : $*UInt8                    // id: %394
  %395 = index_addr %393 : $*UInt8, %384 : $Builtin.Word // user: %396
  store %378 to %395 : $*UInt8                    // id: %396
  %397 = index_addr %393 : $*UInt8, %385 : $Builtin.Word // user: %398
  store %380 to %397 : $*UInt8                    // id: %398
  %399 = index_addr %393 : $*UInt8, %383 : $Builtin.Word // user: %400
  store %382 to %399 : $*UInt8                    // id: %400
  debug_value_addr %3 : $*AudioObjectPropertyAddress, var, name "address", argno 1 // id: %401
  %402 = begin_access [read] [dynamic] [no_nested_conflict] %3 : $*AudioObjectPropertyAddress // users: %404, %403
  %403 = load %402 : $*AudioObjectPropertyAddress // user: %406
  end_access %402 : $*AudioObjectPropertyAddress  // id: %404
  // function_ref AudioObjectPropertyAddress.description.getter
  %405 = function_ref @$sSo26AudioObjectPropertyAddressV0A8ExplorerE11descriptionSSvg : $@convention(method) (AudioObjectPropertyAddress) -> @owned String // user: %406
  %406 = apply %405(%403) : $@convention(method) (AudioObjectPropertyAddress) -> @owned String // users: %411, %408
  // function_ref getNullTerminatedUTF8Pointer(_:using:)
  %407 = function_ref @$s2os28getNullTerminatedUTF8Pointer_5usingSVSS_SpyypGSgztF : $@convention(thin) (@guaranteed String, @inout Optional<UnsafeMutablePointer<Any>>) -> UnsafeRawPointer // user: %408
  %408 = apply %407(%406, %391) : $@convention(thin) (@guaranteed String, @inout Optional<UnsafeMutablePointer<Any>>) -> UnsafeRawPointer // user: %410
  %409 = alloc_stack $UnsafeRawPointer            // users: %444, %439, %410
  store %408 to %409 : $*UnsafeRawPointer         // id: %410
  release_value %406 : $String                    // id: %411
  %412 = metatype $@thick UnsafeRawPointer.Type   // user: %413
  %413 = builtin "sizeof"<UnsafeRawPointer>(%412 : $@thick UnsafeRawPointer.Type) : $Builtin.Word // user: %414
  %414 = builtin "sextOrBitCast_Word_Int64"(%413 : $Builtin.Word) : $Builtin.Int64 // users: %440, %423, %416
  %415 = integer_literal $Builtin.Int64, 0        // users: %441, %419, %416
  %416 = builtin "cmp_slt_Int64"(%414 : $Builtin.Int64, %415 : $Builtin.Int64) : $Builtin.Int1 // user: %417
  cond_fail %416 : $Builtin.Int1, "UnsafeRawBufferPointer with negative count" // id: %417
  %418 = integer_literal $Builtin.Int1, 0         // users: %443, %428, %420
  %419 = builtin "cmp_eq_Int64"(%350 : $Builtin.Int64, %415 : $Builtin.Int64) : $Builtin.Int1 // user: %420
  %420 = builtin "int_expect_Int1"(%419 : $Builtin.Int1, %418 : $Builtin.Int1) : $Builtin.Int1 // user: %421
  cond_fail %420 : $Builtin.Int1, "Division by zero" // id: %421
  %422 = integer_literal $Builtin.Int64, -9223372036854775808 // user: %423
  %423 = builtin "cmp_eq_Int64"(%414 : $Builtin.Int64, %422 : $Builtin.Int64) : $Builtin.Int1 // user: %424
  cond_br %423, bb38, bb37                        // id: %424

bb37:                                             // Preds: bb36
  br bb39                                         // id: %425

bb38:                                             // Preds: bb36
  %426 = integer_literal $Builtin.Int64, -1       // user: %427
  %427 = builtin "cmp_eq_Int64"(%350 : $Builtin.Int64, %426 : $Builtin.Int64) : $Builtin.Int1 // user: %428
  %428 = builtin "int_expect_Int1"(%427 : $Builtin.Int1, %418 : $Builtin.Int1) : $Builtin.Int1 // user: %429
  cond_fail %428 : $Builtin.Int1, "Division results in an overflow" // id: %429
  br bb39                                         // id: %430

bb39:                                             // Preds: bb37 bb38
  %431 = string_literal utf8 "property for address not available %{public}s" // user: %434
  %432 = integer_literal $Builtin.Int32, 12       // user: %433
  %433 = struct $UInt32 (%432 : $Builtin.Int32)   // user: %449
  %434 = struct $UnsafePointer<Int8> (%431 : $Builtin.RawPointer) // user: %449
  %435 = struct $UnsafeMutablePointer<UInt8> (%366 : $Builtin.RawPointer) // user: %449
  %436 = integer_literal $Builtin.Word, 4         // user: %437
  %437 = index_addr %393 : $*UInt8, %436 : $Builtin.Word // user: %438
  %438 = address_to_pointer %437 : $*UInt8 to $Builtin.RawPointer // user: %443
  %439 = address_to_pointer %409 : $*UnsafeRawPointer to $Builtin.RawPointer // user: %443
  %440 = builtin "sdiv_Int64"(%414 : $Builtin.Int64, %350 : $Builtin.Int64) : $Builtin.Int64 // users: %443, %441
  %441 = builtin "cmp_slt_Int64"(%440 : $Builtin.Int64, %415 : $Builtin.Int64) : $Builtin.Int1 // user: %442
  cond_fail %441 : $Builtin.Int1, "Negative value is not representable" // id: %442
  %443 = builtin "int_memmove_RawPointer_RawPointer_Int64"(%438 : $Builtin.RawPointer, %439 : $Builtin.RawPointer, %440 : $Builtin.Int64, %418 : $Builtin.Int1) : $()
  dealloc_stack %409 : $*UnsafeRawPointer         // id: %444
  %445 = global_addr @__dso_handle : $*Builtin.RawPointer // user: %446
  %446 = address_to_pointer %445 : $*Builtin.RawPointer to $Builtin.RawPointer // user: %447
  %447 = struct $UnsafeMutableRawPointer (%446 : $Builtin.RawPointer) // user: %449
  // function_ref _os_log_impl
  %448 = function_ref @_os_log_impl : $@convention(c) (UnsafeMutableRawPointer, OSLog, OSLogType, UnsafePointer<Int8>, UnsafeMutablePointer<UInt8>, UInt32) -> () // user: %449
  %449 = apply %448(%447, %337, %340, %434, %435, %433) : $@convention(c) (UnsafeMutableRawPointer, OSLog, OSLogType, UnsafePointer<Int8>, UnsafeMutablePointer<UInt8>, UInt32) -> ()
  %450 = builtin "destroyArray"<Any>(%369 : $@thick Any.Protocol, %387 : $Builtin.RawPointer, %384 : $Builtin.Word) : $()
  %451 = integer_literal $Builtin.Word, -1        // users: %454, %453
  %452 = integer_literal $Builtin.Word, 0         // users: %454, %453
  %453 = builtin "deallocRaw"(%387 : $Builtin.RawPointer, %451 : $Builtin.Word, %452 : $Builtin.Word) : $()
  %454 = builtin "deallocRaw"(%366 : $Builtin.RawPointer, %451 : $Builtin.Word, %452 : $Builtin.Word) : $()
  strong_release %337 : $OSLog                    // id: %455
  dealloc_stack %391 : $*Optional<UnsafeMutablePointer<Any>> // id: %456
  br bb42                                         // id: %457

bb40:                                             // Preds: bb35
  br bb36(%370 : $Builtin.Word)                   // id: %458

bb41:                                             // Preds: bb35
  %459 = integer_literal $Builtin.Word, 0         // user: %460
  br bb36(%459 : $Builtin.Word)                   // id: %460

bb42:                                             // Preds: bb31 bb39
  destroy_addr %334 : $*Logger                    // id: %461
  dealloc_stack %334 : $*Logger                   // id: %462
  inject_enum_addr %0 : $*Optional<Output>, #Optional.none!enumelt // id: %463
  br bb43                                         // id: %464

bb43:                                             // Preds: bb3 bb16 bb29 bb42
  dealloc_stack %3 : $*AudioObjectPropertyAddress // id: %465
  %466 = tuple ()                                 // user: %467
  return %466 : $()                               // id: %467
} // end sil function '$s13AudioExplorer14DevicePropertyV12wrappedValueq_Sgvg'

// AudioDevicePropertyDescription.address.getter
sil @$s13AudioExplorer0A25DevicePropertyDescriptionV7addressSo0a6ObjectD7AddressVvg : $@convention(method) <τ_0_0> (AudioDevicePropertyDescription<τ_0_0>) -> AudioObjectPropertyAddress

// OSLogInterpolation.init(literalCapacity:interpolationCount:)
sil public_external [available 11.0] [Onone] [_semantics "constant_evaluable"] [_semantics "oslog.interpolation.init"] @$s2os18OSLogInterpolationV15literalCapacity18interpolationCountACSi_SitcfC : $@convention(method) (Int, Int, @thin OSLogInterpolation.Type) -> @owned OSLogInterpolation {
bb0(%0 : $Int, %1 : $Int, %2 : $@thin OSLogInterpolation.Type):
  %3 = alloc_stack $OSLogInterpolation            // users: %42, %41, %36, %32, %28, %24, %20, %16, %10
  %4 = string_literal utf8 ""                     // user: %9
  %5 = integer_literal $Builtin.Word, 0           // user: %9
  %6 = integer_literal $Builtin.Int1, -1          // user: %9
  %7 = metatype $@thin String.Type                // user: %9
  // function_ref String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)
  %8 = function_ref @$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %9
  %9 = apply %8(%4, %5, %6, %7) : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // users: %40, %38, %12, %11
  %10 = struct_element_addr %3 : $*OSLogInterpolation, #OSLogInterpolation.formatString // user: %12
  retain_value %9 : $String                       // id: %11
  store %9 to %10 : $*String                      // id: %12
  %13 = metatype $@thin OSLogArguments.Type       // user: %15
  // function_ref OSLogArguments.init()
  %14 = function_ref @$s2os14OSLogArgumentsVACycfC : $@convention(method) (@thin OSLogArguments.Type) -> @owned OSLogArguments // user: %15
  %15 = apply %14(%13) : $@convention(method) (@thin OSLogArguments.Type) -> @owned OSLogArguments // users: %38, %17
  %16 = struct_element_addr %3 : $*OSLogInterpolation, #OSLogInterpolation.arguments // user: %17
  store %15 to %16 : $*OSLogArguments             // id: %17
  %18 = integer_literal $Builtin.Int8, 0          // user: %19
  %19 = struct $UInt8 (%18 : $Builtin.Int8)       // users: %38, %21
  %20 = struct_element_addr %3 : $*OSLogInterpolation, #OSLogInterpolation.preamble // user: %21
  store %19 to %20 : $*UInt8                      // id: %21
  %22 = integer_literal $Builtin.Int8, 0          // user: %23
  %23 = struct $UInt8 (%22 : $Builtin.Int8)       // users: %38, %25
  %24 = struct_element_addr %3 : $*OSLogInterpolation, #OSLogInterpolation.argumentCount // user: %25
  store %23 to %24 : $*UInt8                      // id: %25
  %26 = integer_literal $Builtin.Int64, 0         // user: %27
  %27 = struct $Int (%26 : $Builtin.Int64)        // users: %38, %29
  %28 = struct_element_addr %3 : $*OSLogInterpolation, #OSLogInterpolation.totalBytesForSerializingArguments // user: %29
  store %27 to %28 : $*Int                        // id: %29
  %30 = integer_literal $Builtin.Int64, 0         // user: %31
  %31 = struct $Int (%30 : $Builtin.Int64)        // users: %38, %33
  %32 = struct_element_addr %3 : $*OSLogInterpolation, #OSLogInterpolation.stringArgumentCount // user: %33
  store %31 to %32 : $*Int                        // id: %33
  %34 = integer_literal $Builtin.Int64, 0         // user: %35
  %35 = struct $Int (%34 : $Builtin.Int64)        // users: %38, %37
  %36 = struct_element_addr %3 : $*OSLogInterpolation, #OSLogInterpolation.objectArgumentCount // user: %37
  store %35 to %36 : $*Int                        // id: %37
  %38 = struct $OSLogInterpolation (%9 : $String, %15 : $OSLogArguments, %19 : $UInt8, %23 : $UInt8, %27 : $Int, %31 : $Int, %35 : $Int) // users: %43, %39
  retain_value %38 : $OSLogInterpolation          // id: %39
  release_value %9 : $String                      // id: %40
  destroy_addr %3 : $*OSLogInterpolation          // id: %41
  dealloc_stack %3 : $*OSLogInterpolation         // id: %42
  return %38 : $OSLogInterpolation                // id: %43
} // end sil function '$s2os18OSLogInterpolationV15literalCapacity18interpolationCountACSi_SitcfC'

// OSLogInterpolation.appendLiteral(_:)
sil public_external [available 11.0] [Onone] [_semantics "constant_evaluable"] @$s2os18OSLogInterpolationV13appendLiteralyySSF : $@convention(method) (@guaranteed String, @inout OSLogInterpolation) -> () {
// %0                                             // user: %4
// %1                                             // user: %5
bb0(%0 : $String, %1 : $*OSLogInterpolation):
  %2 = metatype $@thin String.Type                // user: %7
  // function_ref String.percentEscapedString.getter
  %3 = function_ref @$sSS2osE20percentEscapedStringSSvg : $@convention(method) (@guaranteed String) -> @owned String // user: %4
  %4 = apply %3(%0) : $@convention(method) (@guaranteed String) -> @owned String // users: %8, %7
  %5 = struct_element_addr %1 : $*OSLogInterpolation, #OSLogInterpolation.formatString // user: %7
  // function_ref static String.+= infix(_:_:)
  %6 = function_ref @$sSS2peoiyySSz_SStFZ : $@convention(method) (@inout String, @guaranteed String, @thin String.Type) -> () // user: %7
  %7 = apply %6(%5, %4, %2) : $@convention(method) (@inout String, @guaranteed String, @thin String.Type) -> ()
  release_value %4 : $String                      // id: %8
  %9 = tuple ()                                   // user: %10
  return %9 : $()                                 // id: %10
} // end sil function '$s2os18OSLogInterpolationV13appendLiteralyySSF'

// static OSLogPrivacy.public.getter
sil public_external [available 11.0] [Onone] [_semantics "constant_evaluable"] @$s2os12OSLogPrivacyV6publicACvgZ : $@convention(method) (@thin OSLogPrivacy.Type) -> @out OSLogPrivacy {
// %0                                             // user: %19
bb0(%0 : $*OSLogPrivacy, %1 : $@thin OSLogPrivacy.Type):
  %2 = metatype $@thin OSLogPrivacy.PrivacyOption.Type
  %3 = alloc_stack $OSLogPrivacy.PrivacyOption    // users: %24, %10, %4
  inject_enum_addr %3 : $*OSLogPrivacy.PrivacyOption, #OSLogPrivacy.PrivacyOption.`public`!enumelt // id: %4
  %5 = metatype $@thin OSLogPrivacy.Mask.Type
  %6 = alloc_stack $OSLogPrivacy.Mask             // users: %23, %15, %7
  inject_enum_addr %6 : $*OSLogPrivacy.Mask, #OSLogPrivacy.Mask.none!enumelt // id: %7
  %8 = alloc_stack $OSLogPrivacy                  // users: %21, %20, %19, %16, %11
  %9 = alloc_stack $OSLogPrivacy.PrivacyOption    // users: %13, %12, %10
  copy_addr [take] %3 to [initialization] %9 : $*OSLogPrivacy.PrivacyOption // id: %10
  %11 = struct_element_addr %8 : $*OSLogPrivacy, #OSLogPrivacy.privacy // user: %12
  copy_addr [take] %9 to [initialization] %11 : $*OSLogPrivacy.PrivacyOption // id: %12
  dealloc_stack %9 : $*OSLogPrivacy.PrivacyOption // id: %13
  %14 = alloc_stack $OSLogPrivacy.Mask            // users: %18, %17, %15
  copy_addr [take] %6 to [initialization] %14 : $*OSLogPrivacy.Mask // id: %15
  %16 = struct_element_addr %8 : $*OSLogPrivacy, #OSLogPrivacy.mask // user: %17
  copy_addr [take] %14 to [initialization] %16 : $*OSLogPrivacy.Mask // id: %17
  dealloc_stack %14 : $*OSLogPrivacy.Mask         // id: %18
  copy_addr %8 to [initialization] %0 : $*OSLogPrivacy // id: %19
  destroy_addr %8 : $*OSLogPrivacy                // id: %20
  dealloc_stack %8 : $*OSLogPrivacy               // id: %21
  %22 = tuple ()
  dealloc_stack %6 : $*OSLogPrivacy.Mask          // id: %23
  dealloc_stack %3 : $*OSLogPrivacy.PrivacyOption // id: %24
  %25 = tuple ()                                  // user: %26
  return %25 : $()                                // id: %26
} // end sil function '$s2os12OSLogPrivacyV6publicACvgZ'

// default argument 1 of OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)
sil shared_external [transparent] [available 11.0] [Onone] [_semantics "oslog.requires_constant_arguments"] @$s2os18OSLogInterpolationV06appendC0_5align7privacyyxyXA_AA0B15StringAlignmentVAA0B7PrivacyVts06CustomG11ConvertibleRzlFfA0_ : $@convention(thin) <T where T : CustomStringConvertible> () -> @out OSLogStringAlignment {
// %0                                             // user: %3
bb0(%0 : $*OSLogStringAlignment):
  %1 = metatype $@thin OSLogStringAlignment.Type  // user: %3
  // function_ref static OSLogStringAlignment.none.getter
  %2 = function_ref @$s2os20OSLogStringAlignmentV4noneACvgZ : $@convention(method) (@thin OSLogStringAlignment.Type) -> @out OSLogStringAlignment // user: %3
  %3 = apply %2(%0, %1) : $@convention(method) (@thin OSLogStringAlignment.Type) -> @out OSLogStringAlignment
  %4 = tuple ()                                   // user: %5
  return %4 : $()                                 // id: %5
} // end sil function '$s2os18OSLogInterpolationV06appendC0_5align7privacyyxyXA_AA0B15StringAlignmentVAA0B7PrivacyVts06CustomG11ConvertibleRzlFfA0_'

// OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)
sil public_external [transparent] [available 11.0] [Onone] [_semantics "oslog.requires_constant_arguments"] @$s2os18OSLogInterpolationV06appendC0_5align7privacyyxyXA_AA0B15StringAlignmentVAA0B7PrivacyVts06CustomG11ConvertibleRzlF : $@convention(method) <T where T : CustomStringConvertible> (@guaranteed @callee_guaranteed @substituted <τ_0_0> () -> @out τ_0_0 for <T>, @in_guaranteed OSLogStringAlignment, @in_guaranteed OSLogPrivacy, @inout OSLogInterpolation) -> () {
// %0                                             // users: %6, %5
// %1                                             // user: %8
// %2                                             // user: %8
// %3                                             // user: %8
bb0(%0 : $@callee_guaranteed @substituted <τ_0_0> () -> @out τ_0_0 for <T>, %1 : $*OSLogStringAlignment, %2 : $*OSLogPrivacy, %3 : $*OSLogInterpolation):
  // function_ref implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)
  %4 = function_ref @$s2os18OSLogInterpolationV06appendC0_5align7privacyyxyXA_AA0B15StringAlignmentVAA0B7PrivacyVts06CustomG11ConvertibleRzlFSSycfu_ : $@convention(thin) <τ_0_0 where τ_0_0 : CustomStringConvertible> (@guaranteed @callee_guaranteed @substituted <τ_0_0> () -> @out τ_0_0 for <τ_0_0>) -> @owned String // user: %6
  strong_retain %0 : $@callee_guaranteed @substituted <τ_0_0> () -> @out τ_0_0 for <T> // id: %5
  %6 = partial_apply [callee_guaranteed] %4<T>(%0) : $@convention(thin) <τ_0_0 where τ_0_0 : CustomStringConvertible> (@guaranteed @callee_guaranteed @substituted <τ_0_0> () -> @out τ_0_0 for <τ_0_0>) -> @owned String // users: %9, %8
  // function_ref OSLogInterpolation.appendInterpolation(_:align:privacy:)
  %7 = function_ref @$s2os18OSLogInterpolationV06appendC0_5align7privacyySSyXA_AA0B15StringAlignmentVAA0B7PrivacyVtF : $@convention(method) (@guaranteed @callee_guaranteed () -> @owned String, @in_guaranteed OSLogStringAlignment, @in_guaranteed OSLogPrivacy, @inout OSLogInterpolation) -> () // user: %8
  %8 = apply %7(%6, %1, %2, %3) : $@convention(method) (@guaranteed @callee_guaranteed () -> @owned String, @in_guaranteed OSLogStringAlignment, @in_guaranteed OSLogPrivacy, @inout OSLogInterpolation) -> ()
  strong_release %6 : $@callee_guaranteed () -> @owned String // id: %9
  %10 = tuple ()                                  // user: %11
  return %10 : $()                                // id: %11
} // end sil function '$s2os18OSLogInterpolationV06appendC0_5align7privacyyxyXA_AA0B15StringAlignmentVAA0B7PrivacyVts06CustomG11ConvertibleRzlF'

// OSLogMessage.init(stringInterpolation:)
sil public_external [available 11.0] [Onone] [_semantics "constant_evaluable"] [_semantics "oslog.message.init_interpolation"] @$s2os12OSLogMessageV19stringInterpolationAcA0bE0V_tcfC : $@convention(method) (@owned OSLogInterpolation, @thin OSLogMessage.Type) -> @owned OSLogMessage {
// %0                                             // users: %5, %4
bb0(%0 : $OSLogInterpolation, %1 : $@thin OSLogMessage.Type):
  %2 = alloc_stack $OSLogMessage                  // users: %8, %7, %3
  %3 = struct_element_addr %2 : $*OSLogMessage, #OSLogMessage.interpolation // user: %4
  store %0 to %3 : $*OSLogInterpolation           // id: %4
  %5 = struct $OSLogMessage (%0 : $OSLogInterpolation) // users: %9, %6
  retain_value %5 : $OSLogMessage                 // id: %6
  destroy_addr %2 : $*OSLogMessage                // id: %7
  dealloc_stack %2 : $*OSLogMessage               // id: %8
  return %5 : $OSLogMessage                       // id: %9
} // end sil function '$s2os12OSLogMessageV19stringInterpolationAcA0bE0V_tcfC'

// Logger.error(_:)
sil public_external [transparent] [available 11.0] [Onone] [_semantics "oslog.requires_constant_arguments"] @$s2os6LoggerV5erroryyAA12OSLogMessageVF : $@convention(method) (@guaranteed OSLogMessage, @in_guaranteed Logger) -> () {
// %0                                             // users: %33, %21, %19, %18, %15, %13, %10
// %1                                             // user: %3
bb0(%0 : $OSLogMessage, %1 : $*Logger):
  %2 = alloc_stack $Logger                        // users: %103, %6, %5, %3
  copy_addr %1 to [initialization] %2 : $*Logger  // id: %3
  // function_ref Logger.logObject.getter
  %4 = function_ref @$s2os6LoggerV9logObjectSo03OS_a1_C0Cvg : $@convention(method) (@in_guaranteed Logger) -> @owned OSLog // user: %5
  %5 = apply %4(%2) : $@convention(method) (@in_guaranteed Logger) -> @owned OSLog // users: %102, %40, %88
  destroy_addr %2 : $*Logger                      // id: %6
  %7 = metatype $@thin OSLogType.Type             // user: %9
  // function_ref static os_log_type_t.error.getter
  %8 = function_ref @$sSo13os_log_type_ta0A0E5errorABvgZ : $@convention(method) (@thin OSLogType.Type) -> OSLogType // user: %9
  %9 = apply %8(%7) : $@convention(method) (@thin OSLogType.Type) -> OSLogType // users: %88, %40
  %10 = struct_extract %0 : $OSLogMessage, #OSLogMessage.interpolation // user: %11
  %11 = struct_extract %10 : $OSLogInterpolation, #OSLogInterpolation.formatString // users: %99, %44, %37, %12
  retain_value %11 : $String                      // id: %12
  %13 = struct_extract %0 : $OSLogMessage, #OSLogMessage.interpolation // user: %14
  %14 = struct_extract %13 : $OSLogInterpolation, #OSLogInterpolation.preamble // user: %63
  %15 = struct_extract %0 : $OSLogMessage, #OSLogMessage.interpolation // user: %16
  %16 = struct_extract %15 : $OSLogInterpolation, #OSLogInterpolation.argumentCount // user: %65
  // function_ref OSLogMessage.bufferSize.getter
  %17 = function_ref @$s2os12OSLogMessageV10bufferSizeSivg : $@convention(method) (@guaranteed OSLogMessage) -> Int // user: %18
  %18 = apply %17(%0) : $@convention(method) (@guaranteed OSLogMessage) -> Int // users: %27, %48
  %19 = struct_extract %0 : $OSLogMessage, #OSLogMessage.interpolation // user: %20
  %20 = struct_extract %19 : $OSLogInterpolation, #OSLogInterpolation.objectArgumentCount // users: %90, %51
  %21 = struct_extract %0 : $OSLogMessage, #OSLogMessage.interpolation // user: %22
  %22 = struct_extract %21 : $OSLogInterpolation, #OSLogInterpolation.stringArgumentCount // users: %92, %55
  %23 = alloc_stack $UInt32                       // users: %31, %32, %29
  %24 = metatype $@thin UInt32.Type
  %25 = metatype $@thick UInt32.Type              // user: %29
  %26 = alloc_stack $Int                          // users: %27, %30, %29
  store %18 to %26 : $*Int                        // id: %27
  // function_ref UnsignedInteger<>.init<A>(_:)
  %28 = function_ref @$sSUss17FixedWidthIntegerRzrlEyxqd__cSzRd__lufC : $@convention(method) <τ_0_0 where τ_0_0 : FixedWidthInteger, τ_0_0 : UnsignedInteger><τ_1_0 where τ_1_0 : BinaryInteger> (@in τ_1_0, @thick τ_0_0.Type) -> @out τ_0_0 // user: %29
  %29 = apply %28<UInt32, Int>(%23, %26, %25) : $@convention(method) <τ_0_0 where τ_0_0 : FixedWidthInteger, τ_0_0 : UnsignedInteger><τ_1_0 where τ_1_0 : BinaryInteger> (@in τ_1_0, @thick τ_0_0.Type) -> @out τ_0_0
  dealloc_stack %26 : $*Int                       // id: %30
  %31 = load %23 : $*UInt32                       // user: %88
  dealloc_stack %23 : $*UInt32                    // id: %32
  %33 = struct_extract %0 : $OSLogMessage, #OSLogMessage.interpolation // user: %34
  %34 = struct_extract %33 : $OSLogInterpolation, #OSLogInterpolation.arguments // user: %35
  %35 = struct_extract %34 : $OSLogArguments, #OSLogArguments.argumentClosures // users: %98, %67, %43, %36
  retain_value %35 : $Array<(inout UnsafeMutablePointer<UInt8>, inout Optional<UnsafeMutablePointer<NSObject>>, inout Optional<UnsafeMutablePointer<Any>>) -> ()> // id: %36
  %37 = builtin "globalStringTablePointer"(%11 : $String) : $Builtin.RawPointer // user: %38
  %38 = struct $UnsafePointer<Int8> (%37 : $Builtin.RawPointer) // user: %88
  // function_ref os_log_type_enabled
  %39 = function_ref @os_log_type_enabled : $@convention(c) (OSLog, OSLogType) -> Bool // user: %40
  %40 = apply %39(%5, %9) : $@convention(c) (OSLog, OSLogType) -> Bool // user: %41
  %41 = struct_extract %40 : $Bool, #Bool._value  // user: %42
  cond_br %41, bb2, bb1                           // id: %42

bb1:                                              // Preds: bb0
  release_value %35 : $Array<(inout UnsafeMutablePointer<UInt8>, inout Optional<UnsafeMutablePointer<NSObject>>, inout Optional<UnsafeMutablePointer<Any>>) -> ()> // id: %43
  release_value %11 : $String                     // id: %44
  br bb5                                          // id: %45

bb2:                                              // Preds: bb0
  %46 = metatype $@thin UnsafeMutablePointer<UInt8>.Type // user: %48
  // function_ref static UnsafeMutablePointer.allocate(capacity:)
  %47 = function_ref @$sSp8allocate8capacitySpyxGSi_tFZ : $@convention(method) <τ_0_0> (Int, @thin UnsafeMutablePointer<τ_0_0>.Type) -> UnsafeMutablePointer<τ_0_0> // user: %48
  %48 = apply %47<UInt8>(%18, %46) : $@convention(method) <τ_0_0> (Int, @thin UnsafeMutablePointer<τ_0_0>.Type) -> UnsafeMutablePointer<τ_0_0> // users: %57, %94, %88
  %49 = metatype $@thick NSObject.Type            // user: %51
  // function_ref createStorage<A>(capacity:type:)
  %50 = function_ref @$s2os13createStorage8capacity4typeSpyxGSgSi_xmtlF : $@convention(thin) <τ_0_0> (Int, @thick τ_0_0.Type) -> Optional<UnsafeMutablePointer<τ_0_0>> // user: %51
  %51 = apply %50<NSObject>(%20, %49) : $@convention(thin) <τ_0_0> (Int, @thick τ_0_0.Type) -> Optional<UnsafeMutablePointer<τ_0_0>> // users: %59, %90
  %52 = metatype $@thin Any.Protocol
  %53 = metatype $@thick Any.Protocol             // user: %55
  // function_ref createStorage<A>(capacity:type:)
  %54 = function_ref @$s2os13createStorage8capacity4typeSpyxGSgSi_xmtlF : $@convention(thin) <τ_0_0> (Int, @thick τ_0_0.Type) -> Optional<UnsafeMutablePointer<τ_0_0>> // user: %55
  %55 = apply %54<Any>(%22, %53) : $@convention(thin) <τ_0_0> (Int, @thick τ_0_0.Type) -> Optional<UnsafeMutablePointer<τ_0_0>> // users: %61, %92
  %56 = alloc_stack $UnsafeMutablePointer<UInt8>  // users: %57, %97, %69, %65, %63
  store %48 to %56 : $*UnsafeMutablePointer<UInt8> // id: %57
  %58 = alloc_stack $Optional<UnsafeMutablePointer<NSObject>> // users: %59, %96, %69
  store %51 to %58 : $*Optional<UnsafeMutablePointer<NSObject>> // id: %59
  %60 = alloc_stack $Optional<UnsafeMutablePointer<Any>> // users: %61, %95, %69
  store %55 to %60 : $*Optional<UnsafeMutablePointer<Any>> // id: %61
  // function_ref serialize(_:at:)
  %62 = function_ref @$s2os9serialize_2atys5UInt8V_SpyAEGztF : $@convention(thin) (UInt8, @inout UnsafeMutablePointer<UInt8>) -> () // user: %63
  %63 = apply %62(%14, %56) : $@convention(thin) (UInt8, @inout UnsafeMutablePointer<UInt8>) -> ()
  // function_ref serialize(_:at:)
  %64 = function_ref @$s2os9serialize_2atys5UInt8V_SpyAEGztF : $@convention(thin) (UInt8, @inout UnsafeMutablePointer<UInt8>) -> () // user: %65
  %65 = apply %64(%16, %56) : $@convention(thin) (UInt8, @inout UnsafeMutablePointer<UInt8>) -> ()
  %66 = alloc_stack $Array<(inout UnsafeMutablePointer<UInt8>, inout Optional<UnsafeMutablePointer<NSObject>>, inout Optional<UnsafeMutablePointer<Any>>) -> ()> // users: %67, %83, %75
  store %35 to %66 : $*Array<(inout UnsafeMutablePointer<UInt8>, inout Optional<UnsafeMutablePointer<NSObject>>, inout Optional<UnsafeMutablePointer<Any>>) -> ()> // id: %67
  // function_ref closure #1 in osLogInternal(_:log:type:)
  %68 = function_ref @$s2os0A11LogInternal_3log4typeyAA12OSLogMessageV_So03OS_a1_D0CSo0a1_d1_E2_tatFyySpys5UInt8VGz_SpySo8NSObjectCGSgzSpyypGSgztcXEfU_ : $@convention(thin) (@guaranteed @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> (), @inout_aliasable UnsafeMutablePointer<UInt8>, @inout_aliasable Optional<UnsafeMutablePointer<NSObject>>, @inout_aliasable Optional<UnsafeMutablePointer<Any>>) -> () // user: %69
  %69 = partial_apply [callee_guaranteed] [on_stack] %68(%56, %58, %60) : $@convention(thin) (@guaranteed @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> (), @inout_aliasable UnsafeMutablePointer<UInt8>, @inout_aliasable Optional<UnsafeMutablePointer<NSObject>>, @inout_aliasable Optional<UnsafeMutablePointer<Any>>) -> () // users: %82, %78, %70
  %70 = convert_function %69 : $@noescape @callee_guaranteed (@guaranteed @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> ()) -> () to $@noescape @callee_guaranteed (@guaranteed @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> ()) -> @error Error // user: %72
  // function_ref thunk for @callee_guaranteed (@guaranteed @escaping @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout UnsafeMutablePointer<NSObject>?, @inout UnsafeMutablePointer<Any>?) -> ()) -> (@error @owned Error)
  %71 = function_ref @$sSpys5UInt8VGSpySo8NSObjectCGSgSpyypGSgIeglll_s5Error_pIggzo_xq_q0_q1_r2_lyAcgIytIseglllr_sAJ_pIegnzo_TR : $@convention(thin) (@in_guaranteed @callee_guaranteed @substituted <τ_0_0, τ_0_1, τ_0_2, τ_0_3> (@inout τ_0_0, @inout τ_0_1, @inout τ_0_2) -> @out τ_0_3 for <UnsafeMutablePointer<UInt8>, Optional<UnsafeMutablePointer<NSObject>>, Optional<UnsafeMutablePointer<Any>>, ()>, @noescape @callee_guaranteed (@guaranteed @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> ()) -> @error Error) -> @error Error // user: %72
  %72 = partial_apply [callee_guaranteed] [on_stack] %71(%70) : $@convention(thin) (@in_guaranteed @callee_guaranteed @substituted <τ_0_0, τ_0_1, τ_0_2, τ_0_3> (@inout τ_0_0, @inout τ_0_1, @inout τ_0_2) -> @out τ_0_3 for <UnsafeMutablePointer<UInt8>, Optional<UnsafeMutablePointer<NSObject>>, Optional<UnsafeMutablePointer<Any>>, ()>, @noescape @callee_guaranteed (@guaranteed @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> ()) -> @error Error) -> @error Error // users: %81, %77, %73
  %73 = convert_function %72 : $@noescape @callee_guaranteed (@in_guaranteed @callee_guaranteed @substituted <τ_0_0, τ_0_1, τ_0_2, τ_0_3> (@inout τ_0_0, @inout τ_0_1, @inout τ_0_2) -> @out τ_0_3 for <UnsafeMutablePointer<UInt8>, Optional<UnsafeMutablePointer<NSObject>>, Optional<UnsafeMutablePointer<Any>>, ()>) -> @error Error to $@noescape @callee_guaranteed @substituted <τ_0_0> (@in_guaranteed τ_0_0) -> @error Error for <(inout UnsafeMutablePointer<UInt8>, inout Optional<UnsafeMutablePointer<NSObject>>, inout Optional<UnsafeMutablePointer<Any>>) -> ()> // user: %75
  // function_ref Sequence.forEach(_:)
  %74 = function_ref @$sSTsE7forEachyyy7ElementQzKXEKF : $@convention(method) <τ_0_0 where τ_0_0 : Sequence> (@noescape @callee_guaranteed @substituted <τ_0_0> (@in_guaranteed τ_0_0) -> @error Error for <τ_0_0.Element>, @in_guaranteed τ_0_0) -> @error Error // user: %75
  try_apply %74<Array<(inout UnsafeMutablePointer<UInt8>, inout Optional<UnsafeMutablePointer<NSObject>>, inout Optional<UnsafeMutablePointer<Any>>) -> ()>>(%73, %66) : $@convention(method) <τ_0_0 where τ_0_0 : Sequence> (@noescape @callee_guaranteed @substituted <τ_0_0> (@in_guaranteed τ_0_0) -> @error Error for <τ_0_0.Element>, @in_guaranteed τ_0_0) -> @error Error, normal bb4, error bb3 // id: %75

bb3(%76 : $Error):                                // Preds: bb2
  dealloc_stack %72 : $@noescape @callee_guaranteed (@in_guaranteed @callee_guaranteed @substituted <τ_0_0, τ_0_1, τ_0_2, τ_0_3> (@inout τ_0_0, @inout τ_0_1, @inout τ_0_2) -> @out τ_0_3 for <UnsafeMutablePointer<UInt8>, Optional<UnsafeMutablePointer<NSObject>>, Optional<UnsafeMutablePointer<Any>>, ()>) -> @error Error // id: %77
  dealloc_stack %69 : $@noescape @callee_guaranteed (@guaranteed @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> ()) -> () // id: %78
  unreachable                                     // id: %79

bb4(%80 : $()):                                   // Preds: bb2
  dealloc_stack %72 : $@noescape @callee_guaranteed (@in_guaranteed @callee_guaranteed @substituted <τ_0_0, τ_0_1, τ_0_2, τ_0_3> (@inout τ_0_0, @inout τ_0_1, @inout τ_0_2) -> @out τ_0_3 for <UnsafeMutablePointer<UInt8>, Optional<UnsafeMutablePointer<NSObject>>, Optional<UnsafeMutablePointer<Any>>, ()>) -> @error Error // id: %81
  dealloc_stack %69 : $@noescape @callee_guaranteed (@guaranteed @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> ()) -> () // id: %82
  dealloc_stack %66 : $*Array<(inout UnsafeMutablePointer<UInt8>, inout Optional<UnsafeMutablePointer<NSObject>>, inout Optional<UnsafeMutablePointer<Any>>) -> ()> // id: %83
  %84 = global_addr @__dso_handle : $*Builtin.RawPointer // user: %85
  %85 = address_to_pointer %84 : $*Builtin.RawPointer to $Builtin.RawPointer // user: %86
  %86 = struct $UnsafeMutableRawPointer (%85 : $Builtin.RawPointer) // user: %88
  // function_ref _os_log_impl
  %87 = function_ref @_os_log_impl : $@convention(c) (UnsafeMutableRawPointer, OSLog, OSLogType, UnsafePointer<Int8>, UnsafeMutablePointer<UInt8>, UInt32) -> () // user: %88
  %88 = apply %87(%86, %5, %9, %38, %48, %31) : $@convention(c) (UnsafeMutableRawPointer, OSLog, OSLogType, UnsafePointer<Int8>, UnsafeMutablePointer<UInt8>, UInt32) -> ()
  // function_ref destroyStorage<A>(_:count:)
  %89 = function_ref @$s2os14destroyStorage_5countySpyxGSg_SitlF : $@convention(thin) <τ_0_0> (Optional<UnsafeMutablePointer<τ_0_0>>, Int) -> () // user: %90
  %90 = apply %89<NSObject>(%51, %20) : $@convention(thin) <τ_0_0> (Optional<UnsafeMutablePointer<τ_0_0>>, Int) -> ()
  // function_ref destroyStorage<A>(_:count:)
  %91 = function_ref @$s2os14destroyStorage_5countySpyxGSg_SitlF : $@convention(thin) <τ_0_0> (Optional<UnsafeMutablePointer<τ_0_0>>, Int) -> () // user: %92
  %92 = apply %91<Any>(%55, %22) : $@convention(thin) <τ_0_0> (Optional<UnsafeMutablePointer<τ_0_0>>, Int) -> ()
  // function_ref UnsafeMutablePointer.deallocate()
  %93 = function_ref @$sSp10deallocateyyF : $@convention(method) <τ_0_0> (UnsafeMutablePointer<τ_0_0>) -> () // user: %94
  %94 = apply %93<UInt8>(%48) : $@convention(method) <τ_0_0> (UnsafeMutablePointer<τ_0_0>) -> ()
  dealloc_stack %60 : $*Optional<UnsafeMutablePointer<Any>> // id: %95
  dealloc_stack %58 : $*Optional<UnsafeMutablePointer<NSObject>> // id: %96
  dealloc_stack %56 : $*UnsafeMutablePointer<UInt8> // id: %97
  release_value %35 : $Array<(inout UnsafeMutablePointer<UInt8>, inout Optional<UnsafeMutablePointer<NSObject>>, inout Optional<UnsafeMutablePointer<Any>>) -> ()> // id: %98
  release_value %11 : $String                     // id: %99
  br bb5                                          // id: %100

bb5:                                              // Preds: bb4 bb1
  %101 = tuple ()
  strong_release %5 : $OSLog                      // id: %102
  dealloc_stack %2 : $*Logger                     // id: %103
  %104 = tuple ()                                 // user: %105
  return %104 : $()                               // id: %105
} // end sil function '$s2os6LoggerV5erroryyAA12OSLogMessageVF'

// static UnsafeMutablePointer.allocate(capacity:)
sil public_external @$sSp8allocate8capacitySpyxGSi_tFZ : $@convention(method) <Pointee> (Int, @thin UnsafeMutablePointer<Pointee>.Type) -> UnsafeMutablePointer<Pointee> {
// %0                                             // user: %5
bb0(%0 : $Int, %1 : $@thin UnsafeMutablePointer<Pointee>.Type):
  %2 = metatype $@thick Pointee.Type              // users: %10, %3
  %3 = builtin "strideof"<Pointee>(%2 : $@thick Pointee.Type) : $Builtin.Word // user: %4
  %4 = builtin "sextOrBitCast_Word_Int64"(%3 : $Builtin.Word) : $Builtin.Int64 // user: %7
  %5 = struct_extract %0 : $Int, #Int._value      // users: %22, %7
  %6 = integer_literal $Builtin.Int1, -1          // user: %7
  %7 = builtin "smul_with_overflow_Int64"(%4 : $Builtin.Int64, %5 : $Builtin.Int64, %6 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // users: %8, %19
  %8 = tuple_extract %7 : $(Builtin.Int64, Builtin.Int1), 1 // user: %9
  cond_fail %8 : $Builtin.Int1, "arithmetic overflow" // id: %9
  %10 = builtin "alignof"<Pointee>(%2 : $@thick Pointee.Type) : $Builtin.Word // users: %17, %11
  %11 = builtin "sextOrBitCast_Word_Int64"(%10 : $Builtin.Word) : $Builtin.Int64 // user: %13
  %12 = integer_literal $Builtin.Int64, 16        // user: %13
  %13 = builtin "cmp_slt_Int64"(%12 : $Builtin.Int64, %11 : $Builtin.Int64) : $Builtin.Int1 // user: %14
  cond_br %13, bb2, bb1                           // id: %14

bb1:                                              // Preds: bb0
  %15 = integer_literal $Builtin.Word, 0          // user: %16
  br bb3(%15 : $Builtin.Word)                     // id: %16

bb2:                                              // Preds: bb0
  br bb3(%10 : $Builtin.Word)                     // id: %17

// %18                                            // user: %21
bb3(%18 : $Builtin.Word):                         // Preds: bb2 bb1
  %19 = tuple_extract %7 : $(Builtin.Int64, Builtin.Int1), 0 // user: %20
  %20 = builtin "truncOrBitCast_Int64_Word"(%19 : $Builtin.Int64) : $Builtin.Word // user: %21
  %21 = builtin "allocRaw"(%20 : $Builtin.Word, %18 : $Builtin.Word) : $Builtin.RawPointer // users: %24, %23
  %22 = builtin "truncOrBitCast_Int64_Word"(%5 : $Builtin.Int64) : $Builtin.Word // user: %23
  bind_memory %21 : $Builtin.RawPointer, %22 : $Builtin.Word to $*Pointee // id: %23
  %24 = struct $UnsafeMutablePointer<Pointee> (%21 : $Builtin.RawPointer) // user: %25
  return %24 : $UnsafeMutablePointer<Pointee>     // id: %25
} // end sil function '$sSp8allocate8capacitySpyxGSi_tFZ'

// variable initialization expression of MutableDeviceProperty.id
sil [transparent] [signature_optimized_thunk] [always_inline] @$s13AudioExplorer21MutableDevicePropertyV2ids6UInt32Vvpfi : $@convention(thin) <Base, Output> () -> UInt32 {
bb0:
  %0 = integer_literal $Builtin.Int32, 0          // user: %1
  %1 = struct $UInt32 (%0 : $Builtin.Int32)       // user: %2
  return %1 : $UInt32                             // id: %2
} // end sil function '$s13AudioExplorer21MutableDevicePropertyV2ids6UInt32Vvpfi'

// MutableDeviceProperty.id.getter
sil [transparent] @$s13AudioExplorer21MutableDevicePropertyV2ids6UInt32Vvg : $@convention(method) <Base, Output> (@in_guaranteed MutableDeviceProperty<Base, Output>) -> UInt32 {
// %0 "self"                                      // users: %2, %1
bb0(%0 : $*MutableDeviceProperty<Base, Output>):
  debug_value_addr %0 : $*MutableDeviceProperty<Base, Output>, let, name "self", argno 1 // id: %1
  %2 = struct_element_addr %0 : $*MutableDeviceProperty<Base, Output>, #MutableDeviceProperty.id // user: %3
  %3 = load %2 : $*UInt32                         // user: %4
  return %3 : $UInt32                             // id: %4
} // end sil function '$s13AudioExplorer21MutableDevicePropertyV2ids6UInt32Vvg'

// MutableDeviceProperty.id.setter
sil [transparent] @$s13AudioExplorer21MutableDevicePropertyV2ids6UInt32Vvs : $@convention(method) <Base, Output> (UInt32, @inout MutableDeviceProperty<Base, Output>) -> () {
// %0 "value"                                     // users: %5, %2
// %1 "self"                                      // users: %4, %3
bb0(%0 : $UInt32, %1 : $*MutableDeviceProperty<Base, Output>):
  debug_value %0 : $UInt32, let, name "value", argno 1 // id: %2
  debug_value_addr %1 : $*MutableDeviceProperty<Base, Output>, var, name "self", argno 2 // id: %3
  %4 = struct_element_addr %1 : $*MutableDeviceProperty<Base, Output>, #MutableDeviceProperty.id // user: %5
  store %0 to %4 : $*UInt32                       // id: %5
  %6 = tuple ()                                   // user: %7
  return %6 : $()                                 // id: %7
} // end sil function '$s13AudioExplorer21MutableDevicePropertyV2ids6UInt32Vvs'

// MutableDeviceProperty.id.modify
sil [transparent] @$s13AudioExplorer21MutableDevicePropertyV2ids6UInt32VvM : $@yield_once @convention(method) <Base, Output> (@inout MutableDeviceProperty<Base, Output>) -> @yields @inout UInt32 {
// %0 "self"                                      // users: %2, %1
bb0(%0 : $*MutableDeviceProperty<Base, Output>):
  debug_value_addr %0 : $*MutableDeviceProperty<Base, Output>, var, name "self", argno 1 // id: %1
  %2 = struct_element_addr %0 : $*MutableDeviceProperty<Base, Output>, #MutableDeviceProperty.id // user: %3
  yield %2 : $*UInt32, resume bb1, unwind bb2     // id: %3

bb1:                                              // Preds: bb0
  %4 = tuple ()                                   // user: %5
  return %4 : $()                                 // id: %5

bb2:                                              // Preds: bb0
  unwind                                          // id: %6
} // end sil function '$s13AudioExplorer21MutableDevicePropertyV2ids6UInt32VvM'

// variable initialization expression of MutableDeviceProperty.logger
sil [transparent] @$s13AudioExplorer21MutableDevicePropertyV6logger026_960A3D0F904E7B0BBE7492682G5ABBDFLL2os6LoggerVvpfi : $@convention(thin) <Base, Output> () -> @out Logger {
// %0 "$return_value"                             // user: %25
bb0(%0 : $*Logger):
  %1 = metatype $@thin Logger.Type                // user: %25
  %2 = string_literal utf8 "com.amonshiz.audioexplorer.mutabledeviceproperty" // user: %5
  %3 = integer_literal $Builtin.Int64, -3458764513820540880 // user: %4
  %4 = struct $UInt64 (%3 : $Builtin.Int64)       // user: %14
  %5 = builtin "ptrtoint_Word"(%2 : $Builtin.RawPointer) : $Builtin.Word // user: %6
  %6 = builtin "zextOrBitCast_Word_Int64"(%5 : $Builtin.Word) : $Builtin.Int64 // user: %9
  %7 = integer_literal $Builtin.Int64, 32         // user: %9
  %8 = integer_literal $Builtin.Int1, 0           // user: %9
  %9 = builtin "usub_with_overflow_Int64"(%6 : $Builtin.Int64, %7 : $Builtin.Int64, %8 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // user: %10
  %10 = tuple_extract %9 : $(Builtin.Int64, Builtin.Int1), 0 // user: %12
  %11 = integer_literal $Builtin.Int64, -9223372036854775808 // user: %12
  %12 = builtin "stringObjectOr_Int64"(%10 : $Builtin.Int64, %11 : $Builtin.Int64) : $Builtin.Int64 // user: %13
  %13 = value_to_bridge_object %12 : $Builtin.Int64 // user: %14
  %14 = struct $_StringObject (%4 : $UInt64, %13 : $Builtin.BridgeObject) // user: %15
  %15 = struct $_StringGuts (%14 : $_StringObject) // user: %16
  %16 = struct $String (%15 : $_StringGuts)       // user: %25
  %17 = integer_literal $Builtin.Int64, 491496043109 // user: %18
  %18 = struct $UInt64 (%17 : $Builtin.Int64)     // user: %21
  %19 = integer_literal $Builtin.Int64, -1945555039024054272 // user: %20
  %20 = value_to_bridge_object %19 : $Builtin.Int64 // user: %21
  %21 = struct $_StringObject (%18 : $UInt64, %20 : $Builtin.BridgeObject) // user: %22
  %22 = struct $_StringGuts (%21 : $_StringObject) // user: %23
  %23 = struct $String (%22 : $_StringGuts)       // user: %25
  // function_ref Logger.init(subsystem:category:)
  %24 = function_ref @$s2os6LoggerV9subsystem8categoryACSS_SStcfC : $@convention(method) (@owned String, @owned String, @thin Logger.Type) -> @out Logger // user: %25
  %25 = apply %24(%0, %16, %23, %1) : $@convention(method) (@owned String, @owned String, @thin Logger.Type) -> @out Logger
  %26 = tuple ()                                  // user: %27
  return %26 : $()                                // id: %27
} // end sil function '$s13AudioExplorer21MutableDevicePropertyV6logger026_960A3D0F904E7B0BBE7492682G5ABBDFLL2os6LoggerVvpfi'

// default argument 1 of MutableDeviceProperty.init(_:providers:)
sil [signature_optimized_thunk] [always_inline] @$s13AudioExplorer21MutableDevicePropertyV_9providersACyxq_GAA0adE11DescriptionVyxG_AA0E17ProviderFunctionsVtcfcfA0_ : $@convention(thin) <Base, Output> () -> @owned PropertyProviderFunctions {
bb0:
  %0 = global_addr @globalinit_026_960A3D0F904E7B0BBE7492682A5ABBDF_token0 : $*Builtin.Word // user: %1
  %1 = address_to_pointer %0 : $*Builtin.Word to $Builtin.RawPointer // user: %3
  // function_ref globalinit_026_960A3D0F904E7B0BBE7492682A5ABBDF_func0
  %2 = function_ref @globalinit_026_960A3D0F904E7B0BBE7492682A5ABBDF_func0 : $@convention(c) () -> () // user: %3
  %3 = builtin "once"(%1 : $Builtin.RawPointer, %2 : $@convention(c) () -> ()) : $()
  %4 = global_addr @$s13AudioExplorer25PropertyProviderFunctionsV8standardACvpZ : $*PropertyProviderFunctions // user: %5
  %5 = load %4 : $*PropertyProviderFunctions      // users: %16, %10, %9, %8, %7, %6
  %6 = struct_extract %5 : $PropertyProviderFunctions, #PropertyProviderFunctions.hasCheck // user: %11
  %7 = struct_extract %5 : $PropertyProviderFunctions, #PropertyProviderFunctions.dataSize // user: %12
  %8 = struct_extract %5 : $PropertyProviderFunctions, #PropertyProviderFunctions.getData // user: %13
  %9 = struct_extract %5 : $PropertyProviderFunctions, #PropertyProviderFunctions.isSettable // user: %14
  %10 = struct_extract %5 : $PropertyProviderFunctions, #PropertyProviderFunctions.setData // user: %15
  strong_retain %6 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>) -> Bool // id: %11
  strong_retain %7 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>) -> Int32 // id: %12
  strong_retain %8 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) -> Int32 // id: %13
  strong_retain %9 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UnsafeMutablePointer<DarwinBoolean>) -> Int32 // id: %14
  strong_retain %10 : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UInt32, UnsafeRawPointer) -> Int32 // id: %15
  return %5 : $PropertyProviderFunctions          // id: %16
} // end sil function '$s13AudioExplorer21MutableDevicePropertyV_9providersACyxq_GAA0adE11DescriptionVyxG_AA0E17ProviderFunctionsVtcfcfA0_'

// MutableDeviceProperty.init(_:providers:)
sil @$s13AudioExplorer21MutableDevicePropertyV_9providersACyxq_GAA0adE11DescriptionVyxG_AA0E17ProviderFunctionsVtcfC : $@convention(method) <Base, Output> (AudioDevicePropertyDescription<Base>, @owned PropertyProviderFunctions, @thin MutableDeviceProperty<Base, Output>.Type) -> @out MutableDeviceProperty<Base, Output> {
// %0 "$return_value"                             // users: %8, %36, %41, %39
// %1 "description"                               // users: %40, %4
// %2 "functions"                                 // users: %42, %5
// %3 "$metatype"
bb0(%0 : $*MutableDeviceProperty<Base, Output>, %1 : $AudioDevicePropertyDescription<Base>, %2 : $PropertyProviderFunctions, %3 : $@thin MutableDeviceProperty<Base, Output>.Type):
  debug_value %1 : $AudioDevicePropertyDescription<Base>, let, name "description", argno 1 // id: %4
  debug_value %2 : $PropertyProviderFunctions, let, name "functions", argno 2 // id: %5
  %6 = integer_literal $Builtin.Int32, 0          // user: %7
  %7 = struct $UInt32 (%6 : $Builtin.Int32)       // user: %9
  %8 = struct_element_addr %0 : $*MutableDeviceProperty<Base, Output>, #MutableDeviceProperty.id // user: %9
  store %7 to %8 : $*UInt32                       // id: %9
  %10 = alloc_stack $Logger                       // users: %35, %38, %37
  %11 = metatype $@thin Logger.Type               // user: %35
  %12 = string_literal utf8 "com.amonshiz.audioexplorer.mutabledeviceproperty" // user: %15
  %13 = integer_literal $Builtin.Int64, -3458764513820540880 // user: %14
  %14 = struct $UInt64 (%13 : $Builtin.Int64)     // user: %24
  %15 = builtin "ptrtoint_Word"(%12 : $Builtin.RawPointer) : $Builtin.Word // user: %16
  %16 = builtin "zextOrBitCast_Word_Int64"(%15 : $Builtin.Word) : $Builtin.Int64 // user: %19
  %17 = integer_literal $Builtin.Int64, 32        // user: %19
  %18 = integer_literal $Builtin.Int1, 0          // user: %19
  %19 = builtin "usub_with_overflow_Int64"(%16 : $Builtin.Int64, %17 : $Builtin.Int64, %18 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // user: %20
  %20 = tuple_extract %19 : $(Builtin.Int64, Builtin.Int1), 0 // user: %22
  %21 = integer_literal $Builtin.Int64, -9223372036854775808 // user: %22
  %22 = builtin "stringObjectOr_Int64"(%20 : $Builtin.Int64, %21 : $Builtin.Int64) : $Builtin.Int64 // user: %23
  %23 = value_to_bridge_object %22 : $Builtin.Int64 // user: %24
  %24 = struct $_StringObject (%14 : $UInt64, %23 : $Builtin.BridgeObject) // user: %25
  %25 = struct $_StringGuts (%24 : $_StringObject) // user: %26
  %26 = struct $String (%25 : $_StringGuts)       // user: %35
  %27 = integer_literal $Builtin.Int64, 491496043109 // user: %28
  %28 = struct $UInt64 (%27 : $Builtin.Int64)     // user: %31
  %29 = integer_literal $Builtin.Int64, -1945555039024054272 // user: %30
  %30 = value_to_bridge_object %29 : $Builtin.Int64 // user: %31
  %31 = struct $_StringObject (%28 : $UInt64, %30 : $Builtin.BridgeObject) // user: %32
  %32 = struct $_StringGuts (%31 : $_StringObject) // user: %33
  %33 = struct $String (%32 : $_StringGuts)       // user: %35
  // function_ref Logger.init(subsystem:category:)
  %34 = function_ref @$s2os6LoggerV9subsystem8categoryACSS_SStcfC : $@convention(method) (@owned String, @owned String, @thin Logger.Type) -> @out Logger // user: %35
  %35 = apply %34(%10, %26, %33, %11) : $@convention(method) (@owned String, @owned String, @thin Logger.Type) -> @out Logger
  %36 = struct_element_addr %0 : $*MutableDeviceProperty<Base, Output>, #MutableDeviceProperty.logger // user: %37
  copy_addr [take] %10 to [initialization] %36 : $*Logger // id: %37
  dealloc_stack %10 : $*Logger                    // id: %38
  %39 = struct_element_addr %0 : $*MutableDeviceProperty<Base, Output>, #MutableDeviceProperty.description // user: %40
  store %1 to %39 : $*AudioDevicePropertyDescription<Base> // id: %40
  %41 = struct_element_addr %0 : $*MutableDeviceProperty<Base, Output>, #MutableDeviceProperty.providers // user: %42
  store %2 to %41 : $*PropertyProviderFunctions   // id: %42
  %43 = tuple ()                                  // user: %44
  return %43 : $()                                // id: %44
} // end sil function '$s13AudioExplorer21MutableDevicePropertyV_9providersACyxq_GAA0adE11DescriptionVyxG_AA0E17ProviderFunctionsVtcfC'

// MutableDeviceProperty.wrappedValue.getter
sil @$s13AudioExplorer21MutableDevicePropertyV12wrappedValueq_Sgvg : $@convention(method) <Base, Output> (@in_guaranteed MutableDeviceProperty<Base, Output>) -> @out Optional<Output> {
// %0 "$return_value"                             // users: %76, %74, %72, %211, %345, %478
// %1 "self"                                      // users: %82, %215, %12, %9, %348, %4, %2
bb0(%0 : $*Optional<Output>, %1 : $*MutableDeviceProperty<Base, Output>):
  debug_value_addr %1 : $*MutableDeviceProperty<Base, Output>, let, name "self", argno 1 // id: %2
  %3 = alloc_stack $AudioObjectPropertyAddress, var, name "address" // users: %480, %14, %8, %151, %150, %284, %283, %417, %416
  %4 = struct_element_addr %1 : $*MutableDeviceProperty<Base, Output>, #MutableDeviceProperty.description // users: %39, %5
  %5 = load %4 : $*AudioDevicePropertyDescription<Base> // user: %7
  // function_ref AudioDevicePropertyDescription.address.getter
  %6 = function_ref @$s13AudioExplorer0A25DevicePropertyDescriptionV7addressSo0a6ObjectD7AddressVvg : $@convention(method) <τ_0_0> (AudioDevicePropertyDescription<τ_0_0>) -> AudioObjectPropertyAddress // user: %7
  %7 = apply %6<Base>(%5) : $@convention(method) <τ_0_0> (AudioDevicePropertyDescription<τ_0_0>) -> AudioObjectPropertyAddress // user: %8
  store %7 to %3 : $*AudioObjectPropertyAddress   // id: %8
  %9 = struct_element_addr %1 : $*MutableDeviceProperty<Base, Output>, #MutableDeviceProperty.providers // users: %56, %31, %23, %10
  %10 = struct_element_addr %9 : $*PropertyProviderFunctions, #PropertyProviderFunctions.hasCheck // user: %11
  %11 = load %10 : $*@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>) -> Bool // user: %16
  %12 = struct_element_addr %1 : $*MutableDeviceProperty<Base, Output>, #MutableDeviceProperty.id // users: %58, %25, %13
  %13 = load %12 : $*UInt32                       // user: %16
  %14 = address_to_pointer %3 : $*AudioObjectPropertyAddress to $Builtin.RawPointer // user: %15
  %15 = struct $UnsafePointer<AudioObjectPropertyAddress> (%14 : $Builtin.RawPointer) // users: %63, %29, %16
  %16 = apply %11(%13, %15) : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>) -> Bool // user: %17
  %17 = struct_extract %16 : $Bool, #Bool._value  // user: %18
  cond_br %17, bb1, bb33                          // id: %18

bb1:                                              // Preds: bb0
  %19 = alloc_stack $UInt32, var, name "propertySize" // users: %37, %22, %27, %80, %213, %346
  %20 = integer_literal $Builtin.Int32, 0         // users: %42, %21
  %21 = struct $UInt32 (%20 : $Builtin.Int32)     // users: %63, %29, %22
  store %21 to %19 : $*UInt32                     // id: %22
  %23 = struct_element_addr %9 : $*PropertyProviderFunctions, #PropertyProviderFunctions.dataSize // user: %24
  %24 = load %23 : $*@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>) -> Int32 // user: %29
  %25 = load %12 : $*UInt32                       // user: %29
  %26 = enum $Optional<UnsafeRawPointer>, #Optional.none!enumelt // users: %63, %29
  %27 = address_to_pointer %19 : $*UInt32 to $Builtin.RawPointer // user: %28
  %28 = struct $UnsafeMutablePointer<UInt32> (%27 : $Builtin.RawPointer) // user: %29
  %29 = apply %24(%25, %15, %21, %26, %28) : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>) -> Int32 // users: %34, %30
  debug_value %29 : $Int32, let, name "sizeStatus" // id: %30
  %31 = struct_element_addr %9 : $*PropertyProviderFunctions, #PropertyProviderFunctions.noErrorValue // user: %32
  %32 = struct_element_addr %31 : $*Int32, #Int32._value // users: %65, %33
  %33 = load %32 : $*Builtin.Int32                // user: %35
  %34 = struct_extract %29 : $Int32, #Int32._value // user: %35
  %35 = builtin "cmp_eq_Int32"(%34 : $Builtin.Int32, %33 : $Builtin.Int32) : $Builtin.Int1 // user: %36
  cond_br %35, bb2, bb20                          // id: %36

bb2:                                              // Preds: bb1
  %37 = struct_element_addr %19 : $*UInt32, #UInt32._value // user: %38
  %38 = load %37 : $*Builtin.Int32                // user: %46
  %39 = struct_element_addr %4 : $*AudioDevicePropertyDescription<Base>, #AudioDevicePropertyDescription.elementSize // user: %40
  %40 = struct_element_addr %39 : $*UInt32, #UInt32._value // user: %41
  %41 = load %40 : $*Builtin.Int32                // users: %48, %46, %42
  %42 = builtin "cmp_eq_Int32"(%41 : $Builtin.Int32, %20 : $Builtin.Int32) : $Builtin.Int1 // user: %44
  %43 = integer_literal $Builtin.Int1, 0          // users: %168, %176, %191, %44
  %44 = builtin "int_expect_Int1"(%42 : $Builtin.Int1, %43 : $Builtin.Int1) : $Builtin.Int1 // user: %45
  cond_fail %44 : $Builtin.Int1, "Division by zero" // id: %45
  %46 = builtin "udiv_Int32"(%38 : $Builtin.Int32, %41 : $Builtin.Int32) : $Builtin.Int32 // user: %51
  %47 = alloc_stack $UInt32, var, name "typeSize" // users: %49, %61, %79, %212
  %48 = struct $UInt32 (%41 : $Builtin.Int32)     // user: %49
  store %48 to %47 : $*UInt32                     // id: %49
  %50 = metatype $@thin UnsafeMutablePointer<Base>.Type // user: %54
  %51 = builtin "zextOrBitCast_Int32_Int64"(%46 : $Builtin.Int32) : $Builtin.Int64 // user: %52
  %52 = struct $Int (%51 : $Builtin.Int64)        // user: %54
  // function_ref static UnsafeMutablePointer.allocate(capacity:)
  %53 = function_ref @$sSp8allocate8capacitySpyxGSi_tFZ : $@convention(method) <τ_0_0> (Int, @thin UnsafeMutablePointer<τ_0_0>.Type) -> UnsafeMutablePointer<τ_0_0> // user: %54
  %54 = apply %53<Base>(%52, %50) : $@convention(method) <τ_0_0> (Int, @thin UnsafeMutablePointer<τ_0_0>.Type) -> UnsafeMutablePointer<τ_0_0> // users: %59, %55
  debug_value %54 : $UnsafeMutablePointer<Base>, let, name "holder" // id: %55
  %56 = struct_element_addr %9 : $*PropertyProviderFunctions, #PropertyProviderFunctions.getData // user: %57
  %57 = load %56 : $*@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) -> Int32 // user: %63
  %58 = load %12 : $*UInt32                       // user: %63
  %59 = struct_extract %54 : $UnsafeMutablePointer<Base>, #UnsafeMutablePointer._rawValue // users: %69, %60
  %60 = struct $UnsafeMutableRawPointer (%59 : $Builtin.RawPointer) // user: %63
  %61 = address_to_pointer %47 : $*UInt32 to $Builtin.RawPointer // user: %62
  %62 = struct $UnsafeMutablePointer<UInt32> (%61 : $Builtin.RawPointer) // user: %63
  %63 = apply %57(%58, %15, %21, %26, %62, %60) : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) -> Int32 // users: %66, %64
  debug_value %63 : $Int32, let, name "accessStatus" // id: %64
  %65 = load %32 : $*Builtin.Int32                // user: %67
  %66 = struct_extract %63 : $Int32, #Int32._value // user: %67
  %67 = builtin "cmp_eq_Int32"(%66 : $Builtin.Int32, %65 : $Builtin.Int32) : $Builtin.Int1 // user: %68
  cond_br %67, bb3, bb7                           // id: %68

bb3:                                              // Preds: bb2
  %69 = pointer_to_address %59 : $Builtin.RawPointer to [strict] $*Base // user: %71
  %70 = alloc_stack $Base                         // users: %78, %73, %71
  copy_addr %69 to [initialization] %70 : $*Base  // id: %71
  %72 = init_enum_data_addr %0 : $*Optional<Output>, #Optional.some!enumelt // user: %73
  checked_cast_addr_br take_always Base in %70 : $*Base to Output in %72 : $*Output, bb4, bb5 // id: %73

bb4:                                              // Preds: bb3
  inject_enum_addr %0 : $*Optional<Output>, #Optional.some!enumelt // id: %74
  br bb6                                          // id: %75

bb5:                                              // Preds: bb3
  inject_enum_addr %0 : $*Optional<Output>, #Optional.none!enumelt // id: %76
  br bb6                                          // id: %77

bb6:                                              // Preds: bb5 bb4
  dealloc_stack %70 : $*Base                      // id: %78
  dealloc_stack %47 : $*UInt32                    // id: %79
  dealloc_stack %19 : $*UInt32                    // id: %80
  br bb46                                         // id: %81

bb7:                                              // Preds: bb2
  %82 = struct_element_addr %1 : $*MutableDeviceProperty<Base, Output>, #MutableDeviceProperty.logger // user: %84
  %83 = alloc_stack $Logger                       // users: %86, %209, %210, %84
  copy_addr %82 to [initialization] %83 : $*Logger // id: %84
  // function_ref Logger.logObject.getter
  %85 = function_ref @$s2os6LoggerV9logObjectSo03OS_a1_C0Cvg : $@convention(method) (@in_guaranteed Logger) -> @owned OSLog // user: %86
  %86 = apply %85(%83) : $@convention(method) (@in_guaranteed Logger) -> @owned OSLog // users: %94, %203, %91, %197
  %87 = metatype $@thin OSLogType.Type            // user: %89
  // function_ref static os_log_type_t.error.getter
  %88 = function_ref @$sSo13os_log_type_ta0A0E5errorABvgZ : $@convention(method) (@thin OSLogType.Type) -> OSLogType // user: %89
  %89 = apply %88(%87) : $@convention(method) (@thin OSLogType.Type) -> OSLogType // users: %197, %91
  // function_ref os_log_type_enabled
  %90 = function_ref @os_log_type_enabled : $@convention(c) (OSLog, OSLogType) -> Bool // user: %91
  %91 = apply %90(%86, %89) : $@convention(c) (OSLog, OSLogType) -> Bool // user: %92
  %92 = struct_extract %91 : $Bool, #Bool._value  // user: %93
  cond_br %92, bb9, bb8                           // id: %93

bb8:                                              // Preds: bb7
  strong_release %86 : $OSLog                     // id: %94
  br bb19                                         // id: %95

bb9:                                              // Preds: bb7
  %96 = integer_literal $Builtin.Int64, 12        // user: %101
  %97 = metatype $@thick UInt8.Type               // users: %104, %98
  %98 = builtin "strideof"<UInt8>(%97 : $@thick UInt8.Type) : $Builtin.Word // user: %99
  %99 = builtin "sextOrBitCast_Word_Int64"(%98 : $Builtin.Word) : $Builtin.Int64 // users: %167, %175, %188, %101
  %100 = integer_literal $Builtin.Int1, -1        // user: %101
  %101 = builtin "smul_with_overflow_Int64"(%99 : $Builtin.Int64, %96 : $Builtin.Int64, %100 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // users: %102, %113
  %102 = tuple_extract %101 : $(Builtin.Int64, Builtin.Int1), 1 // user: %103
  cond_fail %102 : $Builtin.Int1, "arithmetic overflow" // id: %103
  %104 = builtin "alignof"<UInt8>(%97 : $@thick UInt8.Type) : $Builtin.Word // users: %109, %105
  %105 = builtin "sextOrBitCast_Word_Int64"(%104 : $Builtin.Word) : $Builtin.Int64 // user: %107
  %106 = integer_literal $Builtin.Int64, 16       // users: %121, %107
  %107 = builtin "cmp_slt_Int64"(%106 : $Builtin.Int64, %105 : $Builtin.Int64) : $Builtin.Int1 // user: %108
  cond_br %107, bb10, bb11                        // id: %108

bb10:                                             // Preds: bb9
  br bb12(%104 : $Builtin.Word)                   // id: %109

bb11:                                             // Preds: bb9
  %110 = integer_literal $Builtin.Word, 0         // user: %111
  br bb12(%110 : $Builtin.Word)                   // id: %111

// %112                                           // user: %115
bb12(%112 : $Builtin.Word):                       // Preds: bb10 bb11
  %113 = tuple_extract %101 : $(Builtin.Int64, Builtin.Int1), 0 // user: %114
  %114 = builtin "truncOrBitCast_Int64_Word"(%113 : $Builtin.Int64) : $Builtin.Word // user: %115
  %115 = builtin "allocRaw"(%114 : $Builtin.Word, %112 : $Builtin.Word) : $Builtin.RawPointer // users: %142, %202, %183, %117
  %116 = integer_literal $Builtin.Word, 12        // user: %117
  bind_memory %115 : $Builtin.RawPointer, %116 : $Builtin.Word to $*UInt8 // id: %117
  %118 = metatype $@thick Any.Protocol            // users: %198, %119, %135
  %119 = builtin "alignof"<Any>(%118 : $@thick Any.Protocol) : $Builtin.Word // users: %206, %120
  %120 = builtin "sextOrBitCast_Word_Int64"(%119 : $Builtin.Word) : $Builtin.Int64 // user: %121
  %121 = builtin "cmp_slt_Int64"(%106 : $Builtin.Int64, %120 : $Builtin.Int64) : $Builtin.Int1 // user: %122
  cond_br %121, bb17, bb18                        // id: %122

// %123                                           // user: %136
bb13(%123 : $Builtin.Word):                       // Preds: bb17 bb18
  %124 = integer_literal $Builtin.Int8, 2         // user: %125
  %125 = struct $UInt8 (%124 : $Builtin.Int8)     // user: %143
  %126 = integer_literal $Builtin.Int8, 1         // user: %127
  %127 = struct $UInt8 (%126 : $Builtin.Int8)     // user: %145
  %128 = integer_literal $Builtin.Int8, 34        // user: %129
  %129 = struct $UInt8 (%128 : $Builtin.Int8)     // user: %147
  %130 = integer_literal $Builtin.Int8, 8         // user: %131
  %131 = struct $UInt8 (%130 : $Builtin.Int8)     // user: %149
  %132 = integer_literal $Builtin.Word, 3         // user: %148
  %133 = integer_literal $Builtin.Word, 1         // users: %198, %144, %137
  %134 = integer_literal $Builtin.Word, 2         // user: %146
  %135 = builtin "strideof"<Any>(%118 : $@thick Any.Protocol) : $Builtin.Word // user: %136
  %136 = builtin "allocRaw"(%135 : $Builtin.Word, %123 : $Builtin.Word) : $Builtin.RawPointer // users: %201, %198, %138, %137
  bind_memory %136 : $Builtin.RawPointer, %133 : $Builtin.Word to $*Any // id: %137
  %138 = struct $UnsafeMutablePointer<Any> (%136 : $Builtin.RawPointer) // user: %139
  %139 = enum $Optional<UnsafeMutablePointer<Any>>, #Optional.some!enumelt, %138 : $UnsafeMutablePointer<Any> // user: %141
  %140 = alloc_stack $Optional<UnsafeMutablePointer<Any>> // users: %157, %141, %204
  store %139 to %140 : $*Optional<UnsafeMutablePointer<Any>> // id: %141
  %142 = pointer_to_address %115 : $Builtin.RawPointer to [strict] $*UInt8 // users: %185, %148, %146, %144, %143
  store %125 to %142 : $*UInt8                    // id: %143
  %144 = index_addr %142 : $*UInt8, %133 : $Builtin.Word // user: %145
  store %127 to %144 : $*UInt8                    // id: %145
  %146 = index_addr %142 : $*UInt8, %134 : $Builtin.Word // user: %147
  store %129 to %146 : $*UInt8                    // id: %147
  %148 = index_addr %142 : $*UInt8, %132 : $Builtin.Word // user: %149
  store %131 to %148 : $*UInt8                    // id: %149
  debug_value_addr %3 : $*AudioObjectPropertyAddress, var, name "address", argno 1 // id: %150
  %151 = begin_access [read] [dynamic] [no_nested_conflict] %3 : $*AudioObjectPropertyAddress // users: %153, %152
  %152 = load %151 : $*AudioObjectPropertyAddress // user: %155
  end_access %151 : $*AudioObjectPropertyAddress  // id: %153
  // function_ref AudioObjectPropertyAddress.description.getter
  %154 = function_ref @$sSo26AudioObjectPropertyAddressV0A8ExplorerE11descriptionSSvg : $@convention(method) (AudioObjectPropertyAddress) -> @owned String // user: %155
  %155 = apply %154(%152) : $@convention(method) (AudioObjectPropertyAddress) -> @owned String // users: %160, %157
  // function_ref getNullTerminatedUTF8Pointer(_:using:)
  %156 = function_ref @$s2os28getNullTerminatedUTF8Pointer_5usingSVSS_SpyypGSgztF : $@convention(thin) (@guaranteed String, @inout Optional<UnsafeMutablePointer<Any>>) -> UnsafeRawPointer // user: %157
  %157 = apply %156(%155, %140) : $@convention(thin) (@guaranteed String, @inout Optional<UnsafeMutablePointer<Any>>) -> UnsafeRawPointer // user: %159
  %158 = alloc_stack $UnsafeRawPointer            // users: %192, %187, %159
  store %157 to %158 : $*UnsafeRawPointer         // id: %159
  release_value %155 : $String                    // id: %160
  %161 = metatype $@thick UnsafeRawPointer.Type   // user: %162
  %162 = builtin "sizeof"<UnsafeRawPointer>(%161 : $@thick UnsafeRawPointer.Type) : $Builtin.Word // user: %163
  %163 = builtin "sextOrBitCast_Word_Int64"(%162 : $Builtin.Word) : $Builtin.Int64 // users: %188, %171, %165
  %164 = integer_literal $Builtin.Int64, 0        // users: %189, %167, %165
  %165 = builtin "cmp_slt_Int64"(%163 : $Builtin.Int64, %164 : $Builtin.Int64) : $Builtin.Int1 // user: %166
  cond_fail %165 : $Builtin.Int1, "UnsafeRawBufferPointer with negative count" // id: %166
  %167 = builtin "cmp_eq_Int64"(%99 : $Builtin.Int64, %164 : $Builtin.Int64) : $Builtin.Int1 // user: %168
  %168 = builtin "int_expect_Int1"(%167 : $Builtin.Int1, %43 : $Builtin.Int1) : $Builtin.Int1 // user: %169
  cond_fail %168 : $Builtin.Int1, "Division by zero" // id: %169
  %170 = integer_literal $Builtin.Int64, -9223372036854775808 // user: %171
  %171 = builtin "cmp_eq_Int64"(%163 : $Builtin.Int64, %170 : $Builtin.Int64) : $Builtin.Int1 // user: %172
  cond_br %171, bb15, bb14                        // id: %172

bb14:                                             // Preds: bb13
  br bb16                                         // id: %173

bb15:                                             // Preds: bb13
  %174 = integer_literal $Builtin.Int64, -1       // user: %175
  %175 = builtin "cmp_eq_Int64"(%99 : $Builtin.Int64, %174 : $Builtin.Int64) : $Builtin.Int1 // user: %176
  %176 = builtin "int_expect_Int1"(%175 : $Builtin.Int1, %43 : $Builtin.Int1) : $Builtin.Int1 // user: %177
  cond_fail %176 : $Builtin.Int1, "Division results in an overflow" // id: %177
  br bb16                                         // id: %178

bb16:                                             // Preds: bb14 bb15
  %179 = string_literal utf8 "unable to access address %{public}s" // user: %182
  %180 = integer_literal $Builtin.Int32, 12       // user: %181
  %181 = struct $UInt32 (%180 : $Builtin.Int32)   // user: %197
  %182 = struct $UnsafePointer<Int8> (%179 : $Builtin.RawPointer) // user: %197
  %183 = struct $UnsafeMutablePointer<UInt8> (%115 : $Builtin.RawPointer) // user: %197
  %184 = integer_literal $Builtin.Word, 4         // user: %185
  %185 = index_addr %142 : $*UInt8, %184 : $Builtin.Word // user: %186
  %186 = address_to_pointer %185 : $*UInt8 to $Builtin.RawPointer // user: %191
  %187 = address_to_pointer %158 : $*UnsafeRawPointer to $Builtin.RawPointer // user: %191
  %188 = builtin "sdiv_Int64"(%163 : $Builtin.Int64, %99 : $Builtin.Int64) : $Builtin.Int64 // users: %191, %189
  %189 = builtin "cmp_slt_Int64"(%188 : $Builtin.Int64, %164 : $Builtin.Int64) : $Builtin.Int1 // user: %190
  cond_fail %189 : $Builtin.Int1, "Negative value is not representable" // id: %190
  %191 = builtin "int_memmove_RawPointer_RawPointer_Int64"(%186 : $Builtin.RawPointer, %187 : $Builtin.RawPointer, %188 : $Builtin.Int64, %43 : $Builtin.Int1) : $()
  dealloc_stack %158 : $*UnsafeRawPointer         // id: %192
  %193 = global_addr @__dso_handle : $*Builtin.RawPointer // user: %194
  %194 = address_to_pointer %193 : $*Builtin.RawPointer to $Builtin.RawPointer // user: %195
  %195 = struct $UnsafeMutableRawPointer (%194 : $Builtin.RawPointer) // user: %197
  // function_ref _os_log_impl
  %196 = function_ref @_os_log_impl : $@convention(c) (UnsafeMutableRawPointer, OSLog, OSLogType, UnsafePointer<Int8>, UnsafeMutablePointer<UInt8>, UInt32) -> () // user: %197
  %197 = apply %196(%195, %86, %89, %182, %183, %181) : $@convention(c) (UnsafeMutableRawPointer, OSLog, OSLogType, UnsafePointer<Int8>, UnsafeMutablePointer<UInt8>, UInt32) -> ()
  %198 = builtin "destroyArray"<Any>(%118 : $@thick Any.Protocol, %136 : $Builtin.RawPointer, %133 : $Builtin.Word) : $()
  %199 = integer_literal $Builtin.Word, -1        // users: %202, %201
  %200 = integer_literal $Builtin.Word, 0         // users: %202, %201
  %201 = builtin "deallocRaw"(%136 : $Builtin.RawPointer, %199 : $Builtin.Word, %200 : $Builtin.Word) : $()
  %202 = builtin "deallocRaw"(%115 : $Builtin.RawPointer, %199 : $Builtin.Word, %200 : $Builtin.Word) : $()
  strong_release %86 : $OSLog                     // id: %203
  dealloc_stack %140 : $*Optional<UnsafeMutablePointer<Any>> // id: %204
  br bb19                                         // id: %205

bb17:                                             // Preds: bb12
  br bb13(%119 : $Builtin.Word)                   // id: %206

bb18:                                             // Preds: bb12
  %207 = integer_literal $Builtin.Word, 0         // user: %208
  br bb13(%207 : $Builtin.Word)                   // id: %208

bb19:                                             // Preds: bb8 bb16
  destroy_addr %83 : $*Logger                     // id: %209
  dealloc_stack %83 : $*Logger                    // id: %210
  inject_enum_addr %0 : $*Optional<Output>, #Optional.none!enumelt // id: %211
  dealloc_stack %47 : $*UInt32                    // id: %212
  dealloc_stack %19 : $*UInt32                    // id: %213
  br bb46                                         // id: %214

bb20:                                             // Preds: bb1
  %215 = struct_element_addr %1 : $*MutableDeviceProperty<Base, Output>, #MutableDeviceProperty.logger // user: %217
  %216 = alloc_stack $Logger                      // users: %219, %343, %344, %217
  copy_addr %215 to [initialization] %216 : $*Logger // id: %217
  // function_ref Logger.logObject.getter
  %218 = function_ref @$s2os6LoggerV9logObjectSo03OS_a1_C0Cvg : $@convention(method) (@in_guaranteed Logger) -> @owned OSLog // user: %219
  %219 = apply %218(%216) : $@convention(method) (@in_guaranteed Logger) -> @owned OSLog // users: %227, %337, %224, %331
  %220 = metatype $@thin OSLogType.Type           // user: %222
  // function_ref static os_log_type_t.error.getter
  %221 = function_ref @$sSo13os_log_type_ta0A0E5errorABvgZ : $@convention(method) (@thin OSLogType.Type) -> OSLogType // user: %222
  %222 = apply %221(%220) : $@convention(method) (@thin OSLogType.Type) -> OSLogType // users: %331, %224
  // function_ref os_log_type_enabled
  %223 = function_ref @os_log_type_enabled : $@convention(c) (OSLog, OSLogType) -> Bool // user: %224
  %224 = apply %223(%219, %222) : $@convention(c) (OSLog, OSLogType) -> Bool // user: %225
  %225 = struct_extract %224 : $Bool, #Bool._value // user: %226
  cond_br %225, bb22, bb21                        // id: %226

bb21:                                             // Preds: bb20
  strong_release %219 : $OSLog                    // id: %227
  br bb32                                         // id: %228

bb22:                                             // Preds: bb20
  %229 = integer_literal $Builtin.Int64, 12       // user: %234
  %230 = metatype $@thick UInt8.Type              // users: %237, %231
  %231 = builtin "strideof"<UInt8>(%230 : $@thick UInt8.Type) : $Builtin.Word // user: %232
  %232 = builtin "sextOrBitCast_Word_Int64"(%231 : $Builtin.Word) : $Builtin.Int64 // users: %301, %309, %322, %234
  %233 = integer_literal $Builtin.Int1, -1        // user: %234
  %234 = builtin "smul_with_overflow_Int64"(%232 : $Builtin.Int64, %229 : $Builtin.Int64, %233 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // users: %235, %246
  %235 = tuple_extract %234 : $(Builtin.Int64, Builtin.Int1), 1 // user: %236
  cond_fail %235 : $Builtin.Int1, "arithmetic overflow" // id: %236
  %237 = builtin "alignof"<UInt8>(%230 : $@thick UInt8.Type) : $Builtin.Word // users: %242, %238
  %238 = builtin "sextOrBitCast_Word_Int64"(%237 : $Builtin.Word) : $Builtin.Int64 // user: %240
  %239 = integer_literal $Builtin.Int64, 16       // users: %254, %240
  %240 = builtin "cmp_slt_Int64"(%239 : $Builtin.Int64, %238 : $Builtin.Int64) : $Builtin.Int1 // user: %241
  cond_br %240, bb23, bb24                        // id: %241

bb23:                                             // Preds: bb22
  br bb25(%237 : $Builtin.Word)                   // id: %242

bb24:                                             // Preds: bb22
  %243 = integer_literal $Builtin.Word, 0         // user: %244
  br bb25(%243 : $Builtin.Word)                   // id: %244

// %245                                           // user: %248
bb25(%245 : $Builtin.Word):                       // Preds: bb23 bb24
  %246 = tuple_extract %234 : $(Builtin.Int64, Builtin.Int1), 0 // user: %247
  %247 = builtin "truncOrBitCast_Int64_Word"(%246 : $Builtin.Int64) : $Builtin.Word // user: %248
  %248 = builtin "allocRaw"(%247 : $Builtin.Word, %245 : $Builtin.Word) : $Builtin.RawPointer // users: %275, %336, %317, %250
  %249 = integer_literal $Builtin.Word, 12        // user: %250
  bind_memory %248 : $Builtin.RawPointer, %249 : $Builtin.Word to $*UInt8 // id: %250
  %251 = metatype $@thick Any.Protocol            // users: %332, %252, %268
  %252 = builtin "alignof"<Any>(%251 : $@thick Any.Protocol) : $Builtin.Word // users: %340, %253
  %253 = builtin "sextOrBitCast_Word_Int64"(%252 : $Builtin.Word) : $Builtin.Int64 // user: %254
  %254 = builtin "cmp_slt_Int64"(%239 : $Builtin.Int64, %253 : $Builtin.Int64) : $Builtin.Int1 // user: %255
  cond_br %254, bb30, bb31                        // id: %255

// %256                                           // user: %269
bb26(%256 : $Builtin.Word):                       // Preds: bb30 bb31
  %257 = integer_literal $Builtin.Int8, 2         // user: %258
  %258 = struct $UInt8 (%257 : $Builtin.Int8)     // user: %276
  %259 = integer_literal $Builtin.Int8, 1         // user: %260
  %260 = struct $UInt8 (%259 : $Builtin.Int8)     // user: %278
  %261 = integer_literal $Builtin.Int8, 34        // user: %262
  %262 = struct $UInt8 (%261 : $Builtin.Int8)     // user: %280
  %263 = integer_literal $Builtin.Int8, 8         // user: %264
  %264 = struct $UInt8 (%263 : $Builtin.Int8)     // user: %282
  %265 = integer_literal $Builtin.Word, 3         // user: %281
  %266 = integer_literal $Builtin.Word, 1         // users: %332, %277, %270
  %267 = integer_literal $Builtin.Word, 2         // user: %279
  %268 = builtin "strideof"<Any>(%251 : $@thick Any.Protocol) : $Builtin.Word // user: %269
  %269 = builtin "allocRaw"(%268 : $Builtin.Word, %256 : $Builtin.Word) : $Builtin.RawPointer // users: %335, %332, %271, %270
  bind_memory %269 : $Builtin.RawPointer, %266 : $Builtin.Word to $*Any // id: %270
  %271 = struct $UnsafeMutablePointer<Any> (%269 : $Builtin.RawPointer) // user: %272
  %272 = enum $Optional<UnsafeMutablePointer<Any>>, #Optional.some!enumelt, %271 : $UnsafeMutablePointer<Any> // user: %274
  %273 = alloc_stack $Optional<UnsafeMutablePointer<Any>> // users: %290, %274, %338
  store %272 to %273 : $*Optional<UnsafeMutablePointer<Any>> // id: %274
  %275 = pointer_to_address %248 : $Builtin.RawPointer to [strict] $*UInt8 // users: %319, %281, %279, %277, %276
  store %258 to %275 : $*UInt8                    // id: %276
  %277 = index_addr %275 : $*UInt8, %266 : $Builtin.Word // user: %278
  store %260 to %277 : $*UInt8                    // id: %278
  %279 = index_addr %275 : $*UInt8, %267 : $Builtin.Word // user: %280
  store %262 to %279 : $*UInt8                    // id: %280
  %281 = index_addr %275 : $*UInt8, %265 : $Builtin.Word // user: %282
  store %264 to %281 : $*UInt8                    // id: %282
  debug_value_addr %3 : $*AudioObjectPropertyAddress, var, name "address", argno 1 // id: %283
  %284 = begin_access [read] [dynamic] [no_nested_conflict] %3 : $*AudioObjectPropertyAddress // users: %286, %285
  %285 = load %284 : $*AudioObjectPropertyAddress // user: %288
  end_access %284 : $*AudioObjectPropertyAddress  // id: %286
  // function_ref AudioObjectPropertyAddress.description.getter
  %287 = function_ref @$sSo26AudioObjectPropertyAddressV0A8ExplorerE11descriptionSSvg : $@convention(method) (AudioObjectPropertyAddress) -> @owned String // user: %288
  %288 = apply %287(%285) : $@convention(method) (AudioObjectPropertyAddress) -> @owned String // users: %293, %290
  // function_ref getNullTerminatedUTF8Pointer(_:using:)
  %289 = function_ref @$s2os28getNullTerminatedUTF8Pointer_5usingSVSS_SpyypGSgztF : $@convention(thin) (@guaranteed String, @inout Optional<UnsafeMutablePointer<Any>>) -> UnsafeRawPointer // user: %290
  %290 = apply %289(%288, %273) : $@convention(thin) (@guaranteed String, @inout Optional<UnsafeMutablePointer<Any>>) -> UnsafeRawPointer // user: %292
  %291 = alloc_stack $UnsafeRawPointer            // users: %326, %321, %292
  store %290 to %291 : $*UnsafeRawPointer         // id: %292
  release_value %288 : $String                    // id: %293
  %294 = metatype $@thick UnsafeRawPointer.Type   // user: %295
  %295 = builtin "sizeof"<UnsafeRawPointer>(%294 : $@thick UnsafeRawPointer.Type) : $Builtin.Word // user: %296
  %296 = builtin "sextOrBitCast_Word_Int64"(%295 : $Builtin.Word) : $Builtin.Int64 // users: %322, %305, %298
  %297 = integer_literal $Builtin.Int64, 0        // users: %323, %301, %298
  %298 = builtin "cmp_slt_Int64"(%296 : $Builtin.Int64, %297 : $Builtin.Int64) : $Builtin.Int1 // user: %299
  cond_fail %298 : $Builtin.Int1, "UnsafeRawBufferPointer with negative count" // id: %299
  %300 = integer_literal $Builtin.Int1, 0         // users: %325, %310, %302
  %301 = builtin "cmp_eq_Int64"(%232 : $Builtin.Int64, %297 : $Builtin.Int64) : $Builtin.Int1 // user: %302
  %302 = builtin "int_expect_Int1"(%301 : $Builtin.Int1, %300 : $Builtin.Int1) : $Builtin.Int1 // user: %303
  cond_fail %302 : $Builtin.Int1, "Division by zero" // id: %303
  %304 = integer_literal $Builtin.Int64, -9223372036854775808 // user: %305
  %305 = builtin "cmp_eq_Int64"(%296 : $Builtin.Int64, %304 : $Builtin.Int64) : $Builtin.Int1 // user: %306
  cond_br %305, bb28, bb27                        // id: %306

bb27:                                             // Preds: bb26
  br bb29                                         // id: %307

bb28:                                             // Preds: bb26
  %308 = integer_literal $Builtin.Int64, -1       // user: %309
  %309 = builtin "cmp_eq_Int64"(%232 : $Builtin.Int64, %308 : $Builtin.Int64) : $Builtin.Int1 // user: %310
  %310 = builtin "int_expect_Int1"(%309 : $Builtin.Int1, %300 : $Builtin.Int1) : $Builtin.Int1 // user: %311
  cond_fail %310 : $Builtin.Int1, "Division results in an overflow" // id: %311
  br bb29                                         // id: %312

bb29:                                             // Preds: bb27 bb28
  %313 = string_literal utf8 "unable to get size for address %{public}s" // user: %316
  %314 = integer_literal $Builtin.Int32, 12       // user: %315
  %315 = struct $UInt32 (%314 : $Builtin.Int32)   // user: %331
  %316 = struct $UnsafePointer<Int8> (%313 : $Builtin.RawPointer) // user: %331
  %317 = struct $UnsafeMutablePointer<UInt8> (%248 : $Builtin.RawPointer) // user: %331
  %318 = integer_literal $Builtin.Word, 4         // user: %319
  %319 = index_addr %275 : $*UInt8, %318 : $Builtin.Word // user: %320
  %320 = address_to_pointer %319 : $*UInt8 to $Builtin.RawPointer // user: %325
  %321 = address_to_pointer %291 : $*UnsafeRawPointer to $Builtin.RawPointer // user: %325
  %322 = builtin "sdiv_Int64"(%296 : $Builtin.Int64, %232 : $Builtin.Int64) : $Builtin.Int64 // users: %325, %323
  %323 = builtin "cmp_slt_Int64"(%322 : $Builtin.Int64, %297 : $Builtin.Int64) : $Builtin.Int1 // user: %324
  cond_fail %323 : $Builtin.Int1, "Negative value is not representable" // id: %324
  %325 = builtin "int_memmove_RawPointer_RawPointer_Int64"(%320 : $Builtin.RawPointer, %321 : $Builtin.RawPointer, %322 : $Builtin.Int64, %300 : $Builtin.Int1) : $()
  dealloc_stack %291 : $*UnsafeRawPointer         // id: %326
  %327 = global_addr @__dso_handle : $*Builtin.RawPointer // user: %328
  %328 = address_to_pointer %327 : $*Builtin.RawPointer to $Builtin.RawPointer // user: %329
  %329 = struct $UnsafeMutableRawPointer (%328 : $Builtin.RawPointer) // user: %331
  // function_ref _os_log_impl
  %330 = function_ref @_os_log_impl : $@convention(c) (UnsafeMutableRawPointer, OSLog, OSLogType, UnsafePointer<Int8>, UnsafeMutablePointer<UInt8>, UInt32) -> () // user: %331
  %331 = apply %330(%329, %219, %222, %316, %317, %315) : $@convention(c) (UnsafeMutableRawPointer, OSLog, OSLogType, UnsafePointer<Int8>, UnsafeMutablePointer<UInt8>, UInt32) -> ()
  %332 = builtin "destroyArray"<Any>(%251 : $@thick Any.Protocol, %269 : $Builtin.RawPointer, %266 : $Builtin.Word) : $()
  %333 = integer_literal $Builtin.Word, -1        // users: %336, %335
  %334 = integer_literal $Builtin.Word, 0         // users: %336, %335
  %335 = builtin "deallocRaw"(%269 : $Builtin.RawPointer, %333 : $Builtin.Word, %334 : $Builtin.Word) : $()
  %336 = builtin "deallocRaw"(%248 : $Builtin.RawPointer, %333 : $Builtin.Word, %334 : $Builtin.Word) : $()
  strong_release %219 : $OSLog                    // id: %337
  dealloc_stack %273 : $*Optional<UnsafeMutablePointer<Any>> // id: %338
  br bb32                                         // id: %339

bb30:                                             // Preds: bb25
  br bb26(%252 : $Builtin.Word)                   // id: %340

bb31:                                             // Preds: bb25
  %341 = integer_literal $Builtin.Word, 0         // user: %342
  br bb26(%341 : $Builtin.Word)                   // id: %342

bb32:                                             // Preds: bb21 bb29
  destroy_addr %216 : $*Logger                    // id: %343
  dealloc_stack %216 : $*Logger                   // id: %344
  inject_enum_addr %0 : $*Optional<Output>, #Optional.none!enumelt // id: %345
  dealloc_stack %19 : $*UInt32                    // id: %346
  br bb46                                         // id: %347

bb33:                                             // Preds: bb0
  %348 = struct_element_addr %1 : $*MutableDeviceProperty<Base, Output>, #MutableDeviceProperty.logger // user: %350
  %349 = alloc_stack $Logger                      // users: %352, %476, %477, %350
  copy_addr %348 to [initialization] %349 : $*Logger // id: %350
  // function_ref Logger.logObject.getter
  %351 = function_ref @$s2os6LoggerV9logObjectSo03OS_a1_C0Cvg : $@convention(method) (@in_guaranteed Logger) -> @owned OSLog // user: %352
  %352 = apply %351(%349) : $@convention(method) (@in_guaranteed Logger) -> @owned OSLog // users: %360, %470, %357, %464
  %353 = metatype $@thin OSLogType.Type           // user: %355
  // function_ref static os_log_type_t.error.getter
  %354 = function_ref @$sSo13os_log_type_ta0A0E5errorABvgZ : $@convention(method) (@thin OSLogType.Type) -> OSLogType // user: %355
  %355 = apply %354(%353) : $@convention(method) (@thin OSLogType.Type) -> OSLogType // users: %464, %357
  // function_ref os_log_type_enabled
  %356 = function_ref @os_log_type_enabled : $@convention(c) (OSLog, OSLogType) -> Bool // user: %357
  %357 = apply %356(%352, %355) : $@convention(c) (OSLog, OSLogType) -> Bool // user: %358
  %358 = struct_extract %357 : $Bool, #Bool._value // user: %359
  cond_br %358, bb35, bb34                        // id: %359

bb34:                                             // Preds: bb33
  strong_release %352 : $OSLog                    // id: %360
  br bb45                                         // id: %361

bb35:                                             // Preds: bb33
  %362 = integer_literal $Builtin.Int64, 12       // user: %367
  %363 = metatype $@thick UInt8.Type              // users: %370, %364
  %364 = builtin "strideof"<UInt8>(%363 : $@thick UInt8.Type) : $Builtin.Word // user: %365
  %365 = builtin "sextOrBitCast_Word_Int64"(%364 : $Builtin.Word) : $Builtin.Int64 // users: %434, %442, %455, %367
  %366 = integer_literal $Builtin.Int1, -1        // user: %367
  %367 = builtin "smul_with_overflow_Int64"(%365 : $Builtin.Int64, %362 : $Builtin.Int64, %366 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // users: %368, %379
  %368 = tuple_extract %367 : $(Builtin.Int64, Builtin.Int1), 1 // user: %369
  cond_fail %368 : $Builtin.Int1, "arithmetic overflow" // id: %369
  %370 = builtin "alignof"<UInt8>(%363 : $@thick UInt8.Type) : $Builtin.Word // users: %375, %371
  %371 = builtin "sextOrBitCast_Word_Int64"(%370 : $Builtin.Word) : $Builtin.Int64 // user: %373
  %372 = integer_literal $Builtin.Int64, 16       // users: %387, %373
  %373 = builtin "cmp_slt_Int64"(%372 : $Builtin.Int64, %371 : $Builtin.Int64) : $Builtin.Int1 // user: %374
  cond_br %373, bb36, bb37                        // id: %374

bb36:                                             // Preds: bb35
  br bb38(%370 : $Builtin.Word)                   // id: %375

bb37:                                             // Preds: bb35
  %376 = integer_literal $Builtin.Word, 0         // user: %377
  br bb38(%376 : $Builtin.Word)                   // id: %377

// %378                                           // user: %381
bb38(%378 : $Builtin.Word):                       // Preds: bb36 bb37
  %379 = tuple_extract %367 : $(Builtin.Int64, Builtin.Int1), 0 // user: %380
  %380 = builtin "truncOrBitCast_Int64_Word"(%379 : $Builtin.Int64) : $Builtin.Word // user: %381
  %381 = builtin "allocRaw"(%380 : $Builtin.Word, %378 : $Builtin.Word) : $Builtin.RawPointer // users: %408, %469, %450, %383
  %382 = integer_literal $Builtin.Word, 12        // user: %383
  bind_memory %381 : $Builtin.RawPointer, %382 : $Builtin.Word to $*UInt8 // id: %383
  %384 = metatype $@thick Any.Protocol            // users: %465, %385, %401
  %385 = builtin "alignof"<Any>(%384 : $@thick Any.Protocol) : $Builtin.Word // users: %473, %386
  %386 = builtin "sextOrBitCast_Word_Int64"(%385 : $Builtin.Word) : $Builtin.Int64 // user: %387
  %387 = builtin "cmp_slt_Int64"(%372 : $Builtin.Int64, %386 : $Builtin.Int64) : $Builtin.Int1 // user: %388
  cond_br %387, bb43, bb44                        // id: %388

// %389                                           // user: %402
bb39(%389 : $Builtin.Word):                       // Preds: bb43 bb44
  %390 = integer_literal $Builtin.Int8, 2         // user: %391
  %391 = struct $UInt8 (%390 : $Builtin.Int8)     // user: %409
  %392 = integer_literal $Builtin.Int8, 1         // user: %393
  %393 = struct $UInt8 (%392 : $Builtin.Int8)     // user: %411
  %394 = integer_literal $Builtin.Int8, 34        // user: %395
  %395 = struct $UInt8 (%394 : $Builtin.Int8)     // user: %413
  %396 = integer_literal $Builtin.Int8, 8         // user: %397
  %397 = struct $UInt8 (%396 : $Builtin.Int8)     // user: %415
  %398 = integer_literal $Builtin.Word, 3         // user: %414
  %399 = integer_literal $Builtin.Word, 1         // users: %465, %410, %403
  %400 = integer_literal $Builtin.Word, 2         // user: %412
  %401 = builtin "strideof"<Any>(%384 : $@thick Any.Protocol) : $Builtin.Word // user: %402
  %402 = builtin "allocRaw"(%401 : $Builtin.Word, %389 : $Builtin.Word) : $Builtin.RawPointer // users: %468, %465, %404, %403
  bind_memory %402 : $Builtin.RawPointer, %399 : $Builtin.Word to $*Any // id: %403
  %404 = struct $UnsafeMutablePointer<Any> (%402 : $Builtin.RawPointer) // user: %405
  %405 = enum $Optional<UnsafeMutablePointer<Any>>, #Optional.some!enumelt, %404 : $UnsafeMutablePointer<Any> // user: %407
  %406 = alloc_stack $Optional<UnsafeMutablePointer<Any>> // users: %423, %407, %471
  store %405 to %406 : $*Optional<UnsafeMutablePointer<Any>> // id: %407
  %408 = pointer_to_address %381 : $Builtin.RawPointer to [strict] $*UInt8 // users: %452, %414, %412, %410, %409
  store %391 to %408 : $*UInt8                    // id: %409
  %410 = index_addr %408 : $*UInt8, %399 : $Builtin.Word // user: %411
  store %393 to %410 : $*UInt8                    // id: %411
  %412 = index_addr %408 : $*UInt8, %400 : $Builtin.Word // user: %413
  store %395 to %412 : $*UInt8                    // id: %413
  %414 = index_addr %408 : $*UInt8, %398 : $Builtin.Word // user: %415
  store %397 to %414 : $*UInt8                    // id: %415
  debug_value_addr %3 : $*AudioObjectPropertyAddress, var, name "address", argno 1 // id: %416
  %417 = begin_access [read] [dynamic] [no_nested_conflict] %3 : $*AudioObjectPropertyAddress // users: %419, %418
  %418 = load %417 : $*AudioObjectPropertyAddress // user: %421
  end_access %417 : $*AudioObjectPropertyAddress  // id: %419
  // function_ref AudioObjectPropertyAddress.description.getter
  %420 = function_ref @$sSo26AudioObjectPropertyAddressV0A8ExplorerE11descriptionSSvg : $@convention(method) (AudioObjectPropertyAddress) -> @owned String // user: %421
  %421 = apply %420(%418) : $@convention(method) (AudioObjectPropertyAddress) -> @owned String // users: %426, %423
  // function_ref getNullTerminatedUTF8Pointer(_:using:)
  %422 = function_ref @$s2os28getNullTerminatedUTF8Pointer_5usingSVSS_SpyypGSgztF : $@convention(thin) (@guaranteed String, @inout Optional<UnsafeMutablePointer<Any>>) -> UnsafeRawPointer // user: %423
  %423 = apply %422(%421, %406) : $@convention(thin) (@guaranteed String, @inout Optional<UnsafeMutablePointer<Any>>) -> UnsafeRawPointer // user: %425
  %424 = alloc_stack $UnsafeRawPointer            // users: %459, %454, %425
  store %423 to %424 : $*UnsafeRawPointer         // id: %425
  release_value %421 : $String                    // id: %426
  %427 = metatype $@thick UnsafeRawPointer.Type   // user: %428
  %428 = builtin "sizeof"<UnsafeRawPointer>(%427 : $@thick UnsafeRawPointer.Type) : $Builtin.Word // user: %429
  %429 = builtin "sextOrBitCast_Word_Int64"(%428 : $Builtin.Word) : $Builtin.Int64 // users: %455, %438, %431
  %430 = integer_literal $Builtin.Int64, 0        // users: %456, %434, %431
  %431 = builtin "cmp_slt_Int64"(%429 : $Builtin.Int64, %430 : $Builtin.Int64) : $Builtin.Int1 // user: %432
  cond_fail %431 : $Builtin.Int1, "UnsafeRawBufferPointer with negative count" // id: %432
  %433 = integer_literal $Builtin.Int1, 0         // users: %458, %443, %435
  %434 = builtin "cmp_eq_Int64"(%365 : $Builtin.Int64, %430 : $Builtin.Int64) : $Builtin.Int1 // user: %435
  %435 = builtin "int_expect_Int1"(%434 : $Builtin.Int1, %433 : $Builtin.Int1) : $Builtin.Int1 // user: %436
  cond_fail %435 : $Builtin.Int1, "Division by zero" // id: %436
  %437 = integer_literal $Builtin.Int64, -9223372036854775808 // user: %438
  %438 = builtin "cmp_eq_Int64"(%429 : $Builtin.Int64, %437 : $Builtin.Int64) : $Builtin.Int1 // user: %439
  cond_br %438, bb41, bb40                        // id: %439

bb40:                                             // Preds: bb39
  br bb42                                         // id: %440

bb41:                                             // Preds: bb39
  %441 = integer_literal $Builtin.Int64, -1       // user: %442
  %442 = builtin "cmp_eq_Int64"(%365 : $Builtin.Int64, %441 : $Builtin.Int64) : $Builtin.Int1 // user: %443
  %443 = builtin "int_expect_Int1"(%442 : $Builtin.Int1, %433 : $Builtin.Int1) : $Builtin.Int1 // user: %444
  cond_fail %443 : $Builtin.Int1, "Division results in an overflow" // id: %444
  br bb42                                         // id: %445

bb42:                                             // Preds: bb40 bb41
  %446 = string_literal utf8 "property for address not available %{public}s" // user: %449
  %447 = integer_literal $Builtin.Int32, 12       // user: %448
  %448 = struct $UInt32 (%447 : $Builtin.Int32)   // user: %464
  %449 = struct $UnsafePointer<Int8> (%446 : $Builtin.RawPointer) // user: %464
  %450 = struct $UnsafeMutablePointer<UInt8> (%381 : $Builtin.RawPointer) // user: %464
  %451 = integer_literal $Builtin.Word, 4         // user: %452
  %452 = index_addr %408 : $*UInt8, %451 : $Builtin.Word // user: %453
  %453 = address_to_pointer %452 : $*UInt8 to $Builtin.RawPointer // user: %458
  %454 = address_to_pointer %424 : $*UnsafeRawPointer to $Builtin.RawPointer // user: %458
  %455 = builtin "sdiv_Int64"(%429 : $Builtin.Int64, %365 : $Builtin.Int64) : $Builtin.Int64 // users: %458, %456
  %456 = builtin "cmp_slt_Int64"(%455 : $Builtin.Int64, %430 : $Builtin.Int64) : $Builtin.Int1 // user: %457
  cond_fail %456 : $Builtin.Int1, "Negative value is not representable" // id: %457
  %458 = builtin "int_memmove_RawPointer_RawPointer_Int64"(%453 : $Builtin.RawPointer, %454 : $Builtin.RawPointer, %455 : $Builtin.Int64, %433 : $Builtin.Int1) : $()
  dealloc_stack %424 : $*UnsafeRawPointer         // id: %459
  %460 = global_addr @__dso_handle : $*Builtin.RawPointer // user: %461
  %461 = address_to_pointer %460 : $*Builtin.RawPointer to $Builtin.RawPointer // user: %462
  %462 = struct $UnsafeMutableRawPointer (%461 : $Builtin.RawPointer) // user: %464
  // function_ref _os_log_impl
  %463 = function_ref @_os_log_impl : $@convention(c) (UnsafeMutableRawPointer, OSLog, OSLogType, UnsafePointer<Int8>, UnsafeMutablePointer<UInt8>, UInt32) -> () // user: %464
  %464 = apply %463(%462, %352, %355, %449, %450, %448) : $@convention(c) (UnsafeMutableRawPointer, OSLog, OSLogType, UnsafePointer<Int8>, UnsafeMutablePointer<UInt8>, UInt32) -> ()
  %465 = builtin "destroyArray"<Any>(%384 : $@thick Any.Protocol, %402 : $Builtin.RawPointer, %399 : $Builtin.Word) : $()
  %466 = integer_literal $Builtin.Word, -1        // users: %469, %468
  %467 = integer_literal $Builtin.Word, 0         // users: %469, %468
  %468 = builtin "deallocRaw"(%402 : $Builtin.RawPointer, %466 : $Builtin.Word, %467 : $Builtin.Word) : $()
  %469 = builtin "deallocRaw"(%381 : $Builtin.RawPointer, %466 : $Builtin.Word, %467 : $Builtin.Word) : $()
  strong_release %352 : $OSLog                    // id: %470
  dealloc_stack %406 : $*Optional<UnsafeMutablePointer<Any>> // id: %471
  br bb45                                         // id: %472

bb43:                                             // Preds: bb38
  br bb39(%385 : $Builtin.Word)                   // id: %473

bb44:                                             // Preds: bb38
  %474 = integer_literal $Builtin.Word, 0         // user: %475
  br bb39(%474 : $Builtin.Word)                   // id: %475

bb45:                                             // Preds: bb34 bb42
  destroy_addr %349 : $*Logger                    // id: %476
  dealloc_stack %349 : $*Logger                   // id: %477
  inject_enum_addr %0 : $*Optional<Output>, #Optional.none!enumelt // id: %478
  br bb46                                         // id: %479

bb46:                                             // Preds: bb6 bb19 bb32 bb45
  dealloc_stack %3 : $*AudioObjectPropertyAddress // id: %480
  %481 = tuple ()                                 // user: %482
  return %481 : $()                               // id: %482
} // end sil function '$s13AudioExplorer21MutableDevicePropertyV12wrappedValueq_Sgvg'

// key path getter for MutableDeviceProperty.wrappedValue : <A, B>MutableDeviceProperty<A, B>
sil shared [thunk] @$s13AudioExplorer21MutableDevicePropertyV12wrappedValueq_Sgvpr0_lACyxq_GTK : $@convention(thin) <Base, Output> (@in_guaranteed MutableDeviceProperty<Base, Output>) -> @out Optional<Output> {
// %0                                             // user: %3
// %1                                             // user: %3
bb0(%0 : $*Optional<Output>, %1 : $*MutableDeviceProperty<Base, Output>):
  // function_ref MutableDeviceProperty.wrappedValue.getter
  %2 = function_ref @$s13AudioExplorer21MutableDevicePropertyV12wrappedValueq_Sgvg : $@convention(method) <τ_0_0, τ_0_1> (@in_guaranteed MutableDeviceProperty<τ_0_0, τ_0_1>) -> @out Optional<τ_0_1> // user: %3
  %3 = apply %2<Base, Output>(%0, %1) : $@convention(method) <τ_0_0, τ_0_1> (@in_guaranteed MutableDeviceProperty<τ_0_0, τ_0_1>) -> @out Optional<τ_0_1>
  %4 = tuple ()                                   // user: %5
  return %4 : $()                                 // id: %5
} // end sil function '$s13AudioExplorer21MutableDevicePropertyV12wrappedValueq_Sgvpr0_lACyxq_GTK'

// key path setter for MutableDeviceProperty.wrappedValue : <A, B>MutableDeviceProperty<A, B>
sil shared [thunk] @$s13AudioExplorer21MutableDevicePropertyV12wrappedValueq_Sgvpr0_lACyxq_GTk : $@convention(thin) <Base, Output> (@in_guaranteed Optional<Output>, @inout MutableDeviceProperty<Base, Output>) -> () {
// %0                                             // user: %3
// %1                                             // user: %5
bb0(%0 : $*Optional<Output>, %1 : $*MutableDeviceProperty<Base, Output>):
  %2 = alloc_stack $Optional<Output>, var, name "wrappedValue" // users: %6, %5, %3
  copy_addr %0 to [initialization] %2 : $*Optional<Output> // id: %3
  // function_ref MutableDeviceProperty.wrappedValue.setter
  %4 = function_ref @$s13AudioExplorer21MutableDevicePropertyV12wrappedValueq_Sgvs : $@convention(method) <τ_0_0, τ_0_1> (@in Optional<τ_0_1>, @inout MutableDeviceProperty<τ_0_0, τ_0_1>) -> () // user: %5
  %5 = apply %4<Base, Output>(%2, %1) : $@convention(method) <τ_0_0, τ_0_1> (@in Optional<τ_0_1>, @inout MutableDeviceProperty<τ_0_0, τ_0_1>) -> ()
  dealloc_stack %2 : $*Optional<Output>           // id: %6
  %7 = tuple ()                                   // user: %8
  return %7 : $()                                 // id: %8
} // end sil function '$s13AudioExplorer21MutableDevicePropertyV12wrappedValueq_Sgvpr0_lACyxq_GTk'

// MutableDeviceProperty.wrappedValue.setter
sil @$s13AudioExplorer21MutableDevicePropertyV12wrappedValueq_Sgvs : $@convention(method) <Base, Output> (@in Optional<Output>, @inout MutableDeviceProperty<Base, Output>) -> () {
// %0 "newValue"                                  // users: %76, %413, %280, %66, %75, %51, %2
// %1 "self"                                      // users: %414, %281, %71, %10, %5, %13, %3
bb0(%0 : $*Optional<Output>, %1 : $*MutableDeviceProperty<Base, Output>):
  debug_value_addr %0 : $*Optional<Output>, let, name "newValue", argno 1 // id: %2
  debug_value_addr %1 : $*MutableDeviceProperty<Base, Output>, var, name "self", argno 2 // id: %3
  %4 = alloc_stack $AudioObjectPropertyAddress, var, name "address" // users: %545, %15, %9, %213, %212, %350, %349, %483, %482
  %5 = struct_element_addr %1 : $*MutableDeviceProperty<Base, Output>, #MutableDeviceProperty.description // users: %47, %6
  %6 = load %5 : $*AudioDevicePropertyDescription<Base> // user: %8
  // function_ref AudioDevicePropertyDescription.address.getter
  %7 = function_ref @$s13AudioExplorer0A25DevicePropertyDescriptionV7addressSo0a6ObjectD7AddressVvg : $@convention(method) <τ_0_0> (AudioDevicePropertyDescription<τ_0_0>) -> AudioObjectPropertyAddress // user: %8
  %8 = apply %7<Base>(%6) : $@convention(method) <τ_0_0> (AudioDevicePropertyDescription<τ_0_0>) -> AudioObjectPropertyAddress // user: %9
  store %8 to %4 : $*AudioObjectPropertyAddress   // id: %9
  %10 = struct_element_addr %1 : $*MutableDeviceProperty<Base, Output>, #MutableDeviceProperty.providers // users: %52, %32, %25, %11
  %11 = struct_element_addr %10 : $*PropertyProviderFunctions, #PropertyProviderFunctions.hasCheck // user: %12
  %12 = load %11 : $*@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>) -> Bool // user: %17
  %13 = struct_element_addr %1 : $*MutableDeviceProperty<Base, Output>, #MutableDeviceProperty.id // users: %54, %27, %14
  %14 = load %13 : $*UInt32                       // user: %17
  %15 = address_to_pointer %4 : $*AudioObjectPropertyAddress to $Builtin.RawPointer // user: %16
  %16 = struct $UnsafePointer<AudioObjectPropertyAddress> (%15 : $Builtin.RawPointer) // users: %60, %30, %17
  %17 = apply %12(%14, %16) : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>) -> Bool // user: %18
  %18 = struct_extract %17 : $Bool, #Bool._value  // user: %19
  cond_br %18, bb1, bb41                          // id: %19

bb1:                                              // Preds: bb0
  %20 = alloc_stack $DarwinBoolean, var, name "isSettable" // users: %39, %24, %28, %69, %278, %411
  %21 = integer_literal $Builtin.Int8, 0          // user: %22
  %22 = struct $UInt8 (%21 : $Builtin.Int8)       // user: %23
  %23 = struct $DarwinBoolean (%22 : $UInt8)      // user: %24
  store %23 to %20 : $*DarwinBoolean              // id: %24
  %25 = struct_element_addr %10 : $*PropertyProviderFunctions, #PropertyProviderFunctions.isSettable // user: %26
  %26 = load %25 : $*@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UnsafeMutablePointer<DarwinBoolean>) -> Int32 // user: %30
  %27 = load %13 : $*UInt32                       // user: %30
  %28 = address_to_pointer %20 : $*DarwinBoolean to $Builtin.RawPointer // user: %29
  %29 = struct $UnsafeMutablePointer<DarwinBoolean> (%28 : $Builtin.RawPointer) // user: %30
  %30 = apply %26(%27, %16, %29) : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UnsafeMutablePointer<DarwinBoolean>) -> Int32 // users: %35, %31
  debug_value %30 : $Int32, let, name "isSettableStatus" // id: %31
  %32 = struct_element_addr %10 : $*PropertyProviderFunctions, #PropertyProviderFunctions.noErrorValue // user: %33
  %33 = struct_element_addr %32 : $*Int32, #Int32._value // users: %62, %34
  %34 = load %33 : $*Builtin.Int32                // user: %36
  %35 = struct_extract %30 : $Int32, #Int32._value // user: %36
  %36 = builtin "cmp_eq_Int32"(%35 : $Builtin.Int32, %34 : $Builtin.Int32) : $Builtin.Int1 // user: %37
  cond_br %36, bb3, bb2                           // id: %37

bb2:                                              // Preds: bb1
  br bb28                                         // id: %38

bb3:                                              // Preds: bb1
  %39 = struct_element_addr %20 : $*DarwinBoolean, #DarwinBoolean._value // user: %40
  %40 = struct_element_addr %39 : $*UInt8, #UInt8._value // user: %41
  %41 = load %40 : $*Builtin.Int8                 // user: %43
  %42 = integer_literal $Builtin.Int64, 0         // users: %181, %226, %248, %178, %200, %44
  %43 = builtin "zextOrBitCast_Int8_Int64"(%41 : $Builtin.Int8) : $Builtin.Int64 // user: %44
  %44 = builtin "cmp_eq_Int64"(%43 : $Builtin.Int64, %42 : $Builtin.Int64) : $Builtin.Int1 // user: %45
  cond_br %44, bb4, bb5                           // id: %45

bb4:                                              // Preds: bb3
  br bb28                                         // id: %46

bb5:                                              // Preds: bb3
  %47 = struct_element_addr %5 : $*AudioDevicePropertyDescription<Base>, #AudioDevicePropertyDescription.elementSize // user: %48
  %48 = load %47 : $*UInt32                       // users: %60, %49
  debug_value %48 : $UInt32, let, name "typeSize" // id: %49
  %50 = alloc_stack $Optional<Output>, var, name "newValueCopy" // users: %58, %68, %67, %277, %276, %51
  copy_addr %0 to [initialization] %50 : $*Optional<Output> // id: %51
  %52 = struct_element_addr %10 : $*PropertyProviderFunctions, #PropertyProviderFunctions.setData // user: %53
  %53 = load %52 : $*@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UInt32, UnsafeRawPointer) -> Int32 // user: %60
  %54 = load %13 : $*UInt32                       // user: %60
  %55 = integer_literal $Builtin.Int32, 0         // user: %56
  %56 = struct $UInt32 (%55 : $Builtin.Int32)     // user: %60
  %57 = enum $Optional<UnsafeRawPointer>, #Optional.none!enumelt // user: %60
  %58 = address_to_pointer %50 : $*Optional<Output> to $Builtin.RawPointer // user: %59
  %59 = struct $UnsafeRawPointer (%58 : $Builtin.RawPointer) // user: %60
  %60 = apply %53(%54, %16, %56, %57, %48, %59) : $@callee_guaranteed (UInt32, UnsafePointer<AudioObjectPropertyAddress>, UInt32, Optional<UnsafeRawPointer>, UInt32, UnsafeRawPointer) -> Int32 // users: %63, %61
  debug_value %60 : $Int32, let, name "didSet"    // id: %61
  %62 = load %33 : $*Builtin.Int32                // user: %64
  %63 = struct_extract %60 : $Int32, #Int32._value // user: %64
  %64 = builtin "cmp_eq_Int32"(%63 : $Builtin.Int32, %62 : $Builtin.Int32) : $Builtin.Int1 // user: %65
  cond_br %64, bb6, bb7                           // id: %65

bb6:                                              // Preds: bb5
  destroy_addr %0 : $*Optional<Output>            // id: %66
  destroy_addr %50 : $*Optional<Output>           // id: %67
  dealloc_stack %50 : $*Optional<Output>          // id: %68
  dealloc_stack %20 : $*DarwinBoolean             // id: %69
  br bb54                                         // id: %70

bb7:                                              // Preds: bb5
  %71 = struct_element_addr %1 : $*MutableDeviceProperty<Base, Output>, #MutableDeviceProperty.logger // user: %73
  %72 = alloc_stack $Logger                       // users: %78, %274, %275, %73
  copy_addr %71 to [initialization] %72 : $*Logger // id: %73
  %74 = alloc_stack $Optional<Output>             // users: %270, %155, %273, %153, %150, %75
  copy_addr %0 to [initialization] %74 : $*Optional<Output> // id: %75
  destroy_addr %0 : $*Optional<Output>            // id: %76
  // function_ref Logger.logObject.getter
  %77 = function_ref @$s2os6LoggerV9logObjectSo03OS_a1_C0Cvg : $@convention(method) (@in_guaranteed Logger) -> @owned OSLog // user: %78
  %78 = apply %77(%72) : $@convention(method) (@in_guaranteed Logger) -> @owned OSLog // users: %271, %264, %83, %256
  %79 = metatype $@thin OSLogType.Type            // user: %81
  // function_ref static os_log_type_t.error.getter
  %80 = function_ref @$sSo13os_log_type_ta0A0E5errorABvgZ : $@convention(method) (@thin OSLogType.Type) -> OSLogType // user: %81
  %81 = apply %80(%79) : $@convention(method) (@thin OSLogType.Type) -> OSLogType // users: %256, %83
  // function_ref os_log_type_enabled
  %82 = function_ref @os_log_type_enabled : $@convention(c) (OSLog, OSLogType) -> Bool // user: %83
  %83 = apply %82(%78, %81) : $@convention(c) (OSLog, OSLogType) -> Bool // user: %84
  %84 = struct_extract %83 : $Bool, #Bool._value  // user: %85
  cond_br %84, bb8, bb26                          // id: %85

bb8:                                              // Preds: bb7
  %86 = integer_literal $Builtin.Int64, 22        // user: %91
  %87 = metatype $@thick UInt8.Type               // users: %94, %88
  %88 = builtin "strideof"<UInt8>(%87 : $@thick UInt8.Type) : $Builtin.Word // user: %89
  %89 = builtin "sextOrBitCast_Word_Int64"(%88 : $Builtin.Word) : $Builtin.Int64 // users: %181, %189, %199, %234, %247, %91
  %90 = integer_literal $Builtin.Int1, -1         // users: %231, %172, %91
  %91 = builtin "smul_with_overflow_Int64"(%89 : $Builtin.Int64, %86 : $Builtin.Int64, %90 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // users: %92, %103
  %92 = tuple_extract %91 : $(Builtin.Int64, Builtin.Int1), 1 // user: %93
  cond_fail %92 : $Builtin.Int1, "arithmetic overflow" // id: %93
  %94 = builtin "alignof"<UInt8>(%87 : $@thick UInt8.Type) : $Builtin.Word // users: %99, %95
  %95 = builtin "sextOrBitCast_Word_Int64"(%94 : $Builtin.Word) : $Builtin.Int64 // user: %97
  %96 = integer_literal $Builtin.Int64, 16        // users: %124, %111, %97
  %97 = builtin "cmp_slt_Int64"(%96 : $Builtin.Int64, %95 : $Builtin.Int64) : $Builtin.Int1 // user: %98
  cond_br %97, bb9, bb10                          // id: %98

bb9:                                              // Preds: bb8
  br bb11(%94 : $Builtin.Word)                    // id: %99

bb10:                                             // Preds: bb8
  %100 = integer_literal $Builtin.Word, 0         // user: %101
  br bb11(%100 : $Builtin.Word)                   // id: %101

// %102                                           // user: %105
bb11(%102 : $Builtin.Word):                       // Preds: bb9 bb10
  %103 = tuple_extract %91 : $(Builtin.Int64, Builtin.Int1), 0 // user: %104
  %104 = builtin "truncOrBitCast_Int64_Word"(%103 : $Builtin.Int64) : $Builtin.Word // user: %105
  %105 = builtin "allocRaw"(%104 : $Builtin.Word, %102 : $Builtin.Word) : $Builtin.RawPointer // users: %142, %263, %242, %107
  %106 = integer_literal $Builtin.Word, 22        // user: %107
  bind_memory %105 : $Builtin.RawPointer, %106 : $Builtin.Word to $*UInt8 // id: %107
  %108 = metatype $@thick NSObject.Type           // users: %257, %166, %109, %118
  %109 = builtin "alignof"<NSObject>(%108 : $@thick NSObject.Type) : $Builtin.Word // users: %113, %110
  %110 = builtin "sextOrBitCast_Word_Int64"(%109 : $Builtin.Word) : $Builtin.Int64 // user: %111
  %111 = builtin "cmp_slt_Int64"(%96 : $Builtin.Int64, %110 : $Builtin.Int64) : $Builtin.Int1 // user: %112
  cond_br %111, bb12, bb13                        // id: %112

bb12:                                             // Preds: bb11
  br bb14(%109 : $Builtin.Word)                   // id: %113

bb13:                                             // Preds: bb11
  %114 = integer_literal $Builtin.Word, 0         // user: %115
  br bb14(%114 : $Builtin.Word)                   // id: %115

// %116                                           // user: %119
bb14(%116 : $Builtin.Word):                       // Preds: bb12 bb13
  %117 = integer_literal $Builtin.Word, 1         // users: %261, %257, %144, %137, %120
  %118 = builtin "strideof"<NSObject>(%108 : $@thick NSObject.Type) : $Builtin.Word // user: %119
  %119 = builtin "allocRaw"(%118 : $Builtin.Word, %116 : $Builtin.Word) : $Builtin.RawPointer // users: %206, %260, %257, %120
  bind_memory %119 : $Builtin.RawPointer, %117 : $Builtin.Word to $*NSObject // id: %120
  %121 = metatype $@thick Any.Protocol            // users: %261, %122, %135
  %122 = builtin "alignof"<Any>(%121 : $@thick Any.Protocol) : $Builtin.Word // users: %267, %123
  %123 = builtin "sextOrBitCast_Word_Int64"(%122 : $Builtin.Word) : $Builtin.Int64 // user: %124
  %124 = builtin "cmp_slt_Int64"(%96 : $Builtin.Int64, %123 : $Builtin.Int64) : $Builtin.Int1 // user: %125
  cond_br %124, bb24, bb25                        // id: %125

// %126                                           // user: %136
bb15(%126 : $Builtin.Word):                       // Preds: bb24 bb25
  %127 = integer_literal $Builtin.Int8, 2         // user: %128
  %128 = struct $UInt8 (%127 : $Builtin.Int8)     // users: %145, %143
  %129 = integer_literal $Builtin.Int8, 66        // user: %130
  %130 = struct $UInt8 (%129 : $Builtin.Int8)     // user: %147
  %131 = integer_literal $Builtin.Int8, 8         // user: %132
  %132 = struct $UInt8 (%131 : $Builtin.Int8)     // users: %211, %149
  %133 = integer_literal $Builtin.Word, 2         // user: %146
  %134 = integer_literal $Builtin.Word, 3         // user: %148
  %135 = builtin "strideof"<Any>(%121 : $@thick Any.Protocol) : $Builtin.Word // user: %136
  %136 = builtin "allocRaw"(%135 : $Builtin.Word, %126 : $Builtin.Word) : $Builtin.RawPointer // users: %262, %261, %138, %137
  bind_memory %136 : $Builtin.RawPointer, %117 : $Builtin.Word to $*Any // id: %137
  %138 = struct $UnsafeMutablePointer<Any> (%136 : $Builtin.RawPointer) // user: %139
  %139 = enum $Optional<UnsafeMutablePointer<Any>>, #Optional.some!enumelt, %138 : $UnsafeMutablePointer<Any> // user: %141
  %140 = alloc_stack $Optional<UnsafeMutablePointer<Any>> // users: %219, %141, %265
  store %139 to %140 : $*Optional<UnsafeMutablePointer<Any>> // id: %141
  %142 = pointer_to_address %105 : $Builtin.RawPointer to [strict] $*UInt8 // users: %244, %210, %205, %196, %148, %146, %144, %143
  store %128 to %142 : $*UInt8                    // id: %143
  %144 = index_addr %142 : $*UInt8, %117 : $Builtin.Word // user: %145
  store %128 to %144 : $*UInt8                    // id: %145
  %146 = index_addr %142 : $*UInt8, %133 : $Builtin.Word // user: %147
  store %130 to %146 : $*UInt8                    // id: %147
  %148 = index_addr %142 : $*UInt8, %134 : $Builtin.Word // user: %149
  store %132 to %148 : $*UInt8                    // id: %149
  debug_value_addr %74 : $*Optional<Output>, let, name "newValue", argno 1 // id: %150
  %151 = alloc_stack $Output                      // users: %163, %159, %157
  %152 = alloc_stack $Optional<Output>            // users: %154, %162, %156, %153
  copy_addr %74 to [initialization] %152 : $*Optional<Output> // id: %153
  switch_enum_addr %152 : $*Optional<Output>, case #Optional.some!enumelt: bb16, case #Optional.none!enumelt: bb21 // id: %154

bb16:                                             // Preds: bb15
  destroy_addr %74 : $*Optional<Output>           // id: %155
  %156 = unchecked_take_enum_data_addr %152 : $*Optional<Output>, #Optional.some!enumelt // user: %157
  copy_addr [take] %156 to [initialization] %151 : $*Output // id: %157
  %158 = alloc_stack $NSObject                    // users: %161, %160, %159
  unconditional_checked_cast_addr Output in %151 : $*Output to NSObject in %158 : $*NSObject // id: %159
  %160 = load %158 : $*NSObject                   // users: %164, %207
  dealloc_stack %158 : $*NSObject                 // id: %161
  dealloc_stack %152 : $*Optional<Output>         // id: %162
  dealloc_stack %151 : $*Output                   // id: %163
  %164 = ref_to_unmanaged %160 : $NSObject to $@sil_unmanaged NSObject // user: %165
  %165 = strong_copy_unmanaged_value %164 : $@sil_unmanaged NSObject // users: %175, %174
  %166 = builtin "sizeof"<NSObject>(%108 : $@thick NSObject.Type) : $Builtin.Word // user: %167
  %167 = builtin "sextOrBitCast_Word_Int64"(%166 : $Builtin.Word) : $Builtin.Int64 // user: %171
  %168 = metatype $@thick UnsafeMutableRawPointer.Type // user: %169
  %169 = builtin "sizeof"<UnsafeMutableRawPointer>(%168 : $@thick UnsafeMutableRawPointer.Type) : $Builtin.Word // user: %170
  %170 = builtin "sextOrBitCast_Word_Int64"(%169 : $Builtin.Word) : $Builtin.Int64 // users: %185, %199, %178, %171
  %171 = builtin "cmp_eq_Int64"(%167 : $Builtin.Int64, %170 : $Builtin.Int64) : $Builtin.Int1 // user: %172
  %172 = builtin "xor_Int1"(%171 : $Builtin.Int1, %90 : $Builtin.Int1) : $Builtin.Int1 // user: %173
  cond_fail %172 : $Builtin.Int1, "Can't unsafeBitCast between types of different sizes" // id: %173
  %174 = unchecked_trivial_bit_cast %165 : $NSObject to $UnsafeMutableRawPointer // user: %177
  strong_release %165 : $NSObject                 // id: %175
  %176 = alloc_stack $UnsafeMutableRawPointer     // users: %203, %198, %177
  store %174 to %176 : $*UnsafeMutableRawPointer  // id: %177
  %178 = builtin "cmp_slt_Int64"(%170 : $Builtin.Int64, %42 : $Builtin.Int64) : $Builtin.Int1 // user: %179
  cond_fail %178 : $Builtin.Int1, "UnsafeRawBufferPointer with negative count" // id: %179
  %180 = integer_literal $Builtin.Int1, 0         // users: %182, %190, %235, %250, %202
  %181 = builtin "cmp_eq_Int64"(%89 : $Builtin.Int64, %42 : $Builtin.Int64) : $Builtin.Int1 // user: %182
  %182 = builtin "int_expect_Int1"(%181 : $Builtin.Int1, %180 : $Builtin.Int1) : $Builtin.Int1 // user: %183
  cond_fail %182 : $Builtin.Int1, "Division by zero" // id: %183
  %184 = integer_literal $Builtin.Int64, -9223372036854775808 // users: %228, %185
  %185 = builtin "cmp_eq_Int64"(%170 : $Builtin.Int64, %184 : $Builtin.Int64) : $Builtin.Int1 // user: %186
  cond_br %185, bb18, bb17                        // id: %186

bb17:                                             // Preds: bb16
  br bb19                                         // id: %187

bb18:                                             // Preds: bb16
  %188 = integer_literal $Builtin.Int64, -1       // user: %189
  %189 = builtin "cmp_eq_Int64"(%89 : $Builtin.Int64, %188 : $Builtin.Int64) : $Builtin.Int1 // user: %190
  %190 = builtin "int_expect_Int1"(%189 : $Builtin.Int1, %180 : $Builtin.Int1) : $Builtin.Int1 // user: %191
  cond_fail %190 : $Builtin.Int1, "Division results in an overflow" // id: %191
  br bb19                                         // id: %192

bb19:                                             // Preds: bb17 bb18
  %193 = integer_literal $Builtin.Int8, 34        // user: %194
  %194 = struct $UInt8 (%193 : $Builtin.Int8)     // user: %208
  %195 = integer_literal $Builtin.Word, 4         // user: %196
  %196 = index_addr %142 : $*UInt8, %195 : $Builtin.Word // user: %197
  %197 = address_to_pointer %196 : $*UInt8 to $Builtin.RawPointer // user: %202
  %198 = address_to_pointer %176 : $*UnsafeMutableRawPointer to $Builtin.RawPointer // user: %202
  %199 = builtin "sdiv_Int64"(%170 : $Builtin.Int64, %89 : $Builtin.Int64) : $Builtin.Int64 // users: %202, %200
  %200 = builtin "cmp_slt_Int64"(%199 : $Builtin.Int64, %42 : $Builtin.Int64) : $Builtin.Int1 // user: %201
  cond_fail %200 : $Builtin.Int1, "Negative value is not representable" // id: %201
  %202 = builtin "int_memmove_RawPointer_RawPointer_Int64"(%197 : $Builtin.RawPointer, %198 : $Builtin.RawPointer, %199 : $Builtin.Int64, %180 : $Builtin.Int1) : $()
  dealloc_stack %176 : $*UnsafeMutableRawPointer  // id: %203
  %204 = integer_literal $Builtin.Word, 12        // user: %205
  %205 = index_addr %142 : $*UInt8, %204 : $Builtin.Word // user: %208
  %206 = pointer_to_address %119 : $Builtin.RawPointer to [strict] $*NSObject // user: %207
  store %160 to %206 : $*NSObject                 // id: %207
  store %194 to %205 : $*UInt8                    // id: %208
  %209 = integer_literal $Builtin.Word, 13        // user: %210
  %210 = index_addr %142 : $*UInt8, %209 : $Builtin.Word // user: %211
  store %132 to %210 : $*UInt8                    // id: %211
  debug_value_addr %4 : $*AudioObjectPropertyAddress, var, name "address", argno 1 // id: %212
  %213 = begin_access [read] [dynamic] [no_nested_conflict] %4 : $*AudioObjectPropertyAddress // users: %215, %214
  %214 = load %213 : $*AudioObjectPropertyAddress // user: %217
  end_access %213 : $*AudioObjectPropertyAddress  // id: %215
  // function_ref AudioObjectPropertyAddress.description.getter
  %216 = function_ref @$sSo26AudioObjectPropertyAddressV0A8ExplorerE11descriptionSSvg : $@convention(method) (AudioObjectPropertyAddress) -> @owned String // user: %217
  %217 = apply %216(%214) : $@convention(method) (AudioObjectPropertyAddress) -> @owned String // users: %222, %219
  // function_ref getNullTerminatedUTF8Pointer(_:using:)
  %218 = function_ref @$s2os28getNullTerminatedUTF8Pointer_5usingSVSS_SpyypGSgztF : $@convention(thin) (@guaranteed String, @inout Optional<UnsafeMutablePointer<Any>>) -> UnsafeRawPointer // user: %219
  %219 = apply %218(%217, %140) : $@convention(thin) (@guaranteed String, @inout Optional<UnsafeMutablePointer<Any>>) -> UnsafeRawPointer // user: %221
  %220 = alloc_stack $UnsafeRawPointer            // users: %251, %246, %221
  store %219 to %220 : $*UnsafeRawPointer         // id: %221
  release_value %217 : $String                    // id: %222
  %223 = metatype $@thick UnsafeRawPointer.Type   // user: %224
  %224 = builtin "sizeof"<UnsafeRawPointer>(%223 : $@thick UnsafeRawPointer.Type) : $Builtin.Word // user: %225
  %225 = builtin "sextOrBitCast_Word_Int64"(%224 : $Builtin.Word) : $Builtin.Int64 // users: %247, %228, %226
  %226 = builtin "cmp_slt_Int64"(%225 : $Builtin.Int64, %42 : $Builtin.Int64) : $Builtin.Int1 // user: %227
  cond_fail %226 : $Builtin.Int1, "UnsafeRawBufferPointer with negative count" // id: %227
  %228 = builtin "cmp_eq_Int64"(%225 : $Builtin.Int64, %184 : $Builtin.Int64) : $Builtin.Int1 // user: %229
  cond_br %228, bb22, bb20                        // id: %229

bb20:                                             // Preds: bb19
  br bb23                                         // id: %230

bb21:                                             // Preds: bb15
  cond_fail %90 : $Builtin.Int1, "Unexpectedly found nil while unwrapping an Optional value" // id: %231
  unreachable                                     // id: %232

bb22:                                             // Preds: bb19
  %233 = integer_literal $Builtin.Int64, -1       // user: %234
  %234 = builtin "cmp_eq_Int64"(%89 : $Builtin.Int64, %233 : $Builtin.Int64) : $Builtin.Int1 // user: %235
  %235 = builtin "int_expect_Int1"(%234 : $Builtin.Int1, %180 : $Builtin.Int1) : $Builtin.Int1 // user: %236
  cond_fail %235 : $Builtin.Int1, "Division results in an overflow" // id: %236
  br bb23                                         // id: %237

bb23:                                             // Preds: bb20 bb22
  %238 = string_literal utf8 "unable to set value %{public}@ for address %{public}s" // user: %241
  %239 = integer_literal $Builtin.Int32, 22       // user: %240
  %240 = struct $UInt32 (%239 : $Builtin.Int32)   // user: %256
  %241 = struct $UnsafePointer<Int8> (%238 : $Builtin.RawPointer) // user: %256
  %242 = struct $UnsafeMutablePointer<UInt8> (%105 : $Builtin.RawPointer) // user: %256
  %243 = integer_literal $Builtin.Word, 14        // user: %244
  %244 = index_addr %142 : $*UInt8, %243 : $Builtin.Word // user: %245
  %245 = address_to_pointer %244 : $*UInt8 to $Builtin.RawPointer // user: %250
  %246 = address_to_pointer %220 : $*UnsafeRawPointer to $Builtin.RawPointer // user: %250
  %247 = builtin "sdiv_Int64"(%225 : $Builtin.Int64, %89 : $Builtin.Int64) : $Builtin.Int64 // users: %250, %248
  %248 = builtin "cmp_slt_Int64"(%247 : $Builtin.Int64, %42 : $Builtin.Int64) : $Builtin.Int1 // user: %249
  cond_fail %248 : $Builtin.Int1, "Negative value is not representable" // id: %249
  %250 = builtin "int_memmove_RawPointer_RawPointer_Int64"(%245 : $Builtin.RawPointer, %246 : $Builtin.RawPointer, %247 : $Builtin.Int64, %180 : $Builtin.Int1) : $()
  dealloc_stack %220 : $*UnsafeRawPointer         // id: %251
  %252 = global_addr @__dso_handle : $*Builtin.RawPointer // user: %253
  %253 = address_to_pointer %252 : $*Builtin.RawPointer to $Builtin.RawPointer // user: %254
  %254 = struct $UnsafeMutableRawPointer (%253 : $Builtin.RawPointer) // user: %256
  // function_ref _os_log_impl
  %255 = function_ref @_os_log_impl : $@convention(c) (UnsafeMutableRawPointer, OSLog, OSLogType, UnsafePointer<Int8>, UnsafeMutablePointer<UInt8>, UInt32) -> () // user: %256
  %256 = apply %255(%254, %78, %81, %241, %242, %240) : $@convention(c) (UnsafeMutableRawPointer, OSLog, OSLogType, UnsafePointer<Int8>, UnsafeMutablePointer<UInt8>, UInt32) -> ()
  %257 = builtin "destroyArray"<NSObject>(%108 : $@thick NSObject.Type, %119 : $Builtin.RawPointer, %117 : $Builtin.Word) : $()
  %258 = integer_literal $Builtin.Word, -1        // users: %263, %262, %260
  %259 = integer_literal $Builtin.Word, 0         // users: %263, %262, %260
  %260 = builtin "deallocRaw"(%119 : $Builtin.RawPointer, %258 : $Builtin.Word, %259 : $Builtin.Word) : $()
  %261 = builtin "destroyArray"<Any>(%121 : $@thick Any.Protocol, %136 : $Builtin.RawPointer, %117 : $Builtin.Word) : $()
  %262 = builtin "deallocRaw"(%136 : $Builtin.RawPointer, %258 : $Builtin.Word, %259 : $Builtin.Word) : $()
  %263 = builtin "deallocRaw"(%105 : $Builtin.RawPointer, %258 : $Builtin.Word, %259 : $Builtin.Word) : $()
  strong_release %78 : $OSLog                     // id: %264
  dealloc_stack %140 : $*Optional<UnsafeMutablePointer<Any>> // id: %265
  br bb27                                         // id: %266

bb24:                                             // Preds: bb14
  br bb15(%122 : $Builtin.Word)                   // id: %267

bb25:                                             // Preds: bb14
  %268 = integer_literal $Builtin.Word, 0         // user: %269
  br bb15(%268 : $Builtin.Word)                   // id: %269

bb26:                                             // Preds: bb7
  destroy_addr %74 : $*Optional<Output>           // id: %270
  strong_release %78 : $OSLog                     // id: %271
  br bb27                                         // id: %272

bb27:                                             // Preds: bb26 bb23
  dealloc_stack %74 : $*Optional<Output>          // id: %273
  destroy_addr %72 : $*Logger                     // id: %274
  dealloc_stack %72 : $*Logger                    // id: %275
  destroy_addr %50 : $*Optional<Output>           // id: %276
  dealloc_stack %50 : $*Optional<Output>          // id: %277
  dealloc_stack %20 : $*DarwinBoolean             // id: %278
  br bb54                                         // id: %279

bb28:                                             // Preds: bb4 bb2
  destroy_addr %0 : $*Optional<Output>            // id: %280
  %281 = struct_element_addr %1 : $*MutableDeviceProperty<Base, Output>, #MutableDeviceProperty.logger // user: %283
  %282 = alloc_stack $Logger                      // users: %285, %409, %410, %283
  copy_addr %281 to [initialization] %282 : $*Logger // id: %283
  // function_ref Logger.logObject.getter
  %284 = function_ref @$s2os6LoggerV9logObjectSo03OS_a1_C0Cvg : $@convention(method) (@in_guaranteed Logger) -> @owned OSLog // user: %285
  %285 = apply %284(%282) : $@convention(method) (@in_guaranteed Logger) -> @owned OSLog // users: %293, %403, %290, %397
  %286 = metatype $@thin OSLogType.Type           // user: %288
  // function_ref static os_log_type_t.error.getter
  %287 = function_ref @$sSo13os_log_type_ta0A0E5errorABvgZ : $@convention(method) (@thin OSLogType.Type) -> OSLogType // user: %288
  %288 = apply %287(%286) : $@convention(method) (@thin OSLogType.Type) -> OSLogType // users: %397, %290
  // function_ref os_log_type_enabled
  %289 = function_ref @os_log_type_enabled : $@convention(c) (OSLog, OSLogType) -> Bool // user: %290
  %290 = apply %289(%285, %288) : $@convention(c) (OSLog, OSLogType) -> Bool // user: %291
  %291 = struct_extract %290 : $Bool, #Bool._value // user: %292
  cond_br %291, bb30, bb29                        // id: %292

bb29:                                             // Preds: bb28
  strong_release %285 : $OSLog                    // id: %293
  br bb40                                         // id: %294

bb30:                                             // Preds: bb28
  %295 = integer_literal $Builtin.Int64, 12       // user: %300
  %296 = metatype $@thick UInt8.Type              // users: %303, %297
  %297 = builtin "strideof"<UInt8>(%296 : $@thick UInt8.Type) : $Builtin.Word // user: %298
  %298 = builtin "sextOrBitCast_Word_Int64"(%297 : $Builtin.Word) : $Builtin.Int64 // users: %367, %375, %388, %300
  %299 = integer_literal $Builtin.Int1, -1        // user: %300
  %300 = builtin "smul_with_overflow_Int64"(%298 : $Builtin.Int64, %295 : $Builtin.Int64, %299 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // users: %301, %312
  %301 = tuple_extract %300 : $(Builtin.Int64, Builtin.Int1), 1 // user: %302
  cond_fail %301 : $Builtin.Int1, "arithmetic overflow" // id: %302
  %303 = builtin "alignof"<UInt8>(%296 : $@thick UInt8.Type) : $Builtin.Word // users: %308, %304
  %304 = builtin "sextOrBitCast_Word_Int64"(%303 : $Builtin.Word) : $Builtin.Int64 // user: %306
  %305 = integer_literal $Builtin.Int64, 16       // users: %320, %306
  %306 = builtin "cmp_slt_Int64"(%305 : $Builtin.Int64, %304 : $Builtin.Int64) : $Builtin.Int1 // user: %307
  cond_br %306, bb31, bb32                        // id: %307

bb31:                                             // Preds: bb30
  br bb33(%303 : $Builtin.Word)                   // id: %308

bb32:                                             // Preds: bb30
  %309 = integer_literal $Builtin.Word, 0         // user: %310
  br bb33(%309 : $Builtin.Word)                   // id: %310

// %311                                           // user: %314
bb33(%311 : $Builtin.Word):                       // Preds: bb31 bb32
  %312 = tuple_extract %300 : $(Builtin.Int64, Builtin.Int1), 0 // user: %313
  %313 = builtin "truncOrBitCast_Int64_Word"(%312 : $Builtin.Int64) : $Builtin.Word // user: %314
  %314 = builtin "allocRaw"(%313 : $Builtin.Word, %311 : $Builtin.Word) : $Builtin.RawPointer // users: %341, %402, %383, %316
  %315 = integer_literal $Builtin.Word, 12        // user: %316
  bind_memory %314 : $Builtin.RawPointer, %315 : $Builtin.Word to $*UInt8 // id: %316
  %317 = metatype $@thick Any.Protocol            // users: %398, %318, %334
  %318 = builtin "alignof"<Any>(%317 : $@thick Any.Protocol) : $Builtin.Word // users: %406, %319
  %319 = builtin "sextOrBitCast_Word_Int64"(%318 : $Builtin.Word) : $Builtin.Int64 // user: %320
  %320 = builtin "cmp_slt_Int64"(%305 : $Builtin.Int64, %319 : $Builtin.Int64) : $Builtin.Int1 // user: %321
  cond_br %320, bb38, bb39                        // id: %321

// %322                                           // user: %335
bb34(%322 : $Builtin.Word):                       // Preds: bb38 bb39
  %323 = integer_literal $Builtin.Int8, 2         // user: %324
  %324 = struct $UInt8 (%323 : $Builtin.Int8)     // user: %342
  %325 = integer_literal $Builtin.Int8, 1         // user: %326
  %326 = struct $UInt8 (%325 : $Builtin.Int8)     // user: %344
  %327 = integer_literal $Builtin.Int8, 34        // user: %328
  %328 = struct $UInt8 (%327 : $Builtin.Int8)     // user: %346
  %329 = integer_literal $Builtin.Int8, 8         // user: %330
  %330 = struct $UInt8 (%329 : $Builtin.Int8)     // user: %348
  %331 = integer_literal $Builtin.Word, 3         // user: %347
  %332 = integer_literal $Builtin.Word, 1         // users: %398, %343, %336
  %333 = integer_literal $Builtin.Word, 2         // user: %345
  %334 = builtin "strideof"<Any>(%317 : $@thick Any.Protocol) : $Builtin.Word // user: %335
  %335 = builtin "allocRaw"(%334 : $Builtin.Word, %322 : $Builtin.Word) : $Builtin.RawPointer // users: %401, %398, %337, %336
  bind_memory %335 : $Builtin.RawPointer, %332 : $Builtin.Word to $*Any // id: %336
  %337 = struct $UnsafeMutablePointer<Any> (%335 : $Builtin.RawPointer) // user: %338
  %338 = enum $Optional<UnsafeMutablePointer<Any>>, #Optional.some!enumelt, %337 : $UnsafeMutablePointer<Any> // user: %340
  %339 = alloc_stack $Optional<UnsafeMutablePointer<Any>> // users: %356, %340, %404
  store %338 to %339 : $*Optional<UnsafeMutablePointer<Any>> // id: %340
  %341 = pointer_to_address %314 : $Builtin.RawPointer to [strict] $*UInt8 // users: %385, %347, %345, %343, %342
  store %324 to %341 : $*UInt8                    // id: %342
  %343 = index_addr %341 : $*UInt8, %332 : $Builtin.Word // user: %344
  store %326 to %343 : $*UInt8                    // id: %344
  %345 = index_addr %341 : $*UInt8, %333 : $Builtin.Word // user: %346
  store %328 to %345 : $*UInt8                    // id: %346
  %347 = index_addr %341 : $*UInt8, %331 : $Builtin.Word // user: %348
  store %330 to %347 : $*UInt8                    // id: %348
  debug_value_addr %4 : $*AudioObjectPropertyAddress, var, name "address", argno 1 // id: %349
  %350 = begin_access [read] [dynamic] [no_nested_conflict] %4 : $*AudioObjectPropertyAddress // users: %352, %351
  %351 = load %350 : $*AudioObjectPropertyAddress // user: %354
  end_access %350 : $*AudioObjectPropertyAddress  // id: %352
  // function_ref AudioObjectPropertyAddress.description.getter
  %353 = function_ref @$sSo26AudioObjectPropertyAddressV0A8ExplorerE11descriptionSSvg : $@convention(method) (AudioObjectPropertyAddress) -> @owned String // user: %354
  %354 = apply %353(%351) : $@convention(method) (AudioObjectPropertyAddress) -> @owned String // users: %359, %356
  // function_ref getNullTerminatedUTF8Pointer(_:using:)
  %355 = function_ref @$s2os28getNullTerminatedUTF8Pointer_5usingSVSS_SpyypGSgztF : $@convention(thin) (@guaranteed String, @inout Optional<UnsafeMutablePointer<Any>>) -> UnsafeRawPointer // user: %356
  %356 = apply %355(%354, %339) : $@convention(thin) (@guaranteed String, @inout Optional<UnsafeMutablePointer<Any>>) -> UnsafeRawPointer // user: %358
  %357 = alloc_stack $UnsafeRawPointer            // users: %392, %387, %358
  store %356 to %357 : $*UnsafeRawPointer         // id: %358
  release_value %354 : $String                    // id: %359
  %360 = metatype $@thick UnsafeRawPointer.Type   // user: %361
  %361 = builtin "sizeof"<UnsafeRawPointer>(%360 : $@thick UnsafeRawPointer.Type) : $Builtin.Word // user: %362
  %362 = builtin "sextOrBitCast_Word_Int64"(%361 : $Builtin.Word) : $Builtin.Int64 // users: %388, %371, %364
  %363 = integer_literal $Builtin.Int64, 0        // users: %389, %367, %364
  %364 = builtin "cmp_slt_Int64"(%362 : $Builtin.Int64, %363 : $Builtin.Int64) : $Builtin.Int1 // user: %365
  cond_fail %364 : $Builtin.Int1, "UnsafeRawBufferPointer with negative count" // id: %365
  %366 = integer_literal $Builtin.Int1, 0         // users: %391, %376, %368
  %367 = builtin "cmp_eq_Int64"(%298 : $Builtin.Int64, %363 : $Builtin.Int64) : $Builtin.Int1 // user: %368
  %368 = builtin "int_expect_Int1"(%367 : $Builtin.Int1, %366 : $Builtin.Int1) : $Builtin.Int1 // user: %369
  cond_fail %368 : $Builtin.Int1, "Division by zero" // id: %369
  %370 = integer_literal $Builtin.Int64, -9223372036854775808 // user: %371
  %371 = builtin "cmp_eq_Int64"(%362 : $Builtin.Int64, %370 : $Builtin.Int64) : $Builtin.Int1 // user: %372
  cond_br %371, bb36, bb35                        // id: %372

bb35:                                             // Preds: bb34
  br bb37                                         // id: %373

bb36:                                             // Preds: bb34
  %374 = integer_literal $Builtin.Int64, -1       // user: %375
  %375 = builtin "cmp_eq_Int64"(%298 : $Builtin.Int64, %374 : $Builtin.Int64) : $Builtin.Int1 // user: %376
  %376 = builtin "int_expect_Int1"(%375 : $Builtin.Int1, %366 : $Builtin.Int1) : $Builtin.Int1 // user: %377
  cond_fail %376 : $Builtin.Int1, "Division results in an overflow" // id: %377
  br bb37                                         // id: %378

bb37:                                             // Preds: bb35 bb36
  %379 = string_literal utf8 "unable to set value for address %{public}s" // user: %382
  %380 = integer_literal $Builtin.Int32, 12       // user: %381
  %381 = struct $UInt32 (%380 : $Builtin.Int32)   // user: %397
  %382 = struct $UnsafePointer<Int8> (%379 : $Builtin.RawPointer) // user: %397
  %383 = struct $UnsafeMutablePointer<UInt8> (%314 : $Builtin.RawPointer) // user: %397
  %384 = integer_literal $Builtin.Word, 4         // user: %385
  %385 = index_addr %341 : $*UInt8, %384 : $Builtin.Word // user: %386
  %386 = address_to_pointer %385 : $*UInt8 to $Builtin.RawPointer // user: %391
  %387 = address_to_pointer %357 : $*UnsafeRawPointer to $Builtin.RawPointer // user: %391
  %388 = builtin "sdiv_Int64"(%362 : $Builtin.Int64, %298 : $Builtin.Int64) : $Builtin.Int64 // users: %391, %389
  %389 = builtin "cmp_slt_Int64"(%388 : $Builtin.Int64, %363 : $Builtin.Int64) : $Builtin.Int1 // user: %390
  cond_fail %389 : $Builtin.Int1, "Negative value is not representable" // id: %390
  %391 = builtin "int_memmove_RawPointer_RawPointer_Int64"(%386 : $Builtin.RawPointer, %387 : $Builtin.RawPointer, %388 : $Builtin.Int64, %366 : $Builtin.Int1) : $()
  dealloc_stack %357 : $*UnsafeRawPointer         // id: %392
  %393 = global_addr @__dso_handle : $*Builtin.RawPointer // user: %394
  %394 = address_to_pointer %393 : $*Builtin.RawPointer to $Builtin.RawPointer // user: %395
  %395 = struct $UnsafeMutableRawPointer (%394 : $Builtin.RawPointer) // user: %397
  // function_ref _os_log_impl
  %396 = function_ref @_os_log_impl : $@convention(c) (UnsafeMutableRawPointer, OSLog, OSLogType, UnsafePointer<Int8>, UnsafeMutablePointer<UInt8>, UInt32) -> () // user: %397
  %397 = apply %396(%395, %285, %288, %382, %383, %381) : $@convention(c) (UnsafeMutableRawPointer, OSLog, OSLogType, UnsafePointer<Int8>, UnsafeMutablePointer<UInt8>, UInt32) -> ()
  %398 = builtin "destroyArray"<Any>(%317 : $@thick Any.Protocol, %335 : $Builtin.RawPointer, %332 : $Builtin.Word) : $()
  %399 = integer_literal $Builtin.Word, -1        // users: %402, %401
  %400 = integer_literal $Builtin.Word, 0         // users: %402, %401
  %401 = builtin "deallocRaw"(%335 : $Builtin.RawPointer, %399 : $Builtin.Word, %400 : $Builtin.Word) : $()
  %402 = builtin "deallocRaw"(%314 : $Builtin.RawPointer, %399 : $Builtin.Word, %400 : $Builtin.Word) : $()
  strong_release %285 : $OSLog                    // id: %403
  dealloc_stack %339 : $*Optional<UnsafeMutablePointer<Any>> // id: %404
  br bb40                                         // id: %405

bb38:                                             // Preds: bb33
  br bb34(%318 : $Builtin.Word)                   // id: %406

bb39:                                             // Preds: bb33
  %407 = integer_literal $Builtin.Word, 0         // user: %408
  br bb34(%407 : $Builtin.Word)                   // id: %408

bb40:                                             // Preds: bb29 bb37
  destroy_addr %282 : $*Logger                    // id: %409
  dealloc_stack %282 : $*Logger                   // id: %410
  dealloc_stack %20 : $*DarwinBoolean             // id: %411
  br bb54                                         // id: %412

bb41:                                             // Preds: bb0
  destroy_addr %0 : $*Optional<Output>            // id: %413
  %414 = struct_element_addr %1 : $*MutableDeviceProperty<Base, Output>, #MutableDeviceProperty.logger // user: %416
  %415 = alloc_stack $Logger                      // users: %418, %542, %543, %416
  copy_addr %414 to [initialization] %415 : $*Logger // id: %416
  // function_ref Logger.logObject.getter
  %417 = function_ref @$s2os6LoggerV9logObjectSo03OS_a1_C0Cvg : $@convention(method) (@in_guaranteed Logger) -> @owned OSLog // user: %418
  %418 = apply %417(%415) : $@convention(method) (@in_guaranteed Logger) -> @owned OSLog // users: %426, %536, %423, %530
  %419 = metatype $@thin OSLogType.Type           // user: %421
  // function_ref static os_log_type_t.error.getter
  %420 = function_ref @$sSo13os_log_type_ta0A0E5errorABvgZ : $@convention(method) (@thin OSLogType.Type) -> OSLogType // user: %421
  %421 = apply %420(%419) : $@convention(method) (@thin OSLogType.Type) -> OSLogType // users: %530, %423
  // function_ref os_log_type_enabled
  %422 = function_ref @os_log_type_enabled : $@convention(c) (OSLog, OSLogType) -> Bool // user: %423
  %423 = apply %422(%418, %421) : $@convention(c) (OSLog, OSLogType) -> Bool // user: %424
  %424 = struct_extract %423 : $Bool, #Bool._value // user: %425
  cond_br %424, bb43, bb42                        // id: %425

bb42:                                             // Preds: bb41
  strong_release %418 : $OSLog                    // id: %426
  br bb53                                         // id: %427

bb43:                                             // Preds: bb41
  %428 = integer_literal $Builtin.Int64, 12       // user: %433
  %429 = metatype $@thick UInt8.Type              // users: %436, %430
  %430 = builtin "strideof"<UInt8>(%429 : $@thick UInt8.Type) : $Builtin.Word // user: %431
  %431 = builtin "sextOrBitCast_Word_Int64"(%430 : $Builtin.Word) : $Builtin.Int64 // users: %500, %508, %521, %433
  %432 = integer_literal $Builtin.Int1, -1        // user: %433
  %433 = builtin "smul_with_overflow_Int64"(%431 : $Builtin.Int64, %428 : $Builtin.Int64, %432 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // users: %434, %445
  %434 = tuple_extract %433 : $(Builtin.Int64, Builtin.Int1), 1 // user: %435
  cond_fail %434 : $Builtin.Int1, "arithmetic overflow" // id: %435
  %436 = builtin "alignof"<UInt8>(%429 : $@thick UInt8.Type) : $Builtin.Word // users: %441, %437
  %437 = builtin "sextOrBitCast_Word_Int64"(%436 : $Builtin.Word) : $Builtin.Int64 // user: %439
  %438 = integer_literal $Builtin.Int64, 16       // users: %453, %439
  %439 = builtin "cmp_slt_Int64"(%438 : $Builtin.Int64, %437 : $Builtin.Int64) : $Builtin.Int1 // user: %440
  cond_br %439, bb44, bb45                        // id: %440

bb44:                                             // Preds: bb43
  br bb46(%436 : $Builtin.Word)                   // id: %441

bb45:                                             // Preds: bb43
  %442 = integer_literal $Builtin.Word, 0         // user: %443
  br bb46(%442 : $Builtin.Word)                   // id: %443

// %444                                           // user: %447
bb46(%444 : $Builtin.Word):                       // Preds: bb44 bb45
  %445 = tuple_extract %433 : $(Builtin.Int64, Builtin.Int1), 0 // user: %446
  %446 = builtin "truncOrBitCast_Int64_Word"(%445 : $Builtin.Int64) : $Builtin.Word // user: %447
  %447 = builtin "allocRaw"(%446 : $Builtin.Word, %444 : $Builtin.Word) : $Builtin.RawPointer // users: %474, %535, %516, %449
  %448 = integer_literal $Builtin.Word, 12        // user: %449
  bind_memory %447 : $Builtin.RawPointer, %448 : $Builtin.Word to $*UInt8 // id: %449
  %450 = metatype $@thick Any.Protocol            // users: %531, %451, %467
  %451 = builtin "alignof"<Any>(%450 : $@thick Any.Protocol) : $Builtin.Word // users: %539, %452
  %452 = builtin "sextOrBitCast_Word_Int64"(%451 : $Builtin.Word) : $Builtin.Int64 // user: %453
  %453 = builtin "cmp_slt_Int64"(%438 : $Builtin.Int64, %452 : $Builtin.Int64) : $Builtin.Int1 // user: %454
  cond_br %453, bb51, bb52                        // id: %454

// %455                                           // user: %468
bb47(%455 : $Builtin.Word):                       // Preds: bb51 bb52
  %456 = integer_literal $Builtin.Int8, 2         // user: %457
  %457 = struct $UInt8 (%456 : $Builtin.Int8)     // user: %475
  %458 = integer_literal $Builtin.Int8, 1         // user: %459
  %459 = struct $UInt8 (%458 : $Builtin.Int8)     // user: %477
  %460 = integer_literal $Builtin.Int8, 34        // user: %461
  %461 = struct $UInt8 (%460 : $Builtin.Int8)     // user: %479
  %462 = integer_literal $Builtin.Int8, 8         // user: %463
  %463 = struct $UInt8 (%462 : $Builtin.Int8)     // user: %481
  %464 = integer_literal $Builtin.Word, 3         // user: %480
  %465 = integer_literal $Builtin.Word, 1         // users: %531, %476, %469
  %466 = integer_literal $Builtin.Word, 2         // user: %478
  %467 = builtin "strideof"<Any>(%450 : $@thick Any.Protocol) : $Builtin.Word // user: %468
  %468 = builtin "allocRaw"(%467 : $Builtin.Word, %455 : $Builtin.Word) : $Builtin.RawPointer // users: %534, %531, %470, %469
  bind_memory %468 : $Builtin.RawPointer, %465 : $Builtin.Word to $*Any // id: %469
  %470 = struct $UnsafeMutablePointer<Any> (%468 : $Builtin.RawPointer) // user: %471
  %471 = enum $Optional<UnsafeMutablePointer<Any>>, #Optional.some!enumelt, %470 : $UnsafeMutablePointer<Any> // user: %473
  %472 = alloc_stack $Optional<UnsafeMutablePointer<Any>> // users: %489, %473, %537
  store %471 to %472 : $*Optional<UnsafeMutablePointer<Any>> // id: %473
  %474 = pointer_to_address %447 : $Builtin.RawPointer to [strict] $*UInt8 // users: %518, %480, %478, %476, %475
  store %457 to %474 : $*UInt8                    // id: %475
  %476 = index_addr %474 : $*UInt8, %465 : $Builtin.Word // user: %477
  store %459 to %476 : $*UInt8                    // id: %477
  %478 = index_addr %474 : $*UInt8, %466 : $Builtin.Word // user: %479
  store %461 to %478 : $*UInt8                    // id: %479
  %480 = index_addr %474 : $*UInt8, %464 : $Builtin.Word // user: %481
  store %463 to %480 : $*UInt8                    // id: %481
  debug_value_addr %4 : $*AudioObjectPropertyAddress, var, name "address", argno 1 // id: %482
  %483 = begin_access [read] [dynamic] [no_nested_conflict] %4 : $*AudioObjectPropertyAddress // users: %485, %484
  %484 = load %483 : $*AudioObjectPropertyAddress // user: %487
  end_access %483 : $*AudioObjectPropertyAddress  // id: %485
  // function_ref AudioObjectPropertyAddress.description.getter
  %486 = function_ref @$sSo26AudioObjectPropertyAddressV0A8ExplorerE11descriptionSSvg : $@convention(method) (AudioObjectPropertyAddress) -> @owned String // user: %487
  %487 = apply %486(%484) : $@convention(method) (AudioObjectPropertyAddress) -> @owned String // users: %492, %489
  // function_ref getNullTerminatedUTF8Pointer(_:using:)
  %488 = function_ref @$s2os28getNullTerminatedUTF8Pointer_5usingSVSS_SpyypGSgztF : $@convention(thin) (@guaranteed String, @inout Optional<UnsafeMutablePointer<Any>>) -> UnsafeRawPointer // user: %489
  %489 = apply %488(%487, %472) : $@convention(thin) (@guaranteed String, @inout Optional<UnsafeMutablePointer<Any>>) -> UnsafeRawPointer // user: %491
  %490 = alloc_stack $UnsafeRawPointer            // users: %525, %520, %491
  store %489 to %490 : $*UnsafeRawPointer         // id: %491
  release_value %487 : $String                    // id: %492
  %493 = metatype $@thick UnsafeRawPointer.Type   // user: %494
  %494 = builtin "sizeof"<UnsafeRawPointer>(%493 : $@thick UnsafeRawPointer.Type) : $Builtin.Word // user: %495
  %495 = builtin "sextOrBitCast_Word_Int64"(%494 : $Builtin.Word) : $Builtin.Int64 // users: %521, %504, %497
  %496 = integer_literal $Builtin.Int64, 0        // users: %522, %500, %497
  %497 = builtin "cmp_slt_Int64"(%495 : $Builtin.Int64, %496 : $Builtin.Int64) : $Builtin.Int1 // user: %498
  cond_fail %497 : $Builtin.Int1, "UnsafeRawBufferPointer with negative count" // id: %498
  %499 = integer_literal $Builtin.Int1, 0         // users: %524, %509, %501
  %500 = builtin "cmp_eq_Int64"(%431 : $Builtin.Int64, %496 : $Builtin.Int64) : $Builtin.Int1 // user: %501
  %501 = builtin "int_expect_Int1"(%500 : $Builtin.Int1, %499 : $Builtin.Int1) : $Builtin.Int1 // user: %502
  cond_fail %501 : $Builtin.Int1, "Division by zero" // id: %502
  %503 = integer_literal $Builtin.Int64, -9223372036854775808 // user: %504
  %504 = builtin "cmp_eq_Int64"(%495 : $Builtin.Int64, %503 : $Builtin.Int64) : $Builtin.Int1 // user: %505
  cond_br %504, bb49, bb48                        // id: %505

bb48:                                             // Preds: bb47
  br bb50                                         // id: %506

bb49:                                             // Preds: bb47
  %507 = integer_literal $Builtin.Int64, -1       // user: %508
  %508 = builtin "cmp_eq_Int64"(%431 : $Builtin.Int64, %507 : $Builtin.Int64) : $Builtin.Int1 // user: %509
  %509 = builtin "int_expect_Int1"(%508 : $Builtin.Int1, %499 : $Builtin.Int1) : $Builtin.Int1 // user: %510
  cond_fail %509 : $Builtin.Int1, "Division results in an overflow" // id: %510
  br bb50                                         // id: %511

bb50:                                             // Preds: bb48 bb49
  %512 = string_literal utf8 "property for address not available %{public}s" // user: %515
  %513 = integer_literal $Builtin.Int32, 12       // user: %514
  %514 = struct $UInt32 (%513 : $Builtin.Int32)   // user: %530
  %515 = struct $UnsafePointer<Int8> (%512 : $Builtin.RawPointer) // user: %530
  %516 = struct $UnsafeMutablePointer<UInt8> (%447 : $Builtin.RawPointer) // user: %530
  %517 = integer_literal $Builtin.Word, 4         // user: %518
  %518 = index_addr %474 : $*UInt8, %517 : $Builtin.Word // user: %519
  %519 = address_to_pointer %518 : $*UInt8 to $Builtin.RawPointer // user: %524
  %520 = address_to_pointer %490 : $*UnsafeRawPointer to $Builtin.RawPointer // user: %524
  %521 = builtin "sdiv_Int64"(%495 : $Builtin.Int64, %431 : $Builtin.Int64) : $Builtin.Int64 // users: %524, %522
  %522 = builtin "cmp_slt_Int64"(%521 : $Builtin.Int64, %496 : $Builtin.Int64) : $Builtin.Int1 // user: %523
  cond_fail %522 : $Builtin.Int1, "Negative value is not representable" // id: %523
  %524 = builtin "int_memmove_RawPointer_RawPointer_Int64"(%519 : $Builtin.RawPointer, %520 : $Builtin.RawPointer, %521 : $Builtin.Int64, %499 : $Builtin.Int1) : $()
  dealloc_stack %490 : $*UnsafeRawPointer         // id: %525
  %526 = global_addr @__dso_handle : $*Builtin.RawPointer // user: %527
  %527 = address_to_pointer %526 : $*Builtin.RawPointer to $Builtin.RawPointer // user: %528
  %528 = struct $UnsafeMutableRawPointer (%527 : $Builtin.RawPointer) // user: %530
  // function_ref _os_log_impl
  %529 = function_ref @_os_log_impl : $@convention(c) (UnsafeMutableRawPointer, OSLog, OSLogType, UnsafePointer<Int8>, UnsafeMutablePointer<UInt8>, UInt32) -> () // user: %530
  %530 = apply %529(%528, %418, %421, %515, %516, %514) : $@convention(c) (UnsafeMutableRawPointer, OSLog, OSLogType, UnsafePointer<Int8>, UnsafeMutablePointer<UInt8>, UInt32) -> ()
  %531 = builtin "destroyArray"<Any>(%450 : $@thick Any.Protocol, %468 : $Builtin.RawPointer, %465 : $Builtin.Word) : $()
  %532 = integer_literal $Builtin.Word, -1        // users: %535, %534
  %533 = integer_literal $Builtin.Word, 0         // users: %535, %534
  %534 = builtin "deallocRaw"(%468 : $Builtin.RawPointer, %532 : $Builtin.Word, %533 : $Builtin.Word) : $()
  %535 = builtin "deallocRaw"(%447 : $Builtin.RawPointer, %532 : $Builtin.Word, %533 : $Builtin.Word) : $()
  strong_release %418 : $OSLog                    // id: %536
  dealloc_stack %472 : $*Optional<UnsafeMutablePointer<Any>> // id: %537
  br bb53                                         // id: %538

bb51:                                             // Preds: bb46
  br bb47(%451 : $Builtin.Word)                   // id: %539

bb52:                                             // Preds: bb46
  %540 = integer_literal $Builtin.Word, 0         // user: %541
  br bb47(%540 : $Builtin.Word)                   // id: %541

bb53:                                             // Preds: bb42 bb50
  destroy_addr %415 : $*Logger                    // id: %542
  dealloc_stack %415 : $*Logger                   // id: %543
  br bb54                                         // id: %544

bb54:                                             // Preds: bb6 bb27 bb40 bb53
  dealloc_stack %4 : $*AudioObjectPropertyAddress // id: %545
  %546 = tuple ()                                 // user: %547
  return %546 : $()                               // id: %547
} // end sil function '$s13AudioExplorer21MutableDevicePropertyV12wrappedValueq_Sgvs'

// OSLogInterpolation.appendInterpolation(_:privacy:)
sil public_external [available 11.0] [Onone] [_semantics "constant_evaluable"] [_semantics "oslog.requires_constant_arguments"] @$s2os18OSLogInterpolationV06appendC0_7privacyySo8NSObjectCyXA_AA0B7PrivacyVtF : $@convention(method) (@guaranteed @callee_guaranteed () -> @owned NSObject, @in_guaranteed OSLogPrivacy, @inout OSLogInterpolation) -> () {
// %0                                             // user: %51
// %1                                             // users: %48, %45, %23, %16
// %2                                             // users: %65, %53, %49, %48, %45, %18, %13, %3
bb0(%0 : $@callee_guaranteed () -> @owned NSObject, %1 : $*OSLogPrivacy, %2 : $*OSLogInterpolation):
  %3 = struct_element_addr %2 : $*OSLogInterpolation, #OSLogInterpolation.argumentCount // user: %4
  %4 = load %3 : $*UInt8                          // user: %7
  // function_ref maxOSLogArgumentCount.getter
  %5 = function_ref @$s2os21maxOSLogArgumentCounts5UInt8Vvg : $@convention(thin) () -> UInt8 // user: %6
  %6 = apply %5() : $@convention(thin) () -> UInt8 // user: %8
  %7 = struct_extract %4 : $UInt8, #UInt8._value  // user: %9
  %8 = struct_extract %6 : $UInt8, #UInt8._value  // user: %9
  %9 = builtin "cmp_ult_Int8"(%7 : $Builtin.Int8, %8 : $Builtin.Int8) : $Builtin.Int1 // user: %10
  cond_br %9, bb2, bb1                            // id: %10

bb1:                                              // Preds: bb0
  br bb9                                          // id: %11

bb2:                                              // Preds: bb0
  %12 = metatype $@thin String.Type               // user: %20
  %13 = load %2 : $*OSLogInterpolation            // users: %17, %16, %14
  retain_value %13 : $OSLogInterpolation          // id: %14
  // function_ref OSLogInterpolation.getNSObjectFormatSpecifier(_:)
  %15 = function_ref @$s2os18OSLogInterpolationV26getNSObjectFormatSpecifierySSAA0B7PrivacyVF : $@convention(method) (@in_guaranteed OSLogPrivacy, @guaranteed OSLogInterpolation) -> @owned String // user: %16
  %16 = apply %15(%1, %13) : $@convention(method) (@in_guaranteed OSLogPrivacy, @guaranteed OSLogInterpolation) -> @owned String // users: %21, %20
  release_value %13 : $OSLogInterpolation         // id: %17
  %18 = struct_element_addr %2 : $*OSLogInterpolation, #OSLogInterpolation.formatString // user: %20
  // function_ref static String.+= infix(_:_:)
  %19 = function_ref @$sSS2peoiyySSz_SStFZ : $@convention(method) (@inout String, @guaranteed String, @thin String.Type) -> () // user: %20
  %20 = apply %19(%18, %16, %12) : $@convention(method) (@inout String, @guaranteed String, @thin String.Type) -> ()
  release_value %16 : $String                     // id: %21
  %22 = alloc_stack $OSLogPrivacy                 // users: %41, %39, %24, %23
  copy_addr %1 to [initialization] %22 : $*OSLogPrivacy // id: %23
  %24 = struct_element_addr %22 : $*OSLogPrivacy, #OSLogPrivacy.mask // user: %26
  %25 = alloc_stack $OSLogPrivacy.Mask            // users: %34, %33, %29, %28, %27, %26
  copy_addr %24 to [initialization] %25 : $*OSLogPrivacy.Mask // id: %26
  switch_enum_addr %25 : $*OSLogPrivacy.Mask, case #OSLogPrivacy.Mask.hash!enumelt: bb4, default bb3 // id: %27

bb3:                                              // Preds: bb2
  destroy_addr %25 : $*OSLogPrivacy.Mask          // id: %28
  dealloc_stack %25 : $*OSLogPrivacy.Mask         // id: %29
  %30 = integer_literal $Builtin.Int1, 0          // user: %31
  %31 = struct $Bool (%30 : $Builtin.Int1)        // user: %32
  br bb5(%31 : $Bool)                             // id: %32

bb4:                                              // Preds: bb2
  destroy_addr %25 : $*OSLogPrivacy.Mask          // id: %33
  dealloc_stack %25 : $*OSLogPrivacy.Mask         // id: %34
  %35 = integer_literal $Builtin.Int1, -1         // user: %36
  %36 = struct $Bool (%35 : $Builtin.Int1)        // user: %37
  br bb5(%36 : $Bool)                             // id: %37

// %38                                            // user: %40
bb5(%38 : $Bool):                                 // Preds: bb4 bb3
  destroy_addr %22 : $*OSLogPrivacy               // id: %39
  %40 = struct_extract %38 : $Bool, #Bool._value  // user: %42
  dealloc_stack %22 : $*OSLogPrivacy              // id: %41
  cond_br %40, bb7, bb6                           // id: %42

bb6:                                              // Preds: bb5
  br bb8                                          // id: %43

bb7:                                              // Preds: bb5
  // function_ref OSLogInterpolation.appendMaskArgument(_:)
  %44 = function_ref @$s2os18OSLogInterpolationV18appendMaskArgumentyyAA0B7PrivacyVF : $@convention(method) (@in_guaranteed OSLogPrivacy, @inout OSLogInterpolation) -> () // user: %45
  %45 = apply %44(%1, %2) : $@convention(method) (@in_guaranteed OSLogPrivacy, @inout OSLogInterpolation) -> ()
  br bb8                                          // id: %46

bb8:                                              // Preds: bb7 bb6
  // function_ref OSLogInterpolation.addNSObjectHeaders(_:)
  %47 = function_ref @$s2os18OSLogInterpolationV18addNSObjectHeadersyyAA0B7PrivacyVF : $@convention(method) (@in_guaranteed OSLogPrivacy, @inout OSLogInterpolation) -> () // user: %48
  %48 = apply %47(%1, %2) : $@convention(method) (@in_guaranteed OSLogPrivacy, @inout OSLogInterpolation) -> ()
  %49 = struct_element_addr %2 : $*OSLogInterpolation, #OSLogInterpolation.arguments // user: %51
  // function_ref OSLogArguments.append(_:)
  %50 = function_ref @$s2os14OSLogArgumentsV6appendyySo8NSObjectCycF : $@convention(method) (@guaranteed @callee_guaranteed () -> @owned NSObject, @inout OSLogArguments) -> () // user: %51
  %51 = apply %50(%0, %49) : $@convention(method) (@guaranteed @callee_guaranteed () -> @owned NSObject, @inout OSLogArguments) -> ()
  %52 = integer_literal $Builtin.Int8, 1          // user: %57
  %53 = struct_element_addr %2 : $*OSLogInterpolation, #OSLogInterpolation.argumentCount // users: %62, %54
  %54 = struct_element_addr %53 : $*UInt8, #UInt8._value // user: %55
  %55 = load %54 : $*Builtin.Int8                 // user: %57
  %56 = integer_literal $Builtin.Int1, -1         // user: %57
  %57 = builtin "uadd_with_overflow_Int8"(%55 : $Builtin.Int8, %52 : $Builtin.Int8, %56 : $Builtin.Int1) : $(Builtin.Int8, Builtin.Int1) // users: %59, %58
  %58 = tuple_extract %57 : $(Builtin.Int8, Builtin.Int1), 0 // user: %61
  %59 = tuple_extract %57 : $(Builtin.Int8, Builtin.Int1), 1 // user: %60
  cond_fail %59 : $Builtin.Int1, "arithmetic overflow" // id: %60
  %61 = struct $UInt8 (%58 : $Builtin.Int8)       // user: %62
  store %61 to %53 : $*UInt8                      // id: %62
  %63 = tuple ()
  %64 = integer_literal $Builtin.Int64, 1         // user: %69
  %65 = struct_element_addr %2 : $*OSLogInterpolation, #OSLogInterpolation.objectArgumentCount // users: %74, %66
  %66 = struct_element_addr %65 : $*Int, #Int._value // user: %67
  %67 = load %66 : $*Builtin.Int64                // user: %69
  %68 = integer_literal $Builtin.Int1, -1         // user: %69
  %69 = builtin "sadd_with_overflow_Int64"(%67 : $Builtin.Int64, %64 : $Builtin.Int64, %68 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // users: %71, %70
  %70 = tuple_extract %69 : $(Builtin.Int64, Builtin.Int1), 0 // user: %73
  %71 = tuple_extract %69 : $(Builtin.Int64, Builtin.Int1), 1 // user: %72
  cond_fail %71 : $Builtin.Int1, "arithmetic overflow" // id: %72
  %73 = struct $Int (%70 : $Builtin.Int64)        // user: %74
  store %73 to %65 : $*Int                        // id: %74
  %75 = tuple ()
  br bb9                                          // id: %76

bb9:                                              // Preds: bb8 bb1
  %77 = tuple ()                                  // user: %78
  return %77 : $()                                // id: %78
} // end sil function '$s2os18OSLogInterpolationV06appendC0_7privacyySo8NSObjectCyXA_AA0B7PrivacyVtF'

// MutableDeviceProperty.wrappedValue.modify
sil [transparent] @$s13AudioExplorer21MutableDevicePropertyV12wrappedValueq_SgvM : $@yield_once @convention(method) <Base, Output> (@inout MutableDeviceProperty<Base, Output>) -> @yields @inout Optional<Output> {
// %0 "self"                                      // users: %4, %14, %7, %1
bb0(%0 : $*MutableDeviceProperty<Base, Output>):
  debug_value_addr %0 : $*MutableDeviceProperty<Base, Output>, var, name "self", argno 1 // id: %1
  %2 = alloc_stack $Optional<Output>              // users: %8, %7, %16, %12, %5, %4
  // function_ref MutableDeviceProperty.wrappedValue.getter
  %3 = function_ref @$s13AudioExplorer21MutableDevicePropertyV12wrappedValueq_Sgvg : $@convention(method) <τ_0_0, τ_0_1> (@in_guaranteed MutableDeviceProperty<τ_0_0, τ_0_1>) -> @out Optional<τ_0_1> // user: %4
  %4 = apply %3<Base, Output>(%2, %0) : $@convention(method) <τ_0_0, τ_0_1> (@in_guaranteed MutableDeviceProperty<τ_0_0, τ_0_1>) -> @out Optional<τ_0_1>
  yield %2 : $*Optional<Output>, resume bb1, unwind bb2 // id: %5

bb1:                                              // Preds: bb0
  // function_ref MutableDeviceProperty.wrappedValue.setter
  %6 = function_ref @$s13AudioExplorer21MutableDevicePropertyV12wrappedValueq_Sgvs : $@convention(method) <τ_0_0, τ_0_1> (@in Optional<τ_0_1>, @inout MutableDeviceProperty<τ_0_0, τ_0_1>) -> () // user: %7
  %7 = apply %6<Base, Output>(%2, %0) : $@convention(method) <τ_0_0, τ_0_1> (@in Optional<τ_0_1>, @inout MutableDeviceProperty<τ_0_0, τ_0_1>) -> ()
  dealloc_stack %2 : $*Optional<Output>           // id: %8
  %9 = tuple ()                                   // user: %10
  return %9 : $()                                 // id: %10

bb2:                                              // Preds: bb0
  %11 = alloc_stack $Optional<Output>             // users: %15, %14, %12
  copy_addr [take] %2 to [initialization] %11 : $*Optional<Output> // id: %12
  // function_ref MutableDeviceProperty.wrappedValue.setter
  %13 = function_ref @$s13AudioExplorer21MutableDevicePropertyV12wrappedValueq_Sgvs : $@convention(method) <τ_0_0, τ_0_1> (@in Optional<τ_0_1>, @inout MutableDeviceProperty<τ_0_0, τ_0_1>) -> () // user: %14
  %14 = apply %13<Base, Output>(%11, %0) : $@convention(method) <τ_0_0, τ_0_1> (@in Optional<τ_0_1>, @inout MutableDeviceProperty<τ_0_0, τ_0_1>) -> ()
  dealloc_stack %11 : $*Optional<Output>          // id: %15
  dealloc_stack %2 : $*Optional<Output>           // id: %16
  unwind                                          // id: %17
} // end sil function '$s13AudioExplorer21MutableDevicePropertyV12wrappedValueq_SgvM'

// Logger.logObject.getter
sil [available 11.0] @$s2os6LoggerV9logObjectSo03OS_a1_C0Cvg : $@convention(method) (@in_guaranteed Logger) -> @owned OSLog

// static os_log_type_t.error.getter
sil [available 10.12] @$sSo13os_log_type_ta0A0E5errorABvgZ : $@convention(method) (@thin OSLogType.Type) -> OSLogType

// OSLogMessage.bufferSize.getter
sil public_external [available 11.0] [Onone] [_semantics "constant_evaluable"] @$s2os12OSLogMessageV10bufferSizeSivg : $@convention(method) (@guaranteed OSLogMessage) -> Int {
// %0                                             // user: %1
bb0(%0 : $OSLogMessage):
  %1 = struct_extract %0 : $OSLogMessage, #OSLogMessage.interpolation // user: %2
  %2 = struct_extract %1 : $OSLogInterpolation, #OSLogInterpolation.totalBytesForSerializingArguments // user: %4
  %3 = integer_literal $Builtin.Int64, 2          // user: %6
  %4 = struct_extract %2 : $Int, #Int._value      // user: %6
  %5 = integer_literal $Builtin.Int1, -1          // user: %6
  %6 = builtin "sadd_with_overflow_Int64"(%4 : $Builtin.Int64, %3 : $Builtin.Int64, %5 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // users: %8, %7
  %7 = tuple_extract %6 : $(Builtin.Int64, Builtin.Int1), 0 // user: %10
  %8 = tuple_extract %6 : $(Builtin.Int64, Builtin.Int1), 1 // user: %9
  cond_fail %8 : $Builtin.Int1, "arithmetic overflow" // id: %9
  %10 = struct $Int (%7 : $Builtin.Int64)         // user: %11
  return %10 : $Int                               // id: %11
} // end sil function '$s2os12OSLogMessageV10bufferSizeSivg'

// UnsignedInteger<>.init<A>(_:)
sil public_external [always_inline] [_semantics "optimize.sil.specialize.generic.partial.never"] @$sSUss17FixedWidthIntegerRzrlEyxqd__cSzRd__lufC : $@convention(method) <Self where Self : FixedWidthInteger, Self : UnsignedInteger><T where T : BinaryInteger> (@in T, @thick Self.Type) -> @out Self {
// %0                                             // user: %202
// %1                                             // users: %202, %42, %32, %10
// %2                                             // user: %202
bb0(%0 : $*Self, %1 : $*T, %2 : $@thick Self.Type):
  %3 = metatype $@thick T.Type                    // users: %178, %176, %164, %161, %132, %130, %89, %87, %72, %20, %18, %5
  %4 = witness_method $T, #BinaryInteger.isSigned!getter : <Self where Self : BinaryInteger> (Self.Type) -> () -> Bool : $@convention(witness_method: BinaryInteger) <τ_0_0 where τ_0_0 : BinaryInteger> (@thick τ_0_0.Type) -> Bool // users: %72, %5
  %5 = apply %4<T>(%3) : $@convention(witness_method: BinaryInteger) <τ_0_0 where τ_0_0 : BinaryInteger> (@thick τ_0_0.Type) -> Bool // user: %6
  %6 = struct_extract %5 : $Bool, #Bool._value    // user: %7
  cond_br %6, bb2, bb1                            // id: %7

bb1:                                              // Preds: bb0
  br bb3                                          // id: %8

bb2:                                              // Preds: bb0
  %9 = alloc_stack $T                             // users: %29, %28, %20, %10
  copy_addr %1 to [initialization] %9 : $*T       // id: %10
  %11 = integer_literal $Builtin.IntLiteral, 0    // user: %15
  %12 = metatype $@thick T.IntegerLiteralType.Type // user: %15
  %13 = alloc_stack $T.IntegerLiteralType         // users: %23, %18, %15
  %14 = witness_method $T.IntegerLiteralType, #_ExpressibleByBuiltinIntegerLiteral.init!allocator : <Self where Self : _ExpressibleByBuiltinIntegerLiteral> (Self.Type) -> (Builtin.IntLiteral) -> Self : $@convention(witness_method: _ExpressibleByBuiltinIntegerLiteral) <τ_0_0 where τ_0_0 : _ExpressibleByBuiltinIntegerLiteral> (Builtin.IntLiteral, @thick τ_0_0.Type) -> @out τ_0_0 // user: %15
  %15 = apply %14<T.IntegerLiteralType>(%13, %11, %12) : $@convention(witness_method: _ExpressibleByBuiltinIntegerLiteral) <τ_0_0 where τ_0_0 : _ExpressibleByBuiltinIntegerLiteral> (Builtin.IntLiteral, @thick τ_0_0.Type) -> @out τ_0_0
  %16 = alloc_stack $T                            // users: %22, %21, %20, %18
  %17 = witness_method $T, #ExpressibleByIntegerLiteral.init!allocator : <Self where Self : ExpressibleByIntegerLiteral> (Self.Type) -> (Self.IntegerLiteralType) -> Self : $@convention(witness_method: ExpressibleByIntegerLiteral) <τ_0_0 where τ_0_0 : ExpressibleByIntegerLiteral> (@in τ_0_0.IntegerLiteralType, @thick τ_0_0.Type) -> @out τ_0_0 // user: %18
  %18 = apply %17<T>(%16, %13, %3) : $@convention(witness_method: ExpressibleByIntegerLiteral) <τ_0_0 where τ_0_0 : ExpressibleByIntegerLiteral> (@in τ_0_0.IntegerLiteralType, @thick τ_0_0.Type) -> @out τ_0_0
  %19 = witness_method $T, #Comparable.">=" : <Self where Self : Comparable> (Self.Type) -> (Self, Self) -> Bool : $@convention(witness_method: Comparable) <τ_0_0 where τ_0_0 : Comparable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // user: %20
  %20 = apply %19<T>(%9, %16, %3) : $@convention(witness_method: Comparable) <τ_0_0 where τ_0_0 : Comparable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // user: %24
  destroy_addr %16 : $*T                          // id: %21
  dealloc_stack %16 : $*T                         // id: %22
  dealloc_stack %13 : $*T.IntegerLiteralType      // id: %23
  %24 = struct_extract %20 : $Bool, #Bool._value  // user: %26
  %25 = integer_literal $Builtin.Int1, -1         // user: %26
  %26 = builtin "xor_Int1"(%24 : $Builtin.Int1, %25 : $Builtin.Int1) : $Builtin.Int1 // user: %27
  cond_fail %26 : $Builtin.Int1, "Negative value is not representable" // id: %27
  destroy_addr %9 : $*T                           // id: %28
  dealloc_stack %9 : $*T                          // id: %29
  br bb3                                          // id: %30

bb3:                                              // Preds: bb1 bb2
  %31 = witness_method $T, #BinaryInteger.bitWidth!getter : <Self where Self : BinaryInteger> (Self) -> () -> Int : $@convention(witness_method: BinaryInteger) <τ_0_0 where τ_0_0 : BinaryInteger> (@in_guaranteed τ_0_0) -> Int // user: %32
  %32 = apply %31<T>(%1) : $@convention(witness_method: BinaryInteger) <τ_0_0 where τ_0_0 : BinaryInteger> (@in_guaranteed τ_0_0) -> Int // user: %36
  %33 = metatype $@thick Self.Type                // users: %185, %153, %151, %146, %113, %111, %64, %62, %47, %45, %35
  %34 = witness_method $Self, #FixedWidthInteger.bitWidth!getter : <Self where Self : FixedWidthInteger> (Self.Type) -> () -> Int : $@convention(witness_method: FixedWidthInteger) <τ_0_0 where τ_0_0 : FixedWidthInteger> (@thick τ_0_0.Type) -> Int // user: %35
  %35 = apply %34<Self>(%33) : $@convention(witness_method: FixedWidthInteger) <τ_0_0 where τ_0_0 : FixedWidthInteger> (@thick τ_0_0.Type) -> Int // user: %37
  %36 = struct_extract %32 : $Int, #Int._value    // user: %38
  %37 = struct_extract %35 : $Int, #Int._value    // user: %38
  %38 = builtin "cmp_slt_Int64"(%36 : $Builtin.Int64, %37 : $Builtin.Int64) : $Builtin.Int1 // user: %39
  cond_br %38, bb4, bb5                           // id: %39

bb4:                                              // Preds: bb3
  br bb25                                         // id: %40

bb5:                                              // Preds: bb3
  %41 = alloc_stack $T                            // users: %101, %190, %184, %199, %179, %178, %164, %144, %118, %74, %42
  copy_addr %1 to [initialization] %41 : $*T      // id: %42
  %43 = alloc_stack $Self                         // users: %102, %191, %197, %186, %185, %176, %113, %49, %45
  %44 = witness_method $Self, #FixedWidthInteger.max!getter : <Self where Self : FixedWidthInteger> (Self.Type) -> () -> Self : $@convention(witness_method: FixedWidthInteger) <τ_0_0 where τ_0_0 : FixedWidthInteger> (@thick τ_0_0.Type) -> @out τ_0_0 // user: %45
  %45 = apply %44<Self>(%43, %33) : $@convention(witness_method: FixedWidthInteger) <τ_0_0 where τ_0_0 : FixedWidthInteger> (@thick τ_0_0.Type) -> @out τ_0_0
  %46 = witness_method $Self, #BinaryInteger.isSigned!getter : <Self where Self : BinaryInteger> (Self.Type) -> () -> Bool : $@convention(witness_method: BinaryInteger) <τ_0_0 where τ_0_0 : BinaryInteger> (@thick τ_0_0.Type) -> Bool // user: %47
  %47 = apply %46<Self>(%33) : $@convention(witness_method: BinaryInteger) <τ_0_0 where τ_0_0 : BinaryInteger> (@thick τ_0_0.Type) -> Bool // user: %50
  %48 = alloc_stack $Self                         // users: %71, %70, %64, %49
  copy_addr %43 to [initialization] %48 : $*Self  // id: %49
  %50 = struct_extract %47 : $Bool, #Bool._value  // user: %51
  cond_br %50, bb7, bb6                           // id: %51

bb6:                                              // Preds: bb5
  %52 = integer_literal $Builtin.Int1, 0          // user: %53
  %53 = struct $Bool (%52 : $Builtin.Int1)        // user: %54
  br bb8(%53 : $Bool)                             // id: %54

bb7:                                              // Preds: bb5
  %55 = integer_literal $Builtin.IntLiteral, 0    // user: %59
  %56 = metatype $@thick Self.IntegerLiteralType.Type // user: %59
  %57 = alloc_stack $Self.IntegerLiteralType      // users: %67, %62, %59
  %58 = witness_method $Self.IntegerLiteralType, #_ExpressibleByBuiltinIntegerLiteral.init!allocator : <Self where Self : _ExpressibleByBuiltinIntegerLiteral> (Self.Type) -> (Builtin.IntLiteral) -> Self : $@convention(witness_method: _ExpressibleByBuiltinIntegerLiteral) <τ_0_0 where τ_0_0 : _ExpressibleByBuiltinIntegerLiteral> (Builtin.IntLiteral, @thick τ_0_0.Type) -> @out τ_0_0 // user: %59
  %59 = apply %58<Self.IntegerLiteralType>(%57, %55, %56) : $@convention(witness_method: _ExpressibleByBuiltinIntegerLiteral) <τ_0_0 where τ_0_0 : _ExpressibleByBuiltinIntegerLiteral> (Builtin.IntLiteral, @thick τ_0_0.Type) -> @out τ_0_0
  %60 = alloc_stack $Self                         // users: %66, %65, %64, %62
  %61 = witness_method $Self, #ExpressibleByIntegerLiteral.init!allocator : <Self where Self : ExpressibleByIntegerLiteral> (Self.Type) -> (Self.IntegerLiteralType) -> Self : $@convention(witness_method: ExpressibleByIntegerLiteral) <τ_0_0 where τ_0_0 : ExpressibleByIntegerLiteral> (@in τ_0_0.IntegerLiteralType, @thick τ_0_0.Type) -> @out τ_0_0 // user: %62
  %62 = apply %61<Self>(%60, %57, %33) : $@convention(witness_method: ExpressibleByIntegerLiteral) <τ_0_0 where τ_0_0 : ExpressibleByIntegerLiteral> (@in τ_0_0.IntegerLiteralType, @thick τ_0_0.Type) -> @out τ_0_0
  %63 = witness_method $Self, #Comparable."<" : <Self where Self : Comparable> (Self.Type) -> (Self, Self) -> Bool : $@convention(witness_method: Comparable) <τ_0_0 where τ_0_0 : Comparable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // user: %64
  %64 = apply %63<Self>(%48, %60, %33) : $@convention(witness_method: Comparable) <τ_0_0 where τ_0_0 : Comparable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // user: %68
  destroy_addr %60 : $*Self                       // id: %65
  dealloc_stack %60 : $*Self                      // id: %66
  dealloc_stack %57 : $*Self.IntegerLiteralType   // id: %67
  br bb8(%64 : $Bool)                             // id: %68

// %69                                            // users: %103, %97
bb8(%69 : $Bool):                                 // Preds: bb7 bb6
  destroy_addr %48 : $*Self                       // id: %70
  dealloc_stack %48 : $*Self                      // id: %71
  %72 = apply %4<T>(%3) : $@convention(witness_method: BinaryInteger) <τ_0_0 where τ_0_0 : BinaryInteger> (@thick τ_0_0.Type) -> Bool // user: %75
  %73 = alloc_stack $T                            // users: %96, %95, %89, %74
  copy_addr %41 to [initialization] %73 : $*T     // id: %74
  %75 = struct_extract %72 : $Bool, #Bool._value  // user: %76
  cond_br %75, bb10, bb9                          // id: %76

bb9:                                              // Preds: bb8
  %77 = integer_literal $Builtin.Int1, 0          // user: %78
  %78 = struct $Bool (%77 : $Builtin.Int1)        // user: %79
  br bb11(%78 : $Bool)                            // id: %79

bb10:                                             // Preds: bb8
  %80 = integer_literal $Builtin.IntLiteral, 0    // user: %84
  %81 = metatype $@thick T.IntegerLiteralType.Type // user: %84
  %82 = alloc_stack $T.IntegerLiteralType         // users: %92, %87, %84
  %83 = witness_method $T.IntegerLiteralType, #_ExpressibleByBuiltinIntegerLiteral.init!allocator : <Self where Self : _ExpressibleByBuiltinIntegerLiteral> (Self.Type) -> (Builtin.IntLiteral) -> Self : $@convention(witness_method: _ExpressibleByBuiltinIntegerLiteral) <τ_0_0 where τ_0_0 : _ExpressibleByBuiltinIntegerLiteral> (Builtin.IntLiteral, @thick τ_0_0.Type) -> @out τ_0_0 // user: %84
  %84 = apply %83<T.IntegerLiteralType>(%82, %80, %81) : $@convention(witness_method: _ExpressibleByBuiltinIntegerLiteral) <τ_0_0 where τ_0_0 : _ExpressibleByBuiltinIntegerLiteral> (Builtin.IntLiteral, @thick τ_0_0.Type) -> @out τ_0_0
  %85 = alloc_stack $T                            // users: %91, %90, %89, %87
  %86 = witness_method $T, #ExpressibleByIntegerLiteral.init!allocator : <Self where Self : ExpressibleByIntegerLiteral> (Self.Type) -> (Self.IntegerLiteralType) -> Self : $@convention(witness_method: ExpressibleByIntegerLiteral) <τ_0_0 where τ_0_0 : ExpressibleByIntegerLiteral> (@in τ_0_0.IntegerLiteralType, @thick τ_0_0.Type) -> @out τ_0_0 // user: %87
  %87 = apply %86<T>(%85, %82, %3) : $@convention(witness_method: ExpressibleByIntegerLiteral) <τ_0_0 where τ_0_0 : ExpressibleByIntegerLiteral> (@in τ_0_0.IntegerLiteralType, @thick τ_0_0.Type) -> @out τ_0_0
  %88 = witness_method $T, #Comparable."<" : <Self where Self : Comparable> (Self.Type) -> (Self, Self) -> Bool : $@convention(witness_method: Comparable) <τ_0_0 where τ_0_0 : Comparable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // user: %89
  %89 = apply %88<T>(%73, %85, %3) : $@convention(witness_method: Comparable) <τ_0_0 where τ_0_0 : Comparable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // user: %93
  destroy_addr %85 : $*T                          // id: %90
  dealloc_stack %85 : $*T                         // id: %91
  dealloc_stack %82 : $*T.IntegerLiteralType      // id: %92
  br bb11(%89 : $Bool)                            // id: %93

// %94                                            // user: %98
bb11(%94 : $Bool):                                // Preds: bb10 bb9
  destroy_addr %73 : $*T                          // id: %95
  dealloc_stack %73 : $*T                         // id: %96
  %97 = struct_extract %69 : $Bool, #Bool._value  // user: %99
  %98 = struct_extract %94 : $Bool, #Bool._value  // users: %171, %99
  %99 = builtin "cmp_eq_Int1"(%97 : $Builtin.Int1, %98 : $Builtin.Int1) : $Builtin.Int1 // user: %100
  cond_br %99, bb13, bb12                         // id: %100

bb12:                                             // Preds: bb11
  destroy_addr %41 : $*T                          // id: %101
  destroy_addr %43 : $*Self                       // id: %102
  br bb24(%69 : $Bool)                            // id: %103

bb13:                                             // Preds: bb11
  %104 = integer_literal $Builtin.IntLiteral, 0   // users: %149, %127, %108
  %105 = metatype $@thick Self.IntegerLiteralType.Type // users: %149, %108
  %106 = alloc_stack $Self.IntegerLiteralType     // users: %116, %111, %108
  %107 = witness_method $Self.IntegerLiteralType, #_ExpressibleByBuiltinIntegerLiteral.init!allocator : <Self where Self : _ExpressibleByBuiltinIntegerLiteral> (Self.Type) -> (Builtin.IntLiteral) -> Self : $@convention(witness_method: _ExpressibleByBuiltinIntegerLiteral) <τ_0_0 where τ_0_0 : _ExpressibleByBuiltinIntegerLiteral> (Builtin.IntLiteral, @thick τ_0_0.Type) -> @out τ_0_0 // users: %149, %108
  %108 = apply %107<Self.IntegerLiteralType>(%106, %104, %105) : $@convention(witness_method: _ExpressibleByBuiltinIntegerLiteral) <τ_0_0 where τ_0_0 : _ExpressibleByBuiltinIntegerLiteral> (Builtin.IntLiteral, @thick τ_0_0.Type) -> @out τ_0_0
  %109 = alloc_stack $Self                        // users: %115, %114, %113, %111
  %110 = witness_method $Self, #ExpressibleByIntegerLiteral.init!allocator : <Self where Self : ExpressibleByIntegerLiteral> (Self.Type) -> (Self.IntegerLiteralType) -> Self : $@convention(witness_method: ExpressibleByIntegerLiteral) <τ_0_0 where τ_0_0 : ExpressibleByIntegerLiteral> (@in τ_0_0.IntegerLiteralType, @thick τ_0_0.Type) -> @out τ_0_0 // users: %151, %111
  %111 = apply %110<Self>(%109, %106, %33) : $@convention(witness_method: ExpressibleByIntegerLiteral) <τ_0_0 where τ_0_0 : ExpressibleByIntegerLiteral> (@in τ_0_0.IntegerLiteralType, @thick τ_0_0.Type) -> @out τ_0_0
  %112 = witness_method $Self, #Equatable."==" : <Self where Self : Equatable> (Self.Type) -> (Self, Self) -> Bool : $@convention(witness_method: Equatable) <τ_0_0 where τ_0_0 : Equatable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // user: %113
  %113 = apply %112<Self>(%43, %109, %33) : $@convention(witness_method: Equatable) <τ_0_0 where τ_0_0 : Equatable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // user: %119
  destroy_addr %109 : $*Self                      // id: %114
  dealloc_stack %109 : $*Self                     // id: %115
  dealloc_stack %106 : $*Self.IntegerLiteralType  // id: %116
  %117 = alloc_stack $T                           // users: %139, %138, %132, %118
  copy_addr %41 to [initialization] %117 : $*T    // id: %118
  %119 = struct_extract %113 : $Bool, #Bool._value // user: %120
  cond_br %119, bb15, bb14                        // id: %120

bb14:                                             // Preds: bb13
  %121 = integer_literal $Builtin.Int1, 0         // user: %122
  %122 = struct $Bool (%121 : $Builtin.Int1)      // user: %123
  br bb16(%122 : $Bool)                           // id: %123

bb15:                                             // Preds: bb13
  %124 = metatype $@thick T.IntegerLiteralType.Type // user: %127
  %125 = alloc_stack $T.IntegerLiteralType        // users: %135, %130, %127
  %126 = witness_method $T.IntegerLiteralType, #_ExpressibleByBuiltinIntegerLiteral.init!allocator : <Self where Self : _ExpressibleByBuiltinIntegerLiteral> (Self.Type) -> (Builtin.IntLiteral) -> Self : $@convention(witness_method: _ExpressibleByBuiltinIntegerLiteral) <τ_0_0 where τ_0_0 : _ExpressibleByBuiltinIntegerLiteral> (Builtin.IntLiteral, @thick τ_0_0.Type) -> @out τ_0_0 // user: %127
  %127 = apply %126<T.IntegerLiteralType>(%125, %104, %124) : $@convention(witness_method: _ExpressibleByBuiltinIntegerLiteral) <τ_0_0 where τ_0_0 : _ExpressibleByBuiltinIntegerLiteral> (Builtin.IntLiteral, @thick τ_0_0.Type) -> @out τ_0_0
  %128 = alloc_stack $T                           // users: %134, %133, %132, %130
  %129 = witness_method $T, #ExpressibleByIntegerLiteral.init!allocator : <Self where Self : ExpressibleByIntegerLiteral> (Self.Type) -> (Self.IntegerLiteralType) -> Self : $@convention(witness_method: ExpressibleByIntegerLiteral) <τ_0_0 where τ_0_0 : ExpressibleByIntegerLiteral> (@in τ_0_0.IntegerLiteralType, @thick τ_0_0.Type) -> @out τ_0_0 // user: %130
  %130 = apply %129<T>(%128, %125, %3) : $@convention(witness_method: ExpressibleByIntegerLiteral) <τ_0_0 where τ_0_0 : ExpressibleByIntegerLiteral> (@in τ_0_0.IntegerLiteralType, @thick τ_0_0.Type) -> @out τ_0_0
  %131 = witness_method $T, #Equatable."==" : <Self where Self : Equatable> (Self.Type) -> (Self, Self) -> Bool : $@convention(witness_method: Equatable) <τ_0_0 where τ_0_0 : Equatable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // user: %132
  %132 = apply %131<T>(%117, %128, %3) : $@convention(witness_method: Equatable) <τ_0_0 where τ_0_0 : Equatable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // user: %136
  destroy_addr %128 : $*T                         // id: %133
  dealloc_stack %128 : $*T                        // id: %134
  dealloc_stack %125 : $*T.IntegerLiteralType     // id: %135
  br bb16(%132 : $Bool)                           // id: %136

// %137                                           // user: %140
bb16(%137 : $Bool):                               // Preds: bb15 bb14
  destroy_addr %117 : $*T                         // id: %138
  dealloc_stack %117 : $*T                        // id: %139
  %140 = struct_extract %137 : $Bool, #Bool._value // user: %141
  cond_br %140, bb23, bb17                        // id: %141

bb17:                                             // Preds: bb16
  %142 = alloc_stack $Self                        // users: %174, %188, %187, %185, %182, %159, %153, %146
  %143 = alloc_stack $T                           // users: %147, %146, %144
  copy_addr %41 to [initialization] %143 : $*T    // id: %144
  %145 = witness_method $Self, #BinaryInteger.init!allocator : <Self where Self : BinaryInteger><T where T : BinaryInteger> (Self.Type) -> (T) -> Self : $@convention(witness_method: BinaryInteger) <τ_0_0 where τ_0_0 : BinaryInteger><τ_1_0 where τ_1_0 : BinaryInteger> (@in τ_1_0, @thick τ_0_0.Type) -> @out τ_0_0 // user: %146
  %146 = apply %145<Self, T>(%142, %143, %33) : $@convention(witness_method: BinaryInteger) <τ_0_0 where τ_0_0 : BinaryInteger><τ_1_0 where τ_1_0 : BinaryInteger> (@in τ_1_0, @thick τ_0_0.Type) -> @out τ_0_0
  dealloc_stack %143 : $*T                        // id: %147
  %148 = alloc_stack $Self.IntegerLiteralType     // users: %156, %151, %149
  %149 = apply %107<Self.IntegerLiteralType>(%148, %104, %105) : $@convention(witness_method: _ExpressibleByBuiltinIntegerLiteral) <τ_0_0 where τ_0_0 : _ExpressibleByBuiltinIntegerLiteral> (Builtin.IntLiteral, @thick τ_0_0.Type) -> @out τ_0_0
  %150 = alloc_stack $Self                        // users: %155, %154, %153, %151
  %151 = apply %110<Self>(%150, %148, %33) : $@convention(witness_method: ExpressibleByIntegerLiteral) <τ_0_0 where τ_0_0 : ExpressibleByIntegerLiteral> (@in τ_0_0.IntegerLiteralType, @thick τ_0_0.Type) -> @out τ_0_0
  %152 = witness_method $Self, #Comparable."<" : <Self where Self : Comparable> (Self.Type) -> (Self, Self) -> Bool : $@convention(witness_method: Comparable) <τ_0_0 where τ_0_0 : Comparable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // users: %185, %153
  %153 = apply %152<Self>(%142, %150, %33) : $@convention(witness_method: Comparable) <τ_0_0 where τ_0_0 : Comparable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // user: %170
  destroy_addr %150 : $*Self                      // id: %154
  dealloc_stack %150 : $*Self                     // id: %155
  dealloc_stack %148 : $*Self.IntegerLiteralType  // id: %156
  %157 = alloc_stack $T                           // users: %166, %165, %164, %161
  %158 = alloc_stack $Self                        // users: %162, %161, %159
  copy_addr %142 to [initialization] %158 : $*Self // id: %159
  %160 = witness_method $T, #BinaryInteger.init!allocator : <Self where Self : BinaryInteger><T where T : BinaryInteger> (Self.Type) -> (T) -> Self : $@convention(witness_method: BinaryInteger) <τ_0_0 where τ_0_0 : BinaryInteger><τ_1_0 where τ_1_0 : BinaryInteger> (@in τ_1_0, @thick τ_0_0.Type) -> @out τ_0_0 // users: %176, %161
  %161 = apply %160<T, Self>(%157, %158, %3) : $@convention(witness_method: BinaryInteger) <τ_0_0 where τ_0_0 : BinaryInteger><τ_1_0 where τ_1_0 : BinaryInteger> (@in τ_1_0, @thick τ_0_0.Type) -> @out τ_0_0
  dealloc_stack %158 : $*Self                     // id: %162
  %163 = witness_method $T, #Equatable."==" : <Self where Self : Equatable> (Self.Type) -> (Self, Self) -> Bool : $@convention(witness_method: Equatable) <τ_0_0 where τ_0_0 : Equatable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // user: %164
  %164 = apply %163<T>(%157, %41, %3) : $@convention(witness_method: Equatable) <τ_0_0 where τ_0_0 : Equatable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // user: %167
  destroy_addr %157 : $*T                         // id: %165
  dealloc_stack %157 : $*T                        // id: %166
  %167 = struct_extract %164 : $Bool, #Bool._value // user: %168
  cond_br %167, bb19, bb18                        // id: %168

bb18:                                             // Preds: bb17
  br bb21                                         // id: %169

bb19:                                             // Preds: bb17
  %170 = struct_extract %153 : $Bool, #Bool._value // user: %171
  %171 = builtin "cmp_eq_Int1"(%98 : $Builtin.Int1, %170 : $Builtin.Int1) : $Builtin.Int1 // user: %172
  cond_br %171, bb22, bb20                        // id: %172

bb20:                                             // Preds: bb19
  br bb21                                         // id: %173

bb21:                                             // Preds: bb20 bb18
  destroy_addr %142 : $*Self                      // id: %174
  %175 = alloc_stack $T                           // users: %181, %180, %178, %176
  %176 = apply %160<T, Self>(%175, %43, %3) : $@convention(witness_method: BinaryInteger) <τ_0_0 where τ_0_0 : BinaryInteger><τ_1_0 where τ_1_0 : BinaryInteger> (@in τ_1_0, @thick τ_0_0.Type) -> @out τ_0_0
  %177 = witness_method $T, #Comparable."<" : <Self where Self : Comparable> (Self.Type) -> (Self, Self) -> Bool : $@convention(witness_method: Comparable) <τ_0_0 where τ_0_0 : Comparable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // user: %178
  %178 = apply %177<T>(%175, %41, %3) : $@convention(witness_method: Comparable) <τ_0_0 where τ_0_0 : Comparable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // user: %183
  destroy_addr %41 : $*T                          // id: %179
  destroy_addr %175 : $*T                         // id: %180
  dealloc_stack %175 : $*T                        // id: %181
  dealloc_stack %142 : $*Self                     // id: %182
  br bb24(%178 : $Bool)                           // id: %183

bb22:                                             // Preds: bb19
  destroy_addr %41 : $*T                          // id: %184
  %185 = apply %152<Self>(%43, %142, %33) : $@convention(witness_method: Comparable) <τ_0_0 where τ_0_0 : Comparable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // user: %189
  destroy_addr %43 : $*Self                       // id: %186
  destroy_addr %142 : $*Self                      // id: %187
  dealloc_stack %142 : $*Self                     // id: %188
  br bb24(%185 : $Bool)                           // id: %189

bb23:                                             // Preds: bb16
  destroy_addr %41 : $*T                          // id: %190
  destroy_addr %43 : $*Self                       // id: %191
  %192 = integer_literal $Builtin.Int1, 0         // user: %193
  %193 = struct $Bool (%192 : $Builtin.Int1)      // user: %194
  br bb24(%193 : $Bool)                           // id: %194

// %195                                           // user: %196
bb24(%195 : $Bool):                               // Preds: bb23 bb22 bb21 bb12
  %196 = struct_extract %195 : $Bool, #Bool._value // user: %198
  dealloc_stack %43 : $*Self                      // id: %197
  cond_fail %196 : $Builtin.Int1, "Not enough bits to represent the passed value" // id: %198
  dealloc_stack %41 : $*T                         // id: %199
  br bb25                                         // id: %200

bb25:                                             // Preds: bb4 bb24
  %201 = witness_method $Self, #BinaryInteger.init!allocator : <Self where Self : BinaryInteger><T where T : BinaryInteger> (Self.Type) -> (T) -> Self : $@convention(witness_method: BinaryInteger) <τ_0_0 where τ_0_0 : BinaryInteger><τ_1_0 where τ_1_0 : BinaryInteger> (@in τ_1_0, @thick τ_0_0.Type) -> @out τ_0_0 // user: %202
  %202 = apply %201<Self, T>(%0, %1, %2) : $@convention(witness_method: BinaryInteger) <τ_0_0 where τ_0_0 : BinaryInteger><τ_1_0 where τ_1_0 : BinaryInteger> (@in τ_1_0, @thick τ_0_0.Type) -> @out τ_0_0
  %203 = tuple ()                                 // user: %204
  return %203 : $()                               // id: %204
} // end sil function '$sSUss17FixedWidthIntegerRzrlEyxqd__cSzRd__lufC'

// os_log_type_enabled
sil [available 10.12] [readonly] [clang OSLog.isEnabled] @os_log_type_enabled : $@convention(c) (OSLog, OSLogType) -> Bool

// createStorage<A>(capacity:type:)
sil shared_external [always_inline] @$s2os13createStorage8capacity4typeSpyxGSgSi_xmtlF : $@convention(thin) <T> (Int, @thick T.Type) -> Optional<UnsafeMutablePointer<T>> {
// %0                                             // users: %8, %3
bb0(%0 : $Int, %1 : $@thick T.Type):
  %2 = integer_literal $Builtin.Int64, 0          // user: %4
  %3 = struct_extract %0 : $Int, #Int._value      // user: %4
  %4 = builtin "cmp_eq_Int64"(%3 : $Builtin.Int64, %2 : $Builtin.Int64) : $Builtin.Int1 // user: %5
  cond_br %4, bb2, bb1                            // id: %5

bb1:                                              // Preds: bb0
  %6 = metatype $@thin UnsafeMutablePointer<T>.Type // user: %8
  // function_ref static UnsafeMutablePointer.allocate(capacity:)
  %7 = function_ref @$sSp8allocate8capacitySpyxGSi_tFZ : $@convention(method) <τ_0_0> (Int, @thin UnsafeMutablePointer<τ_0_0>.Type) -> UnsafeMutablePointer<τ_0_0> // user: %8
  %8 = apply %7<T>(%0, %6) : $@convention(method) <τ_0_0> (Int, @thin UnsafeMutablePointer<τ_0_0>.Type) -> UnsafeMutablePointer<τ_0_0> // user: %9
  %9 = enum $Optional<UnsafeMutablePointer<T>>, #Optional.some!enumelt, %8 : $UnsafeMutablePointer<T> // user: %10
  br bb3(%9 : $Optional<UnsafeMutablePointer<T>>) // id: %10

bb2:                                              // Preds: bb0
  %11 = enum $Optional<UnsafeMutablePointer<T>>, #Optional.none!enumelt // user: %12
  br bb3(%11 : $Optional<UnsafeMutablePointer<T>>) // id: %12

// %13                                            // user: %14
bb3(%13 : $Optional<UnsafeMutablePointer<T>>):    // Preds: bb2 bb1
  return %13 : $Optional<UnsafeMutablePointer<T>> // id: %14
} // end sil function '$s2os13createStorage8capacity4typeSpyxGSgSi_xmtlF'

// serialize(_:at:)
sil shared_external [always_inline] @$s2os9serialize_2atys5UInt8V_SpyAEGztF : $@convention(thin) (UInt8, @inout UnsafeMutablePointer<UInt8>) -> () {
// %0                                             // user: %5
// %1                                             // users: %10, %2
bb0(%0 : $UInt8, %1 : $*UnsafeMutablePointer<UInt8>):
  %2 = struct_element_addr %1 : $*UnsafeMutablePointer<UInt8>, #UnsafeMutablePointer._rawValue // user: %3
  %3 = load %2 : $*Builtin.RawPointer             // user: %4
  %4 = pointer_to_address %3 : $Builtin.RawPointer to [strict] $*UInt8 // users: %7, %5
  store %0 to %4 : $*UInt8                        // id: %5
  %6 = integer_literal $Builtin.Word, 1           // user: %7
  %7 = index_addr %4 : $*UInt8, %6 : $Builtin.Word // user: %8
  %8 = address_to_pointer %7 : $*UInt8 to $Builtin.RawPointer // user: %9
  %9 = struct $UnsafeMutablePointer<UInt8> (%8 : $Builtin.RawPointer) // user: %10
  store %9 to %1 : $*UnsafeMutablePointer<UInt8>  // id: %10
  %11 = tuple ()                                  // user: %12
  return %11 : $()                                // id: %12
} // end sil function '$s2os9serialize_2atys5UInt8V_SpyAEGztF'

// closure #1 in osLogInternal(_:log:type:)
sil shared_external @$s2os0A11LogInternal_3log4typeyAA12OSLogMessageV_So03OS_a1_D0CSo0a1_d1_E2_tatFyySpys5UInt8VGz_SpySo8NSObjectCGSgzSpyypGSgztcXEfU_ : $@convention(thin) (@guaranteed @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> (), @inout_aliasable UnsafeMutablePointer<UInt8>, @inout_aliasable Optional<UnsafeMutablePointer<NSObject>>, @inout_aliasable Optional<UnsafeMutablePointer<Any>>) -> () {
// %0                                             // user: %4
// %1                                             // user: %4
// %2                                             // user: %4
// %3                                             // user: %4
bb0(%0 : $@callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> (), %1 : $*UnsafeMutablePointer<UInt8>, %2 : $*Optional<UnsafeMutablePointer<NSObject>>, %3 : $*Optional<UnsafeMutablePointer<Any>>):
  %4 = apply %0(%1, %2, %3) : $@callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> ()
  %5 = tuple ()                                   // user: %6
  return %5 : $()                                 // id: %6
} // end sil function '$s2os0A11LogInternal_3log4typeyAA12OSLogMessageV_So03OS_a1_D0CSo0a1_d1_E2_tatFyySpys5UInt8VGz_SpySo8NSObjectCGSgzSpyypGSgztcXEfU_'

// thunk for @callee_guaranteed (@guaranteed @escaping @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout UnsafeMutablePointer<NSObject>?, @inout UnsafeMutablePointer<Any>?) -> ()) -> (@error @owned Error)
sil shared_external [transparent] [reabstraction_thunk] @$sSpys5UInt8VGSpySo8NSObjectCGSgSpyypGSgIeglll_s5Error_pIggzo_xq_q0_q1_r2_lyAcgIytIseglllr_sAJ_pIegnzo_TR : $@convention(thin) (@in_guaranteed @callee_guaranteed @substituted <τ_0_0, τ_0_1, τ_0_2, τ_0_3> (@inout τ_0_0, @inout τ_0_1, @inout τ_0_2) -> @out τ_0_3 for <UnsafeMutablePointer<UInt8>, Optional<UnsafeMutablePointer<NSObject>>, Optional<UnsafeMutablePointer<Any>>, ()>, @noescape @callee_guaranteed (@guaranteed @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> ()) -> @error Error) -> @error Error {
// %0                                             // user: %2
// %1                                             // user: %7
bb0(%0 : $*@callee_guaranteed @substituted <τ_0_0, τ_0_1, τ_0_2, τ_0_3> (@inout τ_0_0, @inout τ_0_1, @inout τ_0_2) -> @out τ_0_3 for <UnsafeMutablePointer<UInt8>, Optional<UnsafeMutablePointer<NSObject>>, Optional<UnsafeMutablePointer<Any>>, ()>, %1 : $@noescape @callee_guaranteed (@guaranteed @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> ()) -> @error Error):
  %2 = load %0 : $*@callee_guaranteed @substituted <τ_0_0, τ_0_1, τ_0_2, τ_0_3> (@inout τ_0_0, @inout τ_0_1, @inout τ_0_2) -> @out τ_0_3 for <UnsafeMutablePointer<UInt8>, Optional<UnsafeMutablePointer<NSObject>>, Optional<UnsafeMutablePointer<Any>>, ()> // users: %6, %3
  %3 = convert_function %2 : $@callee_guaranteed @substituted <τ_0_0, τ_0_1, τ_0_2, τ_0_3> (@inout τ_0_0, @inout τ_0_1, @inout τ_0_2) -> @out τ_0_3 for <UnsafeMutablePointer<UInt8>, Optional<UnsafeMutablePointer<NSObject>>, Optional<UnsafeMutablePointer<Any>>, ()> to $@callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> @out () // user: %5
  // function_ref thunk for @escaping @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout UnsafeMutablePointer<NSObject>?, @inout UnsafeMutablePointer<Any>?) -> (@out ())
  %4 = function_ref @$sSpys5UInt8VGSpySo8NSObjectCGSgSpyypGSgytIeglllr_AcgIIeglll_TR : $@convention(thin) (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>, @guaranteed @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> @out ()) -> () // user: %5
  %5 = partial_apply [callee_guaranteed] %4(%3) : $@convention(thin) (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>, @guaranteed @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> @out ()) -> () // users: %9, %12, %7
  strong_retain %2 : $@callee_guaranteed @substituted <τ_0_0, τ_0_1, τ_0_2, τ_0_3> (@inout τ_0_0, @inout τ_0_1, @inout τ_0_2) -> @out τ_0_3 for <UnsafeMutablePointer<UInt8>, Optional<UnsafeMutablePointer<NSObject>>, Optional<UnsafeMutablePointer<Any>>, ()> // id: %6
  try_apply %1(%5) : $@noescape @callee_guaranteed (@guaranteed @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> ()) -> @error Error, normal bb2, error bb1 // id: %7

// %8                                             // user: %10
bb1(%8 : $Error):                                 // Preds: bb0
  strong_release %5 : $@callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> () // id: %9
  throw %8 : $Error                               // id: %10

bb2(%11 : $()):                                   // Preds: bb0
  strong_release %5 : $@callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> () // id: %12
  %13 = tuple ()                                  // user: %14
  return %13 : $()                                // id: %14
} // end sil function '$sSpys5UInt8VGSpySo8NSObjectCGSgSpyypGSgIeglll_s5Error_pIggzo_xq_q0_q1_r2_lyAcgIytIseglllr_sAJ_pIegnzo_TR'

// Sequence.forEach(_:)
sil public_external [_semantics "sequence.forEach"] @$sSTsE7forEachyyy7ElementQzKXEKF : $@convention(method) <Self where Self : Sequence> (@noescape @callee_guaranteed @substituted <τ_0_0> (@in_guaranteed τ_0_0) -> @error Error for <Self.Element>, @in_guaranteed Self) -> @error Error {
// %0                                             // user: %19
// %1                                             // user: %4
bb0(%0 : $@noescape @callee_guaranteed @substituted <τ_0_0> (@in_guaranteed τ_0_0) -> @error Error for <Self.Element>, %1 : $*Self):
  %2 = alloc_stack $Self.Iterator                 // users: %24, %21, %15, %13, %11, %6
  %3 = alloc_stack $Self                          // users: %7, %6, %4
  copy_addr %1 to [initialization] %3 : $*Self    // id: %4
  %5 = witness_method $Self, #Sequence.makeIterator : <Self where Self : Sequence> (__owned Self) -> () -> Self.Iterator : $@convention(witness_method: Sequence) <τ_0_0 where τ_0_0 : Sequence> (@in τ_0_0) -> @out τ_0_0.Iterator // user: %6
  %6 = apply %5<Self>(%2, %3) : $@convention(witness_method: Sequence) <τ_0_0 where τ_0_0 : Sequence> (@in τ_0_0) -> @out τ_0_0.Iterator
  dealloc_stack %3 : $*Self                       // id: %7
  %8 = alloc_stack $Optional<Self.Element>        // users: %23, %18, %14, %12, %11
  %9 = witness_method $Self.Iterator, #IteratorProtocol.next : <Self where Self : IteratorProtocol> (inout Self) -> () -> Self.Element? : $@convention(witness_method: IteratorProtocol) <τ_0_0 where τ_0_0 : IteratorProtocol> (@inout τ_0_0) -> @out Optional<τ_0_0.Element> // user: %11
  br bb1                                          // id: %10

bb1:                                              // Preds: bb5 bb0
  %11 = apply %9<Self.Iterator>(%8, %2) : $@convention(witness_method: IteratorProtocol) <τ_0_0 where τ_0_0 : IteratorProtocol> (@inout τ_0_0) -> @out Optional<τ_0_0.Element>
  switch_enum_addr %8 : $*Optional<Self.Element>, case #Optional.some!enumelt: bb3, case #Optional.none!enumelt: bb2 // id: %12

bb2:                                              // Preds: bb1
  destroy_addr %2 : $*Self.Iterator               // id: %13
  dealloc_stack %8 : $*Optional<Self.Element>     // id: %14
  dealloc_stack %2 : $*Self.Iterator              // id: %15
  %16 = tuple ()                                  // user: %17
  return %16 : $()                                // id: %17

bb3:                                              // Preds: bb1
  %18 = unchecked_take_enum_data_addr %8 : $*Optional<Self.Element>, #Optional.some!enumelt // users: %27, %22, %19
  try_apply %0(%18) : $@noescape @callee_guaranteed @substituted <τ_0_0> (@in_guaranteed τ_0_0) -> @error Error for <Self.Element>, normal bb5, error bb4 // id: %19

// %20                                            // user: %25
bb4(%20 : $Error):                                // Preds: bb3
  destroy_addr %2 : $*Self.Iterator               // id: %21
  destroy_addr %18 : $*Self.Element               // id: %22
  dealloc_stack %8 : $*Optional<Self.Element>     // id: %23
  dealloc_stack %2 : $*Self.Iterator              // id: %24
  throw %20 : $Error                              // id: %25

bb5(%26 : $()):                                   // Preds: bb3
  destroy_addr %18 : $*Self.Element               // id: %27
  br bb1                                          // id: %28
} // end sil function '$sSTsE7forEachyyy7ElementQzKXEKF'

// _os_log_impl
sil [available 10.12] [clang ___os_log_impl] @_os_log_impl : $@convention(c) (UnsafeMutableRawPointer, OSLog, OSLogType, UnsafePointer<Int8>, UnsafeMutablePointer<UInt8>, UInt32) -> ()

// destroyStorage<A>(_:count:)
sil shared_external [always_inline] @$s2os14destroyStorage_5countySpyxGSg_SitlF : $@convention(thin) <T> (Optional<UnsafeMutablePointer<T>>, Int) -> () {
// %0                                             // user: %2
// %1                                             // user: %6
bb0(%0 : $Optional<UnsafeMutablePointer<T>>, %1 : $Int):
  switch_enum %0 : $Optional<UnsafeMutablePointer<T>>, case #Optional.some!enumelt: bb2, case #Optional.none!enumelt: bb1 // id: %2

bb1:                                              // Preds: bb0
  br bb3                                          // id: %3

// %4                                             // users: %8, %6
bb2(%4 : $UnsafeMutablePointer<T>):               // Preds: bb0
  // function_ref UnsafeMutablePointer.deinitialize(count:)
  %5 = function_ref @$sSp12deinitialize5countSvSi_tF : $@convention(method) <τ_0_0> (Int, UnsafeMutablePointer<τ_0_0>) -> UnsafeMutableRawPointer // user: %6
  %6 = apply %5<T>(%1, %4) : $@convention(method) <τ_0_0> (Int, UnsafeMutablePointer<τ_0_0>) -> UnsafeMutableRawPointer
  // function_ref UnsafeMutablePointer.deallocate()
  %7 = function_ref @$sSp10deallocateyyF : $@convention(method) <τ_0_0> (UnsafeMutablePointer<τ_0_0>) -> () // user: %8
  %8 = apply %7<T>(%4) : $@convention(method) <τ_0_0> (UnsafeMutablePointer<τ_0_0>) -> ()
  br bb3                                          // id: %9

bb3:                                              // Preds: bb2 bb1
  %10 = tuple ()                                  // user: %11
  return %10 : $()                                // id: %11
} // end sil function '$s2os14destroyStorage_5countySpyxGSg_SitlF'

// UnsafeMutablePointer.deallocate()
sil public_external @$sSp10deallocateyyF : $@convention(method) <Pointee> (UnsafeMutablePointer<Pointee>) -> () {
// %0                                             // user: %1
bb0(%0 : $UnsafeMutablePointer<Pointee>):
  %1 = struct_extract %0 : $UnsafeMutablePointer<Pointee>, #UnsafeMutablePointer._rawValue // user: %4
  %2 = integer_literal $Builtin.Word, -1          // user: %4
  %3 = integer_literal $Builtin.Word, 0           // user: %4
  %4 = builtin "deallocRaw"(%1 : $Builtin.RawPointer, %2 : $Builtin.Word, %3 : $Builtin.Word) : $()
  %5 = tuple ()                                   // user: %6
  return %5 : $()                                 // id: %6
} // end sil function '$sSp10deallocateyyF'

// implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)
sil shared_external [transparent] @$s2os18OSLogInterpolationV06appendC0_5align7privacyyxyXA_AA0B15StringAlignmentVAA0B7PrivacyVts06CustomG11ConvertibleRzlFSSycfu_ : $@convention(thin) <T where T : CustomStringConvertible> (@guaranteed @callee_guaranteed @substituted <τ_0_0> () -> @out τ_0_0 for <T>) -> @owned String {
// %0                                             // user: %2
bb0(%0 : $@callee_guaranteed @substituted <τ_0_0> () -> @out τ_0_0 for <T>):
  %1 = alloc_stack $T                             // users: %6, %5, %4, %2
  %2 = apply %0(%1) : $@callee_guaranteed @substituted <τ_0_0> () -> @out τ_0_0 for <T>
  %3 = witness_method $T, #CustomStringConvertible.description!getter : <Self where Self : CustomStringConvertible> (Self) -> () -> String : $@convention(witness_method: CustomStringConvertible) <τ_0_0 where τ_0_0 : CustomStringConvertible> (@in_guaranteed τ_0_0) -> @owned String // user: %4
  %4 = apply %3<T>(%1) : $@convention(witness_method: CustomStringConvertible) <τ_0_0 where τ_0_0 : CustomStringConvertible> (@in_guaranteed τ_0_0) -> @owned String // user: %7
  destroy_addr %1 : $*T                           // id: %5
  dealloc_stack %1 : $*T                          // id: %6
  return %4 : $String                             // id: %7
} // end sil function '$s2os18OSLogInterpolationV06appendC0_5align7privacyyxyXA_AA0B15StringAlignmentVAA0B7PrivacyVts06CustomG11ConvertibleRzlFSSycfu_'

// OSLogInterpolation.appendInterpolation(_:align:privacy:)
sil public_external [available 11.0] [Onone] [_semantics "constant_evaluable"] [_semantics "oslog.requires_constant_arguments"] @$s2os18OSLogInterpolationV06appendC0_5align7privacyySSyXA_AA0B15StringAlignmentVAA0B7PrivacyVtF : $@convention(method) (@guaranteed @callee_guaranteed () -> @owned String, @in_guaranteed OSLogStringAlignment, @in_guaranteed OSLogPrivacy, @inout OSLogInterpolation) -> () {
// %0                                             // user: %62
// %1                                             // users: %23, %17
// %2                                             // users: %59, %56, %34, %17
// %3                                             // users: %76, %64, %60, %59, %56, %30, %19, %14, %4
bb0(%0 : $@callee_guaranteed () -> @owned String, %1 : $*OSLogStringAlignment, %2 : $*OSLogPrivacy, %3 : $*OSLogInterpolation):
  %4 = struct_element_addr %3 : $*OSLogInterpolation, #OSLogInterpolation.argumentCount // user: %5
  %5 = load %4 : $*UInt8                          // user: %8
  // function_ref maxOSLogArgumentCount.getter
  %6 = function_ref @$s2os21maxOSLogArgumentCounts5UInt8Vvg : $@convention(thin) () -> UInt8 // user: %7
  %7 = apply %6() : $@convention(thin) () -> UInt8 // user: %9
  %8 = struct_extract %5 : $UInt8, #UInt8._value  // user: %10
  %9 = struct_extract %7 : $UInt8, #UInt8._value  // user: %10
  %10 = builtin "cmp_ult_Int8"(%8 : $Builtin.Int8, %9 : $Builtin.Int8) : $Builtin.Int1 // user: %11
  cond_br %10, bb2, bb1                           // id: %11

bb1:                                              // Preds: bb0
  br bb12                                         // id: %12

bb2:                                              // Preds: bb0
  %13 = metatype $@thin String.Type               // user: %21
  %14 = load %3 : $*OSLogInterpolation            // users: %18, %17, %15
  retain_value %14 : $OSLogInterpolation          // id: %15
  // function_ref OSLogInterpolation.getStringFormatSpecifier(_:_:)
  %16 = function_ref @$s2os18OSLogInterpolationV24getStringFormatSpecifierySSAA0bE9AlignmentV_AA0B7PrivacyVtF : $@convention(method) (@in_guaranteed OSLogStringAlignment, @in_guaranteed OSLogPrivacy, @guaranteed OSLogInterpolation) -> @owned String // user: %17
  %17 = apply %16(%1, %2, %14) : $@convention(method) (@in_guaranteed OSLogStringAlignment, @in_guaranteed OSLogPrivacy, @guaranteed OSLogInterpolation) -> @owned String // users: %22, %21
  release_value %14 : $OSLogInterpolation         // id: %18
  %19 = struct_element_addr %3 : $*OSLogInterpolation, #OSLogInterpolation.formatString // user: %21
  // function_ref static String.+= infix(_:_:)
  %20 = function_ref @$sSS2peoiyySSz_SStFZ : $@convention(method) (@inout String, @guaranteed String, @thin String.Type) -> () // user: %21
  %21 = apply %20(%19, %17, %13) : $@convention(method) (@inout String, @guaranteed String, @thin String.Type) -> ()
  release_value %17 : $String                     // id: %22
  %23 = struct_element_addr %1 : $*OSLogStringAlignment, #OSLogStringAlignment.minimumColumnWidth // user: %24
  %24 = load %23 : $*Optional<@callee_guaranteed () -> Int> // users: %26, %25
  retain_value %24 : $Optional<@callee_guaranteed () -> Int> // id: %25
  switch_enum %24 : $Optional<@callee_guaranteed () -> Int>, case #Optional.some!enumelt: bb4, case #Optional.none!enumelt: bb3 // id: %26

bb3:                                              // Preds: bb2
  br bb5                                          // id: %27

// %28                                            // users: %31, %30
bb4(%28 : $@callee_guaranteed () -> Int):         // Preds: bb2
  // function_ref OSLogInterpolation.appendAlignmentArgument(_:)
  %29 = function_ref @$s2os18OSLogInterpolationV23appendAlignmentArgumentyySiycF : $@convention(method) (@guaranteed @callee_guaranteed () -> Int, @inout OSLogInterpolation) -> () // user: %30
  %30 = apply %29(%28, %3) : $@convention(method) (@guaranteed @callee_guaranteed () -> Int, @inout OSLogInterpolation) -> ()
  strong_release %28 : $@callee_guaranteed () -> Int // id: %31
  br bb5                                          // id: %32

bb5:                                              // Preds: bb4 bb3
  %33 = alloc_stack $OSLogPrivacy                 // users: %52, %50, %35, %34
  copy_addr %2 to [initialization] %33 : $*OSLogPrivacy // id: %34
  %35 = struct_element_addr %33 : $*OSLogPrivacy, #OSLogPrivacy.mask // user: %37
  %36 = alloc_stack $OSLogPrivacy.Mask            // users: %45, %44, %40, %39, %38, %37
  copy_addr %35 to [initialization] %36 : $*OSLogPrivacy.Mask // id: %37
  switch_enum_addr %36 : $*OSLogPrivacy.Mask, case #OSLogPrivacy.Mask.hash!enumelt: bb7, default bb6 // id: %38

bb6:                                              // Preds: bb5
  destroy_addr %36 : $*OSLogPrivacy.Mask          // id: %39
  dealloc_stack %36 : $*OSLogPrivacy.Mask         // id: %40
  %41 = integer_literal $Builtin.Int1, 0          // user: %42
  %42 = struct $Bool (%41 : $Builtin.Int1)        // user: %43
  br bb8(%42 : $Bool)                             // id: %43

bb7:                                              // Preds: bb5
  destroy_addr %36 : $*OSLogPrivacy.Mask          // id: %44
  dealloc_stack %36 : $*OSLogPrivacy.Mask         // id: %45
  %46 = integer_literal $Builtin.Int1, -1         // user: %47
  %47 = struct $Bool (%46 : $Builtin.Int1)        // user: %48
  br bb8(%47 : $Bool)                             // id: %48

// %49                                            // user: %51
bb8(%49 : $Bool):                                 // Preds: bb7 bb6
  destroy_addr %33 : $*OSLogPrivacy               // id: %50
  %51 = struct_extract %49 : $Bool, #Bool._value  // user: %53
  dealloc_stack %33 : $*OSLogPrivacy              // id: %52
  cond_br %51, bb10, bb9                          // id: %53

bb9:                                              // Preds: bb8
  br bb11                                         // id: %54

bb10:                                             // Preds: bb8
  // function_ref OSLogInterpolation.appendMaskArgument(_:)
  %55 = function_ref @$s2os18OSLogInterpolationV18appendMaskArgumentyyAA0B7PrivacyVF : $@convention(method) (@in_guaranteed OSLogPrivacy, @inout OSLogInterpolation) -> () // user: %56
  %56 = apply %55(%2, %3) : $@convention(method) (@in_guaranteed OSLogPrivacy, @inout OSLogInterpolation) -> ()
  br bb11                                         // id: %57

bb11:                                             // Preds: bb10 bb9
  // function_ref OSLogInterpolation.addStringHeaders(_:)
  %58 = function_ref @$s2os18OSLogInterpolationV16addStringHeadersyyAA0B7PrivacyVF : $@convention(method) (@in_guaranteed OSLogPrivacy, @inout OSLogInterpolation) -> () // user: %59
  %59 = apply %58(%2, %3) : $@convention(method) (@in_guaranteed OSLogPrivacy, @inout OSLogInterpolation) -> ()
  %60 = struct_element_addr %3 : $*OSLogInterpolation, #OSLogInterpolation.arguments // user: %62
  // function_ref OSLogArguments.append(_:)
  %61 = function_ref @$s2os14OSLogArgumentsV6appendyySSycF : $@convention(method) (@guaranteed @callee_guaranteed () -> @owned String, @inout OSLogArguments) -> () // user: %62
  %62 = apply %61(%0, %60) : $@convention(method) (@guaranteed @callee_guaranteed () -> @owned String, @inout OSLogArguments) -> ()
  %63 = integer_literal $Builtin.Int8, 1          // user: %68
  %64 = struct_element_addr %3 : $*OSLogInterpolation, #OSLogInterpolation.argumentCount // users: %73, %65
  %65 = struct_element_addr %64 : $*UInt8, #UInt8._value // user: %66
  %66 = load %65 : $*Builtin.Int8                 // user: %68
  %67 = integer_literal $Builtin.Int1, -1         // user: %68
  %68 = builtin "uadd_with_overflow_Int8"(%66 : $Builtin.Int8, %63 : $Builtin.Int8, %67 : $Builtin.Int1) : $(Builtin.Int8, Builtin.Int1) // users: %70, %69
  %69 = tuple_extract %68 : $(Builtin.Int8, Builtin.Int1), 0 // user: %72
  %70 = tuple_extract %68 : $(Builtin.Int8, Builtin.Int1), 1 // user: %71
  cond_fail %70 : $Builtin.Int1, "arithmetic overflow" // id: %71
  %72 = struct $UInt8 (%69 : $Builtin.Int8)       // user: %73
  store %72 to %64 : $*UInt8                      // id: %73
  %74 = tuple ()
  %75 = integer_literal $Builtin.Int64, 1         // user: %80
  %76 = struct_element_addr %3 : $*OSLogInterpolation, #OSLogInterpolation.stringArgumentCount // users: %85, %77
  %77 = struct_element_addr %76 : $*Int, #Int._value // user: %78
  %78 = load %77 : $*Builtin.Int64                // user: %80
  %79 = integer_literal $Builtin.Int1, -1         // user: %80
  %80 = builtin "sadd_with_overflow_Int64"(%78 : $Builtin.Int64, %75 : $Builtin.Int64, %79 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // users: %82, %81
  %81 = tuple_extract %80 : $(Builtin.Int64, Builtin.Int1), 0 // user: %84
  %82 = tuple_extract %80 : $(Builtin.Int64, Builtin.Int1), 1 // user: %83
  cond_fail %82 : $Builtin.Int1, "arithmetic overflow" // id: %83
  %84 = struct $Int (%81 : $Builtin.Int64)        // user: %85
  store %84 to %76 : $*Int                        // id: %85
  %86 = tuple ()
  br bb12                                         // id: %87

bb12:                                             // Preds: bb11 bb1
  %88 = tuple ()                                  // user: %89
  return %88 : $()                                // id: %89
} // end sil function '$s2os18OSLogInterpolationV06appendC0_5align7privacyySSyXA_AA0B15StringAlignmentVAA0B7PrivacyVtF'

// static OSLogStringAlignment.none.getter
sil public_external [available 11.0] [Onone] [_semantics "constant_evaluable"] @$s2os20OSLogStringAlignmentV4noneACvgZ : $@convention(method) (@thin OSLogStringAlignment.Type) -> @out OSLogStringAlignment {
// %0                                             // user: %20
bb0(%0 : $*OSLogStringAlignment, %1 : $@thin OSLogStringAlignment.Type):
  %2 = metatype $@thin OSLogCollectionBound.Type
  %3 = alloc_stack $OSLogCollectionBound          // users: %24, %16, %4
  inject_enum_addr %3 : $*OSLogCollectionBound, #OSLogCollectionBound.end!enumelt // id: %4
  %5 = enum $Optional<@callee_guaranteed () -> Int>, #Optional.none!enumelt // users: %21, %13, %10
  %6 = alloc_stack $OSLogStringAlignment          // users: %22, %20, %17, %11, %8
  %7 = enum $Optional<@callee_guaranteed () -> Int>, #Optional.none!enumelt // user: %9
  %8 = struct_element_addr %6 : $*OSLogStringAlignment, #OSLogStringAlignment.minimumColumnWidth // user: %9
  store %7 to %8 : $*Optional<@callee_guaranteed () -> Int> // id: %9
  retain_value %5 : $Optional<@callee_guaranteed () -> Int> // id: %10
  %11 = struct_element_addr %6 : $*OSLogStringAlignment, #OSLogStringAlignment.minimumColumnWidth // users: %13, %12
  %12 = load %11 : $*Optional<@callee_guaranteed () -> Int> // user: %14
  store %5 to %11 : $*Optional<@callee_guaranteed () -> Int> // id: %13
  release_value %12 : $Optional<@callee_guaranteed () -> Int> // id: %14
  %15 = alloc_stack $OSLogCollectionBound         // users: %19, %18, %16
  copy_addr [take] %3 to [initialization] %15 : $*OSLogCollectionBound // id: %16
  %17 = struct_element_addr %6 : $*OSLogStringAlignment, #OSLogStringAlignment.anchor // user: %18
  copy_addr [take] %15 to [initialization] %17 : $*OSLogCollectionBound // id: %18
  dealloc_stack %15 : $*OSLogCollectionBound      // id: %19
  copy_addr [take] %6 to [initialization] %0 : $*OSLogStringAlignment // id: %20
  release_value %5 : $Optional<@callee_guaranteed () -> Int> // id: %21
  dealloc_stack %6 : $*OSLogStringAlignment       // id: %22
  %23 = tuple ()
  dealloc_stack %3 : $*OSLogCollectionBound       // id: %24
  %25 = tuple ()                                  // user: %26
  return %25 : $()                                // id: %26
} // end sil function '$s2os20OSLogStringAlignmentV4noneACvgZ'

// thunk for @escaping @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout UnsafeMutablePointer<NSObject>?, @inout UnsafeMutablePointer<Any>?) -> (@out ())
sil shared_external [transparent] [reabstraction_thunk] @$sSpys5UInt8VGSpySo8NSObjectCGSgSpyypGSgytIeglllr_AcgIIeglll_TR : $@convention(thin) (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>, @guaranteed @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> @out ()) -> () {
// %0                                             // user: %5
// %1                                             // user: %5
// %2                                             // user: %5
// %3                                             // user: %5
bb0(%0 : $*UnsafeMutablePointer<UInt8>, %1 : $*Optional<UnsafeMutablePointer<NSObject>>, %2 : $*Optional<UnsafeMutablePointer<Any>>, %3 : $@callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> @out ()):
  %4 = alloc_stack $()                            // users: %7, %5
  %5 = apply %3(%4, %0, %1, %2) : $@callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> @out ()
  %6 = tuple ()                                   // user: %8
  dealloc_stack %4 : $*()                         // id: %7
  return %6 : $()                                 // id: %8
} // end sil function '$sSpys5UInt8VGSpySo8NSObjectCGSgSpyypGSgytIeglllr_AcgIIeglll_TR'

// UnsafeMutablePointer.deinitialize(count:)
sil public_external @$sSp12deinitialize5countSvSi_tF : $@convention(method) <Pointee> (Int, UnsafeMutablePointer<Pointee>) -> UnsafeMutableRawPointer {
// %0                                             // user: %4
// %1                                             // user: %3
bb0(%0 : $Int, %1 : $UnsafeMutablePointer<Pointee>):
  %2 = metatype $@thick Pointee.Type              // user: %6
  %3 = struct_extract %1 : $UnsafeMutablePointer<Pointee>, #UnsafeMutablePointer._rawValue // users: %7, %6
  %4 = struct_extract %0 : $Int, #Int._value      // user: %5
  %5 = builtin "truncOrBitCast_Int64_Word"(%4 : $Builtin.Int64) : $Builtin.Word // user: %6
  %6 = builtin "destroyArray"<Pointee>(%2 : $@thick Pointee.Type, %3 : $Builtin.RawPointer, %5 : $Builtin.Word) : $()
  %7 = struct $UnsafeMutableRawPointer (%3 : $Builtin.RawPointer) // user: %8
  return %7 : $UnsafeMutableRawPointer            // id: %8
} // end sil function '$sSp12deinitialize5countSvSi_tF'

// OSLogArguments.init()
sil public_external [available 11.0] [Onone] [_semantics "constant_evaluable"] @$s2os14OSLogArgumentsVACycfC : $@convention(method) (@thin OSLogArguments.Type) -> @owned OSLogArguments {
bb0(%0 : $@thin OSLogArguments.Type):
  %1 = alloc_stack $OSLogArguments                // users: %13, %12, %8
  %2 = integer_literal $Builtin.Word, 0           // user: %4
  // function_ref _allocateUninitializedArray<A>(_:)
  %3 = function_ref @$ss27_allocateUninitializedArrayySayxG_BptBwlF : $@convention(thin) <τ_0_0> (Builtin.Word) -> (@owned Array<τ_0_0>, Builtin.RawPointer) // user: %4
  %4 = apply %3<(inout UnsafeMutablePointer<UInt8>, inout Optional<UnsafeMutablePointer<NSObject>>, inout Optional<UnsafeMutablePointer<Any>>) -> ()>(%2) : $@convention(thin) <τ_0_0> (Builtin.Word) -> (@owned Array<τ_0_0>, Builtin.RawPointer) // users: %6, %5
  %5 = tuple_extract %4 : $(Array<(inout UnsafeMutablePointer<UInt8>, inout Optional<UnsafeMutablePointer<NSObject>>, inout Optional<UnsafeMutablePointer<Any>>) -> ()>, Builtin.RawPointer), 0 // users: %10, %9
  %6 = tuple_extract %4 : $(Array<(inout UnsafeMutablePointer<UInt8>, inout Optional<UnsafeMutablePointer<NSObject>>, inout Optional<UnsafeMutablePointer<Any>>) -> ()>, Builtin.RawPointer), 1 // user: %7
  %7 = pointer_to_address %6 : $Builtin.RawPointer to [strict] $*@callee_guaranteed @substituted <τ_0_0, τ_0_1, τ_0_2, τ_0_3> (@inout τ_0_0, @inout τ_0_1, @inout τ_0_2) -> @out τ_0_3 for <UnsafeMutablePointer<UInt8>, Optional<UnsafeMutablePointer<NSObject>>, Optional<UnsafeMutablePointer<Any>>, ()>
  %8 = struct_element_addr %1 : $*OSLogArguments, #OSLogArguments.argumentClosures // user: %9
  store %5 to %8 : $*Array<(inout UnsafeMutablePointer<UInt8>, inout Optional<UnsafeMutablePointer<NSObject>>, inout Optional<UnsafeMutablePointer<Any>>) -> ()> // id: %9
  %10 = struct $OSLogArguments (%5 : $Array<(inout UnsafeMutablePointer<UInt8>, inout Optional<UnsafeMutablePointer<NSObject>>, inout Optional<UnsafeMutablePointer<Any>>) -> ()>) // users: %14, %11
  retain_value %10 : $OSLogArguments              // id: %11
  destroy_addr %1 : $*OSLogArguments              // id: %12
  dealloc_stack %1 : $*OSLogArguments             // id: %13
  return %10 : $OSLogArguments                    // id: %14
} // end sil function '$s2os14OSLogArgumentsVACycfC'

// _allocateUninitializedArray<A>(_:)
sil public_external [always_inline] [_semantics "array.uninitialized_intrinsic"] @$ss27_allocateUninitializedArrayySayxG_BptBwlF : $@convention(thin) <Element> (Builtin.Word) -> (@owned Array<Element>, Builtin.RawPointer) {
// %0                                             // users: %13, %1
bb0(%0 : $Builtin.Word):
  %1 = builtin "sextOrBitCast_Word_Int64"(%0 : $Builtin.Word) : $Builtin.Int64 // users: %4, %2
  %2 = struct $Int (%1 : $Builtin.Int64)          // users: %16, %8
  %3 = integer_literal $Builtin.Int64, 0          // user: %4
  %4 = builtin "cmp_slt_Int64"(%3 : $Builtin.Int64, %1 : $Builtin.Int64) : $Builtin.Int1 // user: %5
  cond_br %4, bb2, bb1                            // id: %5

bb1:                                              // Preds: bb0
  %6 = metatype $@thin Array<Element>.Type        // user: %8
  // function_ref static Array._allocateUninitialized(_:)
  %7 = function_ref @$sSa22_allocateUninitializedySayxG_SpyxGtSiFZ : $@convention(method) <τ_0_0> (Int, @thin Array<τ_0_0>.Type) -> (@owned Array<τ_0_0>, UnsafeMutablePointer<τ_0_0>) // user: %8
  %8 = apply %7<Element>(%2, %6) : $@convention(method) <τ_0_0> (Int, @thin Array<τ_0_0>.Type) -> (@owned Array<τ_0_0>, UnsafeMutablePointer<τ_0_0>) // users: %10, %9
  %9 = tuple_extract %8 : $(Array<Element>, UnsafeMutablePointer<Element>), 0 // user: %12
  %10 = tuple_extract %8 : $(Array<Element>, UnsafeMutablePointer<Element>), 1 // user: %11
  %11 = struct_extract %10 : $UnsafeMutablePointer<Element>, #UnsafeMutablePointer._rawValue // user: %12
  br bb3(%9 : $Array<Element>, %11 : $Builtin.RawPointer) // id: %12

bb2:                                              // Preds: bb0
  %13 = alloc_ref [tail_elems $Element * %0 : $Builtin.Word] $_ContiguousArrayStorage<Element> // users: %17, %16
  %14 = metatype $@thin Array<Element>.Type       // user: %16
  // function_ref specialized static Array._adoptStorage(_:count:)
  %15 = function_ref @$sSa13_adoptStorage_5countSayxG_SpyxGts016_ContiguousArrayB0CyxGn_SitFZTf4gnn_n : $@convention(method) <τ_0_0> (@guaranteed _ContiguousArrayStorage<τ_0_0>, Int, @thin Array<τ_0_0>.Type) -> (@owned Array<τ_0_0>, UnsafeMutablePointer<τ_0_0>) // user: %16
  %16 = apply %15<Element>(%13, %2, %14) : $@convention(method) <τ_0_0> (@guaranteed _ContiguousArrayStorage<τ_0_0>, Int, @thin Array<τ_0_0>.Type) -> (@owned Array<τ_0_0>, UnsafeMutablePointer<τ_0_0>) // users: %19, %18
  strong_release %13 : $_ContiguousArrayStorage<Element> // id: %17
  %18 = tuple_extract %16 : $(Array<Element>, UnsafeMutablePointer<Element>), 0 // user: %21
  %19 = tuple_extract %16 : $(Array<Element>, UnsafeMutablePointer<Element>), 1 // user: %20
  %20 = struct_extract %19 : $UnsafeMutablePointer<Element>, #UnsafeMutablePointer._rawValue // user: %21
  br bb3(%18 : $Array<Element>, %20 : $Builtin.RawPointer) // id: %21

// %22                                            // user: %24
// %23                                            // user: %24
bb3(%22 : $Array<Element>, %23 : $Builtin.RawPointer): // Preds: bb2 bb1
  %24 = tuple (%22 : $Array<Element>, %23 : $Builtin.RawPointer) // user: %25
  return %24 : $(Array<Element>, Builtin.RawPointer) // id: %25
} // end sil function '$ss27_allocateUninitializedArrayySayxG_BptBwlF'

// static Array._allocateUninitialized(_:)
sil public_external [_semantics "array.uninitialized"] @$sSa22_allocateUninitializedySayxG_SpyxGtSiFZ : $@convention(method) <Element> (Int, @thin Array<Element>.Type) -> (@owned Array<Element>, UnsafeMutablePointer<Element>) {
// %0                                             // user: %3
// %1                                             // user: %3
bb0(%0 : $Int, %1 : $@thin Array<Element>.Type):
  // function_ref Array.init(_uninitializedCount:)
  %2 = function_ref @$sSa19_uninitializedCountSayxGSi_tcfC : $@convention(method) <τ_0_0> (Int, @thin Array<τ_0_0>.Type) -> @owned Array<τ_0_0> // user: %3
  %3 = apply %2<Element>(%0, %1) : $@convention(method) <τ_0_0> (Int, @thin Array<τ_0_0>.Type) -> @owned Array<τ_0_0> // users: %10, %11, %4
  %4 = struct_extract %3 : $Array<Element>, #Array._buffer // users: %9, %6
  // function_ref _ArrayBuffer.firstElementAddress.getter
  %5 = function_ref @$ss12_ArrayBufferV19firstElementAddressSpyxGvg : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> UnsafeMutablePointer<τ_0_0> // user: %9
  %6 = struct_extract %4 : $_ArrayBuffer<Element>, #_ArrayBuffer._storage // user: %7
  %7 = struct_extract %6 : $_BridgeStorage<__ContiguousArrayStorageBase>, #_BridgeStorage.rawValue // user: %8
  strong_retain %7 : $Builtin.BridgeObject        // id: %8
  %9 = apply %5<Element>(%4) : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> UnsafeMutablePointer<τ_0_0> // user: %11
  release_value %3 : $Array<Element>              // id: %10
  %11 = tuple (%3 : $Array<Element>, %9 : $UnsafeMutablePointer<Element>) // user: %12
  return %11 : $(Array<Element>, UnsafeMutablePointer<Element>) // id: %12
} // end sil function '$sSa22_allocateUninitializedySayxG_SpyxGtSiFZ'

// Array.init(_uninitializedCount:)
sil public_external @$sSa19_uninitializedCountSayxGSi_tcfC : $@convention(method) <Element> (Int, @thin Array<Element>.Type) -> @owned Array<Element> {
// %0                                             // users: %21, %17, %4
// %1                                             // user: %17
bb0(%0 : $Int, %1 : $@thin Array<Element>.Type):
  %2 = alloc_stack $_ArrayBuffer<Element>         // users: %25, %23, %21, %18, %10
  %3 = integer_literal $Builtin.Int64, 0          // users: %11, %5
  %4 = struct_extract %0 : $Int, #Int._value      // users: %11, %5
  %5 = builtin "cmp_slt_Int64"(%4 : $Builtin.Int64, %3 : $Builtin.Int64) : $Builtin.Int1 // user: %6
  cond_fail %5 : $Builtin.Int1, "Can't construct Array with count < 0" // id: %6
  %7 = metatype $@thin _ArrayBuffer<Element>.Type // user: %9
  // function_ref specialized _ArrayBuffer.init()
  %8 = function_ref @$ss12_ArrayBufferVAByxGycfCTf4n_g : $@convention(method) <τ_0_0> (@thin _ArrayBuffer<τ_0_0>.Type) -> _ArrayBuffer<τ_0_0> // user: %9
  %9 = apply %8<Element>(%7) : $@convention(method) <τ_0_0> (@thin _ArrayBuffer<τ_0_0>.Type) -> _ArrayBuffer<τ_0_0> // users: %19, %13, %16, %10
  store %9 to %2 : $*_ArrayBuffer<Element>        // id: %10
  %11 = builtin "cmp_slt_Int64"(%3 : $Builtin.Int64, %4 : $Builtin.Int64) : $Builtin.Int1 // user: %12
  cond_br %11, bb2, bb1                           // id: %12

bb1:                                              // Preds: bb0
  retain_value %9 : $_ArrayBuffer<Element>        // id: %13
  br bb3                                          // id: %14

bb2:                                              // Preds: bb0
  // function_ref static Array._allocateBufferUninitialized(minimumCapacity:)
  %15 = function_ref @$sSa28_allocateBufferUninitialized15minimumCapacitys06_ArrayB0VyxGSi_tFZ : $@convention(method) <τ_0_0> (Int, @thin Array<τ_0_0>.Type) -> @owned _ArrayBuffer<τ_0_0> // user: %17
  retain_value %9 : $_ArrayBuffer<Element>        // id: %16
  %17 = apply %15<Element>(%0, %1) : $@convention(method) <τ_0_0> (Int, @thin Array<τ_0_0>.Type) -> @owned _ArrayBuffer<τ_0_0> // user: %18
  store %17 to %2 : $*_ArrayBuffer<Element>       // id: %18
  release_value %9 : $_ArrayBuffer<Element>       // id: %19
  // function_ref _ArrayBuffer.count.setter
  %20 = function_ref @$ss12_ArrayBufferV5countSivs : $@convention(method) <τ_0_0> (Int, @inout _ArrayBuffer<τ_0_0>) -> () // user: %21
  %21 = apply %20<Element>(%0, %2) : $@convention(method) <τ_0_0> (Int, @inout _ArrayBuffer<τ_0_0>) -> ()
  br bb3                                          // id: %22

bb3:                                              // Preds: bb1 bb2
  %23 = load %2 : $*_ArrayBuffer<Element>         // user: %24
  %24 = struct $Array<Element> (%23 : $_ArrayBuffer<Element>) // user: %26
  dealloc_stack %2 : $*_ArrayBuffer<Element>      // id: %25
  return %24 : $Array<Element>                    // id: %26
} // end sil function '$sSa19_uninitializedCountSayxGSi_tcfC'

// _ArrayBuffer.firstElementAddress.getter
sil public_external @$ss12_ArrayBufferV19firstElementAddressSpyxGvg : $@convention(method) <Element> (@guaranteed _ArrayBuffer<Element>) -> UnsafeMutablePointer<Element> {
// %0                                             // user: %2
bb0(%0 : $_ArrayBuffer<Element>):
  // function_ref _ArrayBuffer._native.getter
  %1 = function_ref @$ss12_ArrayBufferV7_natives011_ContiguousaB0VyxGvg : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> @owned _ContiguousArrayBuffer<τ_0_0> // user: %2
  %2 = apply %1<Element>(%0) : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> @owned _ContiguousArrayBuffer<τ_0_0> // users: %5, %4
  // function_ref _ContiguousArrayBuffer.firstElementAddress.getter
  %3 = function_ref @$ss22_ContiguousArrayBufferV19firstElementAddressSpyxGvg : $@convention(method) <τ_0_0> (@guaranteed _ContiguousArrayBuffer<τ_0_0>) -> UnsafeMutablePointer<τ_0_0> // user: %4
  %4 = apply %3<Element>(%2) : $@convention(method) <τ_0_0> (@guaranteed _ContiguousArrayBuffer<τ_0_0>) -> UnsafeMutablePointer<τ_0_0> // user: %6
  release_value %2 : $_ContiguousArrayBuffer<Element> // id: %5
  return %4 : $UnsafeMutablePointer<Element>      // id: %6
} // end sil function '$ss12_ArrayBufferV19firstElementAddressSpyxGvg'

// __ContiguousArrayStorageBase.__allocating_init()
sil public_external [exact_self_class] @$ss28__ContiguousArrayStorageBaseCABycfC : $@convention(method) (@thick __ContiguousArrayStorageBase.Type) -> @owned __ContiguousArrayStorageBase {
bb0(%0 : $@thick __ContiguousArrayStorageBase.Type):
  %1 = alloc_ref $__ContiguousArrayStorageBase    // user: %3
  // function_ref __ContiguousArrayStorageBase.init()
  %2 = function_ref @$ss28__ContiguousArrayStorageBaseCABycfc : $@convention(method) (@owned __ContiguousArrayStorageBase) -> @owned __ContiguousArrayStorageBase // user: %3
  %3 = apply %2(%1) : $@convention(method) (@owned __ContiguousArrayStorageBase) -> @owned __ContiguousArrayStorageBase // user: %4
  return %3 : $__ContiguousArrayStorageBase       // id: %4
} // end sil function '$ss28__ContiguousArrayStorageBaseCABycfC'

// _ContiguousArrayStorage.__allocating_init(_doNotCallMeBase:)
sil public_external [exact_self_class] @$ss23_ContiguousArrayStorageC16_doNotCallMeBaseAByxGyt_tcfC : $@convention(method) <Element> (@thick _ContiguousArrayStorage<Element>.Type) -> @owned _ContiguousArrayStorage<Element> {
bb0(%0 : $@thick _ContiguousArrayStorage<Element>.Type):
  %1 = alloc_ref $_ContiguousArrayStorage<Element> // user: %3
  // function_ref _ContiguousArrayStorage.init(_doNotCallMeBase:)
  %2 = function_ref @$ss23_ContiguousArrayStorageC16_doNotCallMeBaseAByxGyt_tcfc : $@convention(method) <τ_0_0> (@owned _ContiguousArrayStorage<τ_0_0>) -> @owned _ContiguousArrayStorage<τ_0_0> // user: %3
  %3 = apply %2<Element>(%1) : $@convention(method) <τ_0_0> (@owned _ContiguousArrayStorage<τ_0_0>) -> @owned _ContiguousArrayStorage<τ_0_0> // user: %4
  return %3 : $_ContiguousArrayStorage<Element>   // id: %4
} // end sil function '$ss23_ContiguousArrayStorageC16_doNotCallMeBaseAByxGyt_tcfC'

// _ContiguousArrayStorage.canStoreElements(ofDynamicType:)
sil public_external @$ss23_ContiguousArrayStorageC16canStoreElements13ofDynamicTypeSbypXp_tF : $@convention(method) <Element> (@thick Any.Type, @guaranteed _ContiguousArrayStorage<Element>) -> Bool {
// %0                                             // user: %2
bb0(%0 : $@thick Any.Type, %1 : $_ContiguousArrayStorage<Element>):
  checked_cast_br %0 : $@thick Any.Type to Element.Type, bb2, bb1 // id: %2

bb1:                                              // Preds: bb0
  %3 = integer_literal $Builtin.Int1, 0           // user: %4
  br bb3(%3 : $Builtin.Int1)                      // id: %4

bb2(%5 : $@thick Element.Type):                   // Preds: bb0
  %6 = integer_literal $Builtin.Int1, -1          // user: %7
  br bb3(%6 : $Builtin.Int1)                      // id: %7

// %8                                             // user: %9
bb3(%8 : $Builtin.Int1):                          // Preds: bb2 bb1
  %9 = struct $Bool (%8 : $Builtin.Int1)          // user: %10
  return %9 : $Bool                               // id: %10
} // end sil function '$ss23_ContiguousArrayStorageC16canStoreElements13ofDynamicTypeSbypXp_tF'

// _ContiguousArrayStorage.staticElementType.getter
sil public_external @$ss23_ContiguousArrayStorageC17staticElementTypeypXpvg : $@convention(method) <Element> (@guaranteed _ContiguousArrayStorage<Element>) -> @thick Any.Type {
bb0(%0 : $_ContiguousArrayStorage<Element>):
  %1 = metatype $@thick Element.Type              // user: %2
  %2 = init_existential_metatype %1 : $@thick Element.Type, $@thick Any.Type // user: %3
  return %2 : $@thick Any.Type                    // id: %3
} // end sil function '$ss23_ContiguousArrayStorageC17staticElementTypeypXpvg'

// _ContiguousArrayStorage.__deallocating_deinit
sil public_external @$ss23_ContiguousArrayStorageCfD : $@convention(method) <Element> (@owned _ContiguousArrayStorage<Element>) -> () {
// %0                                             // user: %2
bb0(%0 : $_ContiguousArrayStorage<Element>):
  // function_ref _ContiguousArrayStorage.deinit
  %1 = function_ref @$ss23_ContiguousArrayStorageCfd : $@convention(method) <τ_0_0> (@guaranteed _ContiguousArrayStorage<τ_0_0>) -> @owned Builtin.NativeObject // user: %2
  %2 = apply %1<Element>(%0) : $@convention(method) <τ_0_0> (@guaranteed _ContiguousArrayStorage<τ_0_0>) -> @owned Builtin.NativeObject // user: %3
  %3 = unchecked_ref_cast %2 : $Builtin.NativeObject to $_ContiguousArrayStorage<Element> // user: %4
  dealloc_ref %3 : $_ContiguousArrayStorage<Element> // id: %4
  %5 = tuple ()                                   // user: %6
  return %5 : $()                                 // id: %6
} // end sil function '$ss23_ContiguousArrayStorageCfD'

// __ContiguousArrayStorageBase.init()
sil @$ss28__ContiguousArrayStorageBaseCABycfc : $@convention(method) (@owned __ContiguousArrayStorageBase) -> @owned __ContiguousArrayStorageBase

// _ContiguousArrayStorage.init(_doNotCallMeBase:)
sil @$ss23_ContiguousArrayStorageC16_doNotCallMeBaseAByxGyt_tcfc : $@convention(method) <τ_0_0> (@owned _ContiguousArrayStorage<τ_0_0>) -> @owned _ContiguousArrayStorage<τ_0_0>

// _ContiguousArrayStorage.deinit
sil public_external @$ss23_ContiguousArrayStorageCfd : $@convention(method) <Element> (@guaranteed _ContiguousArrayStorage<Element>) -> @owned Builtin.NativeObject {
// %0                                             // users: %14, %13, %3, %2
bb0(%0 : $_ContiguousArrayStorage<Element>):
  // function_ref _ContiguousArrayStorage._elementPointer.getter
  %1 = function_ref @$ss23_ContiguousArrayStorageC15_elementPointerSpyxGvg : $@convention(method) <τ_0_0> (@guaranteed _ContiguousArrayStorage<τ_0_0>) -> UnsafeMutablePointer<τ_0_0> // user: %2
  %2 = apply %1<Element>(%0) : $@convention(method) <τ_0_0> (@guaranteed _ContiguousArrayStorage<τ_0_0>) -> UnsafeMutablePointer<τ_0_0> // user: %12
  %3 = upcast %0 : $_ContiguousArrayStorage<Element> to $__ContiguousArrayStorageBase // user: %4
  %4 = ref_element_addr %3 : $__ContiguousArrayStorageBase, #__ContiguousArrayStorageBase.countAndCapacity // user: %5
  %5 = struct_element_addr %4 : $*_ArrayBody, #_ArrayBody._storage // user: %6
  %6 = struct_element_addr %5 : $*_SwiftArrayBodyStorage, #_SwiftArrayBodyStorage.count // user: %7
  %7 = struct_element_addr %6 : $*Int, #Int._value // user: %8
  %8 = load %7 : $*Builtin.Int64                  // user: %9
  %9 = builtin "assumeNonNegative_Int64"(%8 : $Builtin.Int64) : $Builtin.Int64 // user: %10
  %10 = struct $Int (%9 : $Builtin.Int64)         // user: %12
  // function_ref UnsafeMutablePointer.deinitialize(count:)
  %11 = function_ref @$sSp12deinitialize5countSvSi_tF : $@convention(method) <τ_0_0> (Int, UnsafeMutablePointer<τ_0_0>) -> UnsafeMutableRawPointer // user: %12
  %12 = apply %11<Element>(%10, %2) : $@convention(method) <τ_0_0> (Int, UnsafeMutablePointer<τ_0_0>) -> UnsafeMutableRawPointer
  fix_lifetime %0 : $_ContiguousArrayStorage<Element> // id: %13
  %14 = unchecked_ref_cast %0 : $_ContiguousArrayStorage<Element> to $Builtin.NativeObject // user: %15
  return %14 : $Builtin.NativeObject              // id: %15
} // end sil function '$ss23_ContiguousArrayStorageCfd'

// Array.init(_buffer:)
sil public_external @$sSa7_bufferSayxGs12_ArrayBufferVyxG_tcfC : $@convention(method) <Element> (@owned _ArrayBuffer<Element>, @thin Array<Element>.Type) -> @owned Array<Element> {
// %0                                             // user: %2
bb0(%0 : $_ArrayBuffer<Element>, %1 : $@thin Array<Element>.Type):
  %2 = struct $Array<Element> (%0 : $_ArrayBuffer<Element>) // user: %3
  return %2 : $Array<Element>                     // id: %3
} // end sil function '$sSa7_bufferSayxGs12_ArrayBufferVyxG_tcfC'

// _ContiguousArrayBuffer.firstElementAddress.getter
sil public_external @$ss22_ContiguousArrayBufferV19firstElementAddressSpyxGvg : $@convention(method) <Element> (@guaranteed _ContiguousArrayBuffer<Element>) -> UnsafeMutablePointer<Element> {
// %0                                             // user: %1
bb0(%0 : $_ContiguousArrayBuffer<Element>):
  %1 = struct_extract %0 : $_ContiguousArrayBuffer<Element>, #_ContiguousArrayBuffer._storage // user: %2
  %2 = ref_tail_addr %1 : $__ContiguousArrayStorageBase, $Element // user: %3
  %3 = address_to_pointer %2 : $*Element to $Builtin.RawPointer // user: %4
  %4 = struct $UnsafeMutablePointer<Element> (%3 : $Builtin.RawPointer) // user: %5
  return %4 : $UnsafeMutablePointer<Element>      // id: %5
} // end sil function '$ss22_ContiguousArrayBufferV19firstElementAddressSpyxGvg'

// _ContiguousArrayBuffer._initStorageHeader(count:capacity:)
sil public_external @$ss22_ContiguousArrayBufferV18_initStorageHeader5count8capacityySi_SitF : $@convention(method) <Element> (Int, Int, @guaranteed _ContiguousArrayBuffer<Element>) -> () {
// %0                                             // user: %18
// %1                                             // user: %14
// %2                                             // user: %13
bb0(%0 : $Int, %1 : $Int, %2 : $_ContiguousArrayBuffer<Element>):
  %3 = metatype $@thick Element.Type              // user: %5
  // function_ref _isBridgedVerbatimToObjectiveC<A>(_:)
  %4 = function_ref @$ss30_isBridgedVerbatimToObjectiveCySbxmlF : $@convention(thin) <τ_0_0> (@thick τ_0_0.Type) -> Bool // user: %5
  %5 = apply %4<Element>(%3) : $@convention(thin) <τ_0_0> (@thick τ_0_0.Type) -> Bool // user: %7
  %6 = integer_literal $Builtin.Int64, 1          // users: %11, %15
  %7 = struct_extract %5 : $Bool, #Bool._value    // user: %8
  cond_br %7, bb2, bb1                            // id: %8

bb1:                                              // Preds: bb0
  %9 = integer_literal $Builtin.Int64, 0          // user: %10
  br bb3(%9 : $Builtin.Int64)                     // id: %10

bb2:                                              // Preds: bb0
  br bb3(%6 : $Builtin.Int64)                     // id: %11

// %12                                            // user: %16
bb3(%12 : $Builtin.Int64):                        // Preds: bb2 bb1
  %13 = struct_extract %2 : $_ContiguousArrayBuffer<Element>, #_ContiguousArrayBuffer._storage // user: %20
  %14 = struct_extract %1 : $Int, #Int._value     // user: %15
  %15 = builtin "shl_Int64"(%14 : $Builtin.Int64, %6 : $Builtin.Int64) : $Builtin.Int64 // user: %16
  %16 = builtin "or_Int64"(%15 : $Builtin.Int64, %12 : $Builtin.Int64) : $Builtin.Int64 // user: %17
  %17 = struct $UInt (%16 : $Builtin.Int64)       // user: %18
  %18 = struct $_SwiftArrayBodyStorage (%0 : $Int, %17 : $UInt) // user: %19
  %19 = struct $_ArrayBody (%18 : $_SwiftArrayBodyStorage) // user: %21
  %20 = ref_element_addr %13 : $__ContiguousArrayStorageBase, #__ContiguousArrayStorageBase.countAndCapacity // user: %21
  store %19 to %20 : $*_ArrayBody                 // id: %21
  %22 = tuple ()                                  // user: %23
  return %22 : $()                                // id: %23
} // end sil function '$ss22_ContiguousArrayBufferV18_initStorageHeader5count8capacityySi_SitF'

// _isBridgedVerbatimToObjectiveC<A>(_:)
sil public_external @$ss30_isBridgedVerbatimToObjectiveCySbxmlF : $@convention(thin) <T> (@thick T.Type) -> Bool {
bb0(%0 : $@thick T.Type):
  %1 = metatype $@thick T.Type                    // users: %10, %2
  %2 = builtin "canBeClass"<T>(%1 : $@thick T.Type) : $Builtin.Int8 // users: %7, %4
  %3 = integer_literal $Builtin.Int8, 0           // user: %4
  %4 = builtin "cmp_eq_Int8"(%2 : $Builtin.Int8, %3 : $Builtin.Int8) : $Builtin.Int1 // user: %5
  cond_br %4, bb4, bb1                            // id: %5

bb1:                                              // Preds: bb0
  %6 = integer_literal $Builtin.Int8, 1           // user: %7
  %7 = builtin "cmp_eq_Int8"(%2 : $Builtin.Int8, %6 : $Builtin.Int8) : $Builtin.Int1 // user: %8
  cond_br %7, bb3, bb2                            // id: %8

bb2:                                              // Preds: bb1
  // function_ref _swift_isClassOrObjCExistentialType
  %9 = function_ref @_swift_isClassOrObjCExistentialType : $@convention(thin) <τ_0_0> (@thick τ_0_0.Type) -> Bool // user: %10
  %10 = apply %9<T>(%1) : $@convention(thin) <τ_0_0> (@thick τ_0_0.Type) -> Bool // user: %11
  br bb5(%10 : $Bool)                             // id: %11

bb3:                                              // Preds: bb1
  %12 = integer_literal $Builtin.Int1, -1         // user: %13
  %13 = struct $Bool (%12 : $Builtin.Int1)        // user: %14
  br bb5(%13 : $Bool)                             // id: %14

bb4:                                              // Preds: bb0
  %15 = integer_literal $Builtin.Int1, 0          // user: %16
  %16 = struct $Bool (%15 : $Builtin.Int1)        // user: %17
  br bb5(%16 : $Bool)                             // id: %17

// %18                                            // user: %19
bb5(%18 : $Bool):                                 // Preds: bb4 bb3 bb2
  return %18 : $Bool                              // id: %19
} // end sil function '$ss30_isBridgedVerbatimToObjectiveCySbxmlF'

// _swift_isClassOrObjCExistentialType
sil @_swift_isClassOrObjCExistentialType : $@convention(thin) <τ_0_0> (@thick τ_0_0.Type) -> Bool

// _ContiguousArrayStorage._elementPointer.getter
sil public_external @$ss23_ContiguousArrayStorageC15_elementPointerSpyxGvg : $@convention(method) <Element> (@guaranteed _ContiguousArrayStorage<Element>) -> UnsafeMutablePointer<Element> {
// %0                                             // user: %1
bb0(%0 : $_ContiguousArrayStorage<Element>):
  %1 = ref_tail_addr %0 : $_ContiguousArrayStorage<Element>, $Element // user: %2
  %2 = address_to_pointer %1 : $*Element to $Builtin.RawPointer // user: %3
  %3 = struct $UnsafeMutablePointer<Element> (%2 : $Builtin.RawPointer) // user: %4
  return %3 : $UnsafeMutablePointer<Element>      // id: %4
} // end sil function '$ss23_ContiguousArrayStorageC15_elementPointerSpyxGvg'

// __ContiguousArrayStorageBase.__allocating_init(_doNotCallMeBase:)
sil public_external [exact_self_class] @$ss28__ContiguousArrayStorageBaseC012_doNotCallMeD0AByt_tcfC : $@convention(method) (@thick __ContiguousArrayStorageBase.Type) -> @owned __ContiguousArrayStorageBase {
bb0(%0 : $@thick __ContiguousArrayStorageBase.Type):
  unreachable                                     // id: %1
} // end sil function '$ss28__ContiguousArrayStorageBaseC012_doNotCallMeD0AByt_tcfC'

// __ContiguousArrayStorageBase.canStoreElements(ofDynamicType:)
sil public_external @$ss28__ContiguousArrayStorageBaseC16canStoreElements13ofDynamicTypeSbypXp_tF : $@convention(method) (@thick Any.Type, @guaranteed __ContiguousArrayStorageBase) -> Bool {
bb0(%0 : $@thick Any.Type, %1 : $__ContiguousArrayStorageBase):
  unreachable                                     // id: %2
} // end sil function '$ss28__ContiguousArrayStorageBaseC16canStoreElements13ofDynamicTypeSbypXp_tF'

// __ContiguousArrayStorageBase.staticElementType.getter
sil public_external @$ss28__ContiguousArrayStorageBaseC17staticElementTypeypXpvg : $@convention(method) (@guaranteed __ContiguousArrayStorageBase) -> @thick Any.Type {
bb0(%0 : $__ContiguousArrayStorageBase):
  unreachable                                     // id: %1
} // end sil function '$ss28__ContiguousArrayStorageBaseC17staticElementTypeypXpvg'

// __ContiguousArrayStorageBase.__deallocating_deinit
sil public_external @$ss28__ContiguousArrayStorageBaseCfD : $@convention(method) (@owned __ContiguousArrayStorageBase) -> () {
// %0                                             // user: %1
bb0(%0 : $__ContiguousArrayStorageBase):
  dealloc_ref %0 : $__ContiguousArrayStorageBase  // id: %1
  %2 = tuple ()                                   // user: %3
  return %2 : $()                                 // id: %3
} // end sil function '$ss28__ContiguousArrayStorageBaseCfD'

// static Array._allocateBufferUninitialized(minimumCapacity:)
sil [noinline] @$sSa28_allocateBufferUninitialized15minimumCapacitys06_ArrayB0VyxGSi_tFZ : $@convention(method) <τ_0_0> (Int, @thin Array<τ_0_0>.Type) -> @owned _ArrayBuffer<τ_0_0>

// _ArrayBuffer.count.setter
sil public_external @$ss12_ArrayBufferV5countSivs : $@convention(method) <Element> (Int, @inout _ArrayBuffer<Element>) -> () {
// %0                                             // user: %6
// %1                                             // user: %2
bb0(%0 : $Int, %1 : $*_ArrayBuffer<Element>):
  %2 = load %1 : $*_ArrayBuffer<Element>          // user: %4
  // function_ref _ArrayBuffer._native.getter
  %3 = function_ref @$ss12_ArrayBufferV7_natives011_ContiguousaB0VyxGvg : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> @owned _ContiguousArrayBuffer<τ_0_0> // user: %4
  %4 = apply %3<Element>(%2) : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> @owned _ContiguousArrayBuffer<τ_0_0> // users: %7, %6
  // function_ref _ContiguousArrayBuffer.count.setter
  %5 = function_ref @$ss22_ContiguousArrayBufferV5countSivs : $@convention(method) <τ_0_0> (Int, @guaranteed _ContiguousArrayBuffer<τ_0_0>) -> () // user: %6
  %6 = apply %5<Element>(%0, %4) : $@convention(method) <τ_0_0> (Int, @guaranteed _ContiguousArrayBuffer<τ_0_0>) -> ()
  release_value %4 : $_ContiguousArrayBuffer<Element> // id: %7
  %8 = tuple ()                                   // user: %9
  return %8 : $()                                 // id: %9
} // end sil function '$ss12_ArrayBufferV5countSivs'

// _ArrayBuffer._native.getter
sil public_external @$ss12_ArrayBufferV7_natives011_ContiguousaB0VyxGvg : $@convention(method) <Element> (@guaranteed _ArrayBuffer<Element>) -> @owned _ContiguousArrayBuffer<Element> {
// %0                                             // users: %33, %25, %21
bb0(%0 : $_ArrayBuffer<Element>):
  %1 = metatype $@thick Element.Type              // users: %10, %2
  %2 = builtin "canBeClass"<Element>(%1 : $@thick Element.Type) : $Builtin.Int8 // users: %7, %4
  %3 = integer_literal $Builtin.Int8, 0           // user: %4
  %4 = builtin "cmp_eq_Int8"(%2 : $Builtin.Int8, %3 : $Builtin.Int8) : $Builtin.Int1 // user: %5
  cond_br %4, bb4, bb1                            // id: %5

bb1:                                              // Preds: bb0
  %6 = integer_literal $Builtin.Int8, 1           // user: %7
  %7 = builtin "cmp_eq_Int8"(%2 : $Builtin.Int8, %6 : $Builtin.Int8) : $Builtin.Int1 // user: %8
  cond_br %7, bb3, bb2                            // id: %8

bb2:                                              // Preds: bb1
  // function_ref _swift_isClassOrObjCExistentialType
  %9 = function_ref @_swift_isClassOrObjCExistentialType : $@convention(thin) <τ_0_0> (@thick τ_0_0.Type) -> Bool // user: %10
  %10 = apply %9<Element>(%1) : $@convention(thin) <τ_0_0> (@thick τ_0_0.Type) -> Bool // user: %11
  br bb5(%10 : $Bool)                             // id: %11

bb3:                                              // Preds: bb1
  %12 = integer_literal $Builtin.Int1, -1         // user: %13
  %13 = struct $Bool (%12 : $Builtin.Int1)        // user: %14
  br bb5(%13 : $Bool)                             // id: %14

bb4:                                              // Preds: bb0
  %15 = integer_literal $Builtin.Int1, 0          // user: %16
  %16 = struct $Bool (%15 : $Builtin.Int1)        // user: %17
  br bb5(%16 : $Bool)                             // id: %17

// %18                                            // user: %19
bb5(%18 : $Bool):                                 // Preds: bb4 bb3 bb2
  %19 = struct_extract %18 : $Bool, #Bool._value  // user: %20
  cond_br %19, bb7, bb6                           // id: %20

bb6:                                              // Preds: bb5
  %21 = struct_extract %0 : $_ArrayBuffer<Element>, #_ArrayBuffer._storage // user: %22
  %22 = struct_extract %21 : $_BridgeStorage<__ContiguousArrayStorageBase>, #_BridgeStorage.rawValue // user: %23
  %23 = unchecked_ref_cast %22 : $Builtin.BridgeObject to $__ContiguousArrayStorageBase // user: %24
  br bb8(%23 : $__ContiguousArrayStorageBase)     // id: %24

bb7:                                              // Preds: bb5
  %25 = struct_extract %0 : $_ArrayBuffer<Element>, #_ArrayBuffer._storage // user: %26
  %26 = struct_extract %25 : $_BridgeStorage<__ContiguousArrayStorageBase>, #_BridgeStorage.rawValue // user: %27
  %27 = bridge_object_to_ref %26 : $Builtin.BridgeObject to $__ContiguousArrayStorageBase // user: %28
  br bb8(%27 : $__ContiguousArrayStorageBase)     // id: %28

// %29                                            // user: %32
bb8(%29 : $__ContiguousArrayStorageBase):         // Preds: bb7 bb6
  %30 = metatype $@thin _ContiguousArrayBuffer<Element>.Type // user: %32
  // function_ref _ContiguousArrayBuffer.init(_:)
  %31 = function_ref @$ss22_ContiguousArrayBufferVyAByxGs02__aB11StorageBaseCcfC : $@convention(method) <τ_0_0> (@owned __ContiguousArrayStorageBase, @thin _ContiguousArrayBuffer<τ_0_0>.Type) -> @owned _ContiguousArrayBuffer<τ_0_0> // user: %32
  %32 = apply %31<Element>(%29, %30) : $@convention(method) <τ_0_0> (@owned __ContiguousArrayStorageBase, @thin _ContiguousArrayBuffer<τ_0_0>.Type) -> @owned _ContiguousArrayBuffer<τ_0_0> // user: %36
  %33 = struct_extract %0 : $_ArrayBuffer<Element>, #_ArrayBuffer._storage // user: %34
  %34 = struct_extract %33 : $_BridgeStorage<__ContiguousArrayStorageBase>, #_BridgeStorage.rawValue // user: %35
  strong_retain %34 : $Builtin.BridgeObject       // id: %35
  return %32 : $_ContiguousArrayBuffer<Element>   // id: %36
} // end sil function '$ss12_ArrayBufferV7_natives011_ContiguousaB0VyxGvg'

// _ContiguousArrayBuffer.init(_:)
sil public_external @$ss22_ContiguousArrayBufferVyAByxGs02__aB11StorageBaseCcfC : $@convention(method) <Element> (@owned __ContiguousArrayStorageBase, @thin _ContiguousArrayBuffer<Element>.Type) -> @owned _ContiguousArrayBuffer<Element> {
// %0                                             // user: %2
bb0(%0 : $__ContiguousArrayStorageBase, %1 : $@thin _ContiguousArrayBuffer<Element>.Type):
  %2 = struct $_ContiguousArrayBuffer<Element> (%0 : $__ContiguousArrayStorageBase) // user: %3
  return %2 : $_ContiguousArrayBuffer<Element>    // id: %3
} // end sil function '$ss22_ContiguousArrayBufferVyAByxGs02__aB11StorageBaseCcfC'

// _ContiguousArrayBuffer.count.setter
sil public_external @$ss22_ContiguousArrayBufferV5countSivs : $@convention(method) <Element> (Int, @guaranteed _ContiguousArrayBuffer<Element>) -> () {
// %0                                             // user: %6
// %1                                             // user: %2
bb0(%0 : $Int, %1 : $_ContiguousArrayBuffer<Element>):
  %2 = struct_extract %1 : $_ContiguousArrayBuffer<Element>, #_ContiguousArrayBuffer._storage // user: %3
  %3 = ref_element_addr %2 : $__ContiguousArrayStorageBase, #__ContiguousArrayStorageBase.countAndCapacity // user: %4
  %4 = struct_element_addr %3 : $*_ArrayBody, #_ArrayBody._storage // user: %5
  %5 = struct_element_addr %4 : $*_SwiftArrayBodyStorage, #_SwiftArrayBodyStorage.count // user: %6
  store %0 to %5 : $*Int                          // id: %6
  %7 = tuple ()                                   // user: %8
  return %7 : $()                                 // id: %8
} // end sil function '$ss22_ContiguousArrayBufferV5countSivs'

// String.percentEscapedString.getter
sil public_external [Onone] [readonly] [_semantics "string.escapePercent.get"] @$sSS2osE20percentEscapedStringSSvg : $@convention(method) (@guaranteed String) -> @owned String {
// %0                                             // users: %3, %1
bb0(%0 : $String):
  retain_value %0 : $String                       // id: %1
  %2 = alloc_stack $String                        // users: %20, %17, %3
  store %0 to %2 : $*String                       // id: %3
  %4 = string_literal utf8 "%"                    // user: %9
  %5 = integer_literal $Builtin.Word, 1           // user: %9
  %6 = integer_literal $Builtin.Int1, -1          // user: %9
  %7 = metatype $@thin Character.Type             // user: %9
  // function_ref Character.init(_builtinExtendedGraphemeClusterLiteral:utf8CodeUnitCount:isASCII:)
  %8 = function_ref @$sSJ38_builtinExtendedGraphemeClusterLiteral17utf8CodeUnitCount7isASCIISJBp_BwBi1_tcfC : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin Character.Type) -> @owned Character // user: %9
  %9 = apply %8(%4, %5, %6, %7) : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin Character.Type) -> @owned Character // user: %11
  %10 = alloc_stack $Character                    // users: %19, %18, %17, %11
  store %9 to %10 : $*Character                   // id: %11
  %12 = integer_literal $Builtin.Int1, 0          // user: %13
  %13 = struct $Bool (%12 : $Builtin.Int1)        // user: %17
  // function_ref default argument 1 of Collection<>.split(separator:maxSplits:omittingEmptySubsequences:)
  %14 = function_ref @$sSlsSQ7ElementRpzrlE5split9separator9maxSplits25omittingEmptySubsequencesSay11SubSequenceQzGAB_SiSbtFfA0_ : $@convention(thin) <τ_0_0 where τ_0_0 : Collection, τ_0_0.Element : Equatable> () -> Int // user: %15
  %15 = apply %14<String>() : $@convention(thin) <τ_0_0 where τ_0_0 : Collection, τ_0_0.Element : Equatable> () -> Int // user: %17
  // function_ref Collection<>.split(separator:maxSplits:omittingEmptySubsequences:)
  %16 = function_ref @$sSlsSQ7ElementRpzrlE5split9separator9maxSplits25omittingEmptySubsequencesSay11SubSequenceQzGAB_SiSbtF : $@convention(method) <τ_0_0 where τ_0_0 : Collection, τ_0_0.Element : Equatable> (@in_guaranteed τ_0_0.Element, Int, Bool, @in τ_0_0) -> @owned Array<τ_0_0.SubSequence> // user: %17
  %17 = apply %16<String>(%10, %15, %13, %2) : $@convention(method) <τ_0_0 where τ_0_0 : Collection, τ_0_0.Element : Equatable> (@in_guaranteed τ_0_0.Element, Int, Bool, @in τ_0_0) -> @owned Array<τ_0_0.SubSequence> // user: %22
  destroy_addr %10 : $*Character                  // id: %18
  dealloc_stack %10 : $*Character                 // id: %19
  dealloc_stack %2 : $*String                     // id: %20
  %21 = alloc_stack $Array<Substring>             // users: %33, %32, %30, %22
  store %17 to %21 : $*Array<Substring>           // id: %22
  %23 = string_literal utf8 "%%"                  // user: %28
  %24 = integer_literal $Builtin.Word, 2          // user: %28
  %25 = integer_literal $Builtin.Int1, -1         // user: %28
  %26 = metatype $@thin String.Type               // user: %28
  // function_ref String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)
  %27 = function_ref @$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %28
  %28 = apply %27(%23, %24, %25, %26) : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // users: %31, %30
  // function_ref Sequence<>.joined(separator:)
  %29 = function_ref @$sSTsSy7ElementRpzrlE6joined9separatorS2S_tF : $@convention(method) <τ_0_0 where τ_0_0 : Sequence, τ_0_0.Element : StringProtocol> (@guaranteed String, @in_guaranteed τ_0_0) -> @owned String // user: %30
  %30 = apply %29<[Substring]>(%28, %21) : $@convention(method) <τ_0_0 where τ_0_0 : Sequence, τ_0_0.Element : StringProtocol> (@guaranteed String, @in_guaranteed τ_0_0) -> @owned String // user: %34
  release_value %28 : $String                     // id: %31
  destroy_addr %21 : $*Array<Substring>           // id: %32
  dealloc_stack %21 : $*Array<Substring>          // id: %33
  return %30 : $String                            // id: %34
} // end sil function '$sSS2osE20percentEscapedStringSSvg'

// static String.+= infix(_:_:)
sil public_external [signature_optimized_thunk] [always_inline] [_semantics "string.plusequals"] @$sSS2peoiyySSz_SStFZ : $@convention(method) (@inout String, @guaranteed String, @thin String.Type) -> () {
// %0                                             // user: %4
// %1                                             // user: %4
bb0(%0 : $*String, %1 : $String, %2 : $@thin String.Type):
  // function_ref String.append(_:)
  %3 = function_ref @$sSS6appendyySSF : $@convention(method) (@guaranteed String, @inout String) -> () // user: %4
  %4 = apply %3(%1, %0) : $@convention(method) (@guaranteed String, @inout String) -> ()
  %5 = tuple ()                                   // user: %6
  return %5 : $()                                 // id: %6
} // end sil function '$sSS2peoiyySSz_SStFZ'

// Character.init(_builtinExtendedGraphemeClusterLiteral:utf8CodeUnitCount:isASCII:)
sil public_external [always_inline] [readonly] @$sSJ38_builtinExtendedGraphemeClusterLiteral17utf8CodeUnitCount7isASCIISJBp_BwBi1_tcfC : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin Character.Type) -> @owned Character {
// %0                                             // users: %68, %89, %43
// %1                                             // user: %4
// %2                                             // user: %31
bb0(%0 : $Builtin.RawPointer, %1 : $Builtin.Word, %2 : $Builtin.Int1, %3 : $@thin Character.Type):
  %4 = builtin "sextOrBitCast_Word_Int64"(%1 : $Builtin.Word) : $Builtin.Int64 // users: %57, %38, %158, %110, %74, %33, %36, %17, %8, %6
  %5 = integer_literal $Builtin.Int64, 0          // users: %72, %72, %72, %137, %77, %95, %95, %95, %85, %76, %70, %93, %102, %83, %81, %63, %61, %59, %10, %8, %6
  %6 = builtin "cmp_slt_Int64"(%4 : $Builtin.Int64, %5 : $Builtin.Int64) : $Builtin.Int1 // user: %7
  cond_fail %6 : $Builtin.Int1, "UnsafeBufferPointer with negative count" // id: %7
  %8 = builtin "cmp_eq_Int64"(%4 : $Builtin.Int64, %5 : $Builtin.Int64) : $Builtin.Int1 // user: %9
  cond_br %8, bb1, bb2                            // id: %9

bb1:                                              // Preds: bb0
  %10 = struct $UInt64 (%5 : $Builtin.Int64)      // user: %14
  %11 = integer_literal $Builtin.Int64, -2305843009213693952 // user: %12
  %12 = value_to_bridge_object %11 : $Builtin.Int64 // user: %13
  %13 = unchecked_trivial_bit_cast %12 : $Builtin.BridgeObject to $UInt64 // user: %14
  %14 = tuple (%10 : $UInt64, %13 : $UInt64)      // user: %15
  br bb3(%14 : $(UInt64, UInt64))                 // id: %15

bb2:                                              // Preds: bb0
  %16 = integer_literal $Builtin.Int64, 15        // user: %17
  %17 = builtin "cmp_slt_Int64"(%16 : $Builtin.Int64, %4 : $Builtin.Int64) : $Builtin.Int1 // user: %18
  cond_br %17, bb5, bb6                           // id: %18

// %19                                            // users: %21, %20
bb3(%19 : $(UInt64, UInt64)):                     // Preds: bb23 bb1
  %20 = tuple_extract %19 : $(UInt64, UInt64), 0  // user: %24
  %21 = tuple_extract %19 : $(UInt64, UInt64), 1  // user: %22
  %22 = struct_extract %21 : $UInt64, #UInt64._value // user: %23
  %23 = value_to_bridge_object %22 : $Builtin.Int64 // user: %24
  %24 = struct $_StringObject (%20 : $UInt64, %23 : $Builtin.BridgeObject) // user: %25
  %25 = struct $_StringGuts (%24 : $_StringObject) // user: %26
  %26 = struct $String (%25 : $_StringGuts)       // user: %27
  br bb4(%26 : $String)                           // id: %27

// %28                                            // user: %29
bb4(%28 : $String):                               // Preds: bb9 bb3
  %29 = struct $Character (%28 : $String)         // user: %30
  return %29 : $Character                         // id: %30

bb5:                                              // Preds: bb2
  cond_br %2, bb7, bb8                            // id: %31

bb6:                                              // Preds: bb2
  %32 = integer_literal $Builtin.Int64, 8         // users: %56, %158, %155, %132, %74, %33
  %33 = builtin "cmp_slt_Int64"(%32 : $Builtin.Int64, %4 : $Builtin.Int64) : $Builtin.Int1 // users: %154, %64, %34
  cond_br %33, bb10, bb11                         // id: %34

bb7:                                              // Preds: bb5
  %35 = integer_literal $Builtin.Int64, -4611686018427387904 // user: %36
  %36 = builtin "or_Int64"(%4 : $Builtin.Int64, %35 : $Builtin.Int64) : $Builtin.Int64 // user: %37
  br bb9(%36 : $Builtin.Int64)                    // id: %37

bb8:                                              // Preds: bb5
  br bb9(%4 : $Builtin.Int64)                     // id: %38

// %39                                            // user: %41
bb9(%39 : $Builtin.Int64):                        // Preds: bb8 bb7
  %40 = integer_literal $Builtin.Int64, 1152921504606846976 // user: %41
  %41 = builtin "or_Int64"(%39 : $Builtin.Int64, %40 : $Builtin.Int64) : $Builtin.Int64 // user: %42
  %42 = struct $UInt64 (%41 : $Builtin.Int64)     // user: %52
  %43 = builtin "ptrtoint_Word"(%0 : $Builtin.RawPointer) : $Builtin.Word // user: %44
  %44 = builtin "zextOrBitCast_Word_Int64"(%43 : $Builtin.Word) : $Builtin.Int64 // user: %47
  %45 = integer_literal $Builtin.Int64, 32        // user: %47
  %46 = integer_literal $Builtin.Int1, 0          // user: %47
  %47 = builtin "usub_with_overflow_Int64"(%44 : $Builtin.Int64, %45 : $Builtin.Int64, %46 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // user: %48
  %48 = tuple_extract %47 : $(Builtin.Int64, Builtin.Int1), 0 // user: %50
  %49 = integer_literal $Builtin.Int64, -9223372036854775808 // user: %50
  %50 = builtin "stringObjectOr_Int64"(%48 : $Builtin.Int64, %49 : $Builtin.Int64) : $Builtin.Int64 // user: %51
  %51 = value_to_bridge_object %50 : $Builtin.Int64 // user: %52
  %52 = struct $_StringObject (%42 : $UInt64, %51 : $Builtin.BridgeObject) // user: %53
  %53 = struct $_StringGuts (%52 : $_StringObject) // user: %54
  %54 = struct $String (%53 : $_StringGuts)       // user: %55
  br bb4(%54 : $String)                           // id: %55

bb10:                                             // Preds: bb6
  br bb12(%32 : $Builtin.Int64)                   // id: %56

bb11:                                             // Preds: bb6
  br bb12(%4 : $Builtin.Int64)                    // id: %57

// %58                                            // users: %151, %70, %61, %59
bb12(%58 : $Builtin.Int64):                       // Preds: bb11 bb10
  %59 = builtin "cmp_slt_Int64"(%58 : $Builtin.Int64, %5 : $Builtin.Int64) : $Builtin.Int1 // user: %60
  cond_fail %59 : $Builtin.Int1, "Can't form Range with upperBound < lowerBound" // id: %60
  %61 = builtin "cmp_eq_Int64"(%58 : $Builtin.Int64, %5 : $Builtin.Int64) : $Builtin.Int1 // user: %62
  cond_br %61, bb13, bb14                         // id: %62

bb13:                                             // Preds: bb12
  %63 = struct $UInt64 (%5 : $Builtin.Int64)      // users: %77, %76
  cond_br %33, bb15, bb16                         // id: %64

bb14:                                             // Preds: bb12
  %65 = integer_literal $Builtin.Int1, 0          // users: %158, %155
  %66 = integer_literal $Builtin.Int1, -1         // user: %141
  %67 = integer_literal $Builtin.Int64, 1         // user: %141
  %68 = pointer_to_address %0 : $Builtin.RawPointer to [strict] $*UInt8 // user: %144
  %69 = integer_literal $Builtin.Int64, 63        // user: %148
  %70 = builtin "cmp_sge_Int64"(%5 : $Builtin.Int64, %58 : $Builtin.Int64) : $Builtin.Int1 // user: %71
  cond_fail %70 : $Builtin.Int1, "loop induction variable overflowed" // id: %71
  br bb28(%5 : $Builtin.Int64, %5 : $Builtin.Int64, %5 : $Builtin.Int64) // id: %72

bb15:                                             // Preds: bb13
  %73 = integer_literal $Builtin.Int1, 0          // user: %74
  %74 = builtin "ssub_with_overflow_Int64"(%4 : $Builtin.Int64, %32 : $Builtin.Int64, %73 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // user: %75
  %75 = tuple_extract %74 : $(Builtin.Int64, Builtin.Int1), 0 // user: %76
  br bb17(%5 : $Builtin.Int64, %63 : $UInt64, %75 : $Builtin.Int64) // id: %76

bb16:                                             // Preds: bb13
  br bb27(%5 : $Builtin.Int64, %63 : $UInt64)     // id: %77

// %78                                            // users: %131, %85
// %79                                            // users: %131, %85
// %80                                            // users: %129, %93, %83, %81
bb17(%78 : $Builtin.Int64, %79 : $UInt64, %80 : $Builtin.Int64): // Preds: bb31 bb15
  %81 = builtin "cmp_slt_Int64"(%80 : $Builtin.Int64, %5 : $Builtin.Int64) : $Builtin.Int1 // user: %82
  cond_fail %81 : $Builtin.Int1, "Can't form Range with upperBound < lowerBound" // id: %82
  %83 = builtin "cmp_eq_Int64"(%80 : $Builtin.Int64, %5 : $Builtin.Int64) : $Builtin.Int1 // user: %84
  cond_br %83, bb18, bb19                         // id: %84

bb18:                                             // Preds: bb17
  br bb20(%5 : $Builtin.Int64, %78 : $Builtin.Int64, %79 : $UInt64) // id: %85

bb19:                                             // Preds: bb17
  %86 = integer_literal $Builtin.Int1, 0          // user: %132
  %87 = integer_literal $Builtin.Int1, -1         // user: %119
  %88 = integer_literal $Builtin.Int64, 1         // user: %119
  %89 = pointer_to_address %0 : $Builtin.RawPointer to [strict] $*UInt8 // user: %91
  %90 = integer_literal $Builtin.Word, 8          // user: %91
  %91 = index_addr %89 : $*UInt8, %90 : $Builtin.Word // user: %122
  %92 = integer_literal $Builtin.Int64, 63        // user: %126
  %93 = builtin "cmp_sge_Int64"(%5 : $Builtin.Int64, %80 : $Builtin.Int64) : $Builtin.Int1 // user: %94
  cond_fail %93 : $Builtin.Int1, "loop induction variable overflowed" // id: %94
  br bb24(%5 : $Builtin.Int64, %5 : $Builtin.Int64, %5 : $Builtin.Int64) // id: %95

// %96                                            // users: %112, %99
// %97                                            // user: %99
// %98                                            // user: %114
bb20(%96 : $Builtin.Int64, %97 : $Builtin.Int64, %98 : $UInt64): // Preds: bb27 bb25 bb18
  %99 = builtin "or_Int64"(%97 : $Builtin.Int64, %96 : $Builtin.Int64) : $Builtin.Int64 // user: %101
  %100 = integer_literal $Builtin.Int64, -9187201950435737472 // user: %101
  %101 = builtin "and_Int64"(%99 : $Builtin.Int64, %100 : $Builtin.Int64) : $Builtin.Int64 // user: %102
  %102 = builtin "cmp_eq_Int64"(%101 : $Builtin.Int64, %5 : $Builtin.Int64) : $Builtin.Int1 // user: %103
  cond_br %102, bb21, bb22                        // id: %103

bb21:                                             // Preds: bb20
  %104 = integer_literal $Builtin.Int64, -2305843009213693952 // user: %105
  br bb23(%104 : $Builtin.Int64)                  // id: %105

bb22:                                             // Preds: bb20
  %106 = integer_literal $Builtin.Int64, -6917529027641081856 // user: %107
  br bb23(%106 : $Builtin.Int64)                  // id: %107

// %108                                           // user: %111
bb23(%108 : $Builtin.Int64):                      // Preds: bb22 bb21
  %109 = integer_literal $Builtin.Int64, 56       // user: %110
  %110 = builtin "shl_Int64"(%4 : $Builtin.Int64, %109 : $Builtin.Int64) : $Builtin.Int64 // user: %111
  %111 = builtin "or_Int64"(%108 : $Builtin.Int64, %110 : $Builtin.Int64) : $Builtin.Int64 // user: %112
  %112 = builtin "or_Int64"(%96 : $Builtin.Int64, %111 : $Builtin.Int64) : $Builtin.Int64 // user: %113
  %113 = struct $UInt64 (%112 : $Builtin.Int64)   // user: %114
  %114 = tuple (%98 : $UInt64, %113 : $UInt64)    // user: %115
  br bb3(%114 : $(UInt64, UInt64))                // id: %115

// %116                                           // user: %128
// %117                                           // users: %132, %126
// %118                                           // users: %121, %119
bb24(%116 : $Builtin.Int64, %117 : $Builtin.Int64, %118 : $Builtin.Int64): // Preds: bb26 bb19
  %119 = builtin "sadd_with_overflow_Int64"(%118 : $Builtin.Int64, %88 : $Builtin.Int64, %87 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // user: %120
  %120 = tuple_extract %119 : $(Builtin.Int64, Builtin.Int1), 0 // users: %134, %129
  %121 = builtin "truncOrBitCast_Int64_Word"(%118 : $Builtin.Int64) : $Builtin.Word // user: %122
  %122 = index_addr %91 : $*UInt8, %121 : $Builtin.Word // user: %123
  %123 = struct_element_addr %122 : $*UInt8, #UInt8._value // user: %124
  %124 = load %123 : $*Builtin.Int8               // user: %125
  %125 = builtin "zextOrBitCast_Int8_Int64"(%124 : $Builtin.Int8) : $Builtin.Int64 // user: %127
  %126 = builtin "and_Int64"(%117 : $Builtin.Int64, %92 : $Builtin.Int64) : $Builtin.Int64 // user: %127
  %127 = builtin "shl_Int64"(%125 : $Builtin.Int64, %126 : $Builtin.Int64) : $Builtin.Int64 // user: %128
  %128 = builtin "or_Int64"(%116 : $Builtin.Int64, %127 : $Builtin.Int64) : $Builtin.Int64 // users: %134, %131
  %129 = builtin "cmp_eq_Int64"(%120 : $Builtin.Int64, %80 : $Builtin.Int64) : $Builtin.Int1 // user: %130
  cond_br %129, bb25, bb26                        // id: %130

bb25:                                             // Preds: bb24
  br bb20(%128 : $Builtin.Int64, %78 : $Builtin.Int64, %79 : $UInt64) // id: %131

bb26:                                             // Preds: bb24
  %132 = builtin "sadd_with_overflow_Int64"(%117 : $Builtin.Int64, %32 : $Builtin.Int64, %86 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // user: %133
  %133 = tuple_extract %132 : $(Builtin.Int64, Builtin.Int1), 0 // user: %134
  br bb24(%128 : $Builtin.Int64, %133 : $Builtin.Int64, %120 : $Builtin.Int64) // id: %134

// %135                                           // user: %137
// %136                                           // user: %137
bb27(%135 : $Builtin.Int64, %136 : $UInt64):      // Preds: bb32 bb16
  br bb20(%5 : $Builtin.Int64, %135 : $Builtin.Int64, %136 : $UInt64) // id: %137

// %138                                           // user: %150
// %139                                           // users: %155, %148
// %140                                           // users: %143, %141
bb28(%138 : $Builtin.Int64, %139 : $Builtin.Int64, %140 : $Builtin.Int64): // Preds: bb30 bb14
  %141 = builtin "sadd_with_overflow_Int64"(%140 : $Builtin.Int64, %67 : $Builtin.Int64, %66 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // user: %142
  %142 = tuple_extract %141 : $(Builtin.Int64, Builtin.Int1), 0 // users: %157, %151
  %143 = builtin "truncOrBitCast_Int64_Word"(%140 : $Builtin.Int64) : $Builtin.Word // user: %144
  %144 = index_addr %68 : $*UInt8, %143 : $Builtin.Word // user: %145
  %145 = struct_element_addr %144 : $*UInt8, #UInt8._value // user: %146
  %146 = load %145 : $*Builtin.Int8               // user: %147
  %147 = builtin "zextOrBitCast_Int8_Int64"(%146 : $Builtin.Int8) : $Builtin.Int64 // user: %149
  %148 = builtin "and_Int64"(%139 : $Builtin.Int64, %69 : $Builtin.Int64) : $Builtin.Int64 // user: %149
  %149 = builtin "shl_Int64"(%147 : $Builtin.Int64, %148 : $Builtin.Int64) : $Builtin.Int64 // user: %150
  %150 = builtin "or_Int64"(%138 : $Builtin.Int64, %149 : $Builtin.Int64) : $Builtin.Int64 // users: %157, %161, %160, %153
  %151 = builtin "cmp_eq_Int64"(%142 : $Builtin.Int64, %58 : $Builtin.Int64) : $Builtin.Int1 // user: %152
  cond_br %151, bb29, bb30                        // id: %152

bb29:                                             // Preds: bb28
  %153 = struct $UInt64 (%150 : $Builtin.Int64)   // users: %161, %160
  cond_br %33, bb31, bb32                         // id: %154

bb30:                                             // Preds: bb28
  %155 = builtin "sadd_with_overflow_Int64"(%139 : $Builtin.Int64, %32 : $Builtin.Int64, %65 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // user: %156
  %156 = tuple_extract %155 : $(Builtin.Int64, Builtin.Int1), 0 // user: %157
  br bb28(%150 : $Builtin.Int64, %156 : $Builtin.Int64, %142 : $Builtin.Int64) // id: %157

bb31:                                             // Preds: bb29
  %158 = builtin "ssub_with_overflow_Int64"(%4 : $Builtin.Int64, %32 : $Builtin.Int64, %65 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // user: %159
  %159 = tuple_extract %158 : $(Builtin.Int64, Builtin.Int1), 0 // user: %160
  br bb17(%150 : $Builtin.Int64, %153 : $UInt64, %159 : $Builtin.Int64) // id: %160

bb32:                                             // Preds: bb29
  br bb27(%150 : $Builtin.Int64, %153 : $UInt64)  // id: %161
} // end sil function '$sSJ38_builtinExtendedGraphemeClusterLiteral17utf8CodeUnitCount7isASCIISJBp_BwBi1_tcfC'

// default argument 1 of Collection<>.split(separator:maxSplits:omittingEmptySubsequences:)
sil shared_external [signature_optimized_thunk] [always_inline] @$sSlsSQ7ElementRpzrlE5split9separator9maxSplits25omittingEmptySubsequencesSay11SubSequenceQzGAB_SiSbtFfA0_ : $@convention(thin) <Self where Self : Collection, Self.Element : Equatable> () -> Int {
bb0:
  %0 = integer_literal $Builtin.Int64, 9223372036854775807 // user: %1
  %1 = struct $Int (%0 : $Builtin.Int64)          // user: %2
  return %1 : $Int                                // id: %2
} // end sil function '$sSlsSQ7ElementRpzrlE5split9separator9maxSplits25omittingEmptySubsequencesSay11SubSequenceQzGAB_SiSbtFfA0_'

// Collection<>.split(separator:maxSplits:omittingEmptySubsequences:)
sil public_external @$sSlsSQ7ElementRpzrlE5split9separator9maxSplits25omittingEmptySubsequencesSay11SubSequenceQzGAB_SiSbtF : $@convention(method) <Self where Self : Collection, Self.Element : Equatable> (@in_guaranteed Self.Element, Int, Bool, @in Self) -> @owned Array<Self.SubSequence> {
// %0                                             // users: %6, %5
// %1                                             // user: %9
// %2                                             // user: %9
// %3                                             // user: %9
bb0(%0 : $*Self.Element, %1 : $Int, %2 : $Bool, %3 : $*Self):
  // function_ref closure #1 in Collection<>.split(separator:maxSplits:omittingEmptySubsequences:)
  %4 = function_ref @$sSlsSQ7ElementRpzrlE5split9separator9maxSplits25omittingEmptySubsequencesSay11SubSequenceQzGAB_SiSbtFSbABXEfU_ : $@convention(thin) <τ_0_0 where τ_0_0 : Collection, τ_0_0.Element : Equatable> (@in_guaranteed τ_0_0.Element, @in_guaranteed τ_0_0.Element) -> Bool // user: %5
  %5 = partial_apply [callee_guaranteed] [on_stack] %4<Self>(%0) : $@convention(thin) <τ_0_0 where τ_0_0 : Collection, τ_0_0.Element : Equatable> (@in_guaranteed τ_0_0.Element, @in_guaranteed τ_0_0.Element) -> Bool // users: %10, %6
  %6 = mark_dependence %5 : $@noescape @callee_guaranteed (@in_guaranteed Self.Element) -> Bool on %0 : $*Self.Element // user: %7
  %7 = convert_function %6 : $@noescape @callee_guaranteed (@in_guaranteed Self.Element) -> Bool to $@noescape @callee_guaranteed @substituted <τ_0_0> (@in_guaranteed τ_0_0) -> (Bool, @error Error) for <Self.Element> // user: %9
  // function_ref Collection.split(maxSplits:omittingEmptySubsequences:whereSeparator:)
  %8 = function_ref @$sSlsE5split9maxSplits25omittingEmptySubsequences14whereSeparatorSay11SubSequenceQzGSi_S2b7ElementQzKXEtKF : $@convention(method) <τ_0_0 where τ_0_0 : Collection> (Int, Bool, @noescape @callee_guaranteed @substituted <τ_0_0> (@in_guaranteed τ_0_0) -> (Bool, @error Error) for <τ_0_0.Element>, @in τ_0_0) -> (@owned Array<τ_0_0.SubSequence>, @error Error) // user: %9
  %9 = apply [nothrow] %8<Self>(%1, %2, %7, %3) : $@convention(method) <τ_0_0 where τ_0_0 : Collection> (Int, Bool, @noescape @callee_guaranteed @substituted <τ_0_0> (@in_guaranteed τ_0_0) -> (Bool, @error Error) for <τ_0_0.Element>, @in τ_0_0) -> (@owned Array<τ_0_0.SubSequence>, @error Error) // user: %11
  dealloc_stack %5 : $@noescape @callee_guaranteed (@in_guaranteed Self.Element) -> Bool // id: %10
  return %9 : $Array<Self.SubSequence>            // id: %11
} // end sil function '$sSlsSQ7ElementRpzrlE5split9separator9maxSplits25omittingEmptySubsequencesSay11SubSequenceQzGAB_SiSbtF'

// Sequence<>.joined(separator:)
sil @$sSTsSy7ElementRpzrlE6joined9separatorS2S_tF : $@convention(method) <τ_0_0 where τ_0_0 : Sequence, τ_0_0.Element : StringProtocol> (@guaranteed String, @in_guaranteed τ_0_0) -> @owned String

// String.append(_:)
sil [_semantics "string.append"] @$sSS6appendyySSF : $@convention(method) (@guaranteed String, @inout String) -> ()

// closure #1 in Collection<>.split(separator:maxSplits:omittingEmptySubsequences:)
sil shared_external @$sSlsSQ7ElementRpzrlE5split9separator9maxSplits25omittingEmptySubsequencesSay11SubSequenceQzGAB_SiSbtFSbABXEfU_ : $@convention(thin) <Self where Self : Collection, Self.Element : Equatable> (@in_guaranteed Self.Element, @in_guaranteed Self.Element) -> Bool {
// %0                                             // user: %4
// %1                                             // user: %4
bb0(%0 : $*Self.Element, %1 : $*Self.Element):
  %2 = metatype $@thick Self.Element.Type         // user: %4
  %3 = witness_method $Self.Element, #Equatable."==" : <Self where Self : Equatable> (Self.Type) -> (Self, Self) -> Bool : $@convention(witness_method: Equatable) <τ_0_0 where τ_0_0 : Equatable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // user: %4
  %4 = apply %3<Self.Element>(%0, %1, %2) : $@convention(witness_method: Equatable) <τ_0_0 where τ_0_0 : Equatable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // user: %5
  return %4 : $Bool                               // id: %5
} // end sil function '$sSlsSQ7ElementRpzrlE5split9separator9maxSplits25omittingEmptySubsequencesSay11SubSequenceQzGAB_SiSbtFSbABXEfU_'

// Collection.split(maxSplits:omittingEmptySubsequences:whereSeparator:)
sil public_external @$sSlsE5split9maxSplits25omittingEmptySubsequences14whereSeparatorSay11SubSequenceQzGSi_S2b7ElementQzKXEtKF : $@convention(method) <Self where Self : Collection> (Int, Bool, @noescape @callee_guaranteed @substituted <τ_0_0> (@in_guaranteed τ_0_0) -> (Bool, @error Error) for <Self.Element>, @in Self) -> (@owned Array<Self.SubSequence>, @error Error) {
// %0                                             // user: %5
// %1                                             // users: %165, %109, %84
// %2                                             // user: %59
// %3                                             // users: %63, %149, %167, %165, %163, %141, %139, %86, %84, %81, %51, %39, %22, %19
bb0(%0 : $Int, %1 : $Bool, %2 : $@noescape @callee_guaranteed @substituted <τ_0_0> (@in_guaranteed τ_0_0) -> (Bool, @error Error) for <Self.Element>, %3 : $*Self):
  %4 = integer_literal $Builtin.Int64, 0          // users: %10, %20, %6
  %5 = struct_extract %0 : $Int, #Int._value      // users: %20, %95, %6
  %6 = builtin "cmp_slt_Int64"(%5 : $Builtin.Int64, %4 : $Builtin.Int64) : $Builtin.Int1 // user: %7
  cond_fail %6 : $Builtin.Int1, "Must take zero or more splits" // id: %7
  %8 = alloc_box $<τ_0_0 where τ_0_0 : Collection> { var Array<τ_0_0.SubSequence> } <Self> // users: %66, %157, %175, %165, %84, %9
  %9 = project_box %8 : $<τ_0_0 where τ_0_0 : Collection> { var Array<τ_0_0.SubSequence> } <Self>, 0 // users: %143, %169, %151, %91, %15
  %10 = struct $Int (%4 : $Builtin.Int64)         // user: %13
  %11 = metatype $@thin Array<Self.SubSequence>.Type // user: %13
  // function_ref static Array._allocateUninitialized(_:)
  %12 = function_ref @$sSa22_allocateUninitializedySayxG_SpyxGtSiFZ : $@convention(method) <τ_0_0> (Int, @thin Array<τ_0_0>.Type) -> (@owned Array<τ_0_0>, UnsafeMutablePointer<τ_0_0>) // user: %13
  %13 = apply %12<Self.SubSequence>(%10, %11) : $@convention(method) <τ_0_0> (Int, @thin Array<τ_0_0>.Type) -> (@owned Array<τ_0_0>, UnsafeMutablePointer<τ_0_0>) // user: %14
  %14 = tuple_extract %13 : $(Array<Self.SubSequence>, UnsafeMutablePointer<Self.SubSequence>), 0 // user: %15
  store %14 to %9 : $*Array<Self.SubSequence>     // id: %15
  %16 = alloc_box $<τ_0_0 where τ_0_0 : Collection> { var τ_0_0.Index } <Self> // users: %65, %156, %174, %165, %84, %17
  %17 = project_box %16 : $<τ_0_0 where τ_0_0 : Collection> { var τ_0_0.Index } <Self>, 0 // users: %114, %105, %87, %36, %19
  %18 = witness_method $Self, #Collection.startIndex!getter : <Self where Self : Collection> (Self) -> () -> Self.Index : $@convention(witness_method: Collection) <τ_0_0 where τ_0_0 : Collection> (@in_guaranteed τ_0_0) -> @out τ_0_0.Index // user: %19
  %19 = apply %18<Self>(%17, %3) : $@convention(witness_method: Collection) <τ_0_0 where τ_0_0 : Collection> (@in_guaranteed τ_0_0) -> @out τ_0_0.Index
  %20 = builtin "cmp_eq_Int64"(%5 : $Builtin.Int64, %4 : $Builtin.Int64) : $Builtin.Int1 // user: %23
  %21 = alloc_stack $Self                         // users: %32, %31, %25, %22
  copy_addr %3 to [initialization] %21 : $*Self   // id: %22
  cond_br %20, bb2, bb1                           // id: %23

bb1:                                              // Preds: bb0
  %24 = witness_method $Self, #Collection.isEmpty!getter : <Self where Self : Collection> (Self) -> () -> Bool : $@convention(witness_method: Collection) <τ_0_0 where τ_0_0 : Collection> (@in_guaranteed τ_0_0) -> Bool // user: %25
  %25 = apply %24<Self>(%21) : $@convention(witness_method: Collection) <τ_0_0 where τ_0_0 : Collection> (@in_guaranteed τ_0_0) -> Bool // user: %26
  br bb3(%25 : $Bool)                             // id: %26

bb2:                                              // Preds: bb0
  %27 = integer_literal $Builtin.Int1, -1         // user: %28
  %28 = struct $Bool (%27 : $Builtin.Int1)        // user: %29
  br bb3(%28 : $Bool)                             // id: %29

// %30                                            // user: %33
bb3(%30 : $Bool):                                 // Preds: bb2 bb1
  destroy_addr %21 : $*Self                       // id: %31
  dealloc_stack %21 : $*Self                      // id: %32
  %33 = struct_extract %30 : $Bool, #Bool._value  // user: %34
  cond_br %33, bb26, bb4                          // id: %34

bb4:                                              // Preds: bb3
  %35 = alloc_stack $Self.Index                   // users: %104, %62, %159, %99, %87, %86, %84, %81, %71, %49, %42, %36
  copy_addr %17 to [initialization] %35 : $*Self.Index // id: %36
  %37 = alloc_stack $Self.Index                   // users: %61, %148, %158, %132, %131, %118, %105, %99, %70, %42, %39
  %38 = witness_method $Self, #Collection.endIndex!getter : <Self where Self : Collection> (Self) -> () -> Self.Index : $@convention(witness_method: Collection) <τ_0_0 where τ_0_0 : Collection> (@in_guaranteed τ_0_0) -> @out τ_0_0.Index // user: %39
  %39 = apply %38<Self>(%37, %3) : $@convention(witness_method: Collection) <τ_0_0 where τ_0_0 : Collection> (@in_guaranteed τ_0_0) -> @out τ_0_0.Index
  %40 = metatype $@thick Self.Index.Type          // users: %120, %105, %99, %42
  %41 = witness_method $Self.Index, #Equatable."==" : <Self where Self : Equatable> (Self.Type) -> (Self, Self) -> Bool : $@convention(witness_method: Equatable) <τ_0_0 where τ_0_0 : Equatable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // users: %105, %99, %42
  %42 = apply %41<Self.Index>(%35, %37, %40) : $@convention(witness_method: Equatable) <τ_0_0 where τ_0_0 : Equatable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // user: %43
  %43 = struct_extract %42 : $Bool, #Bool._value  // user: %44
  cond_br %43, bb5, bb6                           // id: %44

bb5:                                              // Preds: bb4
  br bb19                                         // id: %45

bb6:                                              // Preds: bb4
  %46 = witness_method $Self, #Collection.subscript!read : <Self where Self : Collection> (Self) -> (Self.Index) -> () : $@yield_once @convention(witness_method: Collection) <τ_0_0 where τ_0_0 : Collection> (@in_guaranteed τ_0_0.Index, @in_guaranteed τ_0_0) -> @yields @in_guaranteed τ_0_0.Element // user: %52
  br bb7                                          // id: %47

bb7:                                              // Preds: bb17 bb6
  %48 = alloc_stack $Self.Index                   // users: %77, %69, %57, %52, %49
  copy_addr %35 to [initialization] %48 : $*Self.Index // id: %49
  %50 = alloc_stack $Self                         // users: %76, %68, %58, %52, %51
  copy_addr %3 to [initialization] %50 : $*Self   // id: %51
  (%52, %53) = begin_apply %46<Self>(%48, %50) : $@yield_once @convention(witness_method: Collection) <τ_0_0 where τ_0_0 : Collection> (@in_guaranteed τ_0_0.Index, @in_guaranteed τ_0_0) -> @yields @in_guaranteed τ_0_0.Element // users: %55, %56
  %54 = alloc_stack $Self.Element                 // users: %75, %74, %67, %64, %59, %55
  copy_addr %52 to [initialization] %54 : $*Self.Element // id: %55
  end_apply %53                                   // id: %56
  destroy_addr %48 : $*Self.Index                 // id: %57
  destroy_addr %50 : $*Self                       // id: %58
  try_apply %2(%54) : $@noescape @callee_guaranteed @substituted <τ_0_0> (@in_guaranteed τ_0_0) -> (Bool, @error Error) for <Self.Element>, normal bb9, error bb8 // id: %59

// %60                                            // user: %72
bb8(%60 : $Error):                                // Preds: bb7
  destroy_addr %37 : $*Self.Index                 // id: %61
  destroy_addr %35 : $*Self.Index                 // id: %62
  destroy_addr %3 : $*Self                        // id: %63
  destroy_addr %54 : $*Self.Element               // id: %64
  strong_release %16 : $<τ_0_0 where τ_0_0 : Collection> { var τ_0_0.Index } <Self> // id: %65
  strong_release %8 : $<τ_0_0 where τ_0_0 : Collection> { var Array<τ_0_0.SubSequence> } <Self> // id: %66
  dealloc_stack %54 : $*Self.Element              // id: %67
  dealloc_stack %50 : $*Self                      // id: %68
  dealloc_stack %48 : $*Self.Index                // id: %69
  dealloc_stack %37 : $*Self.Index                // id: %70
  dealloc_stack %35 : $*Self.Index                // id: %71
  throw %60 : $Error                              // id: %72

// %73                                            // user: %78
bb9(%73 : $Bool):                                 // Preds: bb7
  destroy_addr %54 : $*Self.Element               // id: %74
  dealloc_stack %54 : $*Self.Element              // id: %75
  dealloc_stack %50 : $*Self                      // id: %76
  dealloc_stack %48 : $*Self.Index                // id: %77
  %78 = struct_extract %73 : $Bool, #Bool._value  // user: %79
  cond_br %78, bb11, bb10                         // id: %79

bb10:                                             // Preds: bb9
  %80 = witness_method $Self, #Collection.formIndex : <Self where Self : Collection> (Self) -> (inout Self.Index) -> () : $@convention(witness_method: Collection) <τ_0_0 where τ_0_0 : Collection> (@inout τ_0_0.Index, @in_guaranteed τ_0_0) -> () // user: %81
  %81 = apply %80<Self>(%35, %3) : $@convention(witness_method: Collection) <τ_0_0 where τ_0_0 : Collection> (@inout τ_0_0.Index, @in_guaranteed τ_0_0) -> ()
  br bb16                                         // id: %82

bb11:                                             // Preds: bb9
  // function_ref appendSubsequence #1 <A>(end:) in Collection.split(maxSplits:omittingEmptySubsequences:whereSeparator:)
  %83 = function_ref @$sSlsE5split9maxSplits25omittingEmptySubsequences14whereSeparatorSay11SubSequenceQzGSi_S2b7ElementQzKXEtKF17appendSubsequenceL_3endSb5IndexQz_tSlRzlF : $@convention(thin) <τ_0_0 where τ_0_0 : Collection> (@in_guaranteed τ_0_0.Index, @guaranteed <τ_0_0 where τ_0_0 : Collection> { var τ_0_0.Index } <τ_0_0>, Bool, @guaranteed <τ_0_0 where τ_0_0 : Collection> { var Array<τ_0_0.SubSequence> } <τ_0_0>, @in_guaranteed τ_0_0) -> Bool // user: %84
  %84 = apply %83<Self>(%35, %16, %1, %8, %3) : $@convention(thin) <τ_0_0 where τ_0_0 : Collection> (@in_guaranteed τ_0_0.Index, @guaranteed <τ_0_0 where τ_0_0 : Collection> { var τ_0_0.Index } <τ_0_0>, Bool, @guaranteed <τ_0_0 where τ_0_0 : Collection> { var Array<τ_0_0.SubSequence> } <τ_0_0>, @in_guaranteed τ_0_0) -> Bool // user: %88
  %85 = witness_method $Self, #Collection.formIndex : <Self where Self : Collection> (Self) -> (inout Self.Index) -> () : $@convention(witness_method: Collection) <τ_0_0 where τ_0_0 : Collection> (@inout τ_0_0.Index, @in_guaranteed τ_0_0) -> () // user: %86
  %86 = apply %85<Self>(%35, %3) : $@convention(witness_method: Collection) <τ_0_0 where τ_0_0 : Collection> (@inout τ_0_0.Index, @in_guaranteed τ_0_0) -> ()
  copy_addr %35 to %17 : $*Self.Index             // id: %87
  %88 = struct_extract %84 : $Bool, #Bool._value  // user: %89
  cond_br %88, bb13, bb12                         // id: %89

bb12:                                             // Preds: bb11
  br bb16                                         // id: %90

bb13:                                             // Preds: bb11
  %91 = load %9 : $*Array<Self.SubSequence>       // user: %93
  // function_ref Array.count.getter
  %92 = function_ref @$sSa5countSivg : $@convention(method) <τ_0_0> (@guaranteed Array<τ_0_0>) -> Int // user: %93
  %93 = apply %92<Self.SubSequence>(%91) : $@convention(method) <τ_0_0> (@guaranteed Array<τ_0_0>) -> Int // user: %94
  %94 = struct_extract %93 : $Int, #Int._value    // user: %95
  %95 = builtin "cmp_eq_Int64"(%94 : $Builtin.Int64, %5 : $Builtin.Int64) : $Builtin.Int1 // user: %96
  cond_br %95, bb15, bb14                         // id: %96

bb14:                                             // Preds: bb13
  br bb16                                         // id: %97

bb15:                                             // Preds: bb13
  br bb19                                         // id: %98

bb16:                                             // Preds: bb14 bb12 bb10
  %99 = apply %41<Self.Index>(%35, %37, %40) : $@convention(witness_method: Equatable) <τ_0_0 where τ_0_0 : Equatable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // user: %100
  %100 = struct_extract %99 : $Bool, #Bool._value // user: %101
  cond_br %100, bb18, bb17                        // id: %101

bb17:                                             // Preds: bb16
  br bb7                                          // id: %102

bb18:                                             // Preds: bb16
  br bb19                                         // id: %103

bb19:                                             // Preds: bb18 bb15 bb5
  destroy_addr %35 : $*Self.Index                 // id: %104
  %105 = apply %41<Self.Index>(%17, %37, %40) : $@convention(witness_method: Equatable) <τ_0_0 where τ_0_0 : Equatable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // user: %106
  %106 = struct_extract %105 : $Bool, #Bool._value // user: %107
  cond_br %106, bb21, bb20                        // id: %107

bb20:                                             // Preds: bb19
  br bb23                                         // id: %108

bb21:                                             // Preds: bb19
  %109 = struct_extract %1 : $Bool, #Bool._value  // user: %110
  cond_br %109, bb24, bb22                        // id: %110

bb22:                                             // Preds: bb21
  br bb23                                         // id: %111

bb23:                                             // Preds: bb22 bb20
  %112 = alloc_stack $Range<Self.Index>           // users: %146, %140, %139, %134
  %113 = alloc_stack $Self.Index                  // users: %136, %134, %116, %114
  copy_addr %17 to [initialization] %113 : $*Self.Index // id: %114
  %115 = alloc_stack $Self.Index                  // users: %128, %125, %120, %116
  copy_addr %113 to [initialization] %115 : $*Self.Index // id: %116
  %117 = alloc_stack $Self.Index                  // users: %127, %126, %120, %118
  copy_addr %37 to [initialization] %117 : $*Self.Index // id: %118
  %119 = witness_method $Self.Index, #Comparable."<=" : <Self where Self : Comparable> (Self.Type) -> (Self, Self) -> Bool : $@convention(witness_method: Comparable) <τ_0_0 where τ_0_0 : Comparable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // user: %120
  %120 = apply %119<Self.Index>(%115, %117, %40) : $@convention(witness_method: Comparable) <τ_0_0 where τ_0_0 : Comparable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // user: %121
  %121 = struct_extract %120 : $Bool, #Bool._value // user: %123
  %122 = integer_literal $Builtin.Int1, -1        // user: %123
  %123 = builtin "xor_Int1"(%121 : $Builtin.Int1, %122 : $Builtin.Int1) : $Builtin.Int1 // user: %124
  cond_fail %123 : $Builtin.Int1, "Can't form Range with upperBound < lowerBound" // id: %124
  destroy_addr %115 : $*Self.Index                // id: %125
  destroy_addr %117 : $*Self.Index                // id: %126
  dealloc_stack %117 : $*Self.Index               // id: %127
  dealloc_stack %115 : $*Self.Index               // id: %128
  %129 = metatype $@thin Range<Self.Index>.Type   // user: %134
  %130 = alloc_stack $Self.Index                  // users: %135, %134, %131
  copy_addr %37 to [initialization] %130 : $*Self.Index // id: %131
  destroy_addr %37 : $*Self.Index                 // id: %132
  // function_ref Range.init(uncheckedBounds:)
  %133 = function_ref @$sSn15uncheckedBoundsSnyxGx5lower_x5uppert_tcfC : $@convention(method) <τ_0_0 where τ_0_0 : Comparable> (@in τ_0_0, @in τ_0_0, @thin Range<τ_0_0>.Type) -> @out Range<τ_0_0> // user: %134
  %134 = apply %133<Self.Index>(%112, %113, %130, %129) : $@convention(method) <τ_0_0 where τ_0_0 : Comparable> (@in τ_0_0, @in τ_0_0, @thin Range<τ_0_0>.Type) -> @out Range<τ_0_0>
  dealloc_stack %130 : $*Self.Index               // id: %135
  dealloc_stack %113 : $*Self.Index               // id: %136
  %137 = alloc_stack $Self.SubSequence            // users: %144, %143, %145, %139
  %138 = witness_method $Self, #Collection.subscript!getter : <Self where Self : Collection> (Self) -> (Range<Self.Index>) -> Self.SubSequence : $@convention(witness_method: Collection) <τ_0_0 where τ_0_0 : Collection> (@in_guaranteed Range<τ_0_0.Index>, @in_guaranteed τ_0_0) -> @out τ_0_0.SubSequence // user: %139
  %139 = apply %138<Self>(%137, %112, %3) : $@convention(witness_method: Collection) <τ_0_0 where τ_0_0 : Collection> (@in_guaranteed Range<τ_0_0.Index>, @in_guaranteed τ_0_0) -> @out τ_0_0.SubSequence
  destroy_addr %112 : $*Range<Self.Index>         // id: %140
  destroy_addr %3 : $*Self                        // id: %141
  // function_ref specialized Array.append(_:)
  %142 = function_ref @$sSa6appendyyxnFTf4gn_n : $@convention(method) <τ_0_0> (@in_guaranteed τ_0_0, @inout Array<τ_0_0>) -> () // user: %143
  %143 = apply %142<Self.SubSequence>(%137, %9) : $@convention(method) <τ_0_0> (@in_guaranteed τ_0_0, @inout Array<τ_0_0>) -> ()
  destroy_addr %137 : $*Self.SubSequence          // id: %144
  dealloc_stack %137 : $*Self.SubSequence         // id: %145
  dealloc_stack %112 : $*Range<Self.Index>        // id: %146
  br bb25                                         // id: %147

bb24:                                             // Preds: bb21
  destroy_addr %37 : $*Self.Index                 // id: %148
  destroy_addr %3 : $*Self                        // id: %149
  br bb25                                         // id: %150

bb25:                                             // Preds: bb24 bb23
  %151 = load %9 : $*Array<Self.SubSequence>      // users: %160, %152
  %152 = struct_extract %151 : $Array<Self.SubSequence>, #Array._buffer // user: %153
  %153 = struct_extract %152 : $_ArrayBuffer<Self.SubSequence>, #_ArrayBuffer._storage // user: %154
  %154 = struct_extract %153 : $_BridgeStorage<__ContiguousArrayStorageBase>, #_BridgeStorage.rawValue // user: %155
  strong_retain %154 : $Builtin.BridgeObject      // id: %155
  strong_release %16 : $<τ_0_0 where τ_0_0 : Collection> { var τ_0_0.Index } <Self> // id: %156
  strong_release %8 : $<τ_0_0 where τ_0_0 : Collection> { var Array<τ_0_0.SubSequence> } <Self> // id: %157
  dealloc_stack %37 : $*Self.Index                // id: %158
  dealloc_stack %35 : $*Self.Index                // id: %159
  br bb27(%151 : $Array<Self.SubSequence>)        // id: %160

bb26:                                             // Preds: bb3
  %161 = alloc_stack $Self.Index                  // users: %168, %166, %165, %163
  %162 = witness_method $Self, #Collection.endIndex!getter : <Self where Self : Collection> (Self) -> () -> Self.Index : $@convention(witness_method: Collection) <τ_0_0 where τ_0_0 : Collection> (@in_guaranteed τ_0_0) -> @out τ_0_0.Index // user: %163
  %163 = apply %162<Self>(%161, %3) : $@convention(witness_method: Collection) <τ_0_0 where τ_0_0 : Collection> (@in_guaranteed τ_0_0) -> @out τ_0_0.Index
  // function_ref appendSubsequence #1 <A>(end:) in Collection.split(maxSplits:omittingEmptySubsequences:whereSeparator:)
  %164 = function_ref @$sSlsE5split9maxSplits25omittingEmptySubsequences14whereSeparatorSay11SubSequenceQzGSi_S2b7ElementQzKXEtKF17appendSubsequenceL_3endSb5IndexQz_tSlRzlF : $@convention(thin) <τ_0_0 where τ_0_0 : Collection> (@in_guaranteed τ_0_0.Index, @guaranteed <τ_0_0 where τ_0_0 : Collection> { var τ_0_0.Index } <τ_0_0>, Bool, @guaranteed <τ_0_0 where τ_0_0 : Collection> { var Array<τ_0_0.SubSequence> } <τ_0_0>, @in_guaranteed τ_0_0) -> Bool // user: %165
  %165 = apply %164<Self>(%161, %16, %1, %8, %3) : $@convention(thin) <τ_0_0 where τ_0_0 : Collection> (@in_guaranteed τ_0_0.Index, @guaranteed <τ_0_0 where τ_0_0 : Collection> { var τ_0_0.Index } <τ_0_0>, Bool, @guaranteed <τ_0_0 where τ_0_0 : Collection> { var Array<τ_0_0.SubSequence> } <τ_0_0>, @in_guaranteed τ_0_0) -> Bool
  destroy_addr %161 : $*Self.Index                // id: %166
  destroy_addr %3 : $*Self                        // id: %167
  dealloc_stack %161 : $*Self.Index               // id: %168
  %169 = load %9 : $*Array<Self.SubSequence>      // users: %176, %170
  %170 = struct_extract %169 : $Array<Self.SubSequence>, #Array._buffer // user: %171
  %171 = struct_extract %170 : $_ArrayBuffer<Self.SubSequence>, #_ArrayBuffer._storage // user: %172
  %172 = struct_extract %171 : $_BridgeStorage<__ContiguousArrayStorageBase>, #_BridgeStorage.rawValue // user: %173
  strong_retain %172 : $Builtin.BridgeObject      // id: %173
  strong_release %16 : $<τ_0_0 where τ_0_0 : Collection> { var τ_0_0.Index } <Self> // id: %174
  strong_release %8 : $<τ_0_0 where τ_0_0 : Collection> { var Array<τ_0_0.SubSequence> } <Self> // id: %175
  br bb27(%169 : $Array<Self.SubSequence>)        // id: %176

// %177                                           // user: %178
bb27(%177 : $Array<Self.SubSequence>):            // Preds: bb26 bb25
  return %177 : $Array<Self.SubSequence>          // id: %178
} // end sil function '$sSlsE5split9maxSplits25omittingEmptySubsequences14whereSeparatorSay11SubSequenceQzGSi_S2b7ElementQzKXEtKF'

// appendSubsequence #1 <A>(end:) in Collection.split(maxSplits:omittingEmptySubsequences:whereSeparator:)
sil shared_external @$sSlsE5split9maxSplits25omittingEmptySubsequences14whereSeparatorSay11SubSequenceQzGSi_S2b7ElementQzKXEtKF17appendSubsequenceL_3endSb5IndexQz_tSlRzlF : $@convention(thin) <Self where Self : Collection> (@in_guaranteed Self.Index, @guaranteed <τ_0_0 where τ_0_0 : Collection> { var τ_0_0.Index } <Self>, Bool, @guaranteed <τ_0_0 where τ_0_0 : Collection> { var Array<τ_0_0.SubSequence> } <Self>, @in_guaranteed Self) -> Bool {
// %0                                             // users: %38, %25, %8
// %1                                             // user: %5
// %2                                             // user: %14
// %3                                             // user: %18
// %4                                             // user: %45
bb0(%0 : $*Self.Index, %1 : $<τ_0_0 where τ_0_0 : Collection> { var τ_0_0.Index } <Self>, %2 : $Bool, %3 : $<τ_0_0 where τ_0_0 : Collection> { var Array<τ_0_0.SubSequence> } <Self>, %4 : $*Self):
  %5 = project_box %1 : $<τ_0_0 where τ_0_0 : Collection> { var τ_0_0.Index } <Self>, 0 // users: %21, %8
  %6 = metatype $@thick Self.Index.Type           // users: %27, %8
  %7 = witness_method $Self.Index, #Equatable."==" : <Self where Self : Equatable> (Self.Type) -> (Self, Self) -> Bool : $@convention(witness_method: Equatable) <τ_0_0 where τ_0_0 : Equatable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // user: %8
  %8 = apply %7<Self.Index>(%5, %0, %6) : $@convention(witness_method: Equatable) <τ_0_0 where τ_0_0 : Equatable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // user: %9
  %9 = struct_extract %8 : $Bool, #Bool._value    // user: %10
  cond_br %9, bb2, bb1                            // id: %10

bb1:                                              // Preds: bb0
  %11 = integer_literal $Builtin.Int1, 0          // user: %12
  %12 = struct $Bool (%11 : $Builtin.Int1)        // user: %13
  br bb3(%12 : $Bool)                             // id: %13

bb2:                                              // Preds: bb0
  br bb3(%2 : $Bool)                              // id: %14

// %15                                            // user: %16
bb3(%15 : $Bool):                                 // Preds: bb2 bb1
  %16 = struct_extract %15 : $Bool, #Bool._value  // user: %17
  cond_br %16, bb5, bb4                           // id: %17

bb4:                                              // Preds: bb3
  %18 = project_box %3 : $<τ_0_0 where τ_0_0 : Collection> { var Array<τ_0_0.SubSequence> } <Self>, 0 // user: %48
  %19 = alloc_stack $Range<Self.Index>            // users: %51, %46, %45, %40
  %20 = alloc_stack $Self.Index                   // users: %42, %40, %23, %21
  copy_addr %5 to [initialization] %20 : $*Self.Index // id: %21
  %22 = alloc_stack $Self.Index                   // users: %35, %32, %27, %23
  copy_addr %20 to [initialization] %22 : $*Self.Index // id: %23
  %24 = alloc_stack $Self.Index                   // users: %34, %33, %27, %25
  copy_addr %0 to [initialization] %24 : $*Self.Index // id: %25
  %26 = witness_method $Self.Index, #Comparable."<=" : <Self where Self : Comparable> (Self.Type) -> (Self, Self) -> Bool : $@convention(witness_method: Comparable) <τ_0_0 where τ_0_0 : Comparable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // user: %27
  %27 = apply %26<Self.Index>(%22, %24, %6) : $@convention(witness_method: Comparable) <τ_0_0 where τ_0_0 : Comparable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // user: %28
  %28 = struct_extract %27 : $Bool, #Bool._value  // user: %30
  %29 = integer_literal $Builtin.Int1, -1         // users: %52, %30
  %30 = builtin "xor_Int1"(%28 : $Builtin.Int1, %29 : $Builtin.Int1) : $Builtin.Int1 // user: %31
  cond_fail %30 : $Builtin.Int1, "Can't form Range with upperBound < lowerBound" // id: %31
  destroy_addr %22 : $*Self.Index                 // id: %32
  destroy_addr %24 : $*Self.Index                 // id: %33
  dealloc_stack %24 : $*Self.Index                // id: %34
  dealloc_stack %22 : $*Self.Index                // id: %35
  %36 = metatype $@thin Range<Self.Index>.Type    // user: %40
  %37 = alloc_stack $Self.Index                   // users: %41, %40, %38
  copy_addr %0 to [initialization] %37 : $*Self.Index // id: %38
  // function_ref Range.init(uncheckedBounds:)
  %39 = function_ref @$sSn15uncheckedBoundsSnyxGx5lower_x5uppert_tcfC : $@convention(method) <τ_0_0 where τ_0_0 : Comparable> (@in τ_0_0, @in τ_0_0, @thin Range<τ_0_0>.Type) -> @out Range<τ_0_0> // user: %40
  %40 = apply %39<Self.Index>(%19, %20, %37, %36) : $@convention(method) <τ_0_0 where τ_0_0 : Comparable> (@in τ_0_0, @in τ_0_0, @thin Range<τ_0_0>.Type) -> @out Range<τ_0_0>
  dealloc_stack %37 : $*Self.Index                // id: %41
  dealloc_stack %20 : $*Self.Index                // id: %42
  %43 = alloc_stack $Self.SubSequence             // users: %49, %48, %50, %45
  %44 = witness_method $Self, #Collection.subscript!getter : <Self where Self : Collection> (Self) -> (Range<Self.Index>) -> Self.SubSequence : $@convention(witness_method: Collection) <τ_0_0 where τ_0_0 : Collection> (@in_guaranteed Range<τ_0_0.Index>, @in_guaranteed τ_0_0) -> @out τ_0_0.SubSequence // user: %45
  %45 = apply %44<Self>(%43, %19, %4) : $@convention(witness_method: Collection) <τ_0_0 where τ_0_0 : Collection> (@in_guaranteed Range<τ_0_0.Index>, @in_guaranteed τ_0_0) -> @out τ_0_0.SubSequence
  destroy_addr %19 : $*Range<Self.Index>          // id: %46
  // function_ref specialized Array.append(_:)
  %47 = function_ref @$sSa6appendyyxnFTf4gn_n : $@convention(method) <τ_0_0> (@in_guaranteed τ_0_0, @inout Array<τ_0_0>) -> () // user: %48
  %48 = apply %47<Self.SubSequence>(%43, %18) : $@convention(method) <τ_0_0> (@in_guaranteed τ_0_0, @inout Array<τ_0_0>) -> ()
  destroy_addr %43 : $*Self.SubSequence           // id: %49
  dealloc_stack %43 : $*Self.SubSequence          // id: %50
  dealloc_stack %19 : $*Range<Self.Index>         // id: %51
  br bb6(%29 : $Builtin.Int1)                     // id: %52

bb5:                                              // Preds: bb3
  %53 = integer_literal $Builtin.Int1, 0          // user: %54
  br bb6(%53 : $Builtin.Int1)                     // id: %54

// %55                                            // user: %56
bb6(%55 : $Builtin.Int1):                         // Preds: bb5 bb4
  %56 = struct $Bool (%55 : $Builtin.Int1)        // user: %57
  return %56 : $Bool                              // id: %57
} // end sil function '$sSlsE5split9maxSplits25omittingEmptySubsequences14whereSeparatorSay11SubSequenceQzGSi_S2b7ElementQzKXEtKF17appendSubsequenceL_3endSb5IndexQz_tSlRzlF'

// Array.count.getter
sil public_external @$sSa5countSivg : $@convention(method) <Element> (@guaranteed Array<Element>) -> Int {
// %0                                             // user: %2
bb0(%0 : $Array<Element>):
  // function_ref Array._getCount()
  %1 = function_ref @$sSa9_getCountSiyF : $@convention(method) <τ_0_0> (@guaranteed Array<τ_0_0>) -> Int // user: %2
  %2 = apply %1<Element>(%0) : $@convention(method) <τ_0_0> (@guaranteed Array<τ_0_0>) -> Int // user: %3
  return %2 : $Int                                // id: %3
} // end sil function '$sSa5countSivg'

// Range.init(uncheckedBounds:)
sil public_external @$sSn15uncheckedBoundsSnyxGx5lower_x5uppert_tcfC : $@convention(method) <Bound where Bound : Comparable> (@in Bound, @in Bound, @thin Range<Bound>.Type) -> @out Range<Bound> {
// %0                                             // users: %24, %15
// %1                                             // user: %7
// %2                                             // user: %8
bb0(%0 : $*Range<Bound>, %1 : $*Bound, %2 : $*Bound, %3 : $@thin Range<Bound>.Type):
  %4 = alloc_stack $(lower: Bound, upper: Bound)  // users: %27, %6, %5
  %5 = tuple_element_addr %4 : $*(lower: Bound, upper: Bound), 0 // users: %21, %12, %7
  %6 = tuple_element_addr %4 : $*(lower: Bound, upper: Bound), 1 // users: %22, %13, %8
  copy_addr [take] %1 to [initialization] %5 : $*Bound // id: %7
  copy_addr [take] %2 to [initialization] %6 : $*Bound // id: %8
  %9 = alloc_stack $(lower: Bound, upper: Bound)  // users: %17, %11, %10
  %10 = tuple_element_addr %9 : $*(lower: Bound, upper: Bound), 1 // users: %14, %13
  %11 = tuple_element_addr %9 : $*(lower: Bound, upper: Bound), 0 // users: %16, %12
  copy_addr %5 to [initialization] %11 : $*Bound  // id: %12
  copy_addr %6 to [initialization] %10 : $*Bound  // id: %13
  destroy_addr %10 : $*Bound                      // id: %14
  %15 = struct_element_addr %0 : $*Range<Bound>, #Range.lowerBound // user: %16
  copy_addr [take] %11 to [initialization] %15 : $*Bound // id: %16
  dealloc_stack %9 : $*(lower: Bound, upper: Bound) // id: %17
  %18 = alloc_stack $(lower: Bound, upper: Bound) // users: %26, %20, %19
  %19 = tuple_element_addr %18 : $*(lower: Bound, upper: Bound), 0 // users: %23, %21
  %20 = tuple_element_addr %18 : $*(lower: Bound, upper: Bound), 1 // users: %25, %22
  copy_addr [take] %5 to [initialization] %19 : $*Bound // id: %21
  copy_addr [take] %6 to [initialization] %20 : $*Bound // id: %22
  destroy_addr %19 : $*Bound                      // id: %23
  %24 = struct_element_addr %0 : $*Range<Bound>, #Range.upperBound // user: %25
  copy_addr [take] %20 to [initialization] %24 : $*Bound // id: %25
  dealloc_stack %18 : $*(lower: Bound, upper: Bound) // id: %26
  dealloc_stack %4 : $*(lower: Bound, upper: Bound) // id: %27
  %28 = tuple ()                                  // user: %29
  return %28 : $()                                // id: %29
} // end sil function '$sSn15uncheckedBoundsSnyxGx5lower_x5uppert_tcfC'

// Array.append(_:)
sil public_external [signature_optimized_thunk] [always_inline] [_semantics "array.append_element"] @$sSa6appendyyxnF : $@convention(method) <Element> (@in Element, @inout Array<Element>) -> () {
// %0                                             // users: %4, %3
// %1                                             // user: %3
bb0(%0 : $*Element, %1 : $*Array<Element>):
  // function_ref specialized Array.append(_:)
  %2 = function_ref @$sSa6appendyyxnFTf4gn_n : $@convention(method) <τ_0_0> (@in_guaranteed τ_0_0, @inout Array<τ_0_0>) -> () // user: %3
  %3 = apply %2<Element>(%0, %1) : $@convention(method) <τ_0_0> (@in_guaranteed τ_0_0, @inout Array<τ_0_0>) -> () // user: %5
  destroy_addr %0 : $*Element                     // id: %4
  return %3 : $()                                 // id: %5
} // end sil function '$sSa6appendyyxnF'

// Array._getCount()
sil public_external [_semantics "array.get_count"] @$sSa9_getCountSiyF : $@convention(method) <Element> (@guaranteed Array<Element>) -> Int {
// %0                                             // users: %15, %1
bb0(%0 : $Array<Element>):
  %1 = struct_extract %0 : $Array<Element>, #Array._buffer // users: %18, %8, %3
  // function_ref _ArrayBuffer._isNative.getter
  %2 = function_ref @$ss12_ArrayBufferV9_isNativeSbvg : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> Bool // user: %3
  %3 = apply %2<Element>(%1) : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> Bool // user: %4
  %4 = struct_extract %3 : $Bool, #Bool._value    // user: %6
  %5 = integer_literal $Builtin.Int1, -1          // user: %6
  %6 = builtin "int_expect_Int1"(%4 : $Builtin.Int1, %5 : $Builtin.Int1) : $Builtin.Int1 // user: %7
  cond_br %6, bb2, bb1                            // id: %7

bb1:                                              // Preds: bb0
  %8 = struct_extract %1 : $_ArrayBuffer<Element>, #_ArrayBuffer._storage // user: %9
  %9 = struct_extract %8 : $_BridgeStorage<__ContiguousArrayStorageBase>, #_BridgeStorage.rawValue // users: %13, %10
  %10 = bridge_object_to_ref %9 : $Builtin.BridgeObject to $AnyObject // user: %11
  %11 = struct $_CocoaArrayWrapper (%10 : $AnyObject) // user: %14
  // function_ref _CocoaArrayWrapper.endIndex.getter
  %12 = function_ref @$ss18_CocoaArrayWrapperV8endIndexSivg : $@convention(method) (@guaranteed _CocoaArrayWrapper) -> Int // user: %14
  strong_retain %9 : $Builtin.BridgeObject        // id: %13
  %14 = apply %12(%11) : $@convention(method) (@guaranteed _CocoaArrayWrapper) -> Int // user: %16
  release_value %0 : $Array<Element>              // id: %15
  br bb3(%14 : $Int)                              // id: %16

bb2:                                              // Preds: bb0
  // function_ref _ArrayBuffer._native.getter
  %17 = function_ref @$ss12_ArrayBufferV7_natives011_ContiguousaB0VyxGvg : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> @owned _ContiguousArrayBuffer<τ_0_0> // user: %18
  %18 = apply %17<Element>(%1) : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> @owned _ContiguousArrayBuffer<τ_0_0> // users: %21, %20
  // function_ref _ContiguousArrayBuffer.count.getter
  %19 = function_ref @$ss22_ContiguousArrayBufferV5countSivg : $@convention(method) <τ_0_0> (@guaranteed _ContiguousArrayBuffer<τ_0_0>) -> Int // user: %20
  %20 = apply %19<Element>(%18) : $@convention(method) <τ_0_0> (@guaranteed _ContiguousArrayBuffer<τ_0_0>) -> Int // user: %22
  release_value %18 : $_ContiguousArrayBuffer<Element> // id: %21
  br bb3(%20 : $Int)                              // id: %22

// %23                                            // user: %24
bb3(%23 : $Int):                                  // Preds: bb2 bb1
  return %23 : $Int                               // id: %24
} // end sil function '$sSa9_getCountSiyF'

// Array._makeUniqueAndReserveCapacityIfNotUnique()
sil public_external [_semantics "array.make_mutable"] @$sSa034_makeUniqueAndReserveCapacityIfNotB0yyF : $@convention(method) <Element> (@inout Array<Element>) -> () {
// %0                                             // users: %23, %11, %1
bb0(%0 : $*Array<Element>):
  %1 = struct_element_addr %0 : $*Array<Element>, #Array._buffer // user: %3
  // function_ref _ArrayBuffer.isMutableAndUniquelyReferenced()
  %2 = function_ref @$ss12_ArrayBufferV30isMutableAndUniquelyReferencedSbyF : $@convention(method) <τ_0_0> (@inout _ArrayBuffer<τ_0_0>) -> Bool // user: %3
  %3 = apply %2<Element>(%1) : $@convention(method) <τ_0_0> (@inout _ArrayBuffer<τ_0_0>) -> Bool // user: %4
  %4 = struct_extract %3 : $Bool, #Bool._value    // user: %6
  %5 = integer_literal $Builtin.Int1, -1          // users: %21, %16, %6
  %6 = builtin "int_expect_Int1"(%4 : $Builtin.Int1, %5 : $Builtin.Int1) : $Builtin.Int1 // user: %7
  cond_br %6, bb1, bb2                            // id: %7

bb1:                                              // Preds: bb0
  br bb3                                          // id: %8

bb2:                                              // Preds: bb0
  %9 = integer_literal $Builtin.Int1, 0           // user: %10
  %10 = struct $Bool (%9 : $Builtin.Int1)         // user: %23
  %11 = load %0 : $*Array<Element>                // user: %13
  // function_ref Array.count.getter
  %12 = function_ref @$sSa5countSivg : $@convention(method) <τ_0_0> (@guaranteed Array<τ_0_0>) -> Int // user: %13
  %13 = apply %12<Element>(%11) : $@convention(method) <τ_0_0> (@guaranteed Array<τ_0_0>) -> Int // user: %15
  %14 = integer_literal $Builtin.Int64, 1         // user: %16
  %15 = struct_extract %13 : $Int, #Int._value    // user: %16
  %16 = builtin "sadd_with_overflow_Int64"(%15 : $Builtin.Int64, %14 : $Builtin.Int64, %5 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // users: %18, %17
  %17 = tuple_extract %16 : $(Builtin.Int64, Builtin.Int1), 0 // user: %20
  %18 = tuple_extract %16 : $(Builtin.Int64, Builtin.Int1), 1 // user: %19
  cond_fail %18 : $Builtin.Int1, "arithmetic overflow" // id: %19
  %20 = struct $Int (%17 : $Builtin.Int64)        // user: %23
  %21 = struct $Bool (%5 : $Builtin.Int1)         // user: %23
  // function_ref Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)
  %22 = function_ref @$sSa16_createNewBuffer14bufferIsUnique15minimumCapacity13growForAppendySb_SiSbtF : $@convention(method) <τ_0_0> (Bool, Int, Bool, @inout Array<τ_0_0>) -> () // user: %23
  %23 = apply %22<Element>(%10, %20, %21, %0) : $@convention(method) <τ_0_0> (Bool, Int, Bool, @inout Array<τ_0_0>) -> ()
  br bb3                                          // id: %24

bb3:                                              // Preds: bb1 bb2
  %25 = tuple ()                                  // user: %26
  return %25 : $()                                // id: %26
} // end sil function '$sSa034_makeUniqueAndReserveCapacityIfNotB0yyF'

// Array._reserveCapacityAssumingUniqueBuffer(oldCount:)
sil public_external [_semantics "array.mutate_unknown"] @$sSa36_reserveCapacityAssumingUniqueBuffer8oldCountySi_tF : $@convention(method) <Element> (Int, @inout Array<Element>) -> () {
// %0                                             // user: %11
// %1                                             // users: %29, %2
bb0(%0 : $Int, %1 : $*Array<Element>):
  %2 = struct_element_addr %1 : $*Array<Element>, #Array._buffer // user: %3
  %3 = load %2 : $*_ArrayBuffer<Element>          // users: %9, %19, %18, %8, %4
  %4 = struct_extract %3 : $_ArrayBuffer<Element>, #_ArrayBuffer._storage // user: %5
  %5 = struct_extract %4 : $_BridgeStorage<__ContiguousArrayStorageBase>, #_BridgeStorage.rawValue // users: %17, %7
  // function_ref _ArrayBuffer.capacity.getter
  %6 = function_ref @$ss12_ArrayBufferV8capacitySivg : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> Int // users: %18, %8
  strong_retain %5 : $Builtin.BridgeObject        // id: %7
  %8 = apply %6<Element>(%3) : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> Int
  release_value %3 : $_ArrayBuffer<Element>       // id: %9
  %10 = integer_literal $Builtin.Int64, 1         // user: %13
  %11 = struct_extract %0 : $Int, #Int._value     // user: %13
  %12 = integer_literal $Builtin.Int1, -1         // users: %26, %13
  %13 = builtin "sadd_with_overflow_Int64"(%11 : $Builtin.Int64, %10 : $Builtin.Int64, %12 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // users: %15, %14
  %14 = tuple_extract %13 : $(Builtin.Int64, Builtin.Int1), 0 // users: %27, %21
  %15 = tuple_extract %13 : $(Builtin.Int64, Builtin.Int1), 1 // user: %16
  cond_fail %15 : $Builtin.Int1, "arithmetic overflow" // id: %16
  strong_retain %5 : $Builtin.BridgeObject        // id: %17
  %18 = apply %6<Element>(%3) : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> Int // user: %20
  release_value %3 : $_ArrayBuffer<Element>       // id: %19
  %20 = struct_extract %18 : $Int, #Int._value    // user: %21
  %21 = builtin "cmp_slt_Int64"(%20 : $Builtin.Int64, %14 : $Builtin.Int64) : $Builtin.Int1 // user: %23
  %22 = integer_literal $Builtin.Int1, 0          // user: %23
  %23 = builtin "int_expect_Int1"(%21 : $Builtin.Int1, %22 : $Builtin.Int1) : $Builtin.Int1 // user: %24
  cond_br %23, bb2, bb1                           // id: %24

bb1:                                              // Preds: bb0
  br bb3                                          // id: %25

bb2:                                              // Preds: bb0
  %26 = struct $Bool (%12 : $Builtin.Int1)        // users: %29, %29
  %27 = struct $Int (%14 : $Builtin.Int64)        // user: %29
  // function_ref Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)
  %28 = function_ref @$sSa16_createNewBuffer14bufferIsUnique15minimumCapacity13growForAppendySb_SiSbtF : $@convention(method) <τ_0_0> (Bool, Int, Bool, @inout Array<τ_0_0>) -> () // user: %29
  %29 = apply %28<Element>(%26, %27, %26, %1) : $@convention(method) <τ_0_0> (Bool, Int, Bool, @inout Array<τ_0_0>) -> ()
  br bb3                                          // id: %30

bb3:                                              // Preds: bb1 bb2
  %31 = tuple ()                                  // user: %32
  return %31 : $()                                // id: %32
} // end sil function '$sSa36_reserveCapacityAssumingUniqueBuffer8oldCountySi_tF'

// _ArrayBuffer.isMutableAndUniquelyReferenced()
sil public_external @$ss12_ArrayBufferV30isMutableAndUniquelyReferencedSbyF : $@convention(method) <Element> (@inout _ArrayBuffer<Element>) -> Bool {
// %0                                             // user: %2
bb0(%0 : $*_ArrayBuffer<Element>):
  // function_ref _ArrayBuffer.isUniquelyReferenced()
  %1 = function_ref @$ss12_ArrayBufferV20isUniquelyReferencedSbyF : $@convention(method) <τ_0_0> (@inout _ArrayBuffer<τ_0_0>) -> Bool // user: %2
  %2 = apply %1<Element>(%0) : $@convention(method) <τ_0_0> (@inout _ArrayBuffer<τ_0_0>) -> Bool // user: %3
  return %2 : $Bool                               // id: %3
} // end sil function '$ss12_ArrayBufferV30isMutableAndUniquelyReferencedSbyF'

// Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)
sil shared_external [noinline] @$sSa16_createNewBuffer14bufferIsUnique15minimumCapacity13growForAppendySb_SiSbtF : $@convention(method) <Element> (Bool, Int, Bool, @inout Array<Element>) -> () {
// %0                                             // user: %32
// %1                                             // users: %25, %9, %11
// %2                                             // user: %7
// %3                                             // users: %76, %68, %51, %34, %4
bb0(%0 : $Bool, %1 : $Int, %2 : $Bool, %3 : $*Array<Element>):
  %4 = load %3 : $*Array<Element>                 // users: %28, %6
  // function_ref Array._getCapacity()
  %5 = function_ref @$sSa12_getCapacitySiyF : $@convention(method) <τ_0_0> (@guaranteed Array<τ_0_0>) -> Int // user: %6
  %6 = apply %5<Element>(%4) : $@convention(method) <τ_0_0> (@guaranteed Array<τ_0_0>) -> Int // users: %14, %10
  %7 = struct_extract %2 : $Bool, #Bool._value    // user: %8
  cond_br %7, bb2, bb1                            // id: %8

bb1:                                              // Preds: bb0
  br bb7(%1 : $Int)                               // id: %9

bb2:                                              // Preds: bb0
  %10 = struct_extract %6 : $Int, #Int._value     // users: %17, %12
  %11 = struct_extract %1 : $Int, #Int._value     // users: %21, %12
  %12 = builtin "cmp_slt_Int64"(%10 : $Builtin.Int64, %11 : $Builtin.Int64) : $Builtin.Int1 // user: %13
  cond_br %12, bb4, bb3                           // id: %13

bb3:                                              // Preds: bb2
  br bb7(%6 : $Int)                               // id: %14

bb4:                                              // Preds: bb2
  %15 = integer_literal $Builtin.Int64, 2         // user: %17
  %16 = integer_literal $Builtin.Int1, -1         // user: %17
  %17 = builtin "smul_with_overflow_Int64"(%10 : $Builtin.Int64, %15 : $Builtin.Int64, %16 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // users: %19, %18
  %18 = tuple_extract %17 : $(Builtin.Int64, Builtin.Int1), 0 // users: %21, %23
  %19 = tuple_extract %17 : $(Builtin.Int64, Builtin.Int1), 1 // user: %20
  cond_fail %19 : $Builtin.Int1, "arithmetic overflow" // id: %20
  %21 = builtin "cmp_slt_Int64"(%18 : $Builtin.Int64, %11 : $Builtin.Int64) : $Builtin.Int1 // user: %22
  cond_br %21, bb6, bb5                           // id: %22

bb5:                                              // Preds: bb4
  %23 = struct $Int (%18 : $Builtin.Int64)        // user: %24
  br bb7(%23 : $Int)                              // id: %24

bb6:                                              // Preds: bb4
  br bb7(%1 : $Int)                               // id: %25

// %26                                            // user: %31
bb7(%26 : $Int):                                  // Preds: bb6 bb5 bb3 bb1
  // function_ref Array._getCount()
  %27 = function_ref @$sSa9_getCountSiyF : $@convention(method) <τ_0_0> (@guaranteed Array<τ_0_0>) -> Int // user: %28
  %28 = apply %27<Element>(%4) : $@convention(method) <τ_0_0> (@guaranteed Array<τ_0_0>) -> Int // users: %60, %41, %37, %31
  %29 = metatype $@thin _ContiguousArrayBuffer<Element>.Type // user: %31
  // function_ref _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)
  %30 = function_ref @$ss22_ContiguousArrayBufferV19_uninitializedCount15minimumCapacityAByxGSi_SitcfC : $@convention(method) <τ_0_0> (Int, Int, @thin _ContiguousArrayBuffer<τ_0_0>.Type) -> @owned _ContiguousArrayBuffer<τ_0_0> // user: %31
  %31 = apply %30<Element>(%28, %26, %29) : $@convention(method) <τ_0_0> (Int, Int, @thin _ContiguousArrayBuffer<τ_0_0>.Type) -> @owned _ContiguousArrayBuffer<τ_0_0> // users: %77, %67, %72, %50, %43
  %32 = struct_extract %0 : $Bool, #Bool._value   // user: %33
  cond_br %32, bb9, bb8                           // id: %33

bb8:                                              // Preds: bb7
  %34 = struct_element_addr %3 : $*Array<Element>, #Array._buffer // user: %35
  %35 = load %34 : $*_ArrayBuffer<Element>        // users: %47, %45, %46
  %36 = integer_literal $Builtin.Int64, 0         // users: %40, %38
  %37 = struct_extract %28 : $Int, #Int._value    // user: %38
  %38 = builtin "cmp_slt_Int64"(%37 : $Builtin.Int64, %36 : $Builtin.Int64) : $Builtin.Int1 // user: %39
  cond_fail %38 : $Builtin.Int1, "Can't form Range with upperBound < lowerBound" // id: %39
  %40 = struct $Int (%36 : $Builtin.Int64)        // user: %41
  %41 = struct $Range<Int> (%40 : $Int, %28 : $Int) // user: %46
  // function_ref _ContiguousArrayBuffer.firstElementAddress.getter
  %42 = function_ref @$ss22_ContiguousArrayBufferV19firstElementAddressSpyxGvg : $@convention(method) <τ_0_0> (@guaranteed _ContiguousArrayBuffer<τ_0_0>) -> UnsafeMutablePointer<τ_0_0> // user: %43
  %43 = apply %42<Element>(%31) : $@convention(method) <τ_0_0> (@guaranteed _ContiguousArrayBuffer<τ_0_0>) -> UnsafeMutablePointer<τ_0_0> // user: %46
  // function_ref specialized _ArrayBuffer._copyContents(subRange:initializing:)
  %44 = function_ref @$ss12_ArrayBufferV13_copyContents8subRange12initializingSpyxGSnySiG_AFtFTf4nng_n : $@convention(thin) <τ_0_0> (Range<Int>, UnsafeMutablePointer<τ_0_0>, @guaranteed _ArrayBuffer<τ_0_0>) -> UnsafeMutablePointer<τ_0_0> // user: %46
  retain_value %35 : $_ArrayBuffer<Element>       // id: %45
  %46 = apply %44<Element>(%41, %43, %35) : $@convention(thin) <τ_0_0> (Range<Int>, UnsafeMutablePointer<τ_0_0>, @guaranteed _ArrayBuffer<τ_0_0>) -> UnsafeMutablePointer<τ_0_0>
  release_value %35 : $_ArrayBuffer<Element>      // id: %47
  br bb10                                         // id: %48

bb9:                                              // Preds: bb7
  // function_ref _ContiguousArrayBuffer.firstElementAddress.getter
  %49 = function_ref @$ss22_ContiguousArrayBufferV19firstElementAddressSpyxGvg : $@convention(method) <τ_0_0> (@guaranteed _ContiguousArrayBuffer<τ_0_0>) -> UnsafeMutablePointer<τ_0_0> // user: %50
  %50 = apply %49<Element>(%31) : $@convention(method) <τ_0_0> (@guaranteed _ContiguousArrayBuffer<τ_0_0>) -> UnsafeMutablePointer<τ_0_0> // user: %60
  %51 = struct_element_addr %3 : $*Array<Element>, #Array._buffer // users: %64, %52
  %52 = load %51 : $*_ArrayBuffer<Element>        // users: %58, %57, %54
  // function_ref _ArrayBuffer.firstElementAddress.getter
  %53 = function_ref @$ss12_ArrayBufferV19firstElementAddressSpyxGvg : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> UnsafeMutablePointer<τ_0_0> // user: %57
  %54 = struct_extract %52 : $_ArrayBuffer<Element>, #_ArrayBuffer._storage // user: %55
  %55 = struct_extract %54 : $_BridgeStorage<__ContiguousArrayStorageBase>, #_BridgeStorage.rawValue // user: %56
  strong_retain %55 : $Builtin.BridgeObject       // id: %56
  %57 = apply %53<Element>(%52) : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> UnsafeMutablePointer<τ_0_0> // user: %60
  release_value %52 : $_ArrayBuffer<Element>      // id: %58
  // function_ref UnsafeMutablePointer.moveInitialize(from:count:)
  %59 = function_ref @$sSp14moveInitialize4from5countySpyxG_SitF : $@convention(method) <τ_0_0> (UnsafeMutablePointer<τ_0_0>, Int, UnsafeMutablePointer<τ_0_0>) -> () // user: %60
  %60 = apply %59<Element>(%57, %28, %50) : $@convention(method) <τ_0_0> (UnsafeMutablePointer<τ_0_0>, Int, UnsafeMutablePointer<τ_0_0>) -> ()
  %61 = integer_literal $Builtin.Int64, 0         // user: %62
  %62 = struct $Int (%61 : $Builtin.Int64)        // user: %64
  // function_ref _ArrayBuffer.count.setter
  %63 = function_ref @$ss12_ArrayBufferV5countSivs : $@convention(method) <τ_0_0> (Int, @inout _ArrayBuffer<τ_0_0>) -> () // user: %64
  %64 = apply %63<Element>(%62, %51) : $@convention(method) <τ_0_0> (Int, @inout _ArrayBuffer<τ_0_0>) -> ()
  br bb10                                         // id: %65

bb10:                                             // Preds: bb9 bb8
  // function_ref specialized _ArrayBuffer.init(_buffer:shiftedToStartIndex:)
  %66 = function_ref @$ss12_ArrayBufferV7_buffer19shiftedToStartIndexAByxGs011_ContiguousaB0VyxG_SitcfCTf4ndd_n : $@convention(thin) <τ_0_0> (@owned _ContiguousArrayBuffer<τ_0_0>) -> @owned _ArrayBuffer<τ_0_0> // user: %67
  %67 = apply %66<Element>(%31) : $@convention(thin) <τ_0_0> (@owned _ContiguousArrayBuffer<τ_0_0>) -> @owned _ArrayBuffer<τ_0_0> // user: %75
  %68 = struct_element_addr %3 : $*Array<Element>, #Array._buffer // user: %69
  %69 = struct_element_addr %68 : $*_ArrayBuffer<Element>, #_ArrayBuffer._storage // user: %70
  %70 = struct_element_addr %69 : $*_BridgeStorage<__ContiguousArrayStorageBase>, #_BridgeStorage.rawValue // user: %71
  %71 = load %70 : $*Builtin.BridgeObject         // user: %74
  %72 = struct_extract %31 : $_ContiguousArrayBuffer<Element>, #_ContiguousArrayBuffer._storage // user: %73
  strong_retain %72 : $__ContiguousArrayStorageBase // id: %73
  strong_release %71 : $Builtin.BridgeObject      // id: %74
  %75 = struct $Array<Element> (%67 : $_ArrayBuffer<Element>) // user: %76
  store %75 to %3 : $*Array<Element>              // id: %76
  release_value %31 : $_ContiguousArrayBuffer<Element> // id: %77
  %78 = tuple ()                                  // user: %79
  return %78 : $()                                // id: %79
} // end sil function '$sSa16_createNewBuffer14bufferIsUnique15minimumCapacity13growForAppendySb_SiSbtF'

// _ArrayBuffer._isNative.getter
sil public_external @$ss12_ArrayBufferV9_isNativeSbvg : $@convention(method) <Element> (@guaranteed _ArrayBuffer<Element>) -> Bool {
// %0                                             // user: %23
bb0(%0 : $_ArrayBuffer<Element>):
  %1 = metatype $@thick Element.Type              // users: %10, %2
  %2 = builtin "canBeClass"<Element>(%1 : $@thick Element.Type) : $Builtin.Int8 // users: %7, %4
  %3 = integer_literal $Builtin.Int8, 0           // user: %4
  %4 = builtin "cmp_eq_Int8"(%2 : $Builtin.Int8, %3 : $Builtin.Int8) : $Builtin.Int1 // user: %5
  cond_br %4, bb4, bb1                            // id: %5

bb1:                                              // Preds: bb0
  %6 = integer_literal $Builtin.Int8, 1           // user: %7
  %7 = builtin "cmp_eq_Int8"(%2 : $Builtin.Int8, %6 : $Builtin.Int8) : $Builtin.Int1 // user: %8
  cond_br %7, bb3, bb2                            // id: %8

bb2:                                              // Preds: bb1
  // function_ref _swift_isClassOrObjCExistentialType
  %9 = function_ref @_swift_isClassOrObjCExistentialType : $@convention(thin) <τ_0_0> (@thick τ_0_0.Type) -> Bool // user: %10
  %10 = apply %9<Element>(%1) : $@convention(thin) <τ_0_0> (@thick τ_0_0.Type) -> Bool // user: %11
  br bb5(%10 : $Bool)                             // id: %11

bb3:                                              // Preds: bb1
  %12 = integer_literal $Builtin.Int1, -1         // user: %13
  %13 = struct $Bool (%12 : $Builtin.Int1)        // user: %14
  br bb5(%13 : $Bool)                             // id: %14

bb4:                                              // Preds: bb0
  %15 = integer_literal $Builtin.Int1, 0          // user: %16
  %16 = struct $Bool (%15 : $Builtin.Int1)        // user: %17
  br bb5(%16 : $Bool)                             // id: %17

// %18                                            // user: %19
bb5(%18 : $Bool):                                 // Preds: bb4 bb3 bb2
  %19 = struct_extract %18 : $Bool, #Bool._value  // user: %20
  cond_br %19, bb7, bb6                           // id: %20

bb6:                                              // Preds: bb5
  %21 = integer_literal $Builtin.Int1, -1         // user: %22
  br bb8(%21 : $Builtin.Int1)                     // id: %22

bb7:                                              // Preds: bb5
  %23 = struct_extract %0 : $_ArrayBuffer<Element>, #_ArrayBuffer._storage // user: %24
  %24 = struct_extract %23 : $_BridgeStorage<__ContiguousArrayStorageBase>, #_BridgeStorage.rawValue // user: %25
  %25 = classify_bridge_object %24 : $Builtin.BridgeObject // users: %27, %26
  %26 = tuple_extract %25 : $(Builtin.Int1, Builtin.Int1), 0 // user: %28
  %27 = tuple_extract %25 : $(Builtin.Int1, Builtin.Int1), 1 // user: %28
  %28 = builtin "or_Int1"(%26 : $Builtin.Int1, %27 : $Builtin.Int1) : $Builtin.Int1 // user: %30
  %29 = integer_literal $Builtin.Int1, -1         // user: %30
  %30 = builtin "xor_Int1"(%28 : $Builtin.Int1, %29 : $Builtin.Int1) : $Builtin.Int1 // user: %31
  br bb8(%30 : $Builtin.Int1)                     // id: %31

// %32                                            // user: %33
bb8(%32 : $Builtin.Int1):                         // Preds: bb7 bb6
  %33 = struct $Bool (%32 : $Builtin.Int1)        // user: %34
  return %33 : $Bool                              // id: %34
} // end sil function '$ss12_ArrayBufferV9_isNativeSbvg'

// _CocoaArrayWrapper.endIndex.getter
sil @$ss18_CocoaArrayWrapperV8endIndexSivg : $@convention(method) (@guaranteed _CocoaArrayWrapper) -> Int

// _ContiguousArrayBuffer.count.getter
sil public_external @$ss22_ContiguousArrayBufferV5countSivg : $@convention(method) <Element> (@guaranteed _ContiguousArrayBuffer<Element>) -> Int {
// %0                                             // user: %1
bb0(%0 : $_ContiguousArrayBuffer<Element>):
  %1 = struct_extract %0 : $_ContiguousArrayBuffer<Element>, #_ContiguousArrayBuffer._storage // user: %2
  %2 = ref_element_addr %1 : $__ContiguousArrayStorageBase, #__ContiguousArrayStorageBase.countAndCapacity // user: %3
  %3 = struct_element_addr %2 : $*_ArrayBody, #_ArrayBody._storage // user: %4
  %4 = struct_element_addr %3 : $*_SwiftArrayBodyStorage, #_SwiftArrayBodyStorage.count // user: %5
  %5 = struct_element_addr %4 : $*Int, #Int._value // user: %6
  %6 = load %5 : $*Builtin.Int64                  // user: %7
  %7 = builtin "assumeNonNegative_Int64"(%6 : $Builtin.Int64) : $Builtin.Int64 // user: %8
  %8 = struct $Int (%7 : $Builtin.Int64)          // user: %9
  return %8 : $Int                                // id: %9
} // end sil function '$ss22_ContiguousArrayBufferV5countSivg'

// _ArrayBuffer.capacity.getter
sil public_external @$ss12_ArrayBufferV8capacitySivg : $@convention(method) <Element> (@guaranteed _ArrayBuffer<Element>) -> Int {
// %0                                             // users: %19, %29, %7, %2
bb0(%0 : $_ArrayBuffer<Element>):
  // function_ref _ArrayBuffer._isNative.getter
  %1 = function_ref @$ss12_ArrayBufferV9_isNativeSbvg : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> Bool // user: %2
  %2 = apply %1<Element>(%0) : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> Bool // user: %3
  %3 = struct_extract %2 : $Bool, #Bool._value    // user: %5
  %4 = integer_literal $Builtin.Int1, -1          // user: %5
  %5 = builtin "int_expect_Int1"(%3 : $Builtin.Int1, %4 : $Builtin.Int1) : $Builtin.Int1 // user: %6
  cond_br %5, bb2, bb1                            // id: %6

bb1:                                              // Preds: bb0
  %7 = struct_extract %0 : $_ArrayBuffer<Element>, #_ArrayBuffer._storage // user: %8
  %8 = struct_extract %7 : $_BridgeStorage<__ContiguousArrayStorageBase>, #_BridgeStorage.rawValue // users: %13, %9
  %9 = bridge_object_to_ref %8 : $Builtin.BridgeObject to $AnyObject // user: %10
  %10 = struct $_CocoaArrayWrapper (%9 : $AnyObject) // users: %18, %15, %14
  %11 = integer_literal $Builtin.Int64, 0         // users: %17, %21
  // function_ref _CocoaArrayWrapper.endIndex.getter
  %12 = function_ref @$ss18_CocoaArrayWrapperV8endIndexSivg : $@convention(method) (@guaranteed _CocoaArrayWrapper) -> Int // users: %18, %15, %14
  strong_retain %8 : $Builtin.BridgeObject        // id: %13
  %14 = apply %12(%10) : $@convention(method) (@guaranteed _CocoaArrayWrapper) -> Int // users: %20, %27
  %15 = apply %12(%10) : $@convention(method) (@guaranteed _CocoaArrayWrapper) -> Int // user: %16
  %16 = struct_extract %15 : $Int, #Int._value    // user: %17
  %17 = builtin "cmp_slt_Int64"(%16 : $Builtin.Int64, %11 : $Builtin.Int64) : $Builtin.Int1 // user: %25
  %18 = apply %12(%10) : $@convention(method) (@guaranteed _CocoaArrayWrapper) -> Int // user: %23
  release_value %0 : $_ArrayBuffer<Element>       // id: %19
  %20 = struct_extract %14 : $Int, #Int._value    // users: %24, %21
  %21 = builtin "cmp_slt_Int64"(%20 : $Builtin.Int64, %11 : $Builtin.Int64) : $Builtin.Int1 // user: %22
  cond_fail %21 : $Builtin.Int1, "Out of bounds: index < startIndex" // id: %22
  %23 = struct_extract %18 : $Int, #Int._value    // user: %24
  %24 = builtin "cmp_slt_Int64"(%23 : $Builtin.Int64, %20 : $Builtin.Int64) : $Builtin.Int1 // user: %25
  %25 = builtin "or_Int1"(%17 : $Builtin.Int1, %24 : $Builtin.Int1) : $Builtin.Int1 // user: %26
  cond_fail %25 : $Builtin.Int1, "Out of bounds: index > endIndex" // id: %26
  br bb3(%14 : $Int)                              // id: %27

bb2:                                              // Preds: bb0
  // function_ref _ArrayBuffer._native.getter
  %28 = function_ref @$ss12_ArrayBufferV7_natives011_ContiguousaB0VyxGvg : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> @owned _ContiguousArrayBuffer<τ_0_0> // user: %29
  %29 = apply %28<Element>(%0) : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> @owned _ContiguousArrayBuffer<τ_0_0> // users: %32, %31
  // function_ref _ContiguousArrayBuffer.capacity.getter
  %30 = function_ref @$ss22_ContiguousArrayBufferV8capacitySivg : $@convention(method) <τ_0_0> (@guaranteed _ContiguousArrayBuffer<τ_0_0>) -> Int // user: %31
  %31 = apply %30<Element>(%29) : $@convention(method) <τ_0_0> (@guaranteed _ContiguousArrayBuffer<τ_0_0>) -> Int // user: %33
  release_value %29 : $_ContiguousArrayBuffer<Element> // id: %32
  br bb3(%31 : $Int)                              // id: %33

// %34                                            // user: %35
bb3(%34 : $Int):                                  // Preds: bb2 bb1
  return %34 : $Int                               // id: %35
} // end sil function '$ss12_ArrayBufferV8capacitySivg'

// UnsafeMutablePointer.initialize(to:)
sil public_external @$sSp10initialize2toyx_tF : $@convention(method) <Pointee> (@in_guaranteed Pointee, UnsafeMutablePointer<Pointee>) -> () {
// %0                                             // user: %4
// %1                                             // user: %2
bb0(%0 : $*Pointee, %1 : $UnsafeMutablePointer<Pointee>):
  %2 = struct_extract %1 : $UnsafeMutablePointer<Pointee>, #UnsafeMutablePointer._rawValue // user: %3
  %3 = pointer_to_address %2 : $Builtin.RawPointer to [strict] $*Pointee // user: %4
  copy_addr %0 to [initialization] %3 : $*Pointee // id: %4
  %5 = tuple ()                                   // user: %6
  return %5 : $()                                 // id: %6
} // end sil function '$sSp10initialize2toyx_tF'

// _ContiguousArrayBuffer.capacity.getter
sil public_external @$ss22_ContiguousArrayBufferV8capacitySivg : $@convention(method) <Element> (@guaranteed _ContiguousArrayBuffer<Element>) -> Int {
// %0                                             // user: %1
bb0(%0 : $_ContiguousArrayBuffer<Element>):
  %1 = struct_extract %0 : $_ContiguousArrayBuffer<Element>, #_ContiguousArrayBuffer._storage // user: %2
  %2 = ref_element_addr %1 : $__ContiguousArrayStorageBase, #__ContiguousArrayStorageBase.countAndCapacity // user: %3
  %3 = struct_element_addr %2 : $*_ArrayBody, #_ArrayBody._storage // user: %4
  %4 = struct_element_addr %3 : $*_SwiftArrayBodyStorage, #_SwiftArrayBodyStorage._capacityAndFlags // user: %5
  %5 = struct_element_addr %4 : $*UInt, #UInt._value // user: %6
  %6 = load %5 : $*Builtin.Int64                  // user: %8
  %7 = integer_literal $Builtin.Int64, 1          // user: %8
  %8 = builtin "lshr_Int64"(%6 : $Builtin.Int64, %7 : $Builtin.Int64) : $Builtin.Int64 // user: %9
  %9 = struct $Int (%8 : $Builtin.Int64)          // user: %10
  return %9 : $Int                                // id: %10
} // end sil function '$ss22_ContiguousArrayBufferV8capacitySivg'

// Array._getCapacity()
sil public_external [_semantics "array.get_capacity"] @$sSa12_getCapacitySiyF : $@convention(method) <Element> (@guaranteed Array<Element>) -> Int {
// %0                                             // user: %1
bb0(%0 : $Array<Element>):
  %1 = struct_extract %0 : $Array<Element>, #Array._buffer // user: %3
  // function_ref _ArrayBuffer.capacity.getter
  %2 = function_ref @$ss12_ArrayBufferV8capacitySivg : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> Int // user: %3
  %3 = apply %2<Element>(%1) : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> Int // user: %4
  return %3 : $Int                                // id: %4
} // end sil function '$sSa12_getCapacitySiyF'

// _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)
sil public_external @$ss22_ContiguousArrayBufferV19_uninitializedCount15minimumCapacityAByxGSi_SitcfC : $@convention(method) <Element> (Int, Int, @thin _ContiguousArrayBuffer<Element>.Type) -> @owned _ContiguousArrayBuffer<Element> {
// %0                                             // users: %52, %8, %3
// %1                                             // users: %7, %4
// %2                                             // user: %56
bb0(%0 : $Int, %1 : $Int, %2 : $@thin _ContiguousArrayBuffer<Element>.Type):
  %3 = struct_extract %0 : $Int, #Int._value      // user: %5
  %4 = struct_extract %1 : $Int, #Int._value      // user: %5
  %5 = builtin "cmp_slt_Int64"(%4 : $Builtin.Int64, %3 : $Builtin.Int64) : $Builtin.Int1 // user: %6
  cond_br %5, bb2, bb1                            // id: %6

bb1:                                              // Preds: bb0
  br bb3(%1 : $Int)                               // id: %7

bb2:                                              // Preds: bb0
  br bb3(%0 : $Int)                               // id: %8

// %9                                             // user: %10
bb3(%9 : $Int):                                   // Preds: bb2 bb1
  %10 = struct_extract %9 : $Int, #Int._value     // users: %14, %12
  %11 = integer_literal $Builtin.Int64, 0         // users: %36, %12
  %12 = builtin "cmp_eq_Int64"(%10 : $Builtin.Int64, %11 : $Builtin.Int64) : $Builtin.Int1 // user: %13
  cond_br %12, bb8, bb4                           // id: %13

bb4:                                              // Preds: bb3
  %14 = builtin "truncOrBitCast_Int64_Word"(%10 : $Builtin.Int64) : $Builtin.Word // user: %15
  %15 = alloc_ref [tail_elems $Element * %14 : $Builtin.Word] $_ContiguousArrayStorage<Element> // users: %53, %20, %16
  %16 = upcast %15 : $_ContiguousArrayStorage<Element> to $__ContiguousArrayStorageBase // users: %54, %25, %17
  %17 = ref_to_raw_pointer %16 : $__ContiguousArrayStorageBase to $Builtin.RawPointer // users: %24, %18
  %18 = struct $UnsafeRawPointer (%17 : $Builtin.RawPointer) // user: %21
  // function_ref _swift_stdlib_malloc_size
  %19 = function_ref @_swift_stdlib_malloc_size : $@convention(c) (UnsafeRawPointer) -> Int // user: %21
  strong_retain %15 : $_ContiguousArrayStorage<Element> // id: %20
  %21 = apply %19(%18) : $@convention(c) (UnsafeRawPointer) -> Int // user: %22
  %22 = struct_extract %21 : $Int, #Int._value    // user: %23
  %23 = builtin "truncOrBitCast_Int64_Word"(%22 : $Builtin.Int64) : $Builtin.Word // user: %24
  %24 = index_raw_pointer %17 : $Builtin.RawPointer, %23 : $Builtin.Word // user: %28
  %25 = struct $_ContiguousArrayBuffer<Element> (%16 : $__ContiguousArrayStorageBase) // users: %52, %27
  // function_ref _ContiguousArrayBuffer.firstElementAddress.getter
  %26 = function_ref @$ss22_ContiguousArrayBufferV19firstElementAddressSpyxGvg : $@convention(method) <τ_0_0> (@guaranteed _ContiguousArrayBuffer<τ_0_0>) -> UnsafeMutablePointer<τ_0_0> // user: %27
  %27 = apply %26<Element>(%25) : $@convention(method) <τ_0_0> (@guaranteed _ContiguousArrayBuffer<τ_0_0>) -> UnsafeMutablePointer<τ_0_0> // user: %29
  %28 = builtin "ptrtoint_Word"(%24 : $Builtin.RawPointer) : $Builtin.Word // user: %31
  %29 = struct_extract %27 : $UnsafeMutablePointer<Element>, #UnsafeMutablePointer._rawValue // user: %30
  %30 = builtin "ptrtoint_Word"(%29 : $Builtin.RawPointer) : $Builtin.Word // user: %31
  %31 = builtin "sub_Word"(%28 : $Builtin.Word, %30 : $Builtin.Word) : $Builtin.Word // user: %32
  %32 = builtin "sextOrBitCast_Word_Int64"(%31 : $Builtin.Word) : $Builtin.Int64 // users: %49, %41
  %33 = metatype $@thick Element.Type             // user: %34
  %34 = builtin "strideof"<Element>(%33 : $@thick Element.Type) : $Builtin.Word // user: %35
  %35 = builtin "sextOrBitCast_Word_Int64"(%34 : $Builtin.Word) : $Builtin.Int64 // users: %49, %45, %36
  %36 = builtin "cmp_eq_Int64"(%35 : $Builtin.Int64, %11 : $Builtin.Int64) : $Builtin.Int1 // user: %38
  %37 = integer_literal $Builtin.Int1, 0          // users: %46, %38
  %38 = builtin "int_expect_Int1"(%36 : $Builtin.Int1, %37 : $Builtin.Int1) : $Builtin.Int1 // user: %39
  cond_fail %38 : $Builtin.Int1, "Division by zero" // id: %39
  %40 = integer_literal $Builtin.Int64, -9223372036854775808 // user: %41
  %41 = builtin "cmp_eq_Int64"(%32 : $Builtin.Int64, %40 : $Builtin.Int64) : $Builtin.Int1 // user: %42
  cond_br %41, bb6, bb5                           // id: %42

bb5:                                              // Preds: bb4
  br bb7                                          // id: %43

bb6:                                              // Preds: bb4
  %44 = integer_literal $Builtin.Int64, -1        // user: %45
  %45 = builtin "cmp_eq_Int64"(%35 : $Builtin.Int64, %44 : $Builtin.Int64) : $Builtin.Int1 // user: %46
  %46 = builtin "int_expect_Int1"(%45 : $Builtin.Int1, %37 : $Builtin.Int1) : $Builtin.Int1 // user: %47
  cond_fail %46 : $Builtin.Int1, "Division results in an overflow" // id: %47
  br bb7                                          // id: %48

bb7:                                              // Preds: bb5 bb6
  %49 = builtin "sdiv_Int64"(%32 : $Builtin.Int64, %35 : $Builtin.Int64) : $Builtin.Int64 // user: %50
  %50 = struct $Int (%49 : $Builtin.Int64)        // user: %52
  // function_ref _ContiguousArrayBuffer._initStorageHeader(count:capacity:)
  %51 = function_ref @$ss22_ContiguousArrayBufferV18_initStorageHeader5count8capacityySi_SitF : $@convention(method) <τ_0_0> (Int, Int, @guaranteed _ContiguousArrayBuffer<τ_0_0>) -> () // user: %52
  %52 = apply %51<Element>(%0, %50, %25) : $@convention(method) <τ_0_0> (Int, Int, @guaranteed _ContiguousArrayBuffer<τ_0_0>) -> ()
  strong_release %15 : $_ContiguousArrayStorage<Element> // id: %53
  br bb9(%16 : $__ContiguousArrayStorageBase)     // id: %54

bb8:                                              // Preds: bb3
  // function_ref specialized _ContiguousArrayBuffer.init()
  %55 = function_ref @$ss22_ContiguousArrayBufferVAByxGycfCTf4n_g : $@convention(method) <τ_0_0> (@thin _ContiguousArrayBuffer<τ_0_0>.Type) -> _ContiguousArrayBuffer<τ_0_0> // user: %56
  %56 = apply %55<Element>(%2) : $@convention(method) <τ_0_0> (@thin _ContiguousArrayBuffer<τ_0_0>.Type) -> _ContiguousArrayBuffer<τ_0_0> // user: %57
  %57 = struct_extract %56 : $_ContiguousArrayBuffer<Element>, #_ContiguousArrayBuffer._storage // users: %59, %58
  strong_retain %57 : $__ContiguousArrayStorageBase // id: %58
  br bb9(%57 : $__ContiguousArrayStorageBase)     // id: %59

// %60                                            // user: %61
bb9(%60 : $__ContiguousArrayStorageBase):         // Preds: bb8 bb7
  %61 = struct $_ContiguousArrayBuffer<Element> (%60 : $__ContiguousArrayStorageBase) // user: %62
  return %61 : $_ContiguousArrayBuffer<Element>   // id: %62
} // end sil function '$ss22_ContiguousArrayBufferV19_uninitializedCount15minimumCapacityAByxGSi_SitcfC'

// UnsafeMutablePointer.moveInitialize(from:count:)
sil public_external @$sSp14moveInitialize4from5countySpyxG_SitF : $@convention(method) <Pointee> (UnsafeMutablePointer<Pointee>, Int, UnsafeMutablePointer<Pointee>) -> () {
// %0                                             // user: %4
// %1                                             // users: %35, %30, %10
// %2                                             // users: %9, %3
bb0(%0 : $UnsafeMutablePointer<Pointee>, %1 : $Int, %2 : $UnsafeMutablePointer<Pointee>):
  %3 = struct_extract %2 : $UnsafeMutablePointer<Pointee>, #UnsafeMutablePointer._rawValue // users: %37, %32, %5
  %4 = struct_extract %0 : $UnsafeMutablePointer<Pointee>, #UnsafeMutablePointer._rawValue // users: %37, %32, %12, %5
  %5 = builtin "cmp_ult_RawPointer"(%3 : $Builtin.RawPointer, %4 : $Builtin.RawPointer) : $Builtin.Int1 // user: %6
  cond_br %5, bb2, bb1                            // id: %6

bb1:                                              // Preds: bb0
  %7 = metatype $@thick UnsafeMutablePointer<Pointee>.Type // user: %19
  %8 = alloc_stack $UnsafeMutablePointer<Pointee> // users: %21, %19, %9
  store %2 to %8 : $*UnsafeMutablePointer<Pointee> // id: %9
  %10 = struct_extract %1 : $Int, #Int._value     // user: %11
  %11 = builtin "truncOrBitCast_Int64_Word"(%10 : $Builtin.Int64) : $Builtin.Word // user: %13
  %12 = pointer_to_address %4 : $Builtin.RawPointer to [strict] $*Pointee // user: %13
  %13 = index_addr %12 : $*Pointee, %11 : $Builtin.Word // user: %14
  %14 = address_to_pointer %13 : $*Pointee to $Builtin.RawPointer // user: %15
  %15 = struct $UnsafeMutablePointer<Pointee> (%14 : $Builtin.RawPointer) // user: %17
  %16 = alloc_stack $UnsafeMutablePointer<Pointee> // users: %20, %19, %17
  store %15 to %16 : $*UnsafeMutablePointer<Pointee> // id: %17
  // function_ref static Comparable.>= infix(_:_:)
  %18 = function_ref @$sSLsE2geoiySbx_xtFZ : $@convention(method) <τ_0_0 where τ_0_0 : Comparable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // user: %19
  %19 = apply %18<UnsafeMutablePointer<Pointee>>(%8, %16, %7) : $@convention(method) <τ_0_0 where τ_0_0 : Comparable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // user: %22
  dealloc_stack %16 : $*UnsafeMutablePointer<Pointee> // id: %20
  dealloc_stack %8 : $*UnsafeMutablePointer<Pointee> // id: %21
  br bb3(%19 : $Bool)                             // id: %22

bb2:                                              // Preds: bb0
  %23 = integer_literal $Builtin.Int1, -1         // user: %24
  %24 = struct $Bool (%23 : $Builtin.Int1)        // user: %25
  br bb3(%24 : $Bool)                             // id: %25

// %26                                            // user: %27
bb3(%26 : $Bool):                                 // Preds: bb2 bb1
  %27 = struct_extract %26 : $Bool, #Bool._value  // user: %28
  cond_br %27, bb5, bb4                           // id: %28

bb4:                                              // Preds: bb3
  %29 = metatype $@thick Pointee.Type             // user: %32
  %30 = struct_extract %1 : $Int, #Int._value     // user: %31
  %31 = builtin "truncOrBitCast_Int64_Word"(%30 : $Builtin.Int64) : $Builtin.Word // user: %32
  %32 = builtin "takeArrayBackToFront"<Pointee>(%29 : $@thick Pointee.Type, %3 : $Builtin.RawPointer, %4 : $Builtin.RawPointer, %31 : $Builtin.Word) : $()
  br bb6                                          // id: %33

bb5:                                              // Preds: bb3
  %34 = metatype $@thick Pointee.Type             // user: %37
  %35 = struct_extract %1 : $Int, #Int._value     // user: %36
  %36 = builtin "truncOrBitCast_Int64_Word"(%35 : $Builtin.Int64) : $Builtin.Word // user: %37
  %37 = builtin "takeArrayFrontToBack"<Pointee>(%34 : $@thick Pointee.Type, %3 : $Builtin.RawPointer, %4 : $Builtin.RawPointer, %36 : $Builtin.Word) : $()
  br bb6                                          // id: %38

bb6:                                              // Preds: bb5 bb4
  %39 = tuple ()                                  // user: %40
  return %39 : $()                                // id: %40
} // end sil function '$sSp14moveInitialize4from5countySpyxG_SitF'

// _swift_stdlib_malloc_size
sil shared_external [clang _swift_stdlib_malloc_size] @_swift_stdlib_malloc_size : $@convention(c) (UnsafeRawPointer) -> Int

// _ArrayBuffer._typeCheck(_:)
sil public_external @$ss12_ArrayBufferV10_typeCheckyySnySiGF : $@convention(method) <Element> (Range<Int>, @guaranteed _ArrayBuffer<Element>) -> () {
// %0                                             // users: %31, %30
// %1                                             // users: %49, %24
bb0(%0 : $Range<Int>, %1 : $_ArrayBuffer<Element>):
  %2 = metatype $@thick Element.Type              // users: %11, %3
  %3 = builtin "canBeClass"<Element>(%2 : $@thick Element.Type) : $Builtin.Int8 // users: %8, %5
  %4 = integer_literal $Builtin.Int8, 0           // user: %5
  %5 = builtin "cmp_eq_Int8"(%3 : $Builtin.Int8, %4 : $Builtin.Int8) : $Builtin.Int1 // user: %6
  cond_br %5, bb4, bb1                            // id: %6

bb1:                                              // Preds: bb0
  %7 = integer_literal $Builtin.Int8, 1           // user: %8
  %8 = builtin "cmp_eq_Int8"(%3 : $Builtin.Int8, %7 : $Builtin.Int8) : $Builtin.Int1 // user: %9
  cond_br %8, bb3, bb2                            // id: %9

bb2:                                              // Preds: bb1
  // function_ref _swift_isClassOrObjCExistentialType
  %10 = function_ref @_swift_isClassOrObjCExistentialType : $@convention(thin) <τ_0_0> (@thick τ_0_0.Type) -> Bool // user: %11
  %11 = apply %10<Element>(%2) : $@convention(thin) <τ_0_0> (@thick τ_0_0.Type) -> Bool // user: %12
  br bb5(%11 : $Bool)                             // id: %12

bb3:                                              // Preds: bb1
  %13 = integer_literal $Builtin.Int1, -1         // user: %14
  %14 = struct $Bool (%13 : $Builtin.Int1)        // user: %15
  br bb5(%14 : $Bool)                             // id: %15

bb4:                                              // Preds: bb0
  %16 = integer_literal $Builtin.Int1, 0          // user: %17
  %17 = struct $Bool (%16 : $Builtin.Int1)        // user: %18
  br bb5(%17 : $Bool)                             // id: %18

// %19                                            // user: %20
bb5(%19 : $Bool):                                 // Preds: bb4 bb3 bb2
  %20 = struct_extract %19 : $Bool, #Bool._value  // user: %21
  cond_br %20, bb7, bb6                           // id: %21

bb6:                                              // Preds: bb5
  br bb15                                         // id: %22

bb7:                                              // Preds: bb5
  // function_ref _ArrayBuffer.needsElementTypeCheck.getter
  %23 = function_ref @$ss12_ArrayBufferV21needsElementTypeCheckSbvg : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> Bool // user: %24
  %24 = apply %23<Element>(%1) : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> Bool // user: %25
  %25 = struct_extract %24 : $Bool, #Bool._value  // user: %27
  %26 = integer_literal $Builtin.Int1, 0          // user: %27
  %27 = builtin "int_expect_Int1"(%25 : $Builtin.Int1, %26 : $Builtin.Int1) : $Builtin.Int1 // user: %28
  cond_br %27, bb9, bb8                           // id: %28

bb8:                                              // Preds: bb7
  br bb15                                         // id: %29

bb9:                                              // Preds: bb7
  %30 = struct_extract %0 : $Range<Int>, #Range.lowerBound // user: %33
  %31 = struct_extract %0 : $Range<Int>, #Range.upperBound // user: %32
  %32 = struct_extract %31 : $Int, #Int._value    // users: %42, %36, %50, %34
  %33 = struct_extract %30 : $Int, #Int._value    // users: %42, %36, %44, %34
  %34 = builtin "cmp_slt_Int64"(%32 : $Builtin.Int64, %33 : $Builtin.Int64) : $Builtin.Int1 // user: %35
  cond_fail %34 : $Builtin.Int1, "Can't form Range with upperBound < lowerBound" // id: %35
  %36 = builtin "cmp_eq_Int64"(%33 : $Builtin.Int64, %32 : $Builtin.Int64) : $Builtin.Int1 // user: %37
  cond_br %36, bb10, bb11                         // id: %37

bb10:                                             // Preds: bb9
  br bb15                                         // id: %38

bb11:                                             // Preds: bb9
  %39 = integer_literal $Builtin.Int1, -1         // user: %47
  %40 = integer_literal $Builtin.Int64, 1         // user: %47
  // function_ref _ArrayBuffer._typeCheckSlowPath(_:)
  %41 = function_ref @$ss12_ArrayBufferV18_typeCheckSlowPathyySiF : $@convention(method) <τ_0_0> (Int, @guaranteed _ArrayBuffer<τ_0_0>) -> () // user: %49
  %42 = builtin "cmp_sge_Int64"(%33 : $Builtin.Int64, %32 : $Builtin.Int64) : $Builtin.Int1 // user: %43
  cond_fail %42 : $Builtin.Int1, "loop induction variable overflowed" // id: %43
  br bb12(%33 : $Builtin.Int64)                   // id: %44

// %45                                            // users: %47, %46
bb12(%45 : $Builtin.Int64):                       // Preds: bb14 bb11
  %46 = struct $Int (%45 : $Builtin.Int64)        // user: %49
  %47 = builtin "sadd_with_overflow_Int64"(%45 : $Builtin.Int64, %40 : $Builtin.Int64, %39 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // user: %48
  %48 = tuple_extract %47 : $(Builtin.Int64, Builtin.Int1), 0 // users: %53, %50
  %49 = apply %41<Element>(%46, %1) : $@convention(method) <τ_0_0> (Int, @guaranteed _ArrayBuffer<τ_0_0>) -> ()
  %50 = builtin "cmp_eq_Int64"(%48 : $Builtin.Int64, %32 : $Builtin.Int64) : $Builtin.Int1 // user: %51
  cond_br %50, bb13, bb14                         // id: %51

bb13:                                             // Preds: bb12
  br bb15                                         // id: %52

bb14:                                             // Preds: bb12
  br bb12(%48 : $Builtin.Int64)                   // id: %53

bb15:                                             // Preds: bb13 bb10 bb8 bb6
  %54 = tuple ()                                  // user: %55
  return %54 : $()                                // id: %55
} // end sil function '$ss12_ArrayBufferV10_typeCheckyySnySiGF'

// _CocoaArrayWrapper._copyContents(subRange:initializing:)
sil @$ss18_CocoaArrayWrapperV13_copyContents8subRange12initializingSpyyXlGSnySiG_AFtF : $@convention(method) (Range<Int>, UnsafeMutablePointer<AnyObject>, @owned _CocoaArrayWrapper) -> UnsafeMutablePointer<AnyObject>

// static Comparable.>= infix(_:_:)
sil public_external @$sSLsE2geoiySbx_xtFZ : $@convention(method) <Self where Self : Comparable> (@in_guaranteed Self, @in_guaranteed Self, @thick Self.Type) -> Bool {
// %0                                             // user: %5
// %1                                             // user: %5
bb0(%0 : $*Self, %1 : $*Self, %2 : $@thick Self.Type):
  %3 = metatype $@thick Self.Type                 // user: %5
  %4 = witness_method $Self, #Comparable."<" : <Self where Self : Comparable> (Self.Type) -> (Self, Self) -> Bool : $@convention(witness_method: Comparable) <τ_0_0 where τ_0_0 : Comparable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // user: %5
  %5 = apply %4<Self>(%0, %1, %3) : $@convention(witness_method: Comparable) <τ_0_0 where τ_0_0 : Comparable> (@in_guaranteed τ_0_0, @in_guaranteed τ_0_0, @thick τ_0_0.Type) -> Bool // user: %6
  %6 = struct_extract %5 : $Bool, #Bool._value    // user: %8
  %7 = integer_literal $Builtin.Int1, -1          // user: %8
  %8 = builtin "xor_Int1"(%6 : $Builtin.Int1, %7 : $Builtin.Int1) : $Builtin.Int1 // user: %9
  %9 = struct $Bool (%8 : $Builtin.Int1)          // user: %10
  return %9 : $Bool                               // id: %10
} // end sil function '$sSLsE2geoiySbx_xtFZ'

// _ArrayBuffer.needsElementTypeCheck.getter
sil public_external @$ss12_ArrayBufferV21needsElementTypeCheckSbvg : $@convention(method) <Element> (@guaranteed _ArrayBuffer<Element>) -> Bool {
// %0                                             // user: %2
bb0(%0 : $_ArrayBuffer<Element>):
  // function_ref _ArrayBuffer._isNativeTypeChecked.getter
  %1 = function_ref @$ss12_ArrayBufferV20_isNativeTypeCheckedSbvg : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> Bool // user: %2
  %2 = apply %1<Element>(%0) : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> Bool // user: %3
  %3 = struct_extract %2 : $Bool, #Bool._value    // user: %4
  cond_br %3, bb5, bb1                            // id: %4

bb1:                                              // Preds: bb0
  %5 = metatype $@thick AnyObject.Protocol        // user: %6
  checked_cast_br %5 : $@thick AnyObject.Protocol to Element.Type, bb3, bb2 // id: %6

bb2:                                              // Preds: bb1
  %7 = integer_literal $Builtin.Int1, 0           // user: %8
  br bb4(%7 : $Builtin.Int1)                      // id: %8

bb3(%9 : $@thick Element.Type):                   // Preds: bb1
  %10 = integer_literal $Builtin.Int1, -1         // user: %11
  br bb4(%10 : $Builtin.Int1)                     // id: %11

// %12                                            // user: %14
bb4(%12 : $Builtin.Int1):                         // Preds: bb3 bb2
  %13 = integer_literal $Builtin.Int1, -1         // user: %14
  %14 = builtin "xor_Int1"(%12 : $Builtin.Int1, %13 : $Builtin.Int1) : $Builtin.Int1 // user: %15
  br bb6(%14 : $Builtin.Int1)                     // id: %15

bb5:                                              // Preds: bb0
  %16 = integer_literal $Builtin.Int1, 0          // user: %17
  br bb6(%16 : $Builtin.Int1)                     // id: %17

// %18                                            // user: %19
bb6(%18 : $Builtin.Int1):                         // Preds: bb5 bb4
  %19 = struct $Bool (%18 : $Builtin.Int1)        // user: %20
  return %19 : $Bool                              // id: %20
} // end sil function '$ss12_ArrayBufferV21needsElementTypeCheckSbvg'

// _ArrayBuffer._typeCheckSlowPath(_:)
sil [noinline] @$ss12_ArrayBufferV18_typeCheckSlowPathyySiF : $@convention(method) <τ_0_0> (Int, @guaranteed _ArrayBuffer<τ_0_0>) -> ()

// UnsafeMutablePointer.initialize(from:count:)
sil public_external @$sSp10initialize4from5countySPyxG_SitF : $@convention(method) <Pointee> (UnsafePointer<Pointee>, Int, UnsafeMutablePointer<Pointee>) -> () {
// %0                                             // user: %5
// %1                                             // user: %6
// %2                                             // user: %4
bb0(%0 : $UnsafePointer<Pointee>, %1 : $Int, %2 : $UnsafeMutablePointer<Pointee>):
  %3 = metatype $@thick Pointee.Type              // user: %8
  %4 = struct_extract %2 : $UnsafeMutablePointer<Pointee>, #UnsafeMutablePointer._rawValue // user: %8
  %5 = struct_extract %0 : $UnsafePointer<Pointee>, #UnsafePointer._rawValue // user: %8
  %6 = struct_extract %1 : $Int, #Int._value      // user: %7
  %7 = builtin "truncOrBitCast_Int64_Word"(%6 : $Builtin.Int64) : $Builtin.Word // user: %8
  %8 = builtin "copyArray"<Pointee>(%3 : $@thick Pointee.Type, %4 : $Builtin.RawPointer, %5 : $Builtin.RawPointer, %7 : $Builtin.Word) : $()
  %9 = tuple ()                                   // user: %10
  return %9 : $()                                 // id: %10
} // end sil function '$sSp10initialize4from5countySPyxG_SitF'

// _ArrayBuffer._isNativeTypeChecked.getter
sil public_external @$ss12_ArrayBufferV20_isNativeTypeCheckedSbvg : $@convention(method) <Element> (@guaranteed _ArrayBuffer<Element>) -> Bool {
// %0                                             // user: %23
bb0(%0 : $_ArrayBuffer<Element>):
  %1 = metatype $@thick Element.Type              // users: %10, %2
  %2 = builtin "canBeClass"<Element>(%1 : $@thick Element.Type) : $Builtin.Int8 // users: %7, %4
  %3 = integer_literal $Builtin.Int8, 0           // user: %4
  %4 = builtin "cmp_eq_Int8"(%2 : $Builtin.Int8, %3 : $Builtin.Int8) : $Builtin.Int1 // user: %5
  cond_br %4, bb4, bb1                            // id: %5

bb1:                                              // Preds: bb0
  %6 = integer_literal $Builtin.Int8, 1           // user: %7
  %7 = builtin "cmp_eq_Int8"(%2 : $Builtin.Int8, %6 : $Builtin.Int8) : $Builtin.Int1 // user: %8
  cond_br %7, bb3, bb2                            // id: %8

bb2:                                              // Preds: bb1
  // function_ref _swift_isClassOrObjCExistentialType
  %9 = function_ref @_swift_isClassOrObjCExistentialType : $@convention(thin) <τ_0_0> (@thick τ_0_0.Type) -> Bool // user: %10
  %10 = apply %9<Element>(%1) : $@convention(thin) <τ_0_0> (@thick τ_0_0.Type) -> Bool // user: %11
  br bb5(%10 : $Bool)                             // id: %11

bb3:                                              // Preds: bb1
  %12 = integer_literal $Builtin.Int1, -1         // user: %13
  %13 = struct $Bool (%12 : $Builtin.Int1)        // user: %14
  br bb5(%13 : $Bool)                             // id: %14

bb4:                                              // Preds: bb0
  %15 = integer_literal $Builtin.Int1, 0          // user: %16
  %16 = struct $Bool (%15 : $Builtin.Int1)        // user: %17
  br bb5(%16 : $Bool)                             // id: %17

// %18                                            // user: %19
bb5(%18 : $Bool):                                 // Preds: bb4 bb3 bb2
  %19 = struct_extract %18 : $Bool, #Bool._value  // user: %20
  cond_br %19, bb7, bb6                           // id: %20

bb6:                                              // Preds: bb5
  %21 = integer_literal $Builtin.Int1, -1         // user: %22
  br bb8(%21 : $Builtin.Int1)                     // id: %22

bb7:                                              // Preds: bb5
  %23 = struct_extract %0 : $_ArrayBuffer<Element>, #_ArrayBuffer._storage // user: %24
  %24 = struct_extract %23 : $_BridgeStorage<__ContiguousArrayStorageBase>, #_BridgeStorage.rawValue // user: %25
  %25 = bridge_object_to_word %24 : $Builtin.BridgeObject to $Builtin.Word // user: %26
  %26 = builtin "zextOrBitCast_Word_Int64"(%25 : $Builtin.Word) : $Builtin.Int64 // user: %28
  %27 = integer_literal $Builtin.Int64, -4611686018427387903 // user: %28
  %28 = builtin "and_Int64"(%26 : $Builtin.Int64, %27 : $Builtin.Int64) : $Builtin.Int64 // user: %30
  %29 = integer_literal $Builtin.Int64, 0         // user: %30
  %30 = builtin "cmp_eq_Int64"(%28 : $Builtin.Int64, %29 : $Builtin.Int64) : $Builtin.Int1 // user: %31
  br bb8(%30 : $Builtin.Int1)                     // id: %31

// %32                                            // user: %33
bb8(%32 : $Builtin.Int1):                         // Preds: bb7 bb6
  %33 = struct $Bool (%32 : $Builtin.Int1)        // user: %34
  return %33 : $Bool                              // id: %34
} // end sil function '$ss12_ArrayBufferV20_isNativeTypeCheckedSbvg'

// _ArrayBuffer.isUniquelyReferenced()
sil public_external @$ss12_ArrayBufferV20isUniquelyReferencedSbyF : $@convention(method) <Element> (@inout _ArrayBuffer<Element>) -> Bool {
// %0                                             // users: %34, %27, %21
bb0(%0 : $*_ArrayBuffer<Element>):
  %1 = metatype $@thick Element.Type              // users: %10, %2
  %2 = builtin "canBeClass"<Element>(%1 : $@thick Element.Type) : $Builtin.Int8 // users: %7, %4
  %3 = integer_literal $Builtin.Int8, 0           // user: %4
  %4 = builtin "cmp_eq_Int8"(%2 : $Builtin.Int8, %3 : $Builtin.Int8) : $Builtin.Int1 // user: %5
  cond_br %4, bb4, bb1                            // id: %5

bb1:                                              // Preds: bb0
  %6 = integer_literal $Builtin.Int8, 1           // user: %7
  %7 = builtin "cmp_eq_Int8"(%2 : $Builtin.Int8, %6 : $Builtin.Int8) : $Builtin.Int1 // user: %8
  cond_br %7, bb3, bb2                            // id: %8

bb2:                                              // Preds: bb1
  // function_ref _swift_isClassOrObjCExistentialType
  %9 = function_ref @_swift_isClassOrObjCExistentialType : $@convention(thin) <τ_0_0> (@thick τ_0_0.Type) -> Bool // user: %10
  %10 = apply %9<Element>(%1) : $@convention(thin) <τ_0_0> (@thick τ_0_0.Type) -> Bool // user: %11
  br bb5(%10 : $Bool)                             // id: %11

bb3:                                              // Preds: bb1
  %12 = integer_literal $Builtin.Int1, -1         // user: %13
  %13 = struct $Bool (%12 : $Builtin.Int1)        // user: %14
  br bb5(%13 : $Bool)                             // id: %14

bb4:                                              // Preds: bb0
  %15 = integer_literal $Builtin.Int1, 0          // user: %16
  %16 = struct $Bool (%15 : $Builtin.Int1)        // user: %17
  br bb5(%16 : $Bool)                             // id: %17

// %18                                            // user: %19
bb5(%18 : $Bool):                                 // Preds: bb4 bb3 bb2
  %19 = struct_extract %18 : $Bool, #Bool._value  // user: %20
  cond_br %19, bb7, bb6                           // id: %20

bb6:                                              // Preds: bb5
  %21 = struct_element_addr %0 : $*_ArrayBuffer<Element>, #_ArrayBuffer._storage // user: %22
  %22 = struct_element_addr %21 : $*_BridgeStorage<__ContiguousArrayStorageBase>, #_BridgeStorage.rawValue // user: %23
  %23 = unchecked_addr_cast %22 : $*Builtin.BridgeObject to $*Builtin.NativeObject // user: %24
  %24 = is_unique %23 : $*Builtin.NativeObject    // user: %25
  %25 = struct $Bool (%24 : $Builtin.Int1)        // user: %26
  br bb10(%25 : $Bool)                            // id: %26

bb7:                                              // Preds: bb5
  %27 = struct_element_addr %0 : $*_ArrayBuffer<Element>, #_ArrayBuffer._storage // user: %28
  %28 = struct_element_addr %27 : $*_BridgeStorage<__ContiguousArrayStorageBase>, #_BridgeStorage.rawValue // user: %29
  %29 = is_unique %28 : $*Builtin.BridgeObject    // user: %30
  cond_br %29, bb9, bb8                           // id: %30

bb8:                                              // Preds: bb7
  %31 = integer_literal $Builtin.Int1, 0          // user: %32
  %32 = struct $Bool (%31 : $Builtin.Int1)        // user: %33
  br bb10(%32 : $Bool)                            // id: %33

bb9:                                              // Preds: bb7
  %34 = load %0 : $*_ArrayBuffer<Element>         // users: %40, %39, %36
  // function_ref _ArrayBuffer._isNative.getter
  %35 = function_ref @$ss12_ArrayBufferV9_isNativeSbvg : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> Bool // user: %39
  %36 = struct_extract %34 : $_ArrayBuffer<Element>, #_ArrayBuffer._storage // user: %37
  %37 = struct_extract %36 : $_BridgeStorage<__ContiguousArrayStorageBase>, #_BridgeStorage.rawValue // user: %38
  strong_retain %37 : $Builtin.BridgeObject       // id: %38
  %39 = apply %35<Element>(%34) : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> Bool // user: %41
  release_value %34 : $_ArrayBuffer<Element>      // id: %40
  br bb10(%39 : $Bool)                            // id: %41

// %42                                            // user: %43
bb10(%42 : $Bool):                                // Preds: bb9 bb8 bb6
  return %42 : $Bool                              // id: %43
} // end sil function '$ss12_ArrayBufferV20isUniquelyReferencedSbyF'

// maxOSLogArgumentCount.getter
sil public_external [available 11.0] [_semantics "constant_evaluable"] @$s2os21maxOSLogArgumentCounts5UInt8Vvg : $@convention(thin) () -> UInt8 {
bb0:
  %0 = integer_literal $Builtin.Int8, 48          // user: %1
  %1 = struct $UInt8 (%0 : $Builtin.Int8)         // user: %2
  return %1 : $UInt8                              // id: %2
} // end sil function '$s2os21maxOSLogArgumentCounts5UInt8Vvg'

// OSLogInterpolation.getStringFormatSpecifier(_:_:)
sil public_external [available 11.0] [Onone] [readonly] [_semantics "constant_evaluable"] @$s2os18OSLogInterpolationV24getStringFormatSpecifierySSAA0bE9AlignmentV_AA0B7PrivacyVtF : $@convention(method) (@in_guaranteed OSLogStringAlignment, @in_guaranteed OSLogPrivacy, @guaranteed OSLogInterpolation) -> @owned String {
// %0                                             // users: %67, %47
// %1                                             // user: %12
bb0(%0 : $*OSLogStringAlignment, %1 : $*OSLogPrivacy, %2 : $OSLogInterpolation):
  %3 = alloc_stack $String                        // users: %98, %97, %95, %93, %82, %64, %43, %34, %30, %10
  %4 = string_literal utf8 "%"                    // user: %9
  %5 = integer_literal $Builtin.Word, 1           // user: %9
  %6 = integer_literal $Builtin.Int1, -1          // user: %9
  %7 = metatype $@thin String.Type                // user: %9
  // function_ref String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)
  %8 = function_ref @$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %9
  %9 = apply %8(%4, %5, %6, %7) : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %10
  store %9 to %3 : $*String                       // id: %10
  %11 = alloc_stack $OSLogPrivacy                 // users: %21, %20, %17, %16, %14, %12
  copy_addr %1 to [initialization] %11 : $*OSLogPrivacy // id: %12
  // function_ref OSLogPrivacy.privacySpecifier.getter
  %13 = function_ref @$s2os12OSLogPrivacyV16privacySpecifierSSSgvg : $@convention(method) (@in_guaranteed OSLogPrivacy) -> @owned Optional<String> // user: %14
  %14 = apply %13(%11) : $@convention(method) (@in_guaranteed OSLogPrivacy) -> @owned Optional<String> // user: %15
  switch_enum %14 : $Optional<String>, case #Optional.some!enumelt: bb2, case #Optional.none!enumelt: bb1 // id: %15

bb1:                                              // Preds: bb0
  destroy_addr %11 : $*OSLogPrivacy               // id: %16
  dealloc_stack %11 : $*OSLogPrivacy              // id: %17
  br bb3                                          // id: %18

// %19                                            // users: %45, %34
bb2(%19 : $String):                               // Preds: bb0
  destroy_addr %11 : $*OSLogPrivacy               // id: %20
  dealloc_stack %11 : $*OSLogPrivacy              // id: %21
  %22 = metatype $@thin String.Type               // user: %30
  %23 = string_literal utf8 "{"                   // user: %28
  %24 = integer_literal $Builtin.Word, 1          // user: %28
  %25 = integer_literal $Builtin.Int1, -1         // user: %28
  %26 = metatype $@thin String.Type               // user: %28
  // function_ref String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)
  %27 = function_ref @$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %28
  %28 = apply %27(%23, %24, %25, %26) : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // users: %31, %30
  // function_ref static String.+= infix(_:_:)
  %29 = function_ref @$sSS2peoiyySSz_SStFZ : $@convention(method) (@inout String, @guaranteed String, @thin String.Type) -> () // user: %30
  %30 = apply %29(%3, %28, %22) : $@convention(method) (@inout String, @guaranteed String, @thin String.Type) -> ()
  release_value %28 : $String                     // id: %31
  %32 = metatype $@thin String.Type               // user: %34
  // function_ref static String.+= infix(_:_:)
  %33 = function_ref @$sSS2peoiyySSz_SStFZ : $@convention(method) (@inout String, @guaranteed String, @thin String.Type) -> () // user: %34
  %34 = apply %33(%3, %19, %32) : $@convention(method) (@inout String, @guaranteed String, @thin String.Type) -> ()
  %35 = metatype $@thin String.Type               // user: %43
  %36 = string_literal utf8 "}"                   // user: %41
  %37 = integer_literal $Builtin.Word, 1          // user: %41
  %38 = integer_literal $Builtin.Int1, -1         // user: %41
  %39 = metatype $@thin String.Type               // user: %41
  // function_ref String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)
  %40 = function_ref @$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %41
  %41 = apply %40(%36, %37, %38, %39) : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // users: %44, %43
  // function_ref static String.+= infix(_:_:)
  %42 = function_ref @$sSS2peoiyySSz_SStFZ : $@convention(method) (@inout String, @guaranteed String, @thin String.Type) -> () // user: %43
  %43 = apply %42(%3, %41, %35) : $@convention(method) (@inout String, @guaranteed String, @thin String.Type) -> ()
  release_value %41 : $String                     // id: %44
  release_value %19 : $String                     // id: %45
  br bb3                                          // id: %46

bb3:                                              // Preds: bb2 bb1
  %47 = struct_element_addr %0 : $*OSLogStringAlignment, #OSLogStringAlignment.anchor // user: %49
  %48 = alloc_stack $OSLogCollectionBound         // users: %55, %54, %52, %51, %50, %49
  copy_addr %47 to [initialization] %48 : $*OSLogCollectionBound // id: %49
  switch_enum_addr %48 : $*OSLogCollectionBound, case #OSLogCollectionBound.start!enumelt: bb5, default bb4 // id: %50

bb4:                                              // Preds: bb3
  destroy_addr %48 : $*OSLogCollectionBound       // id: %51
  dealloc_stack %48 : $*OSLogCollectionBound      // id: %52
  br bb6                                          // id: %53

bb5:                                              // Preds: bb3
  destroy_addr %48 : $*OSLogCollectionBound       // id: %54
  dealloc_stack %48 : $*OSLogCollectionBound      // id: %55
  %56 = metatype $@thin String.Type               // user: %64
  %57 = string_literal utf8 "-"                   // user: %62
  %58 = integer_literal $Builtin.Word, 1          // user: %62
  %59 = integer_literal $Builtin.Int1, -1         // user: %62
  %60 = metatype $@thin String.Type               // user: %62
  // function_ref String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)
  %61 = function_ref @$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %62
  %62 = apply %61(%57, %58, %59, %60) : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // users: %65, %64
  // function_ref static String.+= infix(_:_:)
  %63 = function_ref @$sSS2peoiyySSz_SStFZ : $@convention(method) (@inout String, @guaranteed String, @thin String.Type) -> () // user: %64
  %64 = apply %63(%3, %62, %56) : $@convention(method) (@inout String, @guaranteed String, @thin String.Type) -> ()
  release_value %62 : $String                     // id: %65
  br bb6                                          // id: %66

bb6:                                              // Preds: bb5 bb4
  %67 = struct_element_addr %0 : $*OSLogStringAlignment, #OSLogStringAlignment.minimumColumnWidth // user: %68
  %68 = load %67 : $*Optional<@callee_guaranteed () -> Int> // users: %70, %69
  retain_value %68 : $Optional<@callee_guaranteed () -> Int> // id: %69
  switch_enum %68 : $Optional<@callee_guaranteed () -> Int>, case #Optional.some!enumelt: bb8, case #Optional.none!enumelt: bb7 // id: %70

bb7:                                              // Preds: bb6
  br bb9                                          // id: %71

// %72                                            // user: %73
bb8(%72 : $@callee_guaranteed () -> Int):         // Preds: bb6
  strong_release %72 : $@callee_guaranteed () -> Int // id: %73
  %74 = metatype $@thin String.Type               // user: %82
  %75 = string_literal utf8 "*"                   // user: %80
  %76 = integer_literal $Builtin.Word, 1          // user: %80
  %77 = integer_literal $Builtin.Int1, -1         // user: %80
  %78 = metatype $@thin String.Type               // user: %80
  // function_ref String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)
  %79 = function_ref @$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %80
  %80 = apply %79(%75, %76, %77, %78) : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // users: %83, %82
  // function_ref static String.+= infix(_:_:)
  %81 = function_ref @$sSS2peoiyySSz_SStFZ : $@convention(method) (@inout String, @guaranteed String, @thin String.Type) -> () // user: %82
  %82 = apply %81(%3, %80, %74) : $@convention(method) (@inout String, @guaranteed String, @thin String.Type) -> ()
  release_value %80 : $String                     // id: %83
  br bb9                                          // id: %84

bb9:                                              // Preds: bb8 bb7
  %85 = metatype $@thin String.Type               // user: %93
  %86 = string_literal utf8 "s"                   // user: %91
  %87 = integer_literal $Builtin.Word, 1          // user: %91
  %88 = integer_literal $Builtin.Int1, -1         // user: %91
  %89 = metatype $@thin String.Type               // user: %91
  // function_ref String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)
  %90 = function_ref @$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %91
  %91 = apply %90(%86, %87, %88, %89) : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // users: %94, %93
  // function_ref static String.+= infix(_:_:)
  %92 = function_ref @$sSS2peoiyySSz_SStFZ : $@convention(method) (@inout String, @guaranteed String, @thin String.Type) -> () // user: %93
  %93 = apply %92(%3, %91, %85) : $@convention(method) (@inout String, @guaranteed String, @thin String.Type) -> ()
  release_value %91 : $String                     // id: %94
  %95 = load %3 : $*String                        // users: %99, %96
  retain_value %95 : $String                      // id: %96
  destroy_addr %3 : $*String                      // id: %97
  dealloc_stack %3 : $*String                     // id: %98
  return %95 : $String                            // id: %99
} // end sil function '$s2os18OSLogInterpolationV24getStringFormatSpecifierySSAA0bE9AlignmentV_AA0B7PrivacyVtF'

// OSLogInterpolation.appendAlignmentArgument(_:)
sil public_external [available 11.0] [Onone] [_semantics "constant_evaluable"] @$s2os18OSLogInterpolationV23appendAlignmentArgumentyySiycF : $@convention(method) (@guaranteed @callee_guaranteed () -> Int, @inout OSLogInterpolation) -> () {
// %0                                             // users: %40, %39
// %1                                             // users: %49, %44, %27, %23, %18, %2
bb0(%0 : $@callee_guaranteed () -> Int, %1 : $*OSLogInterpolation):
  %2 = load %1 : $*OSLogInterpolation             // users: %17, %12, %3
  retain_value %2 : $OSLogInterpolation           // id: %3
  %4 = metatype $@thin OSLogPrivacy.Type          // user: %7
  %5 = alloc_stack $OSLogPrivacy                  // users: %16, %15, %12, %7
  // function_ref static OSLogPrivacy.auto.getter
  %6 = function_ref @$s2os12OSLogPrivacyV4autoACvgZ : $@convention(method) (@thin OSLogPrivacy.Type) -> @out OSLogPrivacy // user: %7
  %7 = apply %6(%5, %4) : $@convention(method) (@thin OSLogPrivacy.Type) -> @out OSLogPrivacy
  %8 = metatype $@thin OSLogInterpolation.ArgumentType.Type
  %9 = alloc_stack $OSLogInterpolation.ArgumentType // users: %14, %13, %12, %10
  inject_enum_addr %9 : $*OSLogInterpolation.ArgumentType, #OSLogInterpolation.ArgumentType.scalar!enumelt // id: %10
  // function_ref OSLogInterpolation.getArgumentHeader(privacy:type:)
  %11 = function_ref @$s2os18OSLogInterpolationV17getArgumentHeader7privacy4types5UInt8VAA0B7PrivacyV_AC0E4TypeOtF : $@convention(method) (@in_guaranteed OSLogPrivacy, @in_guaranteed OSLogInterpolation.ArgumentType, @guaranteed OSLogInterpolation) -> UInt8 // user: %12
  %12 = apply %11(%5, %9, %2) : $@convention(method) (@in_guaranteed OSLogPrivacy, @in_guaranteed OSLogInterpolation.ArgumentType, @guaranteed OSLogInterpolation) -> UInt8 // user: %20
  destroy_addr %9 : $*OSLogInterpolation.ArgumentType // id: %13
  dealloc_stack %9 : $*OSLogInterpolation.ArgumentType // id: %14
  destroy_addr %5 : $*OSLogPrivacy                // id: %15
  dealloc_stack %5 : $*OSLogPrivacy               // id: %16
  release_value %2 : $OSLogInterpolation          // id: %17
  %18 = struct_element_addr %1 : $*OSLogInterpolation, #OSLogInterpolation.arguments // user: %20
  // function_ref OSLogArguments.append(_:)
  %19 = function_ref @$s2os14OSLogArgumentsV6appendyys5UInt8VF : $@convention(method) (UInt8, @inout OSLogArguments) -> () // user: %20
  %20 = apply %19(%12, %18) : $@convention(method) (UInt8, @inout OSLogArguments) -> ()
  %21 = integer_literal $Builtin.Int8, 4          // user: %22
  %22 = struct $UInt8 (%21 : $Builtin.Int8)       // user: %25
  %23 = struct_element_addr %1 : $*OSLogInterpolation, #OSLogInterpolation.arguments // user: %25
  // function_ref OSLogArguments.append(_:)
  %24 = function_ref @$s2os14OSLogArgumentsV6appendyys5UInt8VF : $@convention(method) (UInt8, @inout OSLogArguments) -> () // user: %25
  %25 = apply %24(%22, %23) : $@convention(method) (UInt8, @inout OSLogArguments) -> ()
  %26 = integer_literal $Builtin.Int64, 6         // user: %31
  %27 = struct_element_addr %1 : $*OSLogInterpolation, #OSLogInterpolation.totalBytesForSerializingArguments // users: %36, %28
  %28 = struct_element_addr %27 : $*Int, #Int._value // user: %29
  %29 = load %28 : $*Builtin.Int64                // user: %31
  %30 = integer_literal $Builtin.Int1, -1         // user: %31
  %31 = builtin "sadd_with_overflow_Int64"(%29 : $Builtin.Int64, %26 : $Builtin.Int64, %30 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // users: %33, %32
  %32 = tuple_extract %31 : $(Builtin.Int64, Builtin.Int1), 0 // user: %35
  %33 = tuple_extract %31 : $(Builtin.Int64, Builtin.Int1), 1 // user: %34
  cond_fail %33 : $Builtin.Int1, "arithmetic overflow" // id: %34
  %35 = struct $Int (%32 : $Builtin.Int64)        // user: %36
  store %35 to %27 : $*Int                        // id: %36
  %37 = tuple ()
  // function_ref closure #1 in OSLogInterpolation.appendPrecisionAlignCount(_:_:)
  %38 = function_ref @$s2os18OSLogInterpolationV25appendPrecisionAlignCountyySiyc_s5UInt8VtFs5Int32VycfU_ : $@convention(thin) (@guaranteed @callee_guaranteed () -> Int) -> Int32 // user: %40
  strong_retain %0 : $@callee_guaranteed () -> Int // id: %39
  %40 = partial_apply [callee_guaranteed] %38(%0) : $@convention(thin) (@guaranteed @callee_guaranteed () -> Int) -> Int32 // user: %42
  // function_ref thunk for @escaping @callee_guaranteed () -> (@unowned Int32)
  %41 = function_ref @$ss5Int32VIegd_ABIegr_TR : $@convention(thin) (@guaranteed @callee_guaranteed () -> Int32) -> @out Int32 // user: %42
  %42 = partial_apply [callee_guaranteed] %41(%40) : $@convention(thin) (@guaranteed @callee_guaranteed () -> Int32) -> @out Int32 // user: %43
  %43 = convert_function %42 : $@callee_guaranteed () -> @out Int32 to $@callee_guaranteed @substituted <τ_0_0> () -> @out τ_0_0 for <Int32> // users: %47, %46
  %44 = struct_element_addr %1 : $*OSLogInterpolation, #OSLogInterpolation.arguments // user: %46
  // function_ref OSLogArguments.append<A>(_:)
  %45 = function_ref @$s2os14OSLogArgumentsV6appendyyxycs17FixedWidthIntegerRzlF : $@convention(method) <τ_0_0 where τ_0_0 : FixedWidthInteger> (@guaranteed @callee_guaranteed @substituted <τ_0_0> () -> @out τ_0_0 for <τ_0_0>, @inout OSLogArguments) -> () // user: %46
  %46 = apply %45<Int32>(%43, %44) : $@convention(method) <τ_0_0 where τ_0_0 : FixedWidthInteger> (@guaranteed @callee_guaranteed @substituted <τ_0_0> () -> @out τ_0_0 for <τ_0_0>, @inout OSLogArguments) -> ()
  strong_release %43 : $@callee_guaranteed @substituted <τ_0_0> () -> @out τ_0_0 for <Int32> // id: %47
  %48 = integer_literal $Builtin.Int8, 1          // user: %53
  %49 = struct_element_addr %1 : $*OSLogInterpolation, #OSLogInterpolation.argumentCount // users: %58, %50
  %50 = struct_element_addr %49 : $*UInt8, #UInt8._value // user: %51
  %51 = load %50 : $*Builtin.Int8                 // user: %53
  %52 = integer_literal $Builtin.Int1, -1         // user: %53
  %53 = builtin "uadd_with_overflow_Int8"(%51 : $Builtin.Int8, %48 : $Builtin.Int8, %52 : $Builtin.Int1) : $(Builtin.Int8, Builtin.Int1) // users: %55, %54
  %54 = tuple_extract %53 : $(Builtin.Int8, Builtin.Int1), 0 // user: %57
  %55 = tuple_extract %53 : $(Builtin.Int8, Builtin.Int1), 1 // user: %56
  cond_fail %55 : $Builtin.Int1, "arithmetic overflow" // id: %56
  %57 = struct $UInt8 (%54 : $Builtin.Int8)       // user: %58
  store %57 to %49 : $*UInt8                      // id: %58
  %59 = tuple ()
  %60 = tuple ()
  %61 = tuple ()                                  // user: %62
  return %61 : $()                                // id: %62
} // end sil function '$s2os18OSLogInterpolationV23appendAlignmentArgumentyySiycF'

// OSLogInterpolation.appendMaskArgument(_:)
sil public_external [available 11.0] [Onone] [_semantics "constant_evaluable"] @$s2os18OSLogInterpolationV18appendMaskArgumentyyAA0B7PrivacyVF : $@convention(method) (@in_guaranteed OSLogPrivacy, @inout OSLogInterpolation) -> () {
// %0                                             // user: %39
// %1                                             // users: %54, %49, %27, %23, %18, %2
bb0(%0 : $*OSLogPrivacy, %1 : $*OSLogInterpolation):
  %2 = load %1 : $*OSLogInterpolation             // users: %17, %12, %3
  retain_value %2 : $OSLogInterpolation           // id: %3
  %4 = metatype $@thin OSLogPrivacy.Type          // user: %7
  %5 = alloc_stack $OSLogPrivacy                  // users: %16, %15, %12, %7
  // function_ref static OSLogPrivacy.auto.getter
  %6 = function_ref @$s2os12OSLogPrivacyV4autoACvgZ : $@convention(method) (@thin OSLogPrivacy.Type) -> @out OSLogPrivacy // user: %7
  %7 = apply %6(%5, %4) : $@convention(method) (@thin OSLogPrivacy.Type) -> @out OSLogPrivacy
  %8 = metatype $@thin OSLogInterpolation.ArgumentType.Type
  %9 = alloc_stack $OSLogInterpolation.ArgumentType // users: %14, %13, %12, %10
  inject_enum_addr %9 : $*OSLogInterpolation.ArgumentType, #OSLogInterpolation.ArgumentType.mask!enumelt // id: %10
  // function_ref OSLogInterpolation.getArgumentHeader(privacy:type:)
  %11 = function_ref @$s2os18OSLogInterpolationV17getArgumentHeader7privacy4types5UInt8VAA0B7PrivacyV_AC0E4TypeOtF : $@convention(method) (@in_guaranteed OSLogPrivacy, @in_guaranteed OSLogInterpolation.ArgumentType, @guaranteed OSLogInterpolation) -> UInt8 // user: %12
  %12 = apply %11(%5, %9, %2) : $@convention(method) (@in_guaranteed OSLogPrivacy, @in_guaranteed OSLogInterpolation.ArgumentType, @guaranteed OSLogInterpolation) -> UInt8 // user: %20
  destroy_addr %9 : $*OSLogInterpolation.ArgumentType // id: %13
  dealloc_stack %9 : $*OSLogInterpolation.ArgumentType // id: %14
  destroy_addr %5 : $*OSLogPrivacy                // id: %15
  dealloc_stack %5 : $*OSLogPrivacy               // id: %16
  release_value %2 : $OSLogInterpolation          // id: %17
  %18 = struct_element_addr %1 : $*OSLogInterpolation, #OSLogInterpolation.arguments // user: %20
  // function_ref OSLogArguments.append(_:)
  %19 = function_ref @$s2os14OSLogArgumentsV6appendyys5UInt8VF : $@convention(method) (UInt8, @inout OSLogArguments) -> () // user: %20
  %20 = apply %19(%12, %18) : $@convention(method) (UInt8, @inout OSLogArguments) -> ()
  %21 = integer_literal $Builtin.Int8, 8          // user: %22
  %22 = struct $UInt8 (%21 : $Builtin.Int8)       // user: %25
  %23 = struct_element_addr %1 : $*OSLogInterpolation, #OSLogInterpolation.arguments // user: %25
  // function_ref OSLogArguments.append(_:)
  %24 = function_ref @$s2os14OSLogArgumentsV6appendyys5UInt8VF : $@convention(method) (UInt8, @inout OSLogArguments) -> () // user: %25
  %25 = apply %24(%22, %23) : $@convention(method) (UInt8, @inout OSLogArguments) -> ()
  %26 = integer_literal $Builtin.Int64, 10        // user: %31
  %27 = struct_element_addr %1 : $*OSLogInterpolation, #OSLogInterpolation.totalBytesForSerializingArguments // users: %36, %28
  %28 = struct_element_addr %27 : $*Int, #Int._value // user: %29
  %29 = load %28 : $*Builtin.Int64                // user: %31
  %30 = integer_literal $Builtin.Int1, -1         // user: %31
  %31 = builtin "sadd_with_overflow_Int64"(%29 : $Builtin.Int64, %26 : $Builtin.Int64, %30 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // users: %33, %32
  %32 = tuple_extract %31 : $(Builtin.Int64, Builtin.Int1), 0 // user: %35
  %33 = tuple_extract %31 : $(Builtin.Int64, Builtin.Int1), 1 // user: %34
  cond_fail %33 : $Builtin.Int1, "arithmetic overflow" // id: %34
  %35 = struct $Int (%32 : $Builtin.Int64)        // user: %36
  store %35 to %27 : $*Int                        // id: %36
  %37 = tuple ()
  %38 = alloc_stack $OSLogPrivacy                 // users: %43, %42, %39
  copy_addr %0 to [initialization] %38 : $*OSLogPrivacy // id: %39
  %40 = integer_literal $Builtin.Int64, 1752392040 // user: %41
  %41 = struct $UInt64 (%40 : $Builtin.Int64)     // user: %45
  destroy_addr %38 : $*OSLogPrivacy               // id: %42
  dealloc_stack %38 : $*OSLogPrivacy              // id: %43
  // function_ref closure #1 in OSLogInterpolation.appendMaskArgument(_:)
  %44 = function_ref @$s2os18OSLogInterpolationV18appendMaskArgumentyyAA0B7PrivacyVFs6UInt64VycfU_ : $@convention(thin) (UInt64) -> UInt64 // user: %45
  %45 = partial_apply [callee_guaranteed] %44(%41) : $@convention(thin) (UInt64) -> UInt64 // user: %47
  // function_ref thunk for @escaping @callee_guaranteed () -> (@unowned UInt64)
  %46 = function_ref @$ss6UInt64VIegd_ABIegr_TR : $@convention(thin) (@guaranteed @callee_guaranteed () -> UInt64) -> @out UInt64 // user: %47
  %47 = partial_apply [callee_guaranteed] %46(%45) : $@convention(thin) (@guaranteed @callee_guaranteed () -> UInt64) -> @out UInt64 // user: %48
  %48 = convert_function %47 : $@callee_guaranteed () -> @out UInt64 to $@callee_guaranteed @substituted <τ_0_0> () -> @out τ_0_0 for <UInt64> // users: %52, %51
  %49 = struct_element_addr %1 : $*OSLogInterpolation, #OSLogInterpolation.arguments // user: %51
  // function_ref OSLogArguments.append<A>(_:)
  %50 = function_ref @$s2os14OSLogArgumentsV6appendyyxycs17FixedWidthIntegerRzlF : $@convention(method) <τ_0_0 where τ_0_0 : FixedWidthInteger> (@guaranteed @callee_guaranteed @substituted <τ_0_0> () -> @out τ_0_0 for <τ_0_0>, @inout OSLogArguments) -> () // user: %51
  %51 = apply %50<UInt64>(%48, %49) : $@convention(method) <τ_0_0 where τ_0_0 : FixedWidthInteger> (@guaranteed @callee_guaranteed @substituted <τ_0_0> () -> @out τ_0_0 for <τ_0_0>, @inout OSLogArguments) -> ()
  strong_release %48 : $@callee_guaranteed @substituted <τ_0_0> () -> @out τ_0_0 for <UInt64> // id: %52
  %53 = integer_literal $Builtin.Int8, 1          // user: %58
  %54 = struct_element_addr %1 : $*OSLogInterpolation, #OSLogInterpolation.argumentCount // users: %63, %55
  %55 = struct_element_addr %54 : $*UInt8, #UInt8._value // user: %56
  %56 = load %55 : $*Builtin.Int8                 // user: %58
  %57 = integer_literal $Builtin.Int1, -1         // user: %58
  %58 = builtin "uadd_with_overflow_Int8"(%56 : $Builtin.Int8, %53 : $Builtin.Int8, %57 : $Builtin.Int1) : $(Builtin.Int8, Builtin.Int1) // users: %60, %59
  %59 = tuple_extract %58 : $(Builtin.Int8, Builtin.Int1), 0 // user: %62
  %60 = tuple_extract %58 : $(Builtin.Int8, Builtin.Int1), 1 // user: %61
  cond_fail %60 : $Builtin.Int1, "arithmetic overflow" // id: %61
  %62 = struct $UInt8 (%59 : $Builtin.Int8)       // user: %63
  store %62 to %54 : $*UInt8                      // id: %63
  %64 = tuple ()
  %65 = tuple ()                                  // user: %66
  return %65 : $()                                // id: %66
} // end sil function '$s2os18OSLogInterpolationV18appendMaskArgumentyyAA0B7PrivacyVF'

// OSLogInterpolation.addStringHeaders(_:)
sil public_external [available 11.0] [Onone] [_semantics "constant_evaluable"] @$s2os18OSLogInterpolationV16addStringHeadersyyAA0B7PrivacyVF : $@convention(method) (@in_guaranteed OSLogPrivacy, @inout OSLogInterpolation) -> () {
// %0                                             // users: %47, %8
// %1                                             // users: %49, %42, %31, %26, %12, %2
bb0(%0 : $*OSLogPrivacy, %1 : $*OSLogInterpolation):
  %2 = load %1 : $*OSLogInterpolation             // users: %11, %8, %3
  retain_value %2 : $OSLogInterpolation           // id: %3
  %4 = metatype $@thin OSLogInterpolation.ArgumentType.Type
  %5 = alloc_stack $OSLogInterpolation.ArgumentType // users: %10, %9, %8, %6
  inject_enum_addr %5 : $*OSLogInterpolation.ArgumentType, #OSLogInterpolation.ArgumentType.string!enumelt // id: %6
  // function_ref OSLogInterpolation.getArgumentHeader(privacy:type:)
  %7 = function_ref @$s2os18OSLogInterpolationV17getArgumentHeader7privacy4types5UInt8VAA0B7PrivacyV_AC0E4TypeOtF : $@convention(method) (@in_guaranteed OSLogPrivacy, @in_guaranteed OSLogInterpolation.ArgumentType, @guaranteed OSLogInterpolation) -> UInt8 // user: %8
  %8 = apply %7(%0, %5, %2) : $@convention(method) (@in_guaranteed OSLogPrivacy, @in_guaranteed OSLogInterpolation.ArgumentType, @guaranteed OSLogInterpolation) -> UInt8 // user: %14
  destroy_addr %5 : $*OSLogInterpolation.ArgumentType // id: %9
  dealloc_stack %5 : $*OSLogInterpolation.ArgumentType // id: %10
  release_value %2 : $OSLogInterpolation          // id: %11
  %12 = struct_element_addr %1 : $*OSLogInterpolation, #OSLogInterpolation.arguments // user: %14
  // function_ref OSLogArguments.append(_:)
  %13 = function_ref @$s2os14OSLogArgumentsV6appendyys5UInt8VF : $@convention(method) (UInt8, @inout OSLogArguments) -> () // user: %14
  %14 = apply %13(%8, %12) : $@convention(method) (UInt8, @inout OSLogArguments) -> ()
  %15 = integer_literal $Builtin.Int64, 8         // user: %16
  %16 = struct $Int (%15 : $Builtin.Int64)        // user: %21
  %17 = alloc_stack $UInt8                        // users: %29, %25, %23
  %18 = metatype $@thin UInt8.Type
  %19 = metatype $@thick UInt8.Type               // user: %23
  %20 = alloc_stack $Int                          // users: %24, %23, %21
  store %16 to %20 : $*Int                        // id: %21
  // function_ref UnsignedInteger<>.init<A>(_:)
  %22 = function_ref @$sSUss17FixedWidthIntegerRzrlEyxqd__cSzRd__lufC : $@convention(method) <τ_0_0 where τ_0_0 : FixedWidthInteger, τ_0_0 : UnsignedInteger><τ_1_0 where τ_1_0 : BinaryInteger> (@in τ_1_0, @thick τ_0_0.Type) -> @out τ_0_0 // user: %23
  %23 = apply %22<UInt8, Int>(%17, %20, %19) : $@convention(method) <τ_0_0 where τ_0_0 : FixedWidthInteger, τ_0_0 : UnsignedInteger><τ_1_0 where τ_1_0 : BinaryInteger> (@in τ_1_0, @thick τ_0_0.Type) -> @out τ_0_0
  dealloc_stack %20 : $*Int                       // id: %24
  %25 = load %17 : $*UInt8                        // user: %28
  %26 = struct_element_addr %1 : $*OSLogInterpolation, #OSLogInterpolation.arguments // user: %28
  // function_ref OSLogArguments.append(_:)
  %27 = function_ref @$s2os14OSLogArgumentsV6appendyys5UInt8VF : $@convention(method) (UInt8, @inout OSLogArguments) -> () // user: %28
  %28 = apply %27(%25, %26) : $@convention(method) (UInt8, @inout OSLogArguments) -> ()
  dealloc_stack %17 : $*UInt8                     // id: %29
  %30 = integer_literal $Builtin.Int64, 10        // user: %35
  %31 = struct_element_addr %1 : $*OSLogInterpolation, #OSLogInterpolation.totalBytesForSerializingArguments // users: %40, %32
  %32 = struct_element_addr %31 : $*Int, #Int._value // user: %33
  %33 = load %32 : $*Builtin.Int64                // user: %35
  %34 = integer_literal $Builtin.Int1, -1         // user: %35
  %35 = builtin "sadd_with_overflow_Int64"(%33 : $Builtin.Int64, %30 : $Builtin.Int64, %34 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // users: %37, %36
  %36 = tuple_extract %35 : $(Builtin.Int64, Builtin.Int1), 0 // user: %39
  %37 = tuple_extract %35 : $(Builtin.Int64, Builtin.Int1), 1 // user: %38
  cond_fail %37 : $Builtin.Int1, "arithmetic overflow" // id: %38
  %39 = struct $Int (%36 : $Builtin.Int64)        // user: %40
  store %39 to %31 : $*Int                        // id: %40
  %41 = tuple ()
  %42 = load %1 : $*OSLogInterpolation            // users: %48, %47, %43
  retain_value %42 : $OSLogInterpolation          // id: %43
  %44 = integer_literal $Builtin.Int1, 0          // user: %45
  %45 = struct $Bool (%44 : $Builtin.Int1)        // user: %47
  // function_ref OSLogInterpolation.getUpdatedPreamble(privacy:isScalar:)
  %46 = function_ref @$s2os18OSLogInterpolationV18getUpdatedPreamble7privacy8isScalars5UInt8VAA0B7PrivacyV_SbtF : $@convention(method) (@in_guaranteed OSLogPrivacy, Bool, @guaranteed OSLogInterpolation) -> UInt8 // user: %47
  %47 = apply %46(%0, %45, %42) : $@convention(method) (@in_guaranteed OSLogPrivacy, Bool, @guaranteed OSLogInterpolation) -> UInt8 // user: %50
  release_value %42 : $OSLogInterpolation         // id: %48
  %49 = struct_element_addr %1 : $*OSLogInterpolation, #OSLogInterpolation.preamble // user: %50
  store %47 to %49 : $*UInt8                      // id: %50
  %51 = tuple ()                                  // user: %52
  return %51 : $()                                // id: %52
} // end sil function '$s2os18OSLogInterpolationV16addStringHeadersyyAA0B7PrivacyVF'

// OSLogArguments.append(_:)
sil public_external [available 11.0] [Onone] [_semantics "constant_evaluable"] @$s2os14OSLogArgumentsV6appendyySSycF : $@convention(method) (@guaranteed @callee_guaranteed () -> @owned String, @inout OSLogArguments) -> () {
// %0                                             // users: %5, %4
// %1                                             // user: %10
bb0(%0 : $@callee_guaranteed () -> @owned String, %1 : $*OSLogArguments):
  %2 = alloc_stack $@callee_guaranteed @substituted <τ_0_0, τ_0_1, τ_0_2, τ_0_3> (@inout τ_0_0, @inout τ_0_1, @inout τ_0_2) -> @out τ_0_3 for <UnsafeMutablePointer<UInt8>, Optional<UnsafeMutablePointer<NSObject>>, Optional<UnsafeMutablePointer<Any>>, ()> // users: %13, %12, %9
  // function_ref closure #1 in OSLogArguments.append(_:)
  %3 = function_ref @$s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCGSgzSpyypGSgztcfU_ : $@convention(thin) (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>, @guaranteed @callee_guaranteed () -> @owned String) -> () // user: %5
  strong_retain %0 : $@callee_guaranteed () -> @owned String // id: %4
  %5 = partial_apply [callee_guaranteed] %3(%0) : $@convention(thin) (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>, @guaranteed @callee_guaranteed () -> @owned String) -> () // user: %7
  // function_ref thunk for @escaping @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout UnsafeMutablePointer<NSObject>?, @inout UnsafeMutablePointer<Any>?) -> ()
  %6 = function_ref @$sSpys5UInt8VGSpySo8NSObjectCGSgSpyypGSgIeglll_AcgIytIeglllr_TR : $@convention(thin) (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>, @guaranteed @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> ()) -> @out () // user: %7
  %7 = partial_apply [callee_guaranteed] %6(%5) : $@convention(thin) (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>, @guaranteed @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> ()) -> @out () // user: %8
  %8 = convert_function %7 : $@callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> @out () to $@callee_guaranteed @substituted <τ_0_0, τ_0_1, τ_0_2, τ_0_3> (@inout τ_0_0, @inout τ_0_1, @inout τ_0_2) -> @out τ_0_3 for <UnsafeMutablePointer<UInt8>, Optional<UnsafeMutablePointer<NSObject>>, Optional<UnsafeMutablePointer<Any>>, ()> // user: %9
  store %8 to %2 : $*@callee_guaranteed @substituted <τ_0_0, τ_0_1, τ_0_2, τ_0_3> (@inout τ_0_0, @inout τ_0_1, @inout τ_0_2) -> @out τ_0_3 for <UnsafeMutablePointer<UInt8>, Optional<UnsafeMutablePointer<NSObject>>, Optional<UnsafeMutablePointer<Any>>, ()> // id: %9
  %10 = struct_element_addr %1 : $*OSLogArguments, #OSLogArguments.argumentClosures // user: %12
  // function_ref Array.append(_:)
  %11 = function_ref @$sSa6appendyyxnF : $@convention(method) <τ_0_0> (@in τ_0_0, @inout Array<τ_0_0>) -> () // user: %12
  %12 = apply %11<(inout UnsafeMutablePointer<UInt8>, inout UnsafeMutablePointer<NSObject>?, inout UnsafeMutablePointer<Any>?) -> ()>(%2, %10) : $@convention(method) <τ_0_0> (@in τ_0_0, @inout Array<τ_0_0>) -> ()
  dealloc_stack %2 : $*@callee_guaranteed @substituted <τ_0_0, τ_0_1, τ_0_2, τ_0_3> (@inout τ_0_0, @inout τ_0_1, @inout τ_0_2) -> @out τ_0_3 for <UnsafeMutablePointer<UInt8>, Optional<UnsafeMutablePointer<NSObject>>, Optional<UnsafeMutablePointer<Any>>, ()> // id: %13
  %14 = tuple ()                                  // user: %15
  return %14 : $()                                // id: %15
} // end sil function '$s2os14OSLogArgumentsV6appendyySSycF'

// OSLogPrivacy.privacySpecifier.getter
sil public_external [available 11.0] [Onone] [_semantics "constant_evaluable"] @$s2os12OSLogPrivacyV16privacySpecifierSSSgvg : $@convention(method) (@in_guaranteed OSLogPrivacy) -> @owned Optional<String> {
// %0                                             // users: %47, %24, %2
bb0(%0 : $*OSLogPrivacy):
  %1 = alloc_stack $OSLogPrivacy                  // users: %19, %18, %3, %2
  copy_addr %0 to [initialization] %1 : $*OSLogPrivacy // id: %2
  %3 = struct_element_addr %1 : $*OSLogPrivacy, #OSLogPrivacy.mask // user: %5
  %4 = alloc_stack $OSLogPrivacy.Mask             // users: %13, %12, %8, %7, %6, %5
  copy_addr %3 to [initialization] %4 : $*OSLogPrivacy.Mask // id: %5
  switch_enum_addr %4 : $*OSLogPrivacy.Mask, case #OSLogPrivacy.Mask.hash!enumelt: bb2, default bb1 // id: %6

bb1:                                              // Preds: bb0
  destroy_addr %4 : $*OSLogPrivacy.Mask           // id: %7
  dealloc_stack %4 : $*OSLogPrivacy.Mask          // id: %8
  %9 = integer_literal $Builtin.Int1, 0           // user: %10
  %10 = struct $Bool (%9 : $Builtin.Int1)         // user: %11
  br bb3(%10 : $Bool)                             // id: %11

bb2:                                              // Preds: bb0
  destroy_addr %4 : $*OSLogPrivacy.Mask           // id: %12
  dealloc_stack %4 : $*OSLogPrivacy.Mask          // id: %13
  %14 = integer_literal $Builtin.Int1, -1         // user: %15
  %15 = struct $Bool (%14 : $Builtin.Int1)        // user: %16
  br bb3(%15 : $Bool)                             // id: %16

// %17                                            // users: %88, %41
bb3(%17 : $Bool):                                 // Preds: bb2 bb1
  destroy_addr %1 : $*OSLogPrivacy                // id: %18
  dealloc_stack %1 : $*OSLogPrivacy               // id: %19
  %20 = alloc_stack $Bool                         // users: %127, %124, %91, %37, %35, %23
  %21 = integer_literal $Builtin.Int1, 0          // user: %22
  %22 = struct $Bool (%21 : $Builtin.Int1)        // user: %23
  store %22 to %20 : $*Bool                       // id: %23
  %24 = struct_element_addr %0 : $*OSLogPrivacy, #OSLogPrivacy.privacy // user: %26
  %25 = alloc_stack $OSLogPrivacy.PrivacyOption   // users: %32, %31, %29, %28, %27, %26
  copy_addr %24 to [initialization] %25 : $*OSLogPrivacy.PrivacyOption // id: %26
  switch_enum_addr %25 : $*OSLogPrivacy.PrivacyOption, case #OSLogPrivacy.PrivacyOption.auto!enumelt: bb5, default bb4 // id: %27

bb4:                                              // Preds: bb3
  destroy_addr %25 : $*OSLogPrivacy.PrivacyOption // id: %28
  dealloc_stack %25 : $*OSLogPrivacy.PrivacyOption // id: %29
  br bb6                                          // id: %30

bb5:                                              // Preds: bb3
  destroy_addr %25 : $*OSLogPrivacy.PrivacyOption // id: %31
  dealloc_stack %25 : $*OSLogPrivacy.PrivacyOption // id: %32
  %33 = integer_literal $Builtin.Int1, -1         // user: %34
  %34 = struct $Bool (%33 : $Builtin.Int1)        // user: %35
  store %34 to %20 : $*Bool                       // id: %35
  br bb6                                          // id: %36

bb6:                                              // Preds: bb5 bb4
  %37 = struct_element_addr %20 : $*Bool, #Bool._value // user: %38
  %38 = load %37 : $*Builtin.Int1                 // user: %39
  cond_br %38, bb8, bb7                           // id: %39

bb7:                                              // Preds: bb6
  br bb10                                         // id: %40

bb8:                                              // Preds: bb6
  %41 = struct_extract %17 : $Bool, #Bool._value  // user: %43
  %42 = integer_literal $Builtin.Int1, -1         // user: %43
  %43 = builtin "xor_Int1"(%41 : $Builtin.Int1, %42 : $Builtin.Int1) : $Builtin.Int1 // user: %44
  cond_br %43, bb22, bb9                          // id: %44

bb9:                                              // Preds: bb8
  br bb10                                         // id: %45

bb10:                                             // Preds: bb9 bb7
  %46 = alloc_stack $String                       // users: %123, %122, %119, %116, %105, %85, %76, %67, %57
  %47 = struct_element_addr %0 : $*OSLogPrivacy, #OSLogPrivacy.privacy // user: %49
  %48 = alloc_stack $OSLogPrivacy.PrivacyOption   // users: %86, %77, %68, %59, %58, %50, %49
  copy_addr %47 to [initialization] %48 : $*OSLogPrivacy.PrivacyOption // id: %49
  switch_enum_addr %48 : $*OSLogPrivacy.PrivacyOption, case #OSLogPrivacy.PrivacyOption.`public`!enumelt: bb14, case #OSLogPrivacy.PrivacyOption.`private`!enumelt: bb13, case #OSLogPrivacy.PrivacyOption.sensitive!enumelt: bb12, default bb11 // id: %50

bb11:                                             // Preds: bb10
  %51 = string_literal utf8 ""                    // user: %56
  %52 = integer_literal $Builtin.Word, 0          // user: %56
  %53 = integer_literal $Builtin.Int1, -1         // user: %56
  %54 = metatype $@thin String.Type               // user: %56
  // function_ref String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)
  %55 = function_ref @$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %56
  %56 = apply %55(%51, %52, %53, %54) : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %57
  store %56 to %46 : $*String                     // id: %57
  destroy_addr %48 : $*OSLogPrivacy.PrivacyOption // id: %58
  dealloc_stack %48 : $*OSLogPrivacy.PrivacyOption // id: %59
  br bb15                                         // id: %60

bb12:                                             // Preds: bb10
  %61 = string_literal utf8 "sensitive"           // user: %66
  %62 = integer_literal $Builtin.Word, 9          // user: %66
  %63 = integer_literal $Builtin.Int1, -1         // user: %66
  %64 = metatype $@thin String.Type               // user: %66
  // function_ref String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)
  %65 = function_ref @$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %66
  %66 = apply %65(%61, %62, %63, %64) : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %67
  store %66 to %46 : $*String                     // id: %67
  dealloc_stack %48 : $*OSLogPrivacy.PrivacyOption // id: %68
  br bb15                                         // id: %69

bb13:                                             // Preds: bb10
  %70 = string_literal utf8 "private"             // user: %75
  %71 = integer_literal $Builtin.Word, 7          // user: %75
  %72 = integer_literal $Builtin.Int1, -1         // user: %75
  %73 = metatype $@thin String.Type               // user: %75
  // function_ref String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)
  %74 = function_ref @$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %75
  %75 = apply %74(%70, %71, %72, %73) : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %76
  store %75 to %46 : $*String                     // id: %76
  dealloc_stack %48 : $*OSLogPrivacy.PrivacyOption // id: %77
  br bb15                                         // id: %78

bb14:                                             // Preds: bb10
  %79 = string_literal utf8 "public"              // user: %84
  %80 = integer_literal $Builtin.Word, 6          // user: %84
  %81 = integer_literal $Builtin.Int1, -1         // user: %84
  %82 = metatype $@thin String.Type               // user: %84
  // function_ref String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)
  %83 = function_ref @$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %84
  %84 = apply %83(%79, %80, %81, %82) : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %85
  store %84 to %46 : $*String                     // id: %85
  dealloc_stack %48 : $*OSLogPrivacy.PrivacyOption // id: %86
  br bb15                                         // id: %87

bb15:                                             // Preds: bb14 bb13 bb12 bb11
  %88 = struct_extract %17 : $Bool, #Bool._value  // user: %89
  cond_br %88, bb17, bb16                         // id: %89

bb16:                                             // Preds: bb15
  br bb21                                         // id: %90

bb17:                                             // Preds: bb15
  %91 = load %20 : $*Bool                         // user: %92
  %92 = struct_extract %91 : $Bool, #Bool._value  // user: %94
  %93 = integer_literal $Builtin.Int1, -1         // user: %94
  %94 = builtin "xor_Int1"(%92 : $Builtin.Int1, %93 : $Builtin.Int1) : $Builtin.Int1 // user: %95
  cond_br %94, bb19, bb18                         // id: %95

bb18:                                             // Preds: bb17
  br bb20                                         // id: %96

bb19:                                             // Preds: bb17
  %97 = metatype $@thin String.Type               // user: %105
  %98 = string_literal utf8 ","                   // user: %103
  %99 = integer_literal $Builtin.Word, 1          // user: %103
  %100 = integer_literal $Builtin.Int1, -1        // user: %103
  %101 = metatype $@thin String.Type              // user: %103
  // function_ref String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)
  %102 = function_ref @$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %103
  %103 = apply %102(%98, %99, %100, %101) : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // users: %106, %105
  // function_ref static String.+= infix(_:_:)
  %104 = function_ref @$sSS2peoiyySSz_SStFZ : $@convention(method) (@inout String, @guaranteed String, @thin String.Type) -> () // user: %105
  %105 = apply %104(%46, %103, %97) : $@convention(method) (@inout String, @guaranteed String, @thin String.Type) -> ()
  release_value %103 : $String                    // id: %106
  br bb20                                         // id: %107

bb20:                                             // Preds: bb19 bb18
  %108 = metatype $@thin String.Type              // user: %116
  %109 = string_literal utf8 "mask.hash"          // user: %114
  %110 = integer_literal $Builtin.Word, 9         // user: %114
  %111 = integer_literal $Builtin.Int1, -1        // user: %114
  %112 = metatype $@thin String.Type              // user: %114
  // function_ref String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)
  %113 = function_ref @$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %114
  %114 = apply %113(%109, %110, %111, %112) : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // users: %117, %116
  // function_ref static String.+= infix(_:_:)
  %115 = function_ref @$sSS2peoiyySSz_SStFZ : $@convention(method) (@inout String, @guaranteed String, @thin String.Type) -> () // user: %116
  %116 = apply %115(%46, %114, %108) : $@convention(method) (@inout String, @guaranteed String, @thin String.Type) -> ()
  release_value %114 : $String                    // id: %117
  br bb21                                         // id: %118

bb21:                                             // Preds: bb20 bb16
  %119 = load %46 : $*String                      // users: %121, %120
  retain_value %119 : $String                     // id: %120
  %121 = enum $Optional<String>, #Optional.some!enumelt, %119 : $String // user: %125
  destroy_addr %46 : $*String                     // id: %122
  dealloc_stack %46 : $*String                    // id: %123
  dealloc_stack %20 : $*Bool                      // id: %124
  br bb23(%121 : $Optional<String>)               // id: %125

bb22:                                             // Preds: bb8
  %126 = enum $Optional<String>, #Optional.none!enumelt // user: %128
  dealloc_stack %20 : $*Bool                      // id: %127
  br bb23(%126 : $Optional<String>)               // id: %128

// %129                                           // user: %130
bb23(%129 : $Optional<String>):                   // Preds: bb22 bb21
  return %129 : $Optional<String>                 // id: %130
} // end sil function '$s2os12OSLogPrivacyV16privacySpecifierSSSgvg'

// static OSLogPrivacy.auto.getter
sil public_external [available 11.0] [Onone] [_semantics "constant_evaluable"] @$s2os12OSLogPrivacyV4autoACvgZ : $@convention(method) (@thin OSLogPrivacy.Type) -> @out OSLogPrivacy {
// %0                                             // user: %19
bb0(%0 : $*OSLogPrivacy, %1 : $@thin OSLogPrivacy.Type):
  %2 = metatype $@thin OSLogPrivacy.PrivacyOption.Type
  %3 = alloc_stack $OSLogPrivacy.PrivacyOption    // users: %24, %10, %4
  inject_enum_addr %3 : $*OSLogPrivacy.PrivacyOption, #OSLogPrivacy.PrivacyOption.auto!enumelt // id: %4
  %5 = metatype $@thin OSLogPrivacy.Mask.Type
  %6 = alloc_stack $OSLogPrivacy.Mask             // users: %23, %15, %7
  inject_enum_addr %6 : $*OSLogPrivacy.Mask, #OSLogPrivacy.Mask.none!enumelt // id: %7
  %8 = alloc_stack $OSLogPrivacy                  // users: %21, %20, %19, %16, %11
  %9 = alloc_stack $OSLogPrivacy.PrivacyOption    // users: %13, %12, %10
  copy_addr [take] %3 to [initialization] %9 : $*OSLogPrivacy.PrivacyOption // id: %10
  %11 = struct_element_addr %8 : $*OSLogPrivacy, #OSLogPrivacy.privacy // user: %12
  copy_addr [take] %9 to [initialization] %11 : $*OSLogPrivacy.PrivacyOption // id: %12
  dealloc_stack %9 : $*OSLogPrivacy.PrivacyOption // id: %13
  %14 = alloc_stack $OSLogPrivacy.Mask            // users: %18, %17, %15
  copy_addr [take] %6 to [initialization] %14 : $*OSLogPrivacy.Mask // id: %15
  %16 = struct_element_addr %8 : $*OSLogPrivacy, #OSLogPrivacy.mask // user: %17
  copy_addr [take] %14 to [initialization] %16 : $*OSLogPrivacy.Mask // id: %17
  dealloc_stack %14 : $*OSLogPrivacy.Mask         // id: %18
  copy_addr %8 to [initialization] %0 : $*OSLogPrivacy // id: %19
  destroy_addr %8 : $*OSLogPrivacy                // id: %20
  dealloc_stack %8 : $*OSLogPrivacy               // id: %21
  %22 = tuple ()
  dealloc_stack %6 : $*OSLogPrivacy.Mask          // id: %23
  dealloc_stack %3 : $*OSLogPrivacy.PrivacyOption // id: %24
  %25 = tuple ()                                  // user: %26
  return %25 : $()                                // id: %26
} // end sil function '$s2os12OSLogPrivacyV4autoACvgZ'

// OSLogInterpolation.getArgumentHeader(privacy:type:)
sil public_external [available 11.0] [Onone] [readonly] [_semantics "constant_evaluable"] @$s2os18OSLogInterpolationV17getArgumentHeader7privacy4types5UInt8VAA0B7PrivacyV_AC0E4TypeOtF : $@convention(method) (@in_guaranteed OSLogPrivacy, @in_guaranteed OSLogInterpolation.ArgumentType, @guaranteed OSLogInterpolation) -> UInt8 {
// %0                                             // user: %13
// %1                                             // user: %4
bb0(%0 : $*OSLogPrivacy, %1 : $*OSLogInterpolation.ArgumentType, %2 : $OSLogInterpolation):
  %3 = alloc_stack $OSLogInterpolation.ArgumentType // users: %11, %7, %6, %4
  copy_addr %1 to [initialization] %3 : $*OSLogInterpolation.ArgumentType // id: %4
  // function_ref OSLogInterpolation.ArgumentType.rawValue.getter
  %5 = function_ref @$s2os18OSLogInterpolationV12ArgumentTypeO8rawValues5UInt8Vvg : $@convention(method) (@in_guaranteed OSLogInterpolation.ArgumentType) -> UInt8 // user: %6
  %6 = apply %5(%3) : $@convention(method) (@in_guaranteed OSLogInterpolation.ArgumentType) -> UInt8 // user: %8
  destroy_addr %3 : $*OSLogInterpolation.ArgumentType // id: %7
  %8 = struct_extract %6 : $UInt8, #UInt8._value  // user: %10
  %9 = integer_literal $Builtin.Int8, 4           // user: %10
  %10 = builtin "shl_Int8"(%8 : $Builtin.Int8, %9 : $Builtin.Int8) : $Builtin.Int8 // user: %18
  dealloc_stack %3 : $*OSLogInterpolation.ArgumentType // id: %11
  %12 = alloc_stack $OSLogPrivacy                 // users: %20, %16, %15, %13
  copy_addr %0 to [initialization] %12 : $*OSLogPrivacy // id: %13
  // function_ref OSLogPrivacy.argumentFlag.getter
  %14 = function_ref @$s2os12OSLogPrivacyV12argumentFlags5UInt8Vvg : $@convention(method) (@in_guaranteed OSLogPrivacy) -> UInt8 // user: %15
  %15 = apply %14(%12) : $@convention(method) (@in_guaranteed OSLogPrivacy) -> UInt8 // user: %17
  destroy_addr %12 : $*OSLogPrivacy               // id: %16
  %17 = struct_extract %15 : $UInt8, #UInt8._value // user: %18
  %18 = builtin "or_Int8"(%10 : $Builtin.Int8, %17 : $Builtin.Int8) : $Builtin.Int8 // user: %19
  %19 = struct $UInt8 (%18 : $Builtin.Int8)       // user: %21
  dealloc_stack %12 : $*OSLogPrivacy              // id: %20
  return %19 : $UInt8                             // id: %21
} // end sil function '$s2os18OSLogInterpolationV17getArgumentHeader7privacy4types5UInt8VAA0B7PrivacyV_AC0E4TypeOtF'

// OSLogArguments.append(_:)
sil public_external [available 11.0] [Onone] [_semantics "constant_evaluable"] @$s2os14OSLogArgumentsV6appendyys5UInt8VF : $@convention(method) (UInt8, @inout OSLogArguments) -> () {
// %0                                             // user: %4
// %1                                             // user: %9
bb0(%0 : $UInt8, %1 : $*OSLogArguments):
  %2 = alloc_stack $@callee_guaranteed @substituted <τ_0_0, τ_0_1, τ_0_2, τ_0_3> (@inout τ_0_0, @inout τ_0_1, @inout τ_0_2) -> @out τ_0_3 for <UnsafeMutablePointer<UInt8>, Optional<UnsafeMutablePointer<NSObject>>, Optional<UnsafeMutablePointer<Any>>, ()> // users: %12, %11, %8
  // function_ref closure #1 in OSLogArguments.append(_:)
  %3 = function_ref @$s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCGSgzSpyypGSgztcfU_ : $@convention(thin) (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>, UInt8) -> () // user: %4
  %4 = partial_apply [callee_guaranteed] %3(%0) : $@convention(thin) (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>, UInt8) -> () // user: %6
  // function_ref thunk for @escaping @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout UnsafeMutablePointer<NSObject>?, @inout UnsafeMutablePointer<Any>?) -> ()
  %5 = function_ref @$sSpys5UInt8VGSpySo8NSObjectCGSgSpyypGSgIeglll_AcgIytIeglllr_TR : $@convention(thin) (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>, @guaranteed @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> ()) -> @out () // user: %6
  %6 = partial_apply [callee_guaranteed] %5(%4) : $@convention(thin) (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>, @guaranteed @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> ()) -> @out () // user: %7
  %7 = convert_function %6 : $@callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> @out () to $@callee_guaranteed @substituted <τ_0_0, τ_0_1, τ_0_2, τ_0_3> (@inout τ_0_0, @inout τ_0_1, @inout τ_0_2) -> @out τ_0_3 for <UnsafeMutablePointer<UInt8>, Optional<UnsafeMutablePointer<NSObject>>, Optional<UnsafeMutablePointer<Any>>, ()> // user: %8
  store %7 to %2 : $*@callee_guaranteed @substituted <τ_0_0, τ_0_1, τ_0_2, τ_0_3> (@inout τ_0_0, @inout τ_0_1, @inout τ_0_2) -> @out τ_0_3 for <UnsafeMutablePointer<UInt8>, Optional<UnsafeMutablePointer<NSObject>>, Optional<UnsafeMutablePointer<Any>>, ()> // id: %8
  %9 = struct_element_addr %1 : $*OSLogArguments, #OSLogArguments.argumentClosures // user: %11
  // function_ref Array.append(_:)
  %10 = function_ref @$sSa6appendyyxnF : $@convention(method) <τ_0_0> (@in τ_0_0, @inout Array<τ_0_0>) -> () // user: %11
  %11 = apply %10<(inout UnsafeMutablePointer<UInt8>, inout UnsafeMutablePointer<NSObject>?, inout UnsafeMutablePointer<Any>?) -> ()>(%2, %9) : $@convention(method) <τ_0_0> (@in τ_0_0, @inout Array<τ_0_0>) -> ()
  dealloc_stack %2 : $*@callee_guaranteed @substituted <τ_0_0, τ_0_1, τ_0_2, τ_0_3> (@inout τ_0_0, @inout τ_0_1, @inout τ_0_2) -> @out τ_0_3 for <UnsafeMutablePointer<UInt8>, Optional<UnsafeMutablePointer<NSObject>>, Optional<UnsafeMutablePointer<Any>>, ()> // id: %12
  %13 = tuple ()                                  // user: %14
  return %13 : $()                                // id: %14
} // end sil function '$s2os14OSLogArgumentsV6appendyys5UInt8VF'

// closure #1 in OSLogInterpolation.appendPrecisionAlignCount(_:_:)
sil shared_external @$s2os18OSLogInterpolationV25appendPrecisionAlignCountyySiyc_s5UInt8VtFs5Int32VycfU_ : $@convention(thin) (@guaranteed @callee_guaranteed () -> Int) -> Int32 {
// %0                                             // user: %1
bb0(%0 : $@callee_guaranteed () -> Int):
  %1 = apply %0() : $@callee_guaranteed () -> Int // user: %2
  %2 = struct_extract %1 : $Int, #Int._value      // users: %24, %21, %17, %8, %6, %4
  %3 = integer_literal $Builtin.Int64, 0          // user: %4
  %4 = builtin "cmp_slt_Int64"(%2 : $Builtin.Int64, %3 : $Builtin.Int64) : $Builtin.Int1 // user: %5
  cond_br %4, bb7, bb1                            // id: %5

bb1:                                              // Preds: bb0
  %6 = builtin "truncOrBitCast_Int64_Int32"(%2 : $Builtin.Int64) : $Builtin.Int32 // users: %7, %12
  %7 = builtin "sextOrBitCast_Int32_Int64"(%6 : $Builtin.Int32) : $Builtin.Int64 // user: %8
  %8 = builtin "cmp_eq_Int64"(%7 : $Builtin.Int64, %2 : $Builtin.Int64) : $Builtin.Int1 // user: %9
  cond_br %8, bb3, bb2                            // id: %9

bb2:                                              // Preds: bb1
  br bb6                                          // id: %10

bb3:                                              // Preds: bb1
  %11 = integer_literal $Builtin.Int32, 0         // user: %12
  %12 = builtin "cmp_slt_Int32"(%6 : $Builtin.Int32, %11 : $Builtin.Int32) : $Builtin.Int1 // user: %13
  cond_br %12, bb5, bb4                           // id: %13

bb4:                                              // Preds: bb3
  br bb8                                          // id: %14

bb5:                                              // Preds: bb3
  br bb6                                          // id: %15

bb6:                                              // Preds: bb5 bb2
  %16 = integer_literal $Builtin.Int64, 2147483647 // user: %17
  %17 = builtin "cmp_slt_Int64"(%16 : $Builtin.Int64, %2 : $Builtin.Int64) : $Builtin.Int1 // user: %18
  cond_fail %17 : $Builtin.Int1, "Not enough bits to represent the passed value" // id: %18
  br bb8                                          // id: %19

bb7:                                              // Preds: bb0
  %20 = integer_literal $Builtin.Int64, -2147483648 // user: %21
  %21 = builtin "cmp_slt_Int64"(%2 : $Builtin.Int64, %20 : $Builtin.Int64) : $Builtin.Int1 // user: %22
  cond_fail %21 : $Builtin.Int1, "Not enough bits to represent a signed value" // id: %22
  br bb8                                          // id: %23

bb8:                                              // Preds: bb4 bb7 bb6
  %24 = builtin "truncOrBitCast_Int64_Int32"(%2 : $Builtin.Int64) : $Builtin.Int32 // user: %25
  %25 = struct $Int32 (%24 : $Builtin.Int32)      // user: %26
  return %25 : $Int32                             // id: %26
} // end sil function '$s2os18OSLogInterpolationV25appendPrecisionAlignCountyySiyc_s5UInt8VtFs5Int32VycfU_'

// thunk for @escaping @callee_guaranteed () -> (@unowned Int32)
sil shared_external [transparent] [reabstraction_thunk] @$ss5Int32VIegd_ABIegr_TR : $@convention(thin) (@guaranteed @callee_guaranteed () -> Int32) -> @out Int32 {
// %0                                             // user: %3
// %1                                             // user: %2
bb0(%0 : $*Int32, %1 : $@callee_guaranteed () -> Int32):
  %2 = apply %1() : $@callee_guaranteed () -> Int32 // user: %3
  store %2 to %0 : $*Int32                        // id: %3
  %4 = tuple ()                                   // user: %5
  return %4 : $()                                 // id: %5
} // end sil function '$ss5Int32VIegd_ABIegr_TR'

// OSLogArguments.append<A>(_:)
sil public_external [available 11.0] [Onone] [_semantics "constant_evaluable"] @$s2os14OSLogArgumentsV6appendyyxycs17FixedWidthIntegerRzlF : $@convention(method) <T where T : FixedWidthInteger> (@guaranteed @callee_guaranteed @substituted <τ_0_0> () -> @out τ_0_0 for <T>, @inout OSLogArguments) -> () {
// %0                                             // users: %5, %4
// %1                                             // user: %10
bb0(%0 : $@callee_guaranteed @substituted <τ_0_0> () -> @out τ_0_0 for <T>, %1 : $*OSLogArguments):
  %2 = alloc_stack $@callee_guaranteed @substituted <τ_0_0, τ_0_1, τ_0_2, τ_0_3> (@inout τ_0_0, @inout τ_0_1, @inout τ_0_2) -> @out τ_0_3 for <UnsafeMutablePointer<UInt8>, Optional<UnsafeMutablePointer<NSObject>>, Optional<UnsafeMutablePointer<Any>>, ()> // users: %13, %12, %9
  // function_ref closure #1 in OSLogArguments.append<A>(_:)
  %3 = function_ref @$s2os14OSLogArgumentsV6appendyyxycs17FixedWidthIntegerRzlFySpys5UInt8VGz_SpySo8NSObjectCGSgzSpyypGSgztcfU_ : $@convention(thin) <τ_0_0 where τ_0_0 : FixedWidthInteger> (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>, @guaranteed @callee_guaranteed @substituted <τ_0_0> () -> @out τ_0_0 for <τ_0_0>) -> () // user: %5
  strong_retain %0 : $@callee_guaranteed @substituted <τ_0_0> () -> @out τ_0_0 for <T> // id: %4
  %5 = partial_apply [callee_guaranteed] %3<T>(%0) : $@convention(thin) <τ_0_0 where τ_0_0 : FixedWidthInteger> (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>, @guaranteed @callee_guaranteed @substituted <τ_0_0> () -> @out τ_0_0 for <τ_0_0>) -> () // user: %7
  // function_ref thunk for @escaping @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout UnsafeMutablePointer<NSObject>?, @inout UnsafeMutablePointer<Any>?) -> ()
  %6 = function_ref @$sSpys5UInt8VGSpySo8NSObjectCGSgSpyypGSgIeglll_AcgIytIeglllr_TR : $@convention(thin) (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>, @guaranteed @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> ()) -> @out () // user: %7
  %7 = partial_apply [callee_guaranteed] %6(%5) : $@convention(thin) (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>, @guaranteed @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> ()) -> @out () // user: %8
  %8 = convert_function %7 : $@callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> @out () to $@callee_guaranteed @substituted <τ_0_0, τ_0_1, τ_0_2, τ_0_3> (@inout τ_0_0, @inout τ_0_1, @inout τ_0_2) -> @out τ_0_3 for <UnsafeMutablePointer<UInt8>, Optional<UnsafeMutablePointer<NSObject>>, Optional<UnsafeMutablePointer<Any>>, ()> // user: %9
  store %8 to %2 : $*@callee_guaranteed @substituted <τ_0_0, τ_0_1, τ_0_2, τ_0_3> (@inout τ_0_0, @inout τ_0_1, @inout τ_0_2) -> @out τ_0_3 for <UnsafeMutablePointer<UInt8>, Optional<UnsafeMutablePointer<NSObject>>, Optional<UnsafeMutablePointer<Any>>, ()> // id: %9
  %10 = struct_element_addr %1 : $*OSLogArguments, #OSLogArguments.argumentClosures // user: %12
  // function_ref Array.append(_:)
  %11 = function_ref @$sSa6appendyyxnF : $@convention(method) <τ_0_0> (@in τ_0_0, @inout Array<τ_0_0>) -> () // user: %12
  %12 = apply %11<(inout UnsafeMutablePointer<UInt8>, inout UnsafeMutablePointer<NSObject>?, inout UnsafeMutablePointer<Any>?) -> ()>(%2, %10) : $@convention(method) <τ_0_0> (@in τ_0_0, @inout Array<τ_0_0>) -> ()
  dealloc_stack %2 : $*@callee_guaranteed @substituted <τ_0_0, τ_0_1, τ_0_2, τ_0_3> (@inout τ_0_0, @inout τ_0_1, @inout τ_0_2) -> @out τ_0_3 for <UnsafeMutablePointer<UInt8>, Optional<UnsafeMutablePointer<NSObject>>, Optional<UnsafeMutablePointer<Any>>, ()> // id: %13
  %14 = tuple ()                                  // user: %15
  return %14 : $()                                // id: %15
} // end sil function '$s2os14OSLogArgumentsV6appendyyxycs17FixedWidthIntegerRzlF'

// closure #1 in OSLogInterpolation.appendMaskArgument(_:)
sil shared_external @$s2os18OSLogInterpolationV18appendMaskArgumentyyAA0B7PrivacyVFs6UInt64VycfU_ : $@convention(thin) (UInt64) -> UInt64 {
// %0                                             // user: %1
bb0(%0 : $UInt64):
  return %0 : $UInt64                             // id: %1
} // end sil function '$s2os18OSLogInterpolationV18appendMaskArgumentyyAA0B7PrivacyVFs6UInt64VycfU_'

// thunk for @escaping @callee_guaranteed () -> (@unowned UInt64)
sil shared_external [transparent] [reabstraction_thunk] @$ss6UInt64VIegd_ABIegr_TR : $@convention(thin) (@guaranteed @callee_guaranteed () -> UInt64) -> @out UInt64 {
// %0                                             // user: %3
// %1                                             // user: %2
bb0(%0 : $*UInt64, %1 : $@callee_guaranteed () -> UInt64):
  %2 = apply %1() : $@callee_guaranteed () -> UInt64 // user: %3
  store %2 to %0 : $*UInt64                       // id: %3
  %4 = tuple ()                                   // user: %5
  return %4 : $()                                 // id: %5
} // end sil function '$ss6UInt64VIegd_ABIegr_TR'

// OSLogInterpolation.getUpdatedPreamble(privacy:isScalar:)
sil public_external [available 11.0] [Onone] [readonly] [_semantics "constant_evaluable"] @$s2os18OSLogInterpolationV18getUpdatedPreamble7privacy8isScalars5UInt8VAA0B7PrivacyV_SbtF : $@convention(method) (@in_guaranteed OSLogPrivacy, Bool, @guaranteed OSLogInterpolation) -> UInt8 {
// %0                                             // users: %28, %8
// %1                                             // user: %24
// %2                                             // users: %60, %17, %4
bb0(%0 : $*OSLogPrivacy, %1 : $Bool, %2 : $OSLogInterpolation):
  %3 = alloc_stack $UInt8                         // users: %70, %69, %66, %61, %21, %6
  %4 = struct_extract %2 : $OSLogInterpolation, #OSLogInterpolation.preamble // users: %6, %5
  %5 = struct_extract %4 : $UInt8, #UInt8._value  // user: %19
  store %4 to %3 : $*UInt8                        // id: %6
  %7 = alloc_stack $OSLogPrivacy                  // users: %13, %11, %10, %8
  copy_addr %0 to [initialization] %7 : $*OSLogPrivacy // id: %8
  // function_ref OSLogPrivacy.isAtleastPrivate.getter
  %9 = function_ref @$s2os12OSLogPrivacyV16isAtleastPrivateSbvg : $@convention(method) (@in_guaranteed OSLogPrivacy) -> Bool // user: %10
  %10 = apply %9(%7) : $@convention(method) (@in_guaranteed OSLogPrivacy) -> Bool // user: %12
  destroy_addr %7 : $*OSLogPrivacy                // id: %11
  %12 = struct_extract %10 : $Bool, #Bool._value  // user: %14
  dealloc_stack %7 : $*OSLogPrivacy               // id: %13
  cond_br %12, bb2, bb1                           // id: %14

bb1:                                              // Preds: bb0
  br bb3                                          // id: %15

bb2:                                              // Preds: bb0
  // function_ref OSLogInterpolation.privateBitMask.getter
  %16 = function_ref @$s2os18OSLogInterpolationV14privateBitMasks5UInt8Vvg : $@convention(method) (@guaranteed OSLogInterpolation) -> UInt8 // user: %17
  %17 = apply %16(%2) : $@convention(method) (@guaranteed OSLogInterpolation) -> UInt8 // user: %18
  %18 = struct_extract %17 : $UInt8, #UInt8._value // user: %19
  %19 = builtin "or_Int8"(%5 : $Builtin.Int8, %18 : $Builtin.Int8) : $Builtin.Int8 // user: %20
  %20 = struct $UInt8 (%19 : $Builtin.Int8)       // user: %21
  store %20 to %3 : $*UInt8                       // id: %21
  %22 = tuple ()
  br bb3                                          // id: %23

bb3:                                              // Preds: bb2 bb1
  %24 = struct_extract %1 : $Bool, #Bool._value   // user: %26
  %25 = integer_literal $Builtin.Int1, -1         // user: %26
  %26 = builtin "xor_Int1"(%24 : $Builtin.Int1, %25 : $Builtin.Int1) : $Builtin.Int1 // user: %29
  %27 = alloc_stack $OSLogPrivacy                 // users: %55, %54, %31, %28
  copy_addr %0 to [initialization] %27 : $*OSLogPrivacy // id: %28
  cond_br %26, bb8, bb4                           // id: %29

bb4:                                              // Preds: bb3
  %30 = alloc_stack $OSLogPrivacy                 // users: %48, %47, %32, %31
  copy_addr %27 to [initialization] %30 : $*OSLogPrivacy // id: %31
  %32 = struct_element_addr %30 : $*OSLogPrivacy, #OSLogPrivacy.mask // user: %34
  %33 = alloc_stack $OSLogPrivacy.Mask            // users: %42, %41, %37, %36, %35, %34
  copy_addr %32 to [initialization] %33 : $*OSLogPrivacy.Mask // id: %34
  switch_enum_addr %33 : $*OSLogPrivacy.Mask, case #OSLogPrivacy.Mask.hash!enumelt: bb6, default bb5 // id: %35

bb5:                                              // Preds: bb4
  destroy_addr %33 : $*OSLogPrivacy.Mask          // id: %36
  dealloc_stack %33 : $*OSLogPrivacy.Mask         // id: %37
  %38 = integer_literal $Builtin.Int1, 0          // user: %39
  %39 = struct $Bool (%38 : $Builtin.Int1)        // user: %40
  br bb7(%39 : $Bool)                             // id: %40

bb6:                                              // Preds: bb4
  destroy_addr %33 : $*OSLogPrivacy.Mask          // id: %41
  dealloc_stack %33 : $*OSLogPrivacy.Mask         // id: %42
  %43 = integer_literal $Builtin.Int1, -1         // user: %44
  %44 = struct $Bool (%43 : $Builtin.Int1)        // user: %45
  br bb7(%44 : $Bool)                             // id: %45

// %46                                            // user: %49
bb7(%46 : $Bool):                                 // Preds: bb6 bb5
  destroy_addr %30 : $*OSLogPrivacy               // id: %47
  dealloc_stack %30 : $*OSLogPrivacy              // id: %48
  br bb9(%46 : $Bool)                             // id: %49

bb8:                                              // Preds: bb3
  %50 = integer_literal $Builtin.Int1, -1         // user: %51
  %51 = struct $Bool (%50 : $Builtin.Int1)        // user: %52
  br bb9(%51 : $Bool)                             // id: %52

// %53                                            // user: %56
bb9(%53 : $Bool):                                 // Preds: bb8 bb7
  destroy_addr %27 : $*OSLogPrivacy               // id: %54
  dealloc_stack %27 : $*OSLogPrivacy              // id: %55
  %56 = struct_extract %53 : $Bool, #Bool._value  // user: %57
  cond_br %56, bb11, bb10                         // id: %57

bb10:                                             // Preds: bb9
  br bb12                                         // id: %58

bb11:                                             // Preds: bb9
  // function_ref OSLogInterpolation.nonScalarBitMask.getter
  %59 = function_ref @$s2os18OSLogInterpolationV16nonScalarBitMasks5UInt8Vvg : $@convention(method) (@guaranteed OSLogInterpolation) -> UInt8 // user: %60
  %60 = apply %59(%2) : $@convention(method) (@guaranteed OSLogInterpolation) -> UInt8 // user: %63
  %61 = struct_element_addr %3 : $*UInt8, #UInt8._value // user: %62
  %62 = load %61 : $*Builtin.Int8                 // user: %64
  %63 = struct_extract %60 : $UInt8, #UInt8._value // user: %64
  %64 = builtin "or_Int8"(%62 : $Builtin.Int8, %63 : $Builtin.Int8) : $Builtin.Int8 // user: %65
  %65 = struct $UInt8 (%64 : $Builtin.Int8)       // user: %66
  store %65 to %3 : $*UInt8                       // id: %66
  %67 = tuple ()
  br bb12                                         // id: %68

bb12:                                             // Preds: bb11 bb10
  %69 = load %3 : $*UInt8                         // user: %71
  dealloc_stack %3 : $*UInt8                      // id: %70
  return %69 : $UInt8                             // id: %71
} // end sil function '$s2os18OSLogInterpolationV18getUpdatedPreamble7privacy8isScalars5UInt8VAA0B7PrivacyV_SbtF'

// closure #1 in OSLogArguments.append(_:)
sil shared_external @$s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCGSgzSpyypGSgztcfU_ : $@convention(thin) (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>, @guaranteed @callee_guaranteed () -> @owned String) -> () {
// %0                                             // users: %45, %7
// %2                                             // user: %6
// %3                                             // user: %4
bb0(%0 : $*UnsafeMutablePointer<UInt8>, %1 : $*Optional<UnsafeMutablePointer<NSObject>>, %2 : $*Optional<UnsafeMutablePointer<Any>>, %3 : $@callee_guaranteed () -> @owned String):
  %4 = apply %3() : $@callee_guaranteed () -> @owned String // users: %46, %6
  // function_ref getNullTerminatedUTF8Pointer(_:using:)
  %5 = function_ref @$s2os28getNullTerminatedUTF8Pointer_5usingSVSS_SpyypGSgztF : $@convention(thin) (@guaranteed String, @inout Optional<UnsafeMutablePointer<Any>>) -> UnsafeRawPointer // user: %6
  %6 = apply %5(%4, %2) : $@convention(thin) (@guaranteed String, @inout Optional<UnsafeMutablePointer<Any>>) -> UnsafeRawPointer // user: %10
  %7 = struct_element_addr %0 : $*UnsafeMutablePointer<UInt8>, #UnsafeMutablePointer._rawValue // users: %39, %8
  %8 = load %7 : $*Builtin.RawPointer             // user: %37
  %9 = alloc_stack $UnsafeRawPointer              // users: %38, %33, %10
  store %6 to %9 : $*UnsafeRawPointer             // id: %10
  %11 = metatype $@thick UnsafeRawPointer.Type    // user: %12
  %12 = builtin "sizeof"<UnsafeRawPointer>(%11 : $@thick UnsafeRawPointer.Type) : $Builtin.Word // user: %13
  %13 = builtin "sextOrBitCast_Word_Int64"(%12 : $Builtin.Word) : $Builtin.Int64 // users: %34, %25, %15
  %14 = integer_literal $Builtin.Int64, 0         // users: %35, %21, %15
  %15 = builtin "cmp_slt_Int64"(%13 : $Builtin.Int64, %14 : $Builtin.Int64) : $Builtin.Int1 // user: %16
  cond_fail %15 : $Builtin.Int1, "UnsafeRawBufferPointer with negative count" // id: %16
  %17 = integer_literal $Builtin.Int1, 0          // users: %37, %30, %22
  %18 = metatype $@thick UInt8.Type               // user: %19
  %19 = builtin "strideof"<UInt8>(%18 : $@thick UInt8.Type) : $Builtin.Word // user: %20
  %20 = builtin "sextOrBitCast_Word_Int64"(%19 : $Builtin.Word) : $Builtin.Int64 // users: %34, %29, %21
  %21 = builtin "cmp_eq_Int64"(%20 : $Builtin.Int64, %14 : $Builtin.Int64) : $Builtin.Int1 // user: %22
  %22 = builtin "int_expect_Int1"(%21 : $Builtin.Int1, %17 : $Builtin.Int1) : $Builtin.Int1 // user: %23
  cond_fail %22 : $Builtin.Int1, "Division by zero" // id: %23
  %24 = integer_literal $Builtin.Int64, -9223372036854775808 // user: %25
  %25 = builtin "cmp_eq_Int64"(%13 : $Builtin.Int64, %24 : $Builtin.Int64) : $Builtin.Int1 // user: %26
  cond_br %25, bb2, bb1                           // id: %26

bb1:                                              // Preds: bb0
  br bb3                                          // id: %27

bb2:                                              // Preds: bb0
  %28 = integer_literal $Builtin.Int64, -1        // user: %29
  %29 = builtin "cmp_eq_Int64"(%20 : $Builtin.Int64, %28 : $Builtin.Int64) : $Builtin.Int1 // user: %30
  %30 = builtin "int_expect_Int1"(%29 : $Builtin.Int1, %17 : $Builtin.Int1) : $Builtin.Int1 // user: %31
  cond_fail %30 : $Builtin.Int1, "Division results in an overflow" // id: %31
  br bb3                                          // id: %32

bb3:                                              // Preds: bb1 bb2
  %33 = address_to_pointer %9 : $*UnsafeRawPointer to $Builtin.RawPointer // user: %37
  %34 = builtin "sdiv_Int64"(%13 : $Builtin.Int64, %20 : $Builtin.Int64) : $Builtin.Int64 // users: %37, %35
  %35 = builtin "cmp_slt_Int64"(%34 : $Builtin.Int64, %14 : $Builtin.Int64) : $Builtin.Int1 // user: %36
  cond_fail %35 : $Builtin.Int1, "Negative value is not representable" // id: %36
  %37 = builtin "int_memmove_RawPointer_RawPointer_Int64"(%8 : $Builtin.RawPointer, %33 : $Builtin.RawPointer, %34 : $Builtin.Int64, %17 : $Builtin.Int1) : $()
  dealloc_stack %9 : $*UnsafeRawPointer           // id: %38
  %39 = load %7 : $*Builtin.RawPointer            // user: %41
  %40 = integer_literal $Builtin.Word, 8          // user: %42
  %41 = pointer_to_address %39 : $Builtin.RawPointer to [strict] $*UInt8 // user: %42
  %42 = index_addr %41 : $*UInt8, %40 : $Builtin.Word // user: %43
  %43 = address_to_pointer %42 : $*UInt8 to $Builtin.RawPointer // user: %44
  %44 = struct $UnsafeMutablePointer<UInt8> (%43 : $Builtin.RawPointer) // user: %45
  store %44 to %0 : $*UnsafeMutablePointer<UInt8> // id: %45
  release_value %4 : $String                      // id: %46
  %47 = tuple ()                                  // user: %48
  return %47 : $()                                // id: %48
} // end sil function '$s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCGSgzSpyypGSgztcfU_'

// thunk for @escaping @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout UnsafeMutablePointer<NSObject>?, @inout UnsafeMutablePointer<Any>?) -> ()
sil shared_external [transparent] [reabstraction_thunk] @$sSpys5UInt8VGSpySo8NSObjectCGSgSpyypGSgIeglll_AcgIytIeglllr_TR : $@convention(thin) (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>, @guaranteed @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> ()) -> @out () {
// %1                                             // user: %5
// %2                                             // user: %5
// %3                                             // user: %5
// %4                                             // user: %5
bb0(%0 : $*(), %1 : $*UnsafeMutablePointer<UInt8>, %2 : $*Optional<UnsafeMutablePointer<NSObject>>, %3 : $*Optional<UnsafeMutablePointer<Any>>, %4 : $@callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> ()):
  %5 = apply %4(%1, %2, %3) : $@callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> ()
  %6 = tuple ()                                   // user: %7
  return %6 : $()                                 // id: %7
} // end sil function '$sSpys5UInt8VGSpySo8NSObjectCGSgSpyypGSgIeglll_AcgIytIeglllr_TR'

// getNullTerminatedUTF8Pointer(_:using:)
sil [available 11.0] @$s2os28getNullTerminatedUTF8Pointer_5usingSVSS_SpyypGSgztF : $@convention(thin) (@guaranteed String, @inout Optional<UnsafeMutablePointer<Any>>) -> UnsafeRawPointer

// OSLogInterpolation.ArgumentType.rawValue.getter
sil public_external [available 11.0] @$s2os18OSLogInterpolationV12ArgumentTypeO8rawValues5UInt8Vvg : $@convention(method) (@in_guaranteed OSLogInterpolation.ArgumentType) -> UInt8 {
// %0                                             // user: %2
bb0(%0 : $*OSLogInterpolation.ArgumentType):
  %1 = alloc_stack $OSLogInterpolation.ArgumentType // users: %19, %5, %3, %2
  copy_addr %0 to [initialization] %1 : $*OSLogInterpolation.ArgumentType // id: %2
  switch_enum_addr %1 : $*OSLogInterpolation.ArgumentType, case #OSLogInterpolation.ArgumentType.scalar!enumelt: bb6, case #OSLogInterpolation.ArgumentType.count!enumelt: bb5, case #OSLogInterpolation.ArgumentType.string!enumelt: bb4, case #OSLogInterpolation.ArgumentType.pointer!enumelt: bb3, case #OSLogInterpolation.ArgumentType.mask!enumelt: bb2, default bb1 // id: %3

bb1:                                              // Preds: bb0
  %4 = integer_literal $Builtin.Int8, 4           // user: %6
  destroy_addr %1 : $*OSLogInterpolation.ArgumentType // id: %5
  br bb7(%4 : $Builtin.Int8)                      // id: %6

bb2:                                              // Preds: bb0
  %7 = integer_literal $Builtin.Int8, 7           // user: %8
  br bb7(%7 : $Builtin.Int8)                      // id: %8

bb3:                                              // Preds: bb0
  %9 = integer_literal $Builtin.Int8, 3           // user: %10
  br bb7(%9 : $Builtin.Int8)                      // id: %10

bb4:                                              // Preds: bb0
  %11 = integer_literal $Builtin.Int8, 2          // user: %12
  br bb7(%11 : $Builtin.Int8)                     // id: %12

bb5:                                              // Preds: bb0
  %13 = integer_literal $Builtin.Int8, 1          // user: %14
  br bb7(%13 : $Builtin.Int8)                     // id: %14

bb6:                                              // Preds: bb0
  %15 = integer_literal $Builtin.Int8, 0          // user: %16
  br bb7(%15 : $Builtin.Int8)                     // id: %16

// %17                                            // user: %18
bb7(%17 : $Builtin.Int8):                         // Preds: bb6 bb5 bb4 bb3 bb2 bb1
  %18 = struct $UInt8 (%17 : $Builtin.Int8)       // user: %20
  dealloc_stack %1 : $*OSLogInterpolation.ArgumentType // id: %19
  return %18 : $UInt8                             // id: %20
} // end sil function '$s2os18OSLogInterpolationV12ArgumentTypeO8rawValues5UInt8Vvg'

// OSLogPrivacy.argumentFlag.getter
sil public_external [available 11.0] [Onone] [_semantics "constant_evaluable"] @$s2os12OSLogPrivacyV12argumentFlags5UInt8Vvg : $@convention(method) (@in_guaranteed OSLogPrivacy) -> UInt8 {
// %0                                             // user: %1
bb0(%0 : $*OSLogPrivacy):
  %1 = struct_element_addr %0 : $*OSLogPrivacy, #OSLogPrivacy.privacy // user: %3
  %2 = alloc_stack $OSLogPrivacy.PrivacyOption    // users: %20, %16, %12, %8, %7, %4, %3
  copy_addr %1 to [initialization] %2 : $*OSLogPrivacy.PrivacyOption // id: %3
  switch_enum_addr %2 : $*OSLogPrivacy.PrivacyOption, case #OSLogPrivacy.PrivacyOption.`private`!enumelt: bb4, case #OSLogPrivacy.PrivacyOption.`public`!enumelt: bb3, case #OSLogPrivacy.PrivacyOption.sensitive!enumelt: bb2, default bb1 // id: %4

bb1:                                              // Preds: bb0
  %5 = integer_literal $Builtin.Int8, 0           // user: %6
  %6 = struct $UInt8 (%5 : $Builtin.Int8)         // user: %9
  destroy_addr %2 : $*OSLogPrivacy.PrivacyOption  // id: %7
  dealloc_stack %2 : $*OSLogPrivacy.PrivacyOption // id: %8
  br bb5(%6 : $UInt8)                             // id: %9

bb2:                                              // Preds: bb0
  %10 = integer_literal $Builtin.Int8, 5          // user: %11
  %11 = struct $UInt8 (%10 : $Builtin.Int8)       // user: %13
  dealloc_stack %2 : $*OSLogPrivacy.PrivacyOption // id: %12
  br bb5(%11 : $UInt8)                            // id: %13

bb3:                                              // Preds: bb0
  %14 = integer_literal $Builtin.Int8, 2          // user: %15
  %15 = struct $UInt8 (%14 : $Builtin.Int8)       // user: %17
  dealloc_stack %2 : $*OSLogPrivacy.PrivacyOption // id: %16
  br bb5(%15 : $UInt8)                            // id: %17

bb4:                                              // Preds: bb0
  %18 = integer_literal $Builtin.Int8, 1          // user: %19
  %19 = struct $UInt8 (%18 : $Builtin.Int8)       // user: %21
  dealloc_stack %2 : $*OSLogPrivacy.PrivacyOption // id: %20
  br bb5(%19 : $UInt8)                            // id: %21

// %22                                            // user: %23
bb5(%22 : $UInt8):                                // Preds: bb4 bb3 bb2 bb1
  return %22 : $UInt8                             // id: %23
} // end sil function '$s2os12OSLogPrivacyV12argumentFlags5UInt8Vvg'

// closure #1 in OSLogArguments.append(_:)
sil shared_external @$s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCGSgzSpyypGSgztcfU_ : $@convention(thin) (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>, UInt8) -> () {
// %0                                             // users: %12, %4
// %3                                             // user: %7
bb0(%0 : $*UnsafeMutablePointer<UInt8>, %1 : $*Optional<UnsafeMutablePointer<NSObject>>, %2 : $*Optional<UnsafeMutablePointer<Any>>, %3 : $UInt8):
  %4 = struct_element_addr %0 : $*UnsafeMutablePointer<UInt8>, #UnsafeMutablePointer._rawValue // user: %5
  %5 = load %4 : $*Builtin.RawPointer             // user: %6
  %6 = pointer_to_address %5 : $Builtin.RawPointer to [strict] $*UInt8 // users: %9, %7
  store %3 to %6 : $*UInt8                        // id: %7
  %8 = integer_literal $Builtin.Word, 1           // user: %9
  %9 = index_addr %6 : $*UInt8, %8 : $Builtin.Word // user: %10
  %10 = address_to_pointer %9 : $*UInt8 to $Builtin.RawPointer // user: %11
  %11 = struct $UnsafeMutablePointer<UInt8> (%10 : $Builtin.RawPointer) // user: %12
  store %11 to %0 : $*UnsafeMutablePointer<UInt8> // id: %12
  %13 = tuple ()                                  // user: %14
  return %13 : $()                                // id: %14
} // end sil function '$s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCGSgzSpyypGSgztcfU_'

// OSLogPrivacy.isAtleastPrivate.getter
sil public_external [available 11.0] [Onone] [_semantics "constant_evaluable"] @$s2os12OSLogPrivacyV16isAtleastPrivateSbvg : $@convention(method) (@in_guaranteed OSLogPrivacy) -> Bool {
// %0                                             // user: %1
bb0(%0 : $*OSLogPrivacy):
  %1 = struct_element_addr %0 : $*OSLogPrivacy, #OSLogPrivacy.privacy // user: %3
  %2 = alloc_stack $OSLogPrivacy.PrivacyOption    // users: %16, %12, %8, %7, %4, %3
  copy_addr %1 to [initialization] %2 : $*OSLogPrivacy.PrivacyOption // id: %3
  switch_enum_addr %2 : $*OSLogPrivacy.PrivacyOption, case #OSLogPrivacy.PrivacyOption.`public`!enumelt: bb3, case #OSLogPrivacy.PrivacyOption.auto!enumelt: bb2, default bb1 // id: %4

bb1:                                              // Preds: bb0
  %5 = integer_literal $Builtin.Int1, -1          // user: %6
  %6 = struct $Bool (%5 : $Builtin.Int1)          // user: %9
  destroy_addr %2 : $*OSLogPrivacy.PrivacyOption  // id: %7
  dealloc_stack %2 : $*OSLogPrivacy.PrivacyOption // id: %8
  br bb4(%6 : $Bool)                              // id: %9

bb2:                                              // Preds: bb0
  %10 = integer_literal $Builtin.Int1, 0          // user: %11
  %11 = struct $Bool (%10 : $Builtin.Int1)        // user: %13
  dealloc_stack %2 : $*OSLogPrivacy.PrivacyOption // id: %12
  br bb4(%11 : $Bool)                             // id: %13

bb3:                                              // Preds: bb0
  %14 = integer_literal $Builtin.Int1, 0          // user: %15
  %15 = struct $Bool (%14 : $Builtin.Int1)        // user: %17
  dealloc_stack %2 : $*OSLogPrivacy.PrivacyOption // id: %16
  br bb4(%15 : $Bool)                             // id: %17

// %18                                            // user: %19
bb4(%18 : $Bool):                                 // Preds: bb3 bb2 bb1
  return %18 : $Bool                              // id: %19
} // end sil function '$s2os12OSLogPrivacyV16isAtleastPrivateSbvg'

// OSLogInterpolation.privateBitMask.getter
sil public_external [signature_optimized_thunk] [available 11.0] [always_inline] [_semantics "constant_evaluable"] @$s2os18OSLogInterpolationV14privateBitMasks5UInt8Vvg : $@convention(method) (@guaranteed OSLogInterpolation) -> UInt8 {
bb0(%0 : $OSLogInterpolation):
  %1 = integer_literal $Builtin.Int8, 1           // user: %2
  %2 = struct $UInt8 (%1 : $Builtin.Int8)         // user: %3
  return %2 : $UInt8                              // id: %3
} // end sil function '$s2os18OSLogInterpolationV14privateBitMasks5UInt8Vvg'

// OSLogInterpolation.nonScalarBitMask.getter
sil public_external [signature_optimized_thunk] [available 11.0] [always_inline] [_semantics "constant_evaluable"] @$s2os18OSLogInterpolationV16nonScalarBitMasks5UInt8Vvg : $@convention(method) (@guaranteed OSLogInterpolation) -> UInt8 {
bb0(%0 : $OSLogInterpolation):
  %1 = integer_literal $Builtin.Int8, 2           // user: %2
  %2 = struct $UInt8 (%1 : $Builtin.Int8)         // user: %3
  return %2 : $UInt8                              // id: %3
} // end sil function '$s2os18OSLogInterpolationV16nonScalarBitMasks5UInt8Vvg'

// closure #1 in OSLogArguments.append<A>(_:)
sil shared_external @$s2os14OSLogArgumentsV6appendyyxycs17FixedWidthIntegerRzlFySpys5UInt8VGz_SpySo8NSObjectCGSgzSpyypGSgztcfU_ : $@convention(thin) <T where T : FixedWidthInteger> (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>, @guaranteed @callee_guaranteed @substituted <τ_0_0> () -> @out τ_0_0 for <T>) -> () {
// %0                                             // users: %41, %12
// %3                                             // user: %5
bb0(%0 : $*UnsafeMutablePointer<UInt8>, %1 : $*Optional<UnsafeMutablePointer<NSObject>>, %2 : $*Optional<UnsafeMutablePointer<Any>>, %3 : $@callee_guaranteed @substituted <τ_0_0> () -> @out τ_0_0 for <T>):
  %4 = alloc_stack $T                             // users: %43, %42, %32, %5
  %5 = apply %3(%4) : $@callee_guaranteed @substituted <τ_0_0> () -> @out τ_0_0 for <T>
  %6 = metatype $@thick T.Type                    // user: %8
  %7 = witness_method $T, #FixedWidthInteger.bitWidth!getter : <Self where Self : FixedWidthInteger> (Self.Type) -> () -> Int : $@convention(witness_method: FixedWidthInteger) <τ_0_0 where τ_0_0 : FixedWidthInteger> (@thick τ_0_0.Type) -> Int // user: %8
  %8 = apply %7<T>(%6) : $@convention(witness_method: FixedWidthInteger) <τ_0_0 where τ_0_0 : FixedWidthInteger> (@thick τ_0_0.Type) -> Int // user: %9
  %9 = struct_extract %8 : $Int, #Int._value      // user: %11
  %10 = integer_literal $Builtin.Int64, 3         // user: %11
  %11 = builtin "ashr_Int64"(%9 : $Builtin.Int64, %10 : $Builtin.Int64) : $Builtin.Int64 // users: %19, %17
  %12 = struct_element_addr %0 : $*UnsafeMutablePointer<UInt8>, #UnsafeMutablePointer._rawValue // users: %36, %13
  %13 = load %12 : $*Builtin.RawPointer           // users: %20, %14
  %14 = struct $UnsafeMutableRawPointer (%13 : $Builtin.RawPointer) // user: %15
  %15 = enum $Optional<UnsafeMutableRawPointer>, #Optional.some!enumelt, %14 : $UnsafeMutableRawPointer // user: %23
  %16 = integer_literal $Builtin.Int64, 0         // user: %17
  %17 = builtin "cmp_slt_Int64"(%11 : $Builtin.Int64, %16 : $Builtin.Int64) : $Builtin.Int1 // user: %18
  cond_fail %17 : $Builtin.Int1, "UnsafeMutableRawBufferPointer with negative count" // id: %18
  %19 = builtin "truncOrBitCast_Int64_Word"(%11 : $Builtin.Int64) : $Builtin.Word // users: %38, %20
  %20 = index_raw_pointer %13 : $Builtin.RawPointer, %19 : $Builtin.Word // user: %21
  %21 = struct $UnsafeMutableRawPointer (%20 : $Builtin.RawPointer) // user: %22
  %22 = enum $Optional<UnsafeMutableRawPointer>, #Optional.some!enumelt, %21 : $UnsafeMutableRawPointer // user: %23
  %23 = struct $UnsafeMutableRawBufferPointer (%15 : $Optional<UnsafeMutableRawPointer>, %22 : $Optional<UnsafeMutableRawPointer>) // user: %26
  %24 = alloc_stack $()                           // users: %35, %32
  // function_ref closure #1 in serialize<A>(_:at:)
  %25 = function_ref @$s2os9serialize_2atyx_Spys5UInt8VGzts17FixedWidthIntegerRzlFySWXEfU_ : $@convention(thin) (UnsafeRawBufferPointer, UnsafeMutableRawBufferPointer) -> () // user: %26
  %26 = partial_apply [callee_guaranteed] [on_stack] %25(%23) : $@convention(thin) (UnsafeRawBufferPointer, UnsafeMutableRawBufferPointer) -> () // users: %34, %27
  %27 = convert_function %26 : $@noescape @callee_guaranteed (UnsafeRawBufferPointer) -> () to $@noescape @callee_guaranteed (UnsafeRawBufferPointer) -> @error Error // user: %29
  // function_ref thunk for @callee_guaranteed (@unowned UnsafeRawBufferPointer) -> (@error @owned Error)
  %28 = function_ref @$sSWs5Error_pIgyzo_SWytsAA_pIegyrzo_TR : $@convention(thin) (UnsafeRawBufferPointer, @noescape @callee_guaranteed (UnsafeRawBufferPointer) -> @error Error) -> (@out (), @error Error) // user: %29
  %29 = partial_apply [callee_guaranteed] [on_stack] %28(%27) : $@convention(thin) (UnsafeRawBufferPointer, @noescape @callee_guaranteed (UnsafeRawBufferPointer) -> @error Error) -> (@out (), @error Error) // users: %33, %30
  %30 = convert_function %29 : $@noescape @callee_guaranteed (UnsafeRawBufferPointer) -> (@out (), @error Error) to $@noescape @callee_guaranteed @substituted <τ_0_0> (UnsafeRawBufferPointer) -> (@out τ_0_0, @error Error) for <()> // user: %32
  // function_ref withUnsafeBytes<A, B>(of:_:)
  %31 = function_ref @$ss15withUnsafeBytes2of_q_x_q_SWKXEtKr0_lF : $@convention(thin) <τ_0_0, τ_0_1> (@in_guaranteed τ_0_0, @noescape @callee_guaranteed @substituted <τ_0_0> (UnsafeRawBufferPointer) -> (@out τ_0_0, @error Error) for <τ_0_1>) -> (@out τ_0_1, @error Error) // user: %32
  %32 = apply [nothrow] %31<T, ()>(%24, %4, %30) : $@convention(thin) <τ_0_0, τ_0_1> (@in_guaranteed τ_0_0, @noescape @callee_guaranteed @substituted <τ_0_0> (UnsafeRawBufferPointer) -> (@out τ_0_0, @error Error) for <τ_0_1>) -> (@out τ_0_1, @error Error)
  dealloc_stack %29 : $@noescape @callee_guaranteed (UnsafeRawBufferPointer) -> (@out (), @error Error) // id: %33
  dealloc_stack %26 : $@noescape @callee_guaranteed (UnsafeRawBufferPointer) -> () // id: %34
  dealloc_stack %24 : $*()                        // id: %35
  %36 = load %12 : $*Builtin.RawPointer           // user: %37
  %37 = pointer_to_address %36 : $Builtin.RawPointer to [strict] $*UInt8 // user: %38
  %38 = index_addr %37 : $*UInt8, %19 : $Builtin.Word // user: %39
  %39 = address_to_pointer %38 : $*UInt8 to $Builtin.RawPointer // user: %40
  %40 = struct $UnsafeMutablePointer<UInt8> (%39 : $Builtin.RawPointer) // user: %41
  store %40 to %0 : $*UnsafeMutablePointer<UInt8> // id: %41
  destroy_addr %4 : $*T                           // id: %42
  dealloc_stack %4 : $*T                          // id: %43
  %44 = tuple ()                                  // user: %45
  return %44 : $()                                // id: %45
} // end sil function '$s2os14OSLogArgumentsV6appendyyxycs17FixedWidthIntegerRzlFySpys5UInt8VGz_SpySo8NSObjectCGSgzSpyypGSgztcfU_'

// closure #1 in serialize<A>(_:at:)
sil shared_external @$s2os9serialize_2atyx_Spys5UInt8VGzts17FixedWidthIntegerRzlFySWXEfU_ : $@convention(thin) (UnsafeRawBufferPointer, UnsafeMutableRawBufferPointer) -> () {
// %0                                             // users: %12, %6
// %1                                             // user: %2
bb0(%0 : $UnsafeRawBufferPointer, %1 : $UnsafeMutableRawBufferPointer):
  %2 = struct_extract %1 : $UnsafeMutableRawBufferPointer, #UnsafeMutableRawBufferPointer._position // user: %3
  switch_enum %2 : $Optional<UnsafeMutableRawPointer>, case #Optional.some!enumelt: bb2, case #Optional.none!enumelt: bb1 // id: %3

bb1:                                              // Preds: bb0
  br bb10                                         // id: %4

// %5                                             // user: %45
bb2(%5 : $UnsafeMutableRawPointer):               // Preds: bb0
  %6 = struct_extract %0 : $UnsafeRawBufferPointer, #UnsafeRawBufferPointer._position // users: %19, %7
  switch_enum %6 : $Optional<UnsafeRawPointer>, case #Optional.some!enumelt: bb4, case #Optional.none!enumelt: bb3 // id: %7

bb3:                                              // Preds: bb2
  %8 = integer_literal $Builtin.Int1, -1          // user: %9
  cond_fail %8 : $Builtin.Int1, "Unexpectedly found nil while unwrapping an Optional value" // id: %9
  unreachable                                     // id: %10

// %11                                            // user: %46
bb4(%11 : $UnsafeRawPointer):                     // Preds: bb2
  %12 = struct_extract %0 : $UnsafeRawBufferPointer, #UnsafeRawBufferPointer._end // user: %13
  switch_enum %12 : $Optional<UnsafeRawPointer>, case #Optional.some!enumelt: bb6, case #Optional.none!enumelt: bb5 // id: %13

bb5:                                              // Preds: bb4
  %14 = integer_literal $Builtin.Int1, -1         // user: %15
  cond_fail %14 : $Builtin.Int1, "Unexpectedly found nil while unwrapping an Optional value" // id: %15
  unreachable                                     // id: %16

// %17                                            // user: %20
bb6(%17 : $UnsafeRawPointer):                     // Preds: bb4
  %18 = integer_literal $Builtin.Int1, 0          // users: %47, %39, %31
  %19 = unchecked_enum_data %6 : $Optional<UnsafeRawPointer>, #Optional.some!enumelt // user: %22
  %20 = struct_extract %17 : $UnsafeRawPointer, #UnsafeRawPointer._rawValue // user: %21
  %21 = builtin "ptrtoint_Word"(%20 : $Builtin.RawPointer) : $Builtin.Word // user: %24
  %22 = struct_extract %19 : $UnsafeRawPointer, #UnsafeRawPointer._rawValue // user: %23
  %23 = builtin "ptrtoint_Word"(%22 : $Builtin.RawPointer) : $Builtin.Word // user: %24
  %24 = builtin "sub_Word"(%21 : $Builtin.Word, %23 : $Builtin.Word) : $Builtin.Word // user: %25
  %25 = builtin "sextOrBitCast_Word_Int64"(%24 : $Builtin.Word) : $Builtin.Int64 // users: %42, %34
  %26 = metatype $@thick UInt8.Type               // user: %27
  %27 = builtin "strideof"<UInt8>(%26 : $@thick UInt8.Type) : $Builtin.Word // user: %28
  %28 = builtin "sextOrBitCast_Word_Int64"(%27 : $Builtin.Word) : $Builtin.Int64 // users: %42, %38, %30
  %29 = integer_literal $Builtin.Int64, 0         // users: %43, %30
  %30 = builtin "cmp_eq_Int64"(%28 : $Builtin.Int64, %29 : $Builtin.Int64) : $Builtin.Int1 // user: %31
  %31 = builtin "int_expect_Int1"(%30 : $Builtin.Int1, %18 : $Builtin.Int1) : $Builtin.Int1 // user: %32
  cond_fail %31 : $Builtin.Int1, "Division by zero" // id: %32
  %33 = integer_literal $Builtin.Int64, -9223372036854775808 // user: %34
  %34 = builtin "cmp_eq_Int64"(%25 : $Builtin.Int64, %33 : $Builtin.Int64) : $Builtin.Int1 // user: %35
  cond_br %34, bb8, bb7                           // id: %35

bb7:                                              // Preds: bb6
  br bb9                                          // id: %36

bb8:                                              // Preds: bb6
  %37 = integer_literal $Builtin.Int64, -1        // user: %38
  %38 = builtin "cmp_eq_Int64"(%28 : $Builtin.Int64, %37 : $Builtin.Int64) : $Builtin.Int1 // user: %39
  %39 = builtin "int_expect_Int1"(%38 : $Builtin.Int1, %18 : $Builtin.Int1) : $Builtin.Int1 // user: %40
  cond_fail %39 : $Builtin.Int1, "Division results in an overflow" // id: %40
  br bb9                                          // id: %41

bb9:                                              // Preds: bb7 bb8
  %42 = builtin "sdiv_Int64"(%25 : $Builtin.Int64, %28 : $Builtin.Int64) : $Builtin.Int64 // users: %47, %43
  %43 = builtin "cmp_slt_Int64"(%42 : $Builtin.Int64, %29 : $Builtin.Int64) : $Builtin.Int1 // user: %44
  cond_fail %43 : $Builtin.Int1, "Negative value is not representable" // id: %44
  %45 = struct_extract %5 : $UnsafeMutableRawPointer, #UnsafeMutableRawPointer._rawValue // user: %47
  %46 = struct_extract %11 : $UnsafeRawPointer, #UnsafeRawPointer._rawValue // user: %47
  %47 = builtin "int_memmove_RawPointer_RawPointer_Int64"(%45 : $Builtin.RawPointer, %46 : $Builtin.RawPointer, %42 : $Builtin.Int64, %18 : $Builtin.Int1) : $()
  br bb10                                         // id: %48

bb10:                                             // Preds: bb9 bb1
  %49 = tuple ()                                  // user: %50
  return %49 : $()                                // id: %50
} // end sil function '$s2os9serialize_2atyx_Spys5UInt8VGzts17FixedWidthIntegerRzlFySWXEfU_'

// thunk for @callee_guaranteed (@unowned UnsafeRawBufferPointer) -> (@error @owned Error)
sil shared_external [transparent] [reabstraction_thunk] @$sSWs5Error_pIgyzo_SWytsAA_pIegyrzo_TR : $@convention(thin) (UnsafeRawBufferPointer, @noescape @callee_guaranteed (UnsafeRawBufferPointer) -> @error Error) -> (@out (), @error Error) {
// %1                                             // user: %3
// %2                                             // user: %3
bb0(%0 : $*(), %1 : $UnsafeRawBufferPointer, %2 : $@noescape @callee_guaranteed (UnsafeRawBufferPointer) -> @error Error):
  try_apply %2(%1) : $@noescape @callee_guaranteed (UnsafeRawBufferPointer) -> @error Error, normal bb2, error bb1 // id: %3

// %4                                             // user: %5
bb1(%4 : $Error):                                 // Preds: bb0
  throw %4 : $Error                               // id: %5

bb2(%6 : $()):                                    // Preds: bb0
  %7 = tuple ()                                   // user: %8
  return %7 : $()                                 // id: %8
} // end sil function '$sSWs5Error_pIgyzo_SWytsAA_pIegyrzo_TR'

// withUnsafeBytes<A, B>(of:_:)
sil public_external @$ss15withUnsafeBytes2of_q_x_q_SWKXEtKr0_lF : $@convention(thin) <T, Result> (@in_guaranteed T, @noescape @callee_guaranteed @substituted <τ_0_0> (UnsafeRawBufferPointer) -> (@out τ_0_0, @error Error) for <Result>) -> (@out Result, @error Error) {
// %0                                             // user: %16
// %1                                             // user: %3
// %2                                             // user: %16
bb0(%0 : $*Result, %1 : $*T, %2 : $@noescape @callee_guaranteed @substituted <τ_0_0> (UnsafeRawBufferPointer) -> (@out τ_0_0, @error Error) for <Result>):
  %3 = address_to_pointer %1 : $*T to $Builtin.RawPointer // users: %12, %4
  %4 = struct $UnsafeRawPointer (%3 : $Builtin.RawPointer) // user: %5
  %5 = enum $Optional<UnsafeRawPointer>, #Optional.some!enumelt, %4 : $UnsafeRawPointer // user: %15
  %6 = metatype $@thick T.Type                    // user: %7
  %7 = builtin "sizeof"<T>(%6 : $@thick T.Type) : $Builtin.Word // users: %12, %8
  %8 = builtin "sextOrBitCast_Word_Int64"(%7 : $Builtin.Word) : $Builtin.Int64 // user: %10
  %9 = integer_literal $Builtin.Int64, 0          // user: %10
  %10 = builtin "cmp_slt_Int64"(%8 : $Builtin.Int64, %9 : $Builtin.Int64) : $Builtin.Int1 // user: %11
  cond_fail %10 : $Builtin.Int1, "UnsafeRawBufferPointer with negative count" // id: %11
  %12 = index_raw_pointer %3 : $Builtin.RawPointer, %7 : $Builtin.Word // user: %13
  %13 = struct $UnsafeRawPointer (%12 : $Builtin.RawPointer) // user: %14
  %14 = enum $Optional<UnsafeRawPointer>, #Optional.some!enumelt, %13 : $UnsafeRawPointer // user: %15
  %15 = struct $UnsafeRawBufferPointer (%5 : $Optional<UnsafeRawPointer>, %14 : $Optional<UnsafeRawPointer>) // user: %16
  try_apply %2(%0, %15) : $@noescape @callee_guaranteed @substituted <τ_0_0> (UnsafeRawBufferPointer) -> (@out τ_0_0, @error Error) for <Result>, normal bb2, error bb1 // id: %16

// %17                                            // user: %18
bb1(%17 : $Error):                                // Preds: bb0
  throw %17 : $Error                              // id: %18

bb2(%19 : $()):                                   // Preds: bb0
  %20 = tuple ()                                  // user: %21
  return %20 : $()                                // id: %21
} // end sil function '$ss15withUnsafeBytes2of_q_x_q_SWKXEtKr0_lF'

// OSLogInterpolation.getNSObjectFormatSpecifier(_:)
sil public_external [available 11.0] [Onone] [readonly] [_semantics "constant_evaluable"] @$s2os18OSLogInterpolationV26getNSObjectFormatSpecifierySSAA0B7PrivacyVF : $@convention(method) (@in_guaranteed OSLogPrivacy, @guaranteed OSLogInterpolation) -> @owned String {
// %0                                             // user: %11
bb0(%0 : $*OSLogPrivacy, %1 : $OSLogInterpolation):
  %2 = alloc_stack $String                        // users: %59, %58, %56, %54, %42, %33, %29, %9
  %3 = string_literal utf8 "%"                    // user: %8
  %4 = integer_literal $Builtin.Word, 1           // user: %8
  %5 = integer_literal $Builtin.Int1, -1          // user: %8
  %6 = metatype $@thin String.Type                // user: %8
  // function_ref String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)
  %7 = function_ref @$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %8
  %8 = apply %7(%3, %4, %5, %6) : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %9
  store %8 to %2 : $*String                       // id: %9
  %10 = alloc_stack $OSLogPrivacy                 // users: %20, %19, %16, %15, %13, %11
  copy_addr %0 to [initialization] %10 : $*OSLogPrivacy // id: %11
  // function_ref OSLogPrivacy.privacySpecifier.getter
  %12 = function_ref @$s2os12OSLogPrivacyV16privacySpecifierSSSgvg : $@convention(method) (@in_guaranteed OSLogPrivacy) -> @owned Optional<String> // user: %13
  %13 = apply %12(%10) : $@convention(method) (@in_guaranteed OSLogPrivacy) -> @owned Optional<String> // user: %14
  switch_enum %13 : $Optional<String>, case #Optional.some!enumelt: bb2, case #Optional.none!enumelt: bb1 // id: %14

bb1:                                              // Preds: bb0
  destroy_addr %10 : $*OSLogPrivacy               // id: %15
  dealloc_stack %10 : $*OSLogPrivacy              // id: %16
  br bb3                                          // id: %17

// %18                                            // users: %44, %33
bb2(%18 : $String):                               // Preds: bb0
  destroy_addr %10 : $*OSLogPrivacy               // id: %19
  dealloc_stack %10 : $*OSLogPrivacy              // id: %20
  %21 = metatype $@thin String.Type               // user: %29
  %22 = string_literal utf8 "{"                   // user: %27
  %23 = integer_literal $Builtin.Word, 1          // user: %27
  %24 = integer_literal $Builtin.Int1, -1         // user: %27
  %25 = metatype $@thin String.Type               // user: %27
  // function_ref String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)
  %26 = function_ref @$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %27
  %27 = apply %26(%22, %23, %24, %25) : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // users: %30, %29
  // function_ref static String.+= infix(_:_:)
  %28 = function_ref @$sSS2peoiyySSz_SStFZ : $@convention(method) (@inout String, @guaranteed String, @thin String.Type) -> () // user: %29
  %29 = apply %28(%2, %27, %21) : $@convention(method) (@inout String, @guaranteed String, @thin String.Type) -> ()
  release_value %27 : $String                     // id: %30
  %31 = metatype $@thin String.Type               // user: %33
  // function_ref static String.+= infix(_:_:)
  %32 = function_ref @$sSS2peoiyySSz_SStFZ : $@convention(method) (@inout String, @guaranteed String, @thin String.Type) -> () // user: %33
  %33 = apply %32(%2, %18, %31) : $@convention(method) (@inout String, @guaranteed String, @thin String.Type) -> ()
  %34 = metatype $@thin String.Type               // user: %42
  %35 = string_literal utf8 "}"                   // user: %40
  %36 = integer_literal $Builtin.Word, 1          // user: %40
  %37 = integer_literal $Builtin.Int1, -1         // user: %40
  %38 = metatype $@thin String.Type               // user: %40
  // function_ref String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)
  %39 = function_ref @$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %40
  %40 = apply %39(%35, %36, %37, %38) : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // users: %43, %42
  // function_ref static String.+= infix(_:_:)
  %41 = function_ref @$sSS2peoiyySSz_SStFZ : $@convention(method) (@inout String, @guaranteed String, @thin String.Type) -> () // user: %42
  %42 = apply %41(%2, %40, %34) : $@convention(method) (@inout String, @guaranteed String, @thin String.Type) -> ()
  release_value %40 : $String                     // id: %43
  release_value %18 : $String                     // id: %44
  br bb3                                          // id: %45

bb3:                                              // Preds: bb2 bb1
  %46 = metatype $@thin String.Type               // user: %54
  %47 = string_literal utf8 "@"                   // user: %52
  %48 = integer_literal $Builtin.Word, 1          // user: %52
  %49 = integer_literal $Builtin.Int1, -1         // user: %52
  %50 = metatype $@thin String.Type               // user: %52
  // function_ref String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)
  %51 = function_ref @$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // user: %52
  %52 = apply %51(%47, %48, %49, %50) : $@convention(method) (Builtin.RawPointer, Builtin.Word, Builtin.Int1, @thin String.Type) -> @owned String // users: %55, %54
  // function_ref static String.+= infix(_:_:)
  %53 = function_ref @$sSS2peoiyySSz_SStFZ : $@convention(method) (@inout String, @guaranteed String, @thin String.Type) -> () // user: %54
  %54 = apply %53(%2, %52, %46) : $@convention(method) (@inout String, @guaranteed String, @thin String.Type) -> ()
  release_value %52 : $String                     // id: %55
  %56 = load %2 : $*String                        // users: %60, %57
  retain_value %56 : $String                      // id: %57
  destroy_addr %2 : $*String                      // id: %58
  dealloc_stack %2 : $*String                     // id: %59
  return %56 : $String                            // id: %60
} // end sil function '$s2os18OSLogInterpolationV26getNSObjectFormatSpecifierySSAA0B7PrivacyVF'

// OSLogInterpolation.addNSObjectHeaders(_:)
sil public_external [available 11.0] [Onone] [_semantics "constant_evaluable"] @$s2os18OSLogInterpolationV18addNSObjectHeadersyyAA0B7PrivacyVF : $@convention(method) (@in_guaranteed OSLogPrivacy, @inout OSLogInterpolation) -> () {
// %0                                             // users: %47, %8
// %1                                             // users: %49, %42, %31, %26, %12, %2
bb0(%0 : $*OSLogPrivacy, %1 : $*OSLogInterpolation):
  %2 = load %1 : $*OSLogInterpolation             // users: %11, %8, %3
  retain_value %2 : $OSLogInterpolation           // id: %3
  %4 = metatype $@thin OSLogInterpolation.ArgumentType.Type
  %5 = alloc_stack $OSLogInterpolation.ArgumentType // users: %10, %9, %8, %6
  inject_enum_addr %5 : $*OSLogInterpolation.ArgumentType, #OSLogInterpolation.ArgumentType.object!enumelt // id: %6
  // function_ref OSLogInterpolation.getArgumentHeader(privacy:type:)
  %7 = function_ref @$s2os18OSLogInterpolationV17getArgumentHeader7privacy4types5UInt8VAA0B7PrivacyV_AC0E4TypeOtF : $@convention(method) (@in_guaranteed OSLogPrivacy, @in_guaranteed OSLogInterpolation.ArgumentType, @guaranteed OSLogInterpolation) -> UInt8 // user: %8
  %8 = apply %7(%0, %5, %2) : $@convention(method) (@in_guaranteed OSLogPrivacy, @in_guaranteed OSLogInterpolation.ArgumentType, @guaranteed OSLogInterpolation) -> UInt8 // user: %14
  destroy_addr %5 : $*OSLogInterpolation.ArgumentType // id: %9
  dealloc_stack %5 : $*OSLogInterpolation.ArgumentType // id: %10
  release_value %2 : $OSLogInterpolation          // id: %11
  %12 = struct_element_addr %1 : $*OSLogInterpolation, #OSLogInterpolation.arguments // user: %14
  // function_ref OSLogArguments.append(_:)
  %13 = function_ref @$s2os14OSLogArgumentsV6appendyys5UInt8VF : $@convention(method) (UInt8, @inout OSLogArguments) -> () // user: %14
  %14 = apply %13(%8, %12) : $@convention(method) (UInt8, @inout OSLogArguments) -> ()
  %15 = integer_literal $Builtin.Int64, 8         // user: %16
  %16 = struct $Int (%15 : $Builtin.Int64)        // user: %21
  %17 = alloc_stack $UInt8                        // users: %29, %25, %23
  %18 = metatype $@thin UInt8.Type
  %19 = metatype $@thick UInt8.Type               // user: %23
  %20 = alloc_stack $Int                          // users: %24, %23, %21
  store %16 to %20 : $*Int                        // id: %21
  // function_ref UnsignedInteger<>.init<A>(_:)
  %22 = function_ref @$sSUss17FixedWidthIntegerRzrlEyxqd__cSzRd__lufC : $@convention(method) <τ_0_0 where τ_0_0 : FixedWidthInteger, τ_0_0 : UnsignedInteger><τ_1_0 where τ_1_0 : BinaryInteger> (@in τ_1_0, @thick τ_0_0.Type) -> @out τ_0_0 // user: %23
  %23 = apply %22<UInt8, Int>(%17, %20, %19) : $@convention(method) <τ_0_0 where τ_0_0 : FixedWidthInteger, τ_0_0 : UnsignedInteger><τ_1_0 where τ_1_0 : BinaryInteger> (@in τ_1_0, @thick τ_0_0.Type) -> @out τ_0_0
  dealloc_stack %20 : $*Int                       // id: %24
  %25 = load %17 : $*UInt8                        // user: %28
  %26 = struct_element_addr %1 : $*OSLogInterpolation, #OSLogInterpolation.arguments // user: %28
  // function_ref OSLogArguments.append(_:)
  %27 = function_ref @$s2os14OSLogArgumentsV6appendyys5UInt8VF : $@convention(method) (UInt8, @inout OSLogArguments) -> () // user: %28
  %28 = apply %27(%25, %26) : $@convention(method) (UInt8, @inout OSLogArguments) -> ()
  dealloc_stack %17 : $*UInt8                     // id: %29
  %30 = integer_literal $Builtin.Int64, 10        // user: %35
  %31 = struct_element_addr %1 : $*OSLogInterpolation, #OSLogInterpolation.totalBytesForSerializingArguments // users: %40, %32
  %32 = struct_element_addr %31 : $*Int, #Int._value // user: %33
  %33 = load %32 : $*Builtin.Int64                // user: %35
  %34 = integer_literal $Builtin.Int1, -1         // user: %35
  %35 = builtin "sadd_with_overflow_Int64"(%33 : $Builtin.Int64, %30 : $Builtin.Int64, %34 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // users: %37, %36
  %36 = tuple_extract %35 : $(Builtin.Int64, Builtin.Int1), 0 // user: %39
  %37 = tuple_extract %35 : $(Builtin.Int64, Builtin.Int1), 1 // user: %38
  cond_fail %37 : $Builtin.Int1, "arithmetic overflow" // id: %38
  %39 = struct $Int (%36 : $Builtin.Int64)        // user: %40
  store %39 to %31 : $*Int                        // id: %40
  %41 = tuple ()
  %42 = load %1 : $*OSLogInterpolation            // users: %48, %47, %43
  retain_value %42 : $OSLogInterpolation          // id: %43
  %44 = integer_literal $Builtin.Int1, 0          // user: %45
  %45 = struct $Bool (%44 : $Builtin.Int1)        // user: %47
  // function_ref OSLogInterpolation.getUpdatedPreamble(privacy:isScalar:)
  %46 = function_ref @$s2os18OSLogInterpolationV18getUpdatedPreamble7privacy8isScalars5UInt8VAA0B7PrivacyV_SbtF : $@convention(method) (@in_guaranteed OSLogPrivacy, Bool, @guaranteed OSLogInterpolation) -> UInt8 // user: %47
  %47 = apply %46(%0, %45, %42) : $@convention(method) (@in_guaranteed OSLogPrivacy, Bool, @guaranteed OSLogInterpolation) -> UInt8 // user: %50
  release_value %42 : $OSLogInterpolation         // id: %48
  %49 = struct_element_addr %1 : $*OSLogInterpolation, #OSLogInterpolation.preamble // user: %50
  store %47 to %49 : $*UInt8                      // id: %50
  %51 = tuple ()                                  // user: %52
  return %51 : $()                                // id: %52
} // end sil function '$s2os18OSLogInterpolationV18addNSObjectHeadersyyAA0B7PrivacyVF'

// OSLogArguments.append(_:)
sil public_external [available 11.0] [Onone] [_semantics "constant_evaluable"] @$s2os14OSLogArgumentsV6appendyySo8NSObjectCycF : $@convention(method) (@guaranteed @callee_guaranteed () -> @owned NSObject, @inout OSLogArguments) -> () {
// %0                                             // users: %5, %4
// %1                                             // user: %10
bb0(%0 : $@callee_guaranteed () -> @owned NSObject, %1 : $*OSLogArguments):
  %2 = alloc_stack $@callee_guaranteed @substituted <τ_0_0, τ_0_1, τ_0_2, τ_0_3> (@inout τ_0_0, @inout τ_0_1, @inout τ_0_2) -> @out τ_0_3 for <UnsafeMutablePointer<UInt8>, Optional<UnsafeMutablePointer<NSObject>>, Optional<UnsafeMutablePointer<Any>>, ()> // users: %13, %12, %9
  // function_ref closure #1 in OSLogArguments.append(_:)
  %3 = function_ref @$s2os14OSLogArgumentsV6appendyySo8NSObjectCycFySpys5UInt8VGz_SpyAFGSgzSpyypGSgztcfU_ : $@convention(thin) (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>, @guaranteed @callee_guaranteed () -> @owned NSObject) -> () // user: %5
  strong_retain %0 : $@callee_guaranteed () -> @owned NSObject // id: %4
  %5 = partial_apply [callee_guaranteed] %3(%0) : $@convention(thin) (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>, @guaranteed @callee_guaranteed () -> @owned NSObject) -> () // user: %7
  // function_ref thunk for @escaping @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout UnsafeMutablePointer<NSObject>?, @inout UnsafeMutablePointer<Any>?) -> ()
  %6 = function_ref @$sSpys5UInt8VGSpySo8NSObjectCGSgSpyypGSgIeglll_AcgIytIeglllr_TR : $@convention(thin) (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>, @guaranteed @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> ()) -> @out () // user: %7
  %7 = partial_apply [callee_guaranteed] %6(%5) : $@convention(thin) (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>, @guaranteed @callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> ()) -> @out () // user: %8
  %8 = convert_function %7 : $@callee_guaranteed (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>) -> @out () to $@callee_guaranteed @substituted <τ_0_0, τ_0_1, τ_0_2, τ_0_3> (@inout τ_0_0, @inout τ_0_1, @inout τ_0_2) -> @out τ_0_3 for <UnsafeMutablePointer<UInt8>, Optional<UnsafeMutablePointer<NSObject>>, Optional<UnsafeMutablePointer<Any>>, ()> // user: %9
  store %8 to %2 : $*@callee_guaranteed @substituted <τ_0_0, τ_0_1, τ_0_2, τ_0_3> (@inout τ_0_0, @inout τ_0_1, @inout τ_0_2) -> @out τ_0_3 for <UnsafeMutablePointer<UInt8>, Optional<UnsafeMutablePointer<NSObject>>, Optional<UnsafeMutablePointer<Any>>, ()> // id: %9
  %10 = struct_element_addr %1 : $*OSLogArguments, #OSLogArguments.argumentClosures // user: %12
  // function_ref Array.append(_:)
  %11 = function_ref @$sSa6appendyyxnF : $@convention(method) <τ_0_0> (@in τ_0_0, @inout Array<τ_0_0>) -> () // user: %12
  %12 = apply %11<(inout UnsafeMutablePointer<UInt8>, inout UnsafeMutablePointer<NSObject>?, inout UnsafeMutablePointer<Any>?) -> ()>(%2, %10) : $@convention(method) <τ_0_0> (@in τ_0_0, @inout Array<τ_0_0>) -> ()
  dealloc_stack %2 : $*@callee_guaranteed @substituted <τ_0_0, τ_0_1, τ_0_2, τ_0_3> (@inout τ_0_0, @inout τ_0_1, @inout τ_0_2) -> @out τ_0_3 for <UnsafeMutablePointer<UInt8>, Optional<UnsafeMutablePointer<NSObject>>, Optional<UnsafeMutablePointer<Any>>, ()> // id: %13
  %14 = tuple ()                                  // user: %15
  return %14 : $()                                // id: %15
} // end sil function '$s2os14OSLogArgumentsV6appendyySo8NSObjectCycF'

// closure #1 in OSLogArguments.append(_:)
sil shared_external @$s2os14OSLogArgumentsV6appendyySo8NSObjectCycFySpys5UInt8VGz_SpyAFGSgzSpyypGSgztcfU_ : $@convention(thin) (@inout UnsafeMutablePointer<UInt8>, @inout Optional<UnsafeMutablePointer<NSObject>>, @inout Optional<UnsafeMutablePointer<Any>>, @guaranteed @callee_guaranteed () -> @owned NSObject) -> () {
// %0                                             // users: %54, %5
// %1                                             // users: %68, %55
// %3                                             // user: %4
bb0(%0 : $*UnsafeMutablePointer<UInt8>, %1 : $*Optional<UnsafeMutablePointer<NSObject>>, %2 : $*Optional<UnsafeMutablePointer<Any>>, %3 : $@callee_guaranteed () -> @owned NSObject):
  %4 = apply %3() : $@callee_guaranteed () -> @owned NSObject // users: %57, %62, %7
  %5 = struct_element_addr %0 : $*UnsafeMutablePointer<UInt8>, #UnsafeMutablePointer._rawValue // users: %48, %6
  %6 = load %5 : $*Builtin.RawPointer             // user: %46
  %7 = ref_to_unmanaged %4 : $NSObject to $@sil_unmanaged NSObject // user: %8
  %8 = strong_copy_unmanaged_value %7 : $@sil_unmanaged NSObject // users: %20, %19
  %9 = metatype $@thick NSObject.Type             // user: %10
  %10 = builtin "sizeof"<NSObject>(%9 : $@thick NSObject.Type) : $Builtin.Word // user: %11
  %11 = builtin "sextOrBitCast_Word_Int64"(%10 : $Builtin.Word) : $Builtin.Int64 // user: %15
  %12 = metatype $@thick UnsafeMutableRawPointer.Type // user: %13
  %13 = builtin "sizeof"<UnsafeMutableRawPointer>(%12 : $@thick UnsafeMutableRawPointer.Type) : $Builtin.Word // user: %14
  %14 = builtin "sextOrBitCast_Word_Int64"(%13 : $Builtin.Word) : $Builtin.Int64 // users: %34, %43, %24, %15
  %15 = builtin "cmp_eq_Int64"(%11 : $Builtin.Int64, %14 : $Builtin.Int64) : $Builtin.Int1 // user: %17
  %16 = integer_literal $Builtin.Int1, -1         // user: %17
  %17 = builtin "xor_Int1"(%15 : $Builtin.Int1, %16 : $Builtin.Int1) : $Builtin.Int1 // user: %18
  cond_fail %17 : $Builtin.Int1, "Can't unsafeBitCast between types of different sizes" // id: %18
  %19 = unchecked_trivial_bit_cast %8 : $NSObject to $UnsafeMutableRawPointer // user: %22
  strong_release %8 : $NSObject                   // id: %20
  %21 = alloc_stack $UnsafeMutableRawPointer      // users: %47, %42, %22
  store %19 to %21 : $*UnsafeMutableRawPointer    // id: %22
  %23 = integer_literal $Builtin.Int64, 0         // users: %30, %44, %24
  %24 = builtin "cmp_slt_Int64"(%14 : $Builtin.Int64, %23 : $Builtin.Int64) : $Builtin.Int1 // user: %25
  cond_fail %24 : $Builtin.Int1, "UnsafeRawBufferPointer with negative count" // id: %25
  %26 = integer_literal $Builtin.Int1, 0          // users: %31, %39, %46
  %27 = metatype $@thick UInt8.Type               // user: %28
  %28 = builtin "strideof"<UInt8>(%27 : $@thick UInt8.Type) : $Builtin.Word // user: %29
  %29 = builtin "sextOrBitCast_Word_Int64"(%28 : $Builtin.Word) : $Builtin.Int64 // users: %43, %38, %30
  %30 = builtin "cmp_eq_Int64"(%29 : $Builtin.Int64, %23 : $Builtin.Int64) : $Builtin.Int1 // user: %31
  %31 = builtin "int_expect_Int1"(%30 : $Builtin.Int1, %26 : $Builtin.Int1) : $Builtin.Int1 // user: %32
  cond_fail %31 : $Builtin.Int1, "Division by zero" // id: %32
  %33 = integer_literal $Builtin.Int64, -9223372036854775808 // user: %34
  %34 = builtin "cmp_eq_Int64"(%14 : $Builtin.Int64, %33 : $Builtin.Int64) : $Builtin.Int1 // user: %35
  cond_br %34, bb2, bb1                           // id: %35

bb1:                                              // Preds: bb0
  br bb3                                          // id: %36

bb2:                                              // Preds: bb0
  %37 = integer_literal $Builtin.Int64, -1        // user: %38
  %38 = builtin "cmp_eq_Int64"(%29 : $Builtin.Int64, %37 : $Builtin.Int64) : $Builtin.Int1 // user: %39
  %39 = builtin "int_expect_Int1"(%38 : $Builtin.Int1, %26 : $Builtin.Int1) : $Builtin.Int1 // user: %40
  cond_fail %39 : $Builtin.Int1, "Division results in an overflow" // id: %40
  br bb3                                          // id: %41

bb3:                                              // Preds: bb1 bb2
  %42 = address_to_pointer %21 : $*UnsafeMutableRawPointer to $Builtin.RawPointer // user: %46
  %43 = builtin "sdiv_Int64"(%14 : $Builtin.Int64, %29 : $Builtin.Int64) : $Builtin.Int64 // users: %46, %44
  %44 = builtin "cmp_slt_Int64"(%43 : $Builtin.Int64, %23 : $Builtin.Int64) : $Builtin.Int1 // user: %45
  cond_fail %44 : $Builtin.Int1, "Negative value is not representable" // id: %45
  %46 = builtin "int_memmove_RawPointer_RawPointer_Int64"(%6 : $Builtin.RawPointer, %42 : $Builtin.RawPointer, %43 : $Builtin.Int64, %26 : $Builtin.Int1) : $()
  dealloc_stack %21 : $*UnsafeMutableRawPointer   // id: %47
  %48 = load %5 : $*Builtin.RawPointer            // user: %50
  %49 = integer_literal $Builtin.Word, 8          // user: %51
  %50 = pointer_to_address %48 : $Builtin.RawPointer to [strict] $*UInt8 // user: %51
  %51 = index_addr %50 : $*UInt8, %49 : $Builtin.Word // user: %52
  %52 = address_to_pointer %51 : $*UInt8 to $Builtin.RawPointer // user: %53
  %53 = struct $UnsafeMutablePointer<UInt8> (%52 : $Builtin.RawPointer) // user: %54
  store %53 to %0 : $*UnsafeMutablePointer<UInt8> // id: %54
  %55 = load %1 : $*Optional<UnsafeMutablePointer<NSObject>> // user: %56
  switch_enum %55 : $Optional<UnsafeMutablePointer<NSObject>>, case #Optional.some!enumelt: bb5, case #Optional.none!enumelt: bb4 // id: %56

bb4:                                              // Preds: bb3
  strong_release %4 : $NSObject                   // id: %57
  br bb6                                          // id: %58

// %59                                            // user: %60
bb5(%59 : $UnsafeMutablePointer<NSObject>):       // Preds: bb3
  %60 = struct_extract %59 : $UnsafeMutablePointer<NSObject>, #UnsafeMutablePointer._rawValue // user: %61
  %61 = pointer_to_address %60 : $Builtin.RawPointer to [strict] $*NSObject // users: %64, %62
  store %4 to %61 : $*NSObject                    // id: %62
  %63 = integer_literal $Builtin.Word, 1          // user: %64
  %64 = index_addr %61 : $*NSObject, %63 : $Builtin.Word // user: %65
  %65 = address_to_pointer %64 : $*NSObject to $Builtin.RawPointer // user: %66
  %66 = struct $UnsafeMutablePointer<NSObject> (%65 : $Builtin.RawPointer) // user: %67
  %67 = enum $Optional<UnsafeMutablePointer<NSObject>>, #Optional.some!enumelt, %66 : $UnsafeMutablePointer<NSObject> // user: %68
  store %67 to %1 : $*Optional<UnsafeMutablePointer<NSObject>> // id: %68
  br bb6                                          // id: %69

bb6:                                              // Preds: bb5 bb4
  %70 = tuple ()                                  // user: %71
  return %70 : $()                                // id: %71
} // end sil function '$s2os14OSLogArgumentsV6appendyySo8NSObjectCycFySpys5UInt8VGz_SpyAFGSgzSpyypGSgztcfU_'

// String.write<A>(to:)
sil @$sSS5write2toyxz_ts16TextOutputStreamRzlF : $@convention(method) <τ_0_0 where τ_0_0 : TextOutputStream> (@inout τ_0_0, @guaranteed String) -> ()

// BinaryInteger.description.getter
sil [_semantics "binaryInteger.description"] @$sSzsE11descriptionSSvg : $@convention(method) <τ_0_0 where τ_0_0 : BinaryInteger> (@in_guaranteed τ_0_0) -> @owned String

// specialized _ArrayBuffer.init(_buffer:shiftedToStartIndex:)
sil shared @$ss12_ArrayBufferV7_buffer19shiftedToStartIndexAByxGs011_ContiguousaB0VyxG_SitcfCTf4ndd_n : $@convention(thin) <Element> (@owned _ContiguousArrayBuffer<Element>) -> @owned _ArrayBuffer<Element> {
// %0                                             // user: %1
bb0(%0 : $_ContiguousArrayBuffer<Element>):
  %1 = struct_extract %0 : $_ContiguousArrayBuffer<Element>, #_ContiguousArrayBuffer._storage // user: %2
  %2 = unchecked_ref_cast %1 : $__ContiguousArrayStorageBase to $Builtin.BridgeObject // user: %3
  %3 = struct $_BridgeStorage<__ContiguousArrayStorageBase> (%2 : $Builtin.BridgeObject) // user: %4
  %4 = struct $_ArrayBuffer<Element> (%3 : $_BridgeStorage<__ContiguousArrayStorageBase>) // user: %5
  return %4 : $_ArrayBuffer<Element>              // id: %5
} // end sil function '$ss12_ArrayBufferV7_buffer19shiftedToStartIndexAByxGs011_ContiguousaB0VyxG_SitcfCTf4ndd_n'

// specialized _ArrayBuffer.init()
sil shared @$ss12_ArrayBufferVAByxGycfCTf4n_g : $@convention(method) <Element> (@thin _ArrayBuffer<Element>.Type) -> _ArrayBuffer<Element> {
bb0(%0 : $@thin _ArrayBuffer<Element>.Type):
  %1 = global_addr @_swiftEmptyArrayStorage : $*_SwiftEmptyArrayStorage // user: %2
  %2 = address_to_pointer %1 : $*_SwiftEmptyArrayStorage to $Builtin.RawPointer // user: %3
  %3 = raw_pointer_to_ref %2 : $Builtin.RawPointer to $__EmptyArrayStorage // user: %4
  %4 = unchecked_ref_cast %3 : $__EmptyArrayStorage to $Builtin.BridgeObject // user: %5
  %5 = struct $_BridgeStorage<__ContiguousArrayStorageBase> (%4 : $Builtin.BridgeObject) // user: %6
  %6 = struct $_ArrayBuffer<Element> (%5 : $_BridgeStorage<__ContiguousArrayStorageBase>) // user: %7
  return %6 : $_ArrayBuffer<Element>              // id: %7
} // end sil function '$ss12_ArrayBufferVAByxGycfCTf4n_g'

// specialized _ContiguousArrayBuffer.init(count:storage:)
sil shared @$ss22_ContiguousArrayBufferV5count7storageAByxGSi_s01_aB7StorageCyxGtcfCTf4ngn_n : $@convention(method) <Element> (Int, @guaranteed _ContiguousArrayStorage<Element>, @thin _ContiguousArrayBuffer<Element>.Type) -> @owned _ContiguousArrayBuffer<Element> {
// %0                                             // users: %7, %7
// %1                                             // users: %6, %3
bb0(%0 : $Int, %1 : $_ContiguousArrayStorage<Element>, %2 : $@thin _ContiguousArrayBuffer<Element>.Type):
  %3 = upcast %1 : $_ContiguousArrayStorage<Element> to $__ContiguousArrayStorageBase // user: %4
  %4 = struct $_ContiguousArrayBuffer<Element> (%3 : $__ContiguousArrayStorageBase) // users: %8, %7
  // function_ref _ContiguousArrayBuffer._initStorageHeader(count:capacity:)
  %5 = function_ref @$ss22_ContiguousArrayBufferV18_initStorageHeader5count8capacityySi_SitF : $@convention(method) <τ_0_0> (Int, Int, @guaranteed _ContiguousArrayBuffer<τ_0_0>) -> () // user: %7
  strong_retain %1 : $_ContiguousArrayStorage<Element> // id: %6
  %7 = apply %5<Element>(%0, %0, %4) : $@convention(method) <τ_0_0> (Int, Int, @guaranteed _ContiguousArrayBuffer<τ_0_0>) -> ()
  return %4 : $_ContiguousArrayBuffer<Element>    // id: %8
} // end sil function '$ss22_ContiguousArrayBufferV5count7storageAByxGSi_s01_aB7StorageCyxGtcfCTf4ngn_n'

// specialized static Array._adoptStorage(_:count:)
sil shared @$sSa13_adoptStorage_5countSayxG_SpyxGts016_ContiguousArrayB0CyxGn_SitFZTf4gnn_n : $@convention(method) <Element> (@guaranteed _ContiguousArrayStorage<Element>, Int, @thin Array<Element>.Type) -> (@owned Array<Element>, UnsafeMutablePointer<Element>) {
// %0                                             // user: %5
// %1                                             // user: %5
// %2                                             // user: %9
bb0(%0 : $_ContiguousArrayStorage<Element>, %1 : $Int, %2 : $@thin Array<Element>.Type):
  %3 = metatype $@thin _ContiguousArrayBuffer<Element>.Type // user: %5
  // function_ref specialized _ContiguousArrayBuffer.init(count:storage:)
  %4 = function_ref @$ss22_ContiguousArrayBufferV5count7storageAByxGSi_s01_aB7StorageCyxGtcfCTf4ngn_n : $@convention(method) <τ_0_0> (Int, @guaranteed _ContiguousArrayStorage<τ_0_0>, @thin _ContiguousArrayBuffer<τ_0_0>.Type) -> @owned _ContiguousArrayBuffer<τ_0_0> // user: %5
  %5 = apply %4<Element>(%1, %0, %3) : $@convention(method) <τ_0_0> (Int, @guaranteed _ContiguousArrayStorage<τ_0_0>, @thin _ContiguousArrayBuffer<τ_0_0>.Type) -> @owned _ContiguousArrayBuffer<τ_0_0> // users: %7, %11
  // function_ref specialized _ArrayBuffer.init(_buffer:shiftedToStartIndex:)
  %6 = function_ref @$ss12_ArrayBufferV7_buffer19shiftedToStartIndexAByxGs011_ContiguousaB0VyxG_SitcfCTf4ndd_n : $@convention(thin) <τ_0_0> (@owned _ContiguousArrayBuffer<τ_0_0>) -> @owned _ArrayBuffer<τ_0_0> // user: %7
  %7 = apply %6<Element>(%5) : $@convention(thin) <τ_0_0> (@owned _ContiguousArrayBuffer<τ_0_0>) -> @owned _ArrayBuffer<τ_0_0> // user: %9
  // function_ref Array.init(_buffer:)
  %8 = function_ref @$sSa7_bufferSayxGs12_ArrayBufferVyxG_tcfC : $@convention(method) <τ_0_0> (@owned _ArrayBuffer<τ_0_0>, @thin Array<τ_0_0>.Type) -> @owned Array<τ_0_0> // user: %9
  %9 = apply %8<Element>(%7, %2) : $@convention(method) <τ_0_0> (@owned _ArrayBuffer<τ_0_0>, @thin Array<τ_0_0>.Type) -> @owned Array<τ_0_0> // user: %12
  // function_ref _ContiguousArrayBuffer.firstElementAddress.getter
  %10 = function_ref @$ss22_ContiguousArrayBufferV19firstElementAddressSpyxGvg : $@convention(method) <τ_0_0> (@guaranteed _ContiguousArrayBuffer<τ_0_0>) -> UnsafeMutablePointer<τ_0_0> // user: %11
  %11 = apply %10<Element>(%5) : $@convention(method) <τ_0_0> (@guaranteed _ContiguousArrayBuffer<τ_0_0>) -> UnsafeMutablePointer<τ_0_0> // user: %12
  %12 = tuple (%9 : $Array<Element>, %11 : $UnsafeMutablePointer<Element>) // user: %13
  return %12 : $(Array<Element>, UnsafeMutablePointer<Element>) // id: %13
} // end sil function '$sSa13_adoptStorage_5countSayxG_SpyxGts016_ContiguousArrayB0CyxGn_SitFZTf4gnn_n'

// specialized _ContiguousArrayBuffer.init()
sil shared @$ss22_ContiguousArrayBufferVAByxGycfCTf4n_g : $@convention(method) <Element> (@thin _ContiguousArrayBuffer<Element>.Type) -> _ContiguousArrayBuffer<Element> {
bb0(%0 : $@thin _ContiguousArrayBuffer<Element>.Type):
  %1 = global_addr @_swiftEmptyArrayStorage : $*_SwiftEmptyArrayStorage // user: %2
  %2 = address_to_pointer %1 : $*_SwiftEmptyArrayStorage to $Builtin.RawPointer // user: %3
  %3 = raw_pointer_to_ref %2 : $Builtin.RawPointer to $__EmptyArrayStorage // user: %4
  %4 = upcast %3 : $__EmptyArrayStorage to $__ContiguousArrayStorageBase // user: %5
  %5 = struct $_ContiguousArrayBuffer<Element> (%4 : $__ContiguousArrayStorageBase) // user: %6
  return %5 : $_ContiguousArrayBuffer<Element>    // id: %6
} // end sil function '$ss22_ContiguousArrayBufferVAByxGycfCTf4n_g'

// specialized _ContiguousArrayBuffer.owner.getter
sil shared @$ss22_ContiguousArrayBufferV5owneryXlvgTf4n_g : $@convention(method) <Element> (@guaranteed _ContiguousArrayBuffer<Element>) -> AnyObject {
// %0                                             // user: %1
bb0(%0 : $_ContiguousArrayBuffer<Element>):
  %1 = struct_extract %0 : $_ContiguousArrayBuffer<Element>, #_ContiguousArrayBuffer._storage // user: %2
  %2 = init_existential_ref %1 : $__ContiguousArrayStorageBase : $__ContiguousArrayStorageBase, $AnyObject // user: %3
  return %2 : $AnyObject                          // id: %3
} // end sil function '$ss22_ContiguousArrayBufferV5owneryXlvgTf4n_g'

// specialized _ContiguousArrayBuffer._copyContents(subRange:initializing:)
sil shared @$ss22_ContiguousArrayBufferV13_copyContents8subRange12initializingSpyxGSnySiG_AFtFTf4nng_n : $@convention(thin) <Element> (Range<Int>, UnsafeMutablePointer<Element>, @guaranteed _ContiguousArrayBuffer<Element>) -> UnsafeMutablePointer<Element> {
// %0                                             // users: %4, %3
// %1                                             // users: %26, %22
// %2                                             // users: %24, %14
bb0(%0 : $Range<Int>, %1 : $UnsafeMutablePointer<Element>, %2 : $_ContiguousArrayBuffer<Element>):
  %3 = struct_extract %0 : $Range<Int>, #Range.upperBound // user: %5
  %4 = struct_extract %0 : $Range<Int>, #Range.lowerBound // user: %6
  %5 = struct_extract %3 : $Int, #Int._value      // user: %8
  %6 = struct_extract %4 : $Int, #Int._value      // users: %16, %8
  %7 = integer_literal $Builtin.Int1, -1          // user: %8
  %8 = builtin "ssub_with_overflow_Int64"(%5 : $Builtin.Int64, %6 : $Builtin.Int64, %7 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // users: %10, %9
  %9 = tuple_extract %8 : $(Builtin.Int64, Builtin.Int1), 0 // users: %27, %12
  %10 = tuple_extract %8 : $(Builtin.Int64, Builtin.Int1), 1 // user: %11
  cond_fail %10 : $Builtin.Int1, "arithmetic overflow" // id: %11
  %12 = struct $Int (%9 : $Builtin.Int64)         // user: %22
  // function_ref _ContiguousArrayBuffer.firstElementAddress.getter
  %13 = function_ref @$ss22_ContiguousArrayBufferV19firstElementAddressSpyxGvg : $@convention(method) <τ_0_0> (@guaranteed _ContiguousArrayBuffer<τ_0_0>) -> UnsafeMutablePointer<τ_0_0> // user: %14
  %14 = apply %13<Element>(%2) : $@convention(method) <τ_0_0> (@guaranteed _ContiguousArrayBuffer<τ_0_0>) -> UnsafeMutablePointer<τ_0_0> // user: %15
  %15 = struct_extract %14 : $UnsafeMutablePointer<Element>, #UnsafeMutablePointer._rawValue // user: %17
  %16 = builtin "truncOrBitCast_Int64_Word"(%6 : $Builtin.Int64) : $Builtin.Word // user: %18
  %17 = pointer_to_address %15 : $Builtin.RawPointer to [strict] $*Element // user: %18
  %18 = index_addr %17 : $*Element, %16 : $Builtin.Word // user: %19
  %19 = address_to_pointer %18 : $*Element to $Builtin.RawPointer // user: %20
  %20 = struct $UnsafePointer<Element> (%19 : $Builtin.RawPointer) // user: %22
  // function_ref UnsafeMutablePointer.initialize(from:count:)
  %21 = function_ref @$sSp10initialize4from5countySPyxG_SitF : $@convention(method) <τ_0_0> (UnsafePointer<τ_0_0>, Int, UnsafeMutablePointer<τ_0_0>) -> () // user: %22
  %22 = apply %21<Element>(%20, %12, %1) : $@convention(method) <τ_0_0> (UnsafePointer<τ_0_0>, Int, UnsafeMutablePointer<τ_0_0>) -> ()
  // function_ref specialized _ContiguousArrayBuffer.owner.getter
  %23 = function_ref @$ss22_ContiguousArrayBufferV5owneryXlvgTf4n_g : $@convention(method) <τ_0_0> (@guaranteed _ContiguousArrayBuffer<τ_0_0>) -> AnyObject // user: %24
  %24 = apply %23<Element>(%2) : $@convention(method) <τ_0_0> (@guaranteed _ContiguousArrayBuffer<τ_0_0>) -> AnyObject // user: %25
  fix_lifetime %24 : $AnyObject                   // id: %25
  %26 = struct_extract %1 : $UnsafeMutablePointer<Element>, #UnsafeMutablePointer._rawValue // user: %28
  %27 = builtin "truncOrBitCast_Int64_Word"(%9 : $Builtin.Int64) : $Builtin.Word // user: %29
  %28 = pointer_to_address %26 : $Builtin.RawPointer to [strict] $*Element // user: %29
  %29 = index_addr %28 : $*Element, %27 : $Builtin.Word // user: %30
  %30 = address_to_pointer %29 : $*Element to $Builtin.RawPointer // user: %31
  %31 = struct $UnsafeMutablePointer<Element> (%30 : $Builtin.RawPointer) // user: %32
  return %31 : $UnsafeMutablePointer<Element>     // id: %32
} // end sil function '$ss22_ContiguousArrayBufferV13_copyContents8subRange12initializingSpyxGSnySiG_AFtFTf4nng_n'

// specialized _ArrayBuffer._copyContents(subRange:initializing:)
sil shared @$ss12_ArrayBufferV13_copyContents8subRange12initializingSpyxGSnySiG_AFtFTf4nng_n : $@convention(thin) <Element> (Range<Int>, UnsafeMutablePointer<Element>, @guaranteed _ArrayBuffer<Element>) -> UnsafeMutablePointer<Element> {
// %0                                             // users: %26, %19, %4
// %1                                             // users: %26, %11
// %2                                             // users: %24, %13, %6, %4
bb0(%0 : $Range<Int>, %1 : $UnsafeMutablePointer<Element>, %2 : $_ArrayBuffer<Element>):
  // function_ref _ArrayBuffer._typeCheck(_:)
  %3 = function_ref @$ss12_ArrayBufferV10_typeCheckyySnySiGF : $@convention(method) <τ_0_0> (Range<Int>, @guaranteed _ArrayBuffer<τ_0_0>) -> () // user: %4
  %4 = apply %3<Element>(%0, %2) : $@convention(method) <τ_0_0> (Range<Int>, @guaranteed _ArrayBuffer<τ_0_0>) -> ()
  // function_ref _ArrayBuffer._isNative.getter
  %5 = function_ref @$ss12_ArrayBufferV9_isNativeSbvg : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> Bool // user: %6
  %6 = apply %5<Element>(%2) : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> Bool // user: %7
  %7 = struct_extract %6 : $Bool, #Bool._value    // user: %9
  %8 = integer_literal $Builtin.Int1, -1          // user: %9
  %9 = builtin "int_expect_Int1"(%7 : $Builtin.Int1, %8 : $Builtin.Int1) : $Builtin.Int1 // user: %10
  cond_br %9, bb2, bb1                            // id: %10

bb1:                                              // Preds: bb0
  %11 = struct_extract %1 : $UnsafeMutablePointer<Element>, #UnsafeMutablePointer._rawValue // user: %12
  %12 = struct $UnsafeMutablePointer<AnyObject> (%11 : $Builtin.RawPointer) // user: %19
  %13 = struct_extract %2 : $_ArrayBuffer<Element>, #_ArrayBuffer._storage // user: %14
  %14 = struct_extract %13 : $_BridgeStorage<__ContiguousArrayStorageBase>, #_BridgeStorage.rawValue // users: %18, %15
  %15 = bridge_object_to_ref %14 : $Builtin.BridgeObject to $AnyObject // user: %16
  %16 = struct $_CocoaArrayWrapper (%15 : $AnyObject) // user: %19
  // function_ref _CocoaArrayWrapper._copyContents(subRange:initializing:)
  %17 = function_ref @$ss18_CocoaArrayWrapperV13_copyContents8subRange12initializingSpyyXlGSnySiG_AFtF : $@convention(method) (Range<Int>, UnsafeMutablePointer<AnyObject>, @owned _CocoaArrayWrapper) -> UnsafeMutablePointer<AnyObject> // user: %19
  strong_retain %14 : $Builtin.BridgeObject       // id: %18
  %19 = apply %17(%0, %12, %16) : $@convention(method) (Range<Int>, UnsafeMutablePointer<AnyObject>, @owned _CocoaArrayWrapper) -> UnsafeMutablePointer<AnyObject> // user: %20
  %20 = struct_extract %19 : $UnsafeMutablePointer<AnyObject>, #UnsafeMutablePointer._rawValue // user: %21
  %21 = struct $UnsafeMutablePointer<Element> (%20 : $Builtin.RawPointer) // user: %22
  br bb3(%21 : $UnsafeMutablePointer<Element>)    // id: %22

bb2:                                              // Preds: bb0
  // function_ref _ArrayBuffer._native.getter
  %23 = function_ref @$ss12_ArrayBufferV7_natives011_ContiguousaB0VyxGvg : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> @owned _ContiguousArrayBuffer<τ_0_0> // user: %24
  %24 = apply %23<Element>(%2) : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> @owned _ContiguousArrayBuffer<τ_0_0> // users: %27, %26
  // function_ref specialized _ContiguousArrayBuffer._copyContents(subRange:initializing:)
  %25 = function_ref @$ss22_ContiguousArrayBufferV13_copyContents8subRange12initializingSpyxGSnySiG_AFtFTf4nng_n : $@convention(thin) <τ_0_0> (Range<Int>, UnsafeMutablePointer<τ_0_0>, @guaranteed _ContiguousArrayBuffer<τ_0_0>) -> UnsafeMutablePointer<τ_0_0> // user: %26
  %26 = apply %25<Element>(%0, %1, %24) : $@convention(thin) <τ_0_0> (Range<Int>, UnsafeMutablePointer<τ_0_0>, @guaranteed _ContiguousArrayBuffer<τ_0_0>) -> UnsafeMutablePointer<τ_0_0> // user: %28
  release_value %24 : $_ContiguousArrayBuffer<Element> // id: %27
  br bb3(%26 : $UnsafeMutablePointer<Element>)    // id: %28

// %29                                            // user: %30
bb3(%29 : $UnsafeMutablePointer<Element>):        // Preds: bb2 bb1
  return %29 : $UnsafeMutablePointer<Element>     // id: %30
} // end sil function '$ss12_ArrayBufferV13_copyContents8subRange12initializingSpyxGSnySiG_AFtFTf4nng_n'

// specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)
sil shared @$sSa37_appendElementAssumeUniqueAndCapacity_03newB0ySi_xntFTf4ngn_n : $@convention(method) <Element> (Int, @in_guaranteed Element, @inout Array<Element>) -> () {
// %0                                             // user: %4
// %1                                             // user: %28
// %2                                             // user: %11
bb0(%0 : $Int, %1 : $*Element, %2 : $*Array<Element>):
  %3 = integer_literal $Builtin.Int64, 1          // user: %6
  %4 = struct_extract %0 : $Int, #Int._value      // users: %22, %6
  %5 = integer_literal $Builtin.Int1, -1          // user: %6
  %6 = builtin "sadd_with_overflow_Int64"(%4 : $Builtin.Int64, %3 : $Builtin.Int64, %5 : $Builtin.Int1) : $(Builtin.Int64, Builtin.Int1) // users: %8, %7
  %7 = tuple_extract %6 : $(Builtin.Int64, Builtin.Int1), 0 // user: %10
  %8 = tuple_extract %6 : $(Builtin.Int64, Builtin.Int1), 1 // user: %9
  cond_fail %8 : $Builtin.Int1, "arithmetic overflow" // id: %9
  %10 = struct $Int (%7 : $Builtin.Int64)         // user: %13
  %11 = struct_element_addr %2 : $*Array<Element>, #Array._buffer // users: %14, %13
  // function_ref _ArrayBuffer.count.setter
  %12 = function_ref @$ss12_ArrayBufferV5countSivs : $@convention(method) <τ_0_0> (Int, @inout _ArrayBuffer<τ_0_0>) -> () // user: %13
  %13 = apply %12<Element>(%10, %11) : $@convention(method) <τ_0_0> (Int, @inout _ArrayBuffer<τ_0_0>) -> ()
  %14 = load %11 : $*_ArrayBuffer<Element>        // users: %20, %19, %16
  // function_ref _ArrayBuffer.firstElementAddress.getter
  %15 = function_ref @$ss12_ArrayBufferV19firstElementAddressSpyxGvg : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> UnsafeMutablePointer<τ_0_0> // user: %19
  %16 = struct_extract %14 : $_ArrayBuffer<Element>, #_ArrayBuffer._storage // user: %17
  %17 = struct_extract %16 : $_BridgeStorage<__ContiguousArrayStorageBase>, #_BridgeStorage.rawValue // user: %18
  strong_retain %17 : $Builtin.BridgeObject       // id: %18
  %19 = apply %15<Element>(%14) : $@convention(method) <τ_0_0> (@guaranteed _ArrayBuffer<τ_0_0>) -> UnsafeMutablePointer<τ_0_0> // user: %21
  release_value %14 : $_ArrayBuffer<Element>      // id: %20
  %21 = struct_extract %19 : $UnsafeMutablePointer<Element>, #UnsafeMutablePointer._rawValue // user: %23
  %22 = builtin "truncOrBitCast_Int64_Word"(%4 : $Builtin.Int64) : $Builtin.Word // user: %24
  %23 = pointer_to_address %21 : $Builtin.RawPointer to [strict] $*Element // user: %24
  %24 = index_addr %23 : $*Element, %22 : $Builtin.Word // user: %25
  %25 = address_to_pointer %24 : $*Element to $Builtin.RawPointer // user: %26
  %26 = struct $UnsafeMutablePointer<Element> (%25 : $Builtin.RawPointer) // user: %28
  // function_ref UnsafeMutablePointer.initialize(to:)
  %27 = function_ref @$sSp10initialize2toyx_tF : $@convention(method) <τ_0_0> (@in_guaranteed τ_0_0, UnsafeMutablePointer<τ_0_0>) -> () // user: %28
  %28 = apply %27<Element>(%1, %26) : $@convention(method) <τ_0_0> (@in_guaranteed τ_0_0, UnsafeMutablePointer<τ_0_0>) -> ()
  %29 = tuple ()                                  // user: %30
  return %29 : $()                                // id: %30
} // end sil function '$sSa37_appendElementAssumeUniqueAndCapacity_03newB0ySi_xntFTf4ngn_n'

// specialized Array.append(_:)
sil shared @$sSa6appendyyxnFTf4gn_n : $@convention(method) <Element> (@in_guaranteed Element, @inout Array<Element>) -> () {
// %0                                             // user: %10
// %1                                             // users: %10, %8, %4, %3
bb0(%0 : $*Element, %1 : $*Array<Element>):
  // function_ref Array._makeUniqueAndReserveCapacityIfNotUnique()
  %2 = function_ref @$sSa034_makeUniqueAndReserveCapacityIfNotB0yyF : $@convention(method) <τ_0_0> (@inout Array<τ_0_0>) -> () // user: %3
  %3 = apply %2<Element>(%1) : $@convention(method) <τ_0_0> (@inout Array<τ_0_0>) -> ()
  %4 = load %1 : $*Array<Element>                 // user: %6
  // function_ref Array._getCount()
  %5 = function_ref @$sSa9_getCountSiyF : $@convention(method) <τ_0_0> (@guaranteed Array<τ_0_0>) -> Int // user: %6
  %6 = apply %5<Element>(%4) : $@convention(method) <τ_0_0> (@guaranteed Array<τ_0_0>) -> Int // users: %10, %8
  // function_ref Array._reserveCapacityAssumingUniqueBuffer(oldCount:)
  %7 = function_ref @$sSa36_reserveCapacityAssumingUniqueBuffer8oldCountySi_tF : $@convention(method) <τ_0_0> (Int, @inout Array<τ_0_0>) -> () // user: %8
  %8 = apply %7<Element>(%6, %1) : $@convention(method) <τ_0_0> (Int, @inout Array<τ_0_0>) -> ()
  // function_ref specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)
  %9 = function_ref @$sSa37_appendElementAssumeUniqueAndCapacity_03newB0ySi_xntFTf4ngn_n : $@convention(method) <τ_0_0> (Int, @in_guaranteed τ_0_0, @inout Array<τ_0_0>) -> () // user: %10
  %10 = apply %9<Element>(%6, %0, %1) : $@convention(method) <τ_0_0> (Int, @in_guaranteed τ_0_0, @inout Array<τ_0_0>) -> ()
  %11 = tuple ()                                  // user: %12
  return %11 : $()                                // id: %12
} // end sil function '$sSa6appendyyxnFTf4gn_n'

sil_vtable _ContiguousArrayStorage {
  #__SwiftNativeNSArray.init!allocator: (__SwiftNativeNSArray.Type) -> () -> __SwiftNativeNSArray : @$ss28__ContiguousArrayStorageBaseCABycfC [inherited]	// __ContiguousArrayStorageBase.__allocating_init()
  #__ContiguousArrayStorageBase.init!allocator: (__ContiguousArrayStorageBase.Type) -> (()) -> __ContiguousArrayStorageBase : @$ss23_ContiguousArrayStorageC16_doNotCallMeBaseAByxGyt_tcfC [override]	// _ContiguousArrayStorage.__allocating_init(_doNotCallMeBase:)
  #__ContiguousArrayStorageBase.canStoreElements: (__ContiguousArrayStorageBase) -> (Any.Type) -> Bool : @$ss23_ContiguousArrayStorageC16canStoreElements13ofDynamicTypeSbypXp_tF [override]	// _ContiguousArrayStorage.canStoreElements(ofDynamicType:)
  #__ContiguousArrayStorageBase.staticElementType!getter: (__ContiguousArrayStorageBase) -> () -> Any.Type : @$ss23_ContiguousArrayStorageC17staticElementTypeypXpvg [override]	// _ContiguousArrayStorage.staticElementType.getter
  #_ContiguousArrayStorage.deinit!deallocator: @$ss23_ContiguousArrayStorageCfD	// _ContiguousArrayStorage.__deallocating_deinit
}

sil_vtable __ContiguousArrayStorageBase {
  #__SwiftNativeNSArray.init!allocator: (__SwiftNativeNSArray.Type) -> () -> __SwiftNativeNSArray : @$ss28__ContiguousArrayStorageBaseCABycfC [override]	// __ContiguousArrayStorageBase.__allocating_init()
  #__ContiguousArrayStorageBase.init!allocator: (__ContiguousArrayStorageBase.Type) -> (()) -> __ContiguousArrayStorageBase : @$ss28__ContiguousArrayStorageBaseC012_doNotCallMeD0AByt_tcfC	// __ContiguousArrayStorageBase.__allocating_init(_doNotCallMeBase:)
  #__ContiguousArrayStorageBase.canStoreElements: (__ContiguousArrayStorageBase) -> (Any.Type) -> Bool : @$ss28__ContiguousArrayStorageBaseC16canStoreElements13ofDynamicTypeSbypXp_tF	// __ContiguousArrayStorageBase.canStoreElements(ofDynamicType:)
  #__ContiguousArrayStorageBase.staticElementType!getter: (__ContiguousArrayStorageBase) -> () -> Any.Type : @$ss28__ContiguousArrayStorageBaseC17staticElementTypeypXpvg	// __ContiguousArrayStorageBase.staticElementType.getter
  #__ContiguousArrayStorageBase.deinit!deallocator: @$ss28__ContiguousArrayStorageBaseCfD	// __ContiguousArrayStorageBase.__deallocating_deinit
}

sil_witness_table AudioObjectPropertyAddress: CustomStringConvertible module AudioExplorer {
  method #CustomStringConvertible.description!getter: <Self where Self : CustomStringConvertible> (Self) -> () -> String : @$sSo26AudioObjectPropertyAddressVs23CustomStringConvertible0A8ExplorersACP11descriptionSSvgTW	// protocol witness for CustomStringConvertible.description.getter in conformance AudioObjectPropertyAddress
}

sil_property #AudioObjectPropertyAddress.description ()
sil_property #PropertyProviderFunctions.hasCheck ()
sil_property #PropertyProviderFunctions.dataSize ()
sil_property #PropertyProviderFunctions.getData ()
sil_property #PropertyProviderFunctions.isSettable ()
sil_property #PropertyProviderFunctions.setData ()
sil_property #PropertyProviderFunctions.noErrorValue ()
sil_property #DeviceProperty.id<τ_0_0, τ_0_1> ()
sil_property #DeviceProperty.wrappedValue<τ_0_0, τ_0_1> ()
sil_property #MutableDeviceProperty.id<τ_0_0, τ_0_1> ()
sil_property #MutableDeviceProperty.wrappedValue<τ_0_0, τ_0_1> (settable_property $Optional<τ_0_1>,  id @$s13AudioExplorer21MutableDevicePropertyV12wrappedValueq_Sgvg : $@convention(method) <τ_0_0, τ_0_1> (@in_guaranteed MutableDeviceProperty<τ_0_0, τ_0_1>) -> @out Optional<τ_0_1>, getter @$s13AudioExplorer21MutableDevicePropertyV12wrappedValueq_Sgvpr0_lACyxq_GTK : $@convention(thin) <τ_0_0, τ_0_1> (@in_guaranteed MutableDeviceProperty<τ_0_0, τ_0_1>) -> @out Optional<τ_0_1>, setter @$s13AudioExplorer21MutableDevicePropertyV12wrappedValueq_Sgvpr0_lACyxq_GTk : $@convention(thin) <τ_0_0, τ_0_1> (@in_guaranteed Optional<τ_0_1>, @inout MutableDeviceProperty<τ_0_0, τ_0_1>) -> ())


// Mappings from '#fileID' to '#filePath':
//   'AudioExplorer/ContentView.swift' => '/Users/amonshiz/Documents/Development/AudioExplorer/AudioExplorer/ContentView.swift'
//   'AudioExplorer/AudioDevicePropertyWrapper.swift' => '/Users/amonshiz/Documents/Development/AudioExplorer/AudioExplorer/AudioDevice/AudioDevicePropertyWrapper.swift'
//   'AudioExplorer/DevicePicker.swift' => '/Users/amonshiz/Documents/Development/AudioExplorer/AudioExplorer/Views/DevicePicker.swift'
//   'AudioExplorer/AudioDevicePropertyDescription.swift' => '/Users/amonshiz/Documents/Development/AudioExplorer/AudioExplorer/AudioDevice/AudioDevicePropertyDescription.swift'
//   'AudioExplorer/AudioDeviceManager.swift' => '/Users/amonshiz/Documents/Development/AudioExplorer/AudioExplorer/AudioDevice/AudioDeviceManager.swift'
//   'AudioExplorer/BasicRoutingView.swift' => '/Users/amonshiz/Documents/Development/AudioExplorer/AudioExplorer/Views/BasicRoutingView.swift'
//   'AudioExplorer/AudioDevice.swift' => '/Users/amonshiz/Documents/Development/AudioExplorer/AudioExplorer/AudioDevice/AudioDevice.swift'
//   'AudioExplorer/AudioExplorerApp.swift' => '/Users/amonshiz/Documents/Development/AudioExplorer/AudioExplorer/AudioExplorerApp.swift'


