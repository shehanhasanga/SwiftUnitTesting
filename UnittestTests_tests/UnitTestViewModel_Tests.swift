//
//  UnitTestViewModel_Tests.swift
//  UnittestTests_tests
//
//  Created by shehan karunarathna on 2022-02-18.
//

import XCTest
@testable import Unittest

class UnitTestViewModel_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_UnitTestViewmodel_isPremium_shouldBeTrue(){
        // given
        let userIsPremium:Bool = true
        
        // when
        let vm = UnitTestViewModel(ispremium: userIsPremium)
        
        // Then
        XCTAssertTrue(vm.isPremium)
        
    }
    
    func test_UnitTestViewmodel_isPremium_shouldBeFalse(){
        // given
        let userIsPremium:Bool = false
        
        // when
        let vm = UnitTestViewModel(ispremium: userIsPremium)
        
        // Then
        XCTAssertFalse(vm.isPremium)
        
    }
    func test_UnitTestViewmodel_isPremium_shouldBeInjected(){
        // given
        let userIsPremium:Bool = Bool.random()
        
        // when
        let vm = UnitTestViewModel(ispremium: userIsPremium)
        
        // Then
        XCTAssertEqual(userIsPremium, vm.isPremium)
        
    }
    
    func test_UnitTestViewmodel_dataArray_shouldBeEmpty(){
        // given
        // when
        let vm = UnitTestViewModel(ispremium: Bool.random())
        
        // Then
        XCTAssertTrue(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, 0)
        
    }
    func test_UnitTestViewmodel_dataArray_shouldaddBlankItems(){
        // given
        let vm = UnitTestViewModel(ispremium: Bool.random())
        // when
        vm.addItem(item: "")
        
        // Then
        XCTAssertTrue(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, 0)
    }
    func test_UnitTestViewmodel_dataArray_shouldaddItems(){
        // given
        let vm = UnitTestViewModel(ispremium: Bool.random())
        // when
        let count  = 10
        for _ in 0..<count{
            vm.addItem(item: UUID().uuidString)
        }
       
        
        // Then
        XCTAssertTrue(!vm.dataArray.isEmpty)
        XCTAssertFalse(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, count)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
    }

    func test_UnitTestViewmodel_selected_shouldStartasNil(){
        // given
        let vm = UnitTestViewModel(ispremium: Bool.random())
        // when
        vm.addItem(item: "")
        
        // Then
        XCTAssertTrue(vm.selectedItem == nil)
        XCTAssertNil(vm.selectedItem)
    }
    
    func test_UnitTestViewmodel_selected_shouldBeNilwhenSelectingInvalidItem(){
        // given
        let vm = UnitTestViewModel(ispremium: Bool.random())
        // when
        vm.selectItem(item:  UUID().uuidString)
        
        // Then
        XCTAssertNil(vm.selectedItem)
    }
    
    func test_UnitTestViewmodel_selected_shouldBeSelected(){
        // given
        let vm = UnitTestViewModel(ispremium: Bool.random())
        // when
        let iitem = UUID().uuidString
        vm.addItem(item: iitem)
        vm.selectItem(item:  iitem)
        
        // Then
        XCTAssertNotNil(vm.selectedItem)
    }
    
    func test_UnitTestViewmodel_selected_shouldBeSelectedNodata(){
        // given
        let vm = UnitTestViewModel(ispremium: Bool.random())
        // when
        let iitem = UUID().uuidString
        vm.addItem(item: iitem)
        vm.selectItem(item:  iitem)
        
        // Then
        XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString))
        XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString), "Should throw irem not found ") { error in
            let error = error as? UnitTestViewModel.DataError
            XCTAssertEqual(error, UnitTestViewModel.DataError.itemNotFound)
            
        }
    }
}
