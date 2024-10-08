//
//  CoffeeShopAppUIE2ETests.swift
//  CoffeeShopAppUIE2ETests
//
//  Created by Ricky Primayuda Putra on 07/10/24.
//

import XCTest

final class when_deleting_an_order: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp()  {
        app = XCUIApplication()
        continueAfterFailure = false
        app.launchEnvironment = ["ENV" : "TEST"]
        app.launch()
        
        app.buttons["addNewOrderButton"].tap()
        
        let nameTextField = app.textFields["name"]
        let coffeeNameTextField = app.textFields["coffeeName"]
        let priceTextField = app.textFields["price"]
        let placeOrderButton = app.buttons["placeOrderButton"]
        
        nameTextField.tap()
        nameTextField.typeText("Ricky")
        
        coffeeNameTextField.tap()
        coffeeNameTextField.typeText("Kopi Susu Disaat")
        
        priceTextField.tap()
        priceTextField.typeText("4.50")
        
        placeOrderButton.tap()
    }
    
    func test_should_delete_order_successfully() throws {
        let collectionViewQuery = XCUIApplication().collectionViews
        let cellsQuery = collectionViewQuery.cells
        let element = cellsQuery.children(matching: .other).element(boundBy: 1).children(matching: .other).element
        element.swipeLeft()
        collectionViewQuery.buttons["Delete"].tap()
        
        let orderList = app.collectionViews["orderList"]
        XCTAssertEqual(0, orderList.cells.count)
    }
    
//    override func tearDown() {
//        Task{
//            guard let url = URL(string: "/test/clear-orders", relativeTo: URL(string: "https://island-bramble.glitch.me")) else {
//                return
//            }
//            let (_, _) = try await URLSession.shared.data(from: url)
//        }
//    }
    
}

final class when_adding_a_new_coffee_order: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp()  {
        app = XCUIApplication()
        continueAfterFailure = false
        app.launchEnvironment = ["ENV" : "TEST"]
        app.launch()
        
        app.buttons["addNewOrderButton"].tap()
        
        let nameTextField = app.textFields["name"]
        let coffeeNameTextField = app.textFields["coffeeName"]
        let priceTextField = app.textFields["price"]
        let placeOrderButton = app.buttons["placeOrderButton"]
        
        nameTextField.tap()
        nameTextField.typeText("Ricky")
        
        coffeeNameTextField.tap()
        coffeeNameTextField.typeText("Kopi Susu Disaat")
        
        priceTextField.tap()
        priceTextField.typeText("4.50")
        
        placeOrderButton.tap()
    }
    
    func test_should_display_coffee_order_in_list_successfully() throws {
        XCTAssertEqual("Ricky", app.staticTexts["orderNameText"].label)
        XCTAssertEqual("Kopi Susu Disaat (Medium)", app.staticTexts["coffeeNameAndSizeText"].label)
        XCTAssertEqual("$4.50", app.staticTexts["coffeePriceText"].label)
    }
    
}

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
