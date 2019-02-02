//
//  Error.swift
//  week4
//
//  Created by 蔡佳宣 on 2019/2/2.
//  Copyright © 2019年 蔡佳宣. All rights reserved.
//

import Foundation

enum StationError: Error {
    case requestFailed
    case responseUnsuccessful(statusCode: Int)
    case invalidData
    case jsonParsingFailure
    case invalidUrl
}
