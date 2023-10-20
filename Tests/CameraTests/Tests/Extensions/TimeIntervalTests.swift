//
//  TimeIntervalTests.swift
//  CameraPackage
//
//  Created by Pat Murphy on 10/20/23.
//  The MIT License (MIT)
//
import XCTest
@testable import CameraPackage

final class TimeIntervalTests: XCTestCase {
    let testLocale: Locale = Locale(identifier: "en_US")

    func testReadableFewSeconds() throws {
        let interval = TimeInterval(seconds: 3)
        let readable = interval.formatted(locale: testLocale)

        XCTAssertNotNil(readable)
        XCTAssertEqual(readable, "3s")
    }

    func testReadableHalfMinute() throws {
        let interval = TimeInterval(seconds: 30)
        let readable = interval.formatted(locale: testLocale)

        XCTAssertNotNil(readable)
        XCTAssertEqual(readable, "30s")
    }

    func testReadableFewMinutes() throws {
        let interval = TimeInterval(minutes: 8, seconds: 44)
        let readable = interval.formatted(locale: testLocale)

        XCTAssertNotNil(readable)
        XCTAssertEqual(readable, "8m 44s")
    }

    func testReadableFewHoursRoundHalfMinuteWithoutOneToDown() throws {
        let interval = TimeInterval(hours: 3, minutes: 44, seconds: 29)
        let readable = interval.formatted(locale: testLocale)

        XCTAssertNotNil(readable)
        XCTAssertEqual(readable, "3h 44m")
    }

    func testReadableFewHoursRoundHalfMinuteToUp() throws {
        let interval = TimeInterval(hours: 3, minutes: 44, seconds: 30)
        let readable = interval.formatted(locale: testLocale)

        XCTAssertNotNil(readable)
        XCTAssertEqual(readable, "3h 45m")
    }
}
