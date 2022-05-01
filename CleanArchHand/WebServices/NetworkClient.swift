//
//  NetworkClient.swift
//  Created by Laura on 1/3/21.
//

import Foundation
import Alamofire
import RealmSwift
import Network

struct NetworkClient {
    let session: Session

    let monitor = NWPathMonitor()
    let queue = DispatchQueue.global(qos: .background)

    init() {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 20
        configuration.requestCachePolicy = .useProtocolCachePolicy

        #if DEBUG
        self.session = Session(
            configuration: configuration,
            eventMonitors: [AlamofireLogger()]
        )
        #else
        self.session = Session(
            configuration: configuration
        )
        #endif

        self.monitorConnection()
    }

    enum Endpoint: String {
        case index = "https://raw.githubusercontent.com/laura-digio/CleanArch/master/API/REST/index.json"
    }

    func endpoint<T>(
        method: HTTPMethod,
        endpoint: Endpoint,
        callback: @escaping (DataResponse<T, AFError>) -> Void
    ) where T:Decodable {
        let request = session.request(endpoint.rawValue, method: method)
        request.responseDecodable(of: T.self, completionHandler: callback)
    }

    func requestMarkdown(
        _ link: String?,
        callback: @escaping (DataResponse<String, AFError>) -> Void
    ) {
        let request = session.request(link ?? "")
        request.responseString(completionHandler: callback)
    }
}

extension NetworkClient {
    func monitorConnection() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                NotificationCenter.default.post(
                    name: Notification.Name.monitorConnection,
                    object: nil,
                    userInfo: [AppConstants.monitorConnectionKey: path.status]
                )
            }
        }
        monitor.start(queue: queue)
    }
}

struct AlamofireLogger: EventMonitor {
    let verbose: Bool = false

    func requestDidResume(_ request: Request) {
        if verbose {
            let body = request.request.flatMap { $0.httpBody.map { String(decoding: $0, as: UTF8.self) } } ?? "None"
            let message = """
            ⚡️ Request Started: \(request)
            ⚡️ Body Data: \(body)
            """
            NSLog(message)
        }
        else {
            NSLog("⚡️ Requesting... [\(request.request?.httpMethod ?? "")] \(request.request?.url?.absoluteString ?? "")")
        }
    }

    func request<Value>(_ request: DataRequest, didParseResponse response: AFDataResponse<Value>) {
        if verbose {
            NSLog("⚡️ Response Received: \(response.debugDescription)")
        }
        else {
            NSLog("⚡️ Response! [HTTP \(response.response?.statusCode ?? 0)] \(request.request?.url?.absoluteString ?? "")")
        }
    }
}
