//
//  PlenyInterviewTaskTests.swift
//  PlenyInterviewTaskTests
//
//  Created by Ammar.M on 17/09/2023.
//

import XCTest

@testable import PlenyInterviewTask


class PlenyInterviewTaskTests: XCTestCase {
    
    var loginViewModel: LoginViewModel!
    
    override func setUp() {
        let environment = AppEnvironment.bootstrap()
        loginViewModel = LoginViewModel(service: environment.container.services.loginService)
    }
    
    func testEmptyLoginForm() {
        XCTAssertEqual(loginViewModel.userName, "")
        XCTAssertEqual(loginViewModel.password, "")
        XCTAssertFalse(loginViewModel.validateForm())
    }
}
