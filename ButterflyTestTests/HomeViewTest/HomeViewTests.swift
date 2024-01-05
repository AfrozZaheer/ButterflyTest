//
//  HomeViewTests.swift
//  ButterflyTestTests
//
//  Created by muhammad.afroz on 05/01/2024.
//

import XCTest
@testable import ButterflyTest

final class HomeViewTests: XCTestCase {

    var mockView: MockHomeViewController!
    var mockPresenter: MockHomePresenter!
    var mockIntrector: MockHomeIntreactor!
    var mockRouter: MockHomeRouter!
    
    override func setUp() {
        super.setUp()
        mockView = MockHomeViewController()
        mockIntrector = MockHomeIntreactor(apiManager: MockApiManager())
        mockRouter = MockHomeRouter()
        mockPresenter = MockHomePresenter(view: mockView, itreator: mockIntrector, router: mockRouter)
        
        mockView.presenter = mockPresenter
        mockIntrector.presenter = mockPresenter
        mockRouter.view = mockView
        
    }
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHomeViewPopulateTableView() throws {
        let view = HomeViewController()
        self.mockPresenter.view = view
        view.presenter = mockPresenter
        view.presenter?.getAllMovies(txt: "Avenger")
        
        let itemCount = view.tableView.numberOfRows(inSection: 0)
        XCTAssertTrue(itemCount > 0)
    }
    
    func testHomeViewShowError() throws {
        let view = HomeViewController()
        let api = MockApiManager()
        api.shouldFail = true
        
        let presenter = MockHomePresenter(view: view, itreator: MockHomeIntreactor(apiManager: api), router: MockHomeRouter())
        
        view.presenter = presenter
        view.presenter?.getAllMovies(txt: "Avenger")
        
        let itemCount = view.tableView.numberOfRows(inSection: 0)
        XCTAssertFalse(itemCount > 0)
    }
    
    func testHomePresenter() throws {
        let presenter = HomePresenter(view: mockView, itreator: mockIntrector, router: mockRouter)
        presenter.getAllMovies(txt: "asd")
        
        XCTAssertTrue(mockIntrector.functionCalled)
        
        presenter.moveToMovieDetail(movie: HomeMovieModel(movie: Movie(JSON: ["id": 1])!))
        XCTAssert(mockRouter.functionCalled)
        
        presenter.errorOccurecd(error: NSError(errorMessage: "error"))
        XCTAssert(mockView.showedError)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
