//
//  QuestionProviderError.swift
//  QuestionAnswererSwiftUI
//
//  Created by Negar Tolou on 2/8/23.
//

import Foundation

enum QuestionProviderError: Error {
    case unvalidResponse(res: Int)
    case decodingProblem(error: Error)
    case unvalidURL(url: String)
    case serverError(error: Error)
}
