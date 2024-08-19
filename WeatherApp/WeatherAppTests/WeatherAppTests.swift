//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Manish Gupta on 8/9/24.
//

import XCTest
import SwiftUI
@testable import WeatherApp


@MainActor
final class WeatherAppTests: XCTestCase {
    
    var wvm = WeatherViewModel()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    @MainActor func test_prompts_for_location() {
        let manager = wvm.clLocationManager
        
        XCTAssertNotNil(manager.authorizationStatus)
        XCTAssertNotNil(manager.authorizationStatus)
    }
    
    func testCurrentLocation() {
		Task {
			let locationManager = wvm.clLocationManager
			let lat = locationManager.location?.coordinate.latitude
			let lon = locationManager.location?.coordinate.longitude

			XCTAssertNotNil(lat)
			XCTAssertNotNil(lon)
		}
    }
    
    func testForGeneratingURLRequest() {
        let lat = wvm.clLocationManager.location?.coordinate.latitude
        let lon = wvm.clLocationManager.location?.coordinate.longitude
        wvm.fetchWeatherDetails(lat: lat ?? 0.0 , lon: lon ?? 0.0)
        let urlRequest = Fetch.defaultWeather
        print(urlRequest)
		let testURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?units=imperial&APPID=019ba229d67bcb745c7686df9fd2036e&q=Austin,us")
        XCTAssertNotNil(urlRequest)
		XCTAssertEqual(urlRequest, testURL)
    }
	

}
