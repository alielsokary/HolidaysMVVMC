//
//  Client.swift
//  HolidaysMVVM-C
//
//  Created by Ali Elsokary on 02/05/2021.
//  
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa

class APIClient {
	@discardableResult
	 func request<T: Codable> (_ route: HolidaysRouter) -> Observable<T> {
		return Observable<T>.create { observer in
			let request = AF.request(route).responseDecodable { (response: AFDataResponse<T>) in
				switch response.result {
				case .success(let value):
					observer.onNext(value)
					observer.onCompleted()
				case .failure(let error):
					switch response.response?.statusCode {
					case 403:
						observer.onError(APIError.holiday_forbidden)
					case 404:
						observer.onError(APIError.holiday_notFound)
					case 409:
						observer.onError(APIError.holiday_conflict)
					case 500:
						observer.onError(APIError.holiday_internalServerError)
					default:
						guard NetworkReachabilityManager()?.isReachable ?? false else {
							observer.onError(APIError.holiday_noInternet)
							return
						}
						observer.onError(error)
					}
				}
			}

			return Disposables.create {
				request.cancel()
			}
		}
	}
}
