import Foundation

struct QuizQuestion: Identifiable, Codable {
    let id = UUID()
    let question: String
    let answers: [String]
    let correctAnswerIndex: Int

    enum CodingKeys: String, CodingKey {
        case question
        case answers
        case correctAnswerIndex
    }
}
