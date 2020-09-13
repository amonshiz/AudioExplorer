//
//  AudioDevicePropertyWrapperTests.swift
//  AudioExplorerTests
//
//  Created by Andrew Monshizadeh on 9/12/20.
//

import XCTest
@testable import AudioExplorer

class AudioDevicePropertyWrapperTests: XCTestCase {
  func testCallsHasFunction() throws {
    let hasExpectation = XCTestExpectation(description: "hasCheck must be called")
    hasExpectation.expectedFulfillmentCount = 1

    var expectedString = "Test" as CFString
    let mockFunctions = PropertyProviderFunctions(hasCheck: { (id, address) -> Bool in
      hasExpectation.fulfill()
      return true
    }, dataSize: { (id, address, qualifierDataSize, qualifierData, dataSize) -> OSStatus in
      0
    }, getData: { (id, address, qualifierDataSize, qualifierData, dataSize, data) -> OSStatus in
      data.initializeMemory(as: CFString.self, from: &expectedString, count: 1)
      return 0
    }, noErrorValue: 0)

    let prop: DeviceProperty<CFString, Int> = DeviceProperty(.name, providers: mockFunctions)
    _ = prop.wrappedValue

    wait(for: [hasExpectation], timeout: 2)
  }

  func testCallsHasFunction_FalseReturn() throws {
    let hasExpectation = XCTestExpectation(description: "hasCheck must be called")
    hasExpectation.expectedFulfillmentCount = 1

    let mockFunctions = PropertyProviderFunctions(hasCheck: { (id, address) -> Bool in
      hasExpectation.fulfill()
      return false
    }, dataSize: { (id, address, qualifierDataSize, qualifierData, dataSize) -> OSStatus in
      0
    }, getData: { (id, address, qualifierDataSize, qualifierData, dataSize, data) -> OSStatus in
      0
    }, noErrorValue: 0)

    let prop: DeviceProperty<CFString, Int> = DeviceProperty(.name, providers: mockFunctions)

    XCTAssertNil(prop.wrappedValue)
    wait(for: [hasExpectation], timeout: 2)
  }

  func testCallsDataSizeFunction_EnforceOrder() throws {
    let hasExpectation = XCTestExpectation(description: "hasCheck must be called")
    hasExpectation.expectedFulfillmentCount = 1
    let dataSizeExpectation = XCTestExpectation(description: "dataSize must be called and after hasCheck")
    dataSizeExpectation.expectedFulfillmentCount = 1

    var expectedString = "Test" as CFString
    let mockFunctions = PropertyProviderFunctions(hasCheck: { (id, address) -> Bool in
      hasExpectation.fulfill()
      return true
    }, dataSize: { (id, address, qualifierDataSize, qualifierData, dataSize) -> OSStatus in
      dataSizeExpectation.fulfill()
      return 0
    }, getData: { (id, address, qualifierDataSize, qualifierData, dataSize, data) -> OSStatus in
      data.initializeMemory(as: CFString.self, from: &expectedString, count: 1)
      return 0
    }, noErrorValue: 0)

    let prop: DeviceProperty<CFString, Int> = DeviceProperty(.name, providers: mockFunctions)
    _ = prop.wrappedValue

    wait(for: [hasExpectation, dataSizeExpectation], timeout: 2, enforceOrder: true)
  }

  func testCallsDataSizeFunction_NonSuccessReturn() throws {
    let dataSizeExpectation = XCTestExpectation()
    dataSizeExpectation.expectedFulfillmentCount = 1

    var expectedString = "Test" as CFString
    let mockFunctions = PropertyProviderFunctions(hasCheck: { (id, address) -> Bool in
      true
    }, dataSize: { (id, address, qualifierDataSize, qualifierData, dataSize) -> OSStatus in
      dataSizeExpectation.fulfill()
      return 1
    }, getData: { (id, address, qualifierDataSize, qualifierData, dataSize, data) -> OSStatus in
      data.initializeMemory(as: CFString.self, from: &expectedString, count: 1)
      return 0
    }, noErrorValue: 0)

    let prop: DeviceProperty<CFString, Int> = DeviceProperty(.name, providers: mockFunctions)

    XCTAssertNil(prop.wrappedValue)
    wait(for: [dataSizeExpectation], timeout: 2)
  }

