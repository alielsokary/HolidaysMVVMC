//
//  URLRequestBuilder.swift
//  HolidaysMVVM-C
//
//  Created by Ali Elsokary on 02/05/2021.
//  
//

import Foundation
import Alamofire

protocol URLRequestBuilder: URLRequestConvertible {

	var mainURL: URL { get }
	var requestURL: URL { get }
	// MARK: - Path
	var path: ServerPaths { get }

	var headers: HTTPHeaders { get }
	// MARK: - Parameters
	var parameters: Parameters? { get }

	// MARK: - Methods
	var method: HTTPMethod { get }

	var encoding: ParameterEncoding { get }

	var urlRequest: URLRequest { get }

	var deviceId: String { get }
}

extension URLRequestBuilder {
	var mainURL: URL {
		#if DEBUG
			return URL(string: "https://holidayapi.com/v1/")!
		#else
			return URL(string: "https://holidayapi.com/v1/")!
		#endif
	}

	var requestURL: URL {
		return mainURL.appendingPathComponent(path.rawValue)
	}

	var headers: HTTPHeaders {
		let header = HTTPHeaders()
//			header["Authorization"] = "Bearer \(token)"
		return header
	}

	var defaultParams: Parameters {
		var param = Parameters()
		param["key"] = "668257df-4851-4b2c-82b8-f423a5a528d6"
		param["year"] = "2020"
		return param
	}

	var encoding: ParameterEncoding {
		switch method {
		case .get:
			return URLEncoding.default
		default:
			return JSONEncoding.default
		}
	}

	var urlRequest: URLRequest {
		var request = URLRequest(url: requestURL)
		request.httpMethod = method.rawValue
		headers.forEach { request.addValue($0.value, forHTTPHeaderField: $0.name) }
		return request
	}

	var deviceId: String {
		return UIDevice.current.identifierForVendor?.uuidString ?? ""
	}

	func asURLRequest() throws -> URLRequest {
		return try encoding.encode(urlRequest, with: parameters)
	}

}
