import XCTest

class WeatherAppUITests: XCTestCase {
    
//    func testLogin() throws {
//        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launch()
//        app.textFields["Email"].tap()
//        let emailTextField = app.textFields["Email"]
//        emailTextField.typeText("123456@mail.ru")
//
//        let passwordSecureTextField = app.secureTextFields["Password"]
//        passwordSecureTextField.tap()
//        passwordSecureTextField.typeText("123456")
//        app/*@START_MENU_TOKEN@*/.staticTexts["Login"]/*[[".buttons[\"Login\"].staticTexts[\"Login\"]",".staticTexts[\"Login\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//    }

    func testAddFavouriteWeather() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        app.navigationBars["WeatherApp.MainTemperature"].buttons["Item"].tap()
        app.alerts["Сохранение погоды"].scrollViews.otherElements.buttons["Сохранить"].tap()
    }
    
    func testChooseCity() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let searchButton = app.navigationBars["WeatherApp.MainTemperature"].buttons["Search"]
        searchButton.tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Moscow Oblast"]/*[[".cells.staticTexts[\"Moscow Oblast\"]",".staticTexts[\"Moscow Oblast\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        searchButton.tap()
        tablesQuery.children(matching: .cell).element(boundBy: 2).staticTexts["Saint Petersburg"].tap()
        searchButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Leningradskaya Oblast’"]/*[[".cells.staticTexts[\"Leningradskaya Oblast’\"]",".staticTexts[\"Leningradskaya Oblast’\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func testFindCity() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        app.navigationBars["WeatherApp.MainTemperature"].buttons["Search"].tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Moscow"]/*[[".cells.staticTexts[\"Moscow\"]",".staticTexts[\"Moscow\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeDown()
        app.navigationBars["WeatherApp.CitiesView"].searchFields["Select a city"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Ukraine"]/*[[".cells.staticTexts[\"Ukraine\"]",".staticTexts[\"Ukraine\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func testDeleteFavouriteCity() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        app.navigationBars["WeatherApp.MainTemperature"].buttons["Item"].tap()
        app.alerts["Сохранение погоды"].scrollViews.otherElements.buttons["Сохранить"].tap()
        
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["Favourite"].tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["-4.2℃"]/*[[".cells.staticTexts[\"-4.2℃\"]",".staticTexts[\"-4.2℃\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Delete"]/*[[".cells.buttons[\"Delete\"]",".buttons[\"Delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tabBar.buttons["Weather"].tap()
    }
}