  func testCallsGetDataFunction_EnforceOrder() throws {
    let hasExpectation = XCTestExpectation(description: "hasCheck must be called")
    hasExpectation.expectedFulfillmentCount = 1
    let dataSizeExpectation = XCTestExpectation(description: "dataSize must be called and after hasCheck")
    dataSizeExpectation.expectedFulfillmentCount = 1
    let getDataExpectation = XCTestExpectation(description: "getData must be called and after dataSize")
    getDataExpectation.expectedFulfillmentCount = 1

    var expectedString = "Test" as CFString
    let mockFunctions = PropertyProviderFunctions(hasCheck: { (id, address) -> Bool in
      hasExpectation.fulfill()
      return true
    }, dataSize: { (id, address, qualifierDataSize, qualifierData, dataSize) -> OSStatus in
      dataSizeExpectation.fulfill()
      return 0
    }, getData: { (id, address, qualifierDataSize, qualifierData, dataSize, data) -> OSStatus in
      data.initializeMemory(as: CFString.self, from: &expectedString, count: 1)
      getDataExpectation.fulfill()
      return 0
    }, noErrorValue: 0)

    let prop: DeviceProperty<CFString, Int> = DeviceProperty(.name, providers: mockFunctions)
    _ = prop.wrappedValue

    wait(for: [hasExpectation, dataSizeExpectation, getDataExpectation], timeout: 2, enforceOrder: true)
  }

  func testCallsGetDataFunction_NonSuccessReturn() throws {
    let getDataExpectation = XCTestExpectation()
    getDataExpectation.expectedFulfillmentCount = 1

    var expectedString = "Test" as CFString
    let mockFunctions = PropertyProviderFunctions(hasCheck: { (id, address) -> Bool in
      true
    }, dataSize: { (id, address, qualifierDataSize, qualifierData, dataSize) -> OSStatus in
      0
    }, getData: { (id, address, qualifierDataSize, qualifierData, dataSize, data) -> OSStatus in
      data.initializeMemory(as: CFString.self, from: &expectedString, count: 1)
      getDataExpectation.fulfill()
      return 1
    }, noErrorValue: 0)

    let prop: DeviceProperty<CFString, Int> = DeviceProperty(.name, providers: mockFunctions)

    XCTAssertNil(prop.wrappedValue)
    wait(for: [getDataExpectation], timeout: 2, enforceOrder: true)
  }

  func testFullExecution() throws {
    let getDataExpectation = XCTestExpectation()
    getDataExpectation.expectedFulfillmentCount = 1

    let desc = AudioDevicePropertyDescription<Int>(
      selector: .init(0),
      scope: .init(0),
      element: .init(0))

    let mockFunctions = PropertyProviderFunctions(hasCheck: { (id, address) -> Bool in
      true
    }, dataSize: { (id, address, qualifierDataSize, qualifierData, dataSize) -> OSStatus in
      dataSize.initialize(repeating: 1, count: 1)
      return 0
    }, getData: { (id, address, qualifierDataSize, qualifierData, dataSize, data) -> OSStatus in
      XCTAssert(dataSize.pointee == MemoryLayout<Int>.size)
      data.initializeMemory(as: Int.self, repeating: 1, count: 1)
      getDataExpectation.fulfill()
      return 0
    }, noErrorValue: 0)

    let prop: DeviceProperty<Int, Int> = DeviceProperty(desc, providers: mockFunctions)
    let wrapped = try! XCTUnwrap(prop.wrappedValue)
    XCTAssertEqual(wrapped, 1)
    wait(for: [getDataExpectation], timeout: 2)
  }

}
