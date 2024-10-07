//
//  CoffeeShopAppUIE2ETests.swift
//  CoffeeShopAppUIE2ETests
//
//  Created by Ricky Primayuda Putra on 07/10/24.
//

import XCTest

final class when_app_is_launched_with_no_orders: XCTestCase {

    @MainActor
    func test_should_make_sure_no_orders_message_is_displayed() throws {
        
        let app = XCUIApplication()
        let continueAfterFailure = false
        app.launchEnvironment = ["ENV" : "TEST"]
        app.launch()
        
        XCTAssertEqual("No Orders Avalaible!", app.staticTexts["noOrdersText"].label)
        
    }
    
}
