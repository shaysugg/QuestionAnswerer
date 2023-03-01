import Foundation

public struct QuestionKit {
    public static func getQuestions(_ complition: @escaping (Result<[Question], GetError>) -> Void) {
        let baseURL = URL(string: "http://127.0.0.1:8090")!
        let questionsURL = URL(string: "/api/collections/questions/records", relativeTo: baseURL)!
        struct DTO: Decodable {
            let items: [Question]
        }
        
        URLSession.shared.dataTask(with: questionsURL) { data, response, error in
            if let error {
                complition(.failure(.serverError(error: error)))
                return
            }
            
            
            //TODO: Other response
            do {
                let dto = try JSONDecoder().decode(DTO.self, from: data!)
                complition(.success(dto.items.sorted { $0.number > $1.number }))
            } catch {
                complition(.failure(.decodingProblem(error: error)))
            }
            
        }.resume()
    }
    
    public enum GetError: Error {
        case unvalidResponse(res: Int)
        case decodingProblem(error: Error)
        case unvalidURL(url: String)
        case serverError(error: Error)
    }
}
