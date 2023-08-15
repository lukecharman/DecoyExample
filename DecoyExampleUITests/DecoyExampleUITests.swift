import Foundation
import XCTest
import Decoy
import DecoyXCUI

class DecoyExampleUITests: DecoyUITestCase {
  override func setUp() {
    super.setUpDecoy()
  }

  func test_singleResponse_stubbed() {
    loadWordButton.tap()
    XCTAssert(stubbedResponse.waitForExistence(timeout: 1))
  }

  func test_singleResponse_withoutStub() {
    loadWordButton.tap()
    XCTAssert(stubbedResponse.waitForNonExistence(timeout: 1))
  }

  func test_twoStubbedResponsesToTheSameEndpoint() {
    loadWordButton.tap()
    XCTAssert(firstStubbedResponse.waitForExistence(timeout: 1))

    loadWordButton.tap()
    XCTAssert(secondStubbedResponse.waitForExistence(timeout: 1))
  }

  func test_twoStubbedResponsesToTwoDifferentEndpoints() {
    loadWordButton.tap()
    XCTAssert(firstStubbedResponse.waitForNonExistence(timeout: 1))

    loadLanguageButton.tap()
    XCTAssert(languageCountStub.waitForExistence(timeout: 1))
  }
}

private extension DecoyExampleUITests {
  var loadWordButton: XCUIElement {
    app.buttons["Load Random Word"]
  }

  var loadLanguageButton: XCUIElement {
    app.buttons["Load Language Count"]
  }

  var stubbedResponse: XCUIElement {
    app.staticTexts["STUBBED"]
  }

  var firstStubbedResponse: XCUIElement {
    app.staticTexts["STUBBED 1"]
  }

  var secondStubbedResponse: XCUIElement {
    app.staticTexts["STUBBED 2"]
  }

  var languageCountStub: XCUIElement {
    app.staticTexts["4"]
  }
}

private extension XCUIElement {
  func waitForNonExistence(timeout: TimeInterval) -> Bool {
    let timeStart = Date().timeIntervalSince1970

    while (Date().timeIntervalSince1970 <= (timeStart + timeout)) {
      if !exists {
        return true
      }
    }

    return false
  }
}
