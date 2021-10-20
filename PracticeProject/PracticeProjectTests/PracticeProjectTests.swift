//
//  PracticeProjectTests.swift
//  PracticeProjectTests
//
//  Created by Sagar Tilekar on 20/10/21.
//

import XCTest
@testable import PracticeProject

class APITests: XCTestCase {

    // Test for Network connectivity
    func test_fetchUsers_deliversConnectivityErrorOnNetworkError() {
        let session = URLSessionSpy()
        let sut = ServiceManager(session: session)

        var fetchError: FetchError?
        sut.fetchUsers(excludingUserWithID: .none, success: { _ in }, failure: { fetchError = $0 })
        
        session.completeWithNetworkError()
        
        XCTAssertEqual(fetchError, .connectivity)
    }
    
    // Test for Task is resume or not
    func test_fetchUsers_DoesnotCompleteWhenResumeIsNotCalled() {
        let session = URLSessionSpy()
        let dataTask = MockURLSessionDataTask()
        session.dataTask = dataTask
        let sut = ServiceManager(session: session)

        sut.fetchUsers(excludingUserWithID: .none, success: { _ in }, failure: { _ in })
        
        XCTAssertTrue(dataTask.isResumeCalled)
    }
    
    // Test for invalid JSON
    func test_fetchUsers_deliversInvalidErrorOnInvalidJSON() {
        let session = URLSessionSpy()
        let sut = ServiceManager(session: session)

        var fetchError: FetchError?
        sut.fetchUsers(excludingUserWithID: .none, success: { _ in }, failure: { fetchError = $0 })
        let invalidData = Data("invalidData".utf8)
        session.completeWithData(invalidData)
        
        XCTAssertEqual(fetchError, .invalidData)
    }
}

private class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    private(set) var isResumeCalled = false
    
    func resume() {
        isResumeCalled = true
    }
}

private class URLSessionSpy: URLSessionProtocol {
    var dataTask = MockURLSessionDataTask()
    var url: URL?
    var completion: ((Data?, URLResponse?, Error?) -> Void)?
    
    func data(with url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        self.url = url
        self.completion = completion
        return dataTask
    }
    
    func completeWithNetworkError() {
        let error = URLError(.cannotConnectToHost)
        completion?(nil, nil, error)
    }
    
    func completeWithData(_ data: Data) {
        let response = URLResponse(url: URLs.getUsers, mimeType: nil, expectedContentLength: 0, textEncodingName: nil)
        completion?(data, response, nil)
    }
}
