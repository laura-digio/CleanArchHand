//
//  NetworkClient.swift
//  Created by Laura on 1/3/21.
//

import Foundation
import Alamofire

struct NetworkClient {
    let session: Session

    init() {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 20
        configuration.requestCachePolicy = .useProtocolCachePolicy
        #if DEBUG
        session = Session(configuration: configuration, eventMonitors: [AlamofireLogger()])
        #else
        session = Session(configuration: configuration)
        #endif
    }

    enum Endpoint: String {
        case index = "https://raw.githubusercontent.com/laura-digio/CleanArch/master/API/REST/index.json"
    }

    func endpoint(
        method: HTTPMethod,
        endpoint: Endpoint,
        callback: @escaping (DataResponse<Index, AFError>) -> Void
    ) {
        let request = session.request(endpoint.rawValue, method: method)
        request.responseDecodable(of: Index.self, completionHandler: callback)
    }
}

final class AlamofireLogger: EventMonitor {
    func requestDidResume(_ request: Request) {
        let body = request.request.flatMap { $0.httpBody.map { String(decoding: $0, as: UTF8.self) } } ?? "None"
        let message = """
        ⚡️ Request Started: \(request)
        ⚡️ Body Data: \(body)
        """
        NSLog(message)
    }

    func request<Value>(_ request: DataRequest, didParseResponse response: AFDataResponse<Value>) {
        NSLog("⚡️ Response Received: \(response.debugDescription)")
    }
}
