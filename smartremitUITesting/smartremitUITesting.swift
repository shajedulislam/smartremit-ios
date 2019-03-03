//
//  smartremitUITesting.swift
//  smartremitUITesting
//
//  Created by Shajedul Islam on 3/3/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import XCTest

class smartremitUITesting: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func testLoginSucess()
    {
        let validUsername = "shajedul"
        let validPassword = "1234"
        
        
        
        let app = XCUIApplication()
        
        
        app.buttons["Get Started"].tap()
        
        let usernameTextField = app.textFields["Username"]
        XCTAssertTrue(usernameTextField.exists)
        usernameTextField.tap()
        usernameTextField.typeText(validUsername)
        
        let passwordTextField = app.secureTextFields["Password"]
        XCTAssertTrue(passwordTextField.exists)
        passwordTextField.tap()
        passwordTextField.typeText(validPassword)
    
        app.buttons["Log in"].tap()
        app.buttons["Resend Code"].tap() 
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    

}
