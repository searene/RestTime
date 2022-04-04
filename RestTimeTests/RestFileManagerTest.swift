//
//  RestFileManagerTest.swift
//  RestTimeTests
//
//  Created by Joey Green on 2022/4/4.
//

import XCTest
@testable import RestTime

class RestFileManagerTest: XCTestCase {
    
    override func setUp() {
        deleteDataFile()
    }

    func testSaveAndGetRecords() {
        let record1 = RestRecord(startDate: "2020-12-30 10:00:00".toDate(),
                                 endDate: "2020-12-30 11:00:00".toDate())
        let record2 = RestRecord(startDate: "2020-12-30 15:00:00".toDate(),
                                 endDate: "2020-12-30 16:00:00".toDate())
        let records = [record1, record2]
        
        saveRestRecords(restRecords: records)
        let obtainedRecords = getRestRecords()
        
        XCTAssertEqual(records, obtainedRecords)
    }
    
    func testCanSaveMultipleTimes() {
        let record1 = RestRecord(startDate: "2020-12-30 10:00:00".toDate(),
                                 endDate: "2020-12-30 11:00:00".toDate())
        let record2 = RestRecord(startDate: "2020-12-30 15:00:00".toDate(),
                                 endDate: "2020-12-30 16:00:00".toDate())
        
        saveRestRecords(restRecords: [record1])
        saveRestRecords(restRecords: [record2])
        
        let obtainedRecords = getRestRecords()
        
        XCTAssertEqual([record2], obtainedRecords)
    }
    
    func testShouldGetEmptyArrayWhenNotSavedBefore() {
        let obtainedRecords = getRestRecords()
        
        XCTAssertEqual(obtainedRecords, [])
    }
    
}
