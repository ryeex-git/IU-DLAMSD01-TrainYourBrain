import Foundation

final class QuizDataService {
    func loadQuestions() -> [QuizQuestion] {
        guard let url = Bundle.main.url(forResource: "questions", withExtension: "json") else {
            print("Fehler: questions.json wurde nicht gefunden.")
            return []
        }

        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode([QuizQuestion].self, from: data)
        } catch {
            print("Fehler beim Laden der Fragen: \(error)")
            return []
        }
    }
}
