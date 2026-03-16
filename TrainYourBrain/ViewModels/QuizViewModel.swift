import Combine
import Foundation
import SwiftUI

enum AnswerState {
    case normal
    case correct
    case wrong
}

final class QuizViewModel: ObservableObject {
    @Published var hasStarted: Bool = false
    @Published var questions: [QuizQuestion] = []
    @Published var currentQuestionIndex: Int = 0
    @Published var score: Int = 0
    @Published var selectedAnswerIndex: Int? = nil
    @Published var showAnswerFeedback: Bool = false
    @Published var quizFinished: Bool = false

    private let dataService = QuizDataService()

    init() {
        questions = dataService.loadQuestions()
        questions.shuffle()
        questions = Array(questions.prefix(10))
    }

    var currentQuestion: QuizQuestion {
        questions[currentQuestionIndex]
    }

    var progressText: String {
        "Frage \(currentQuestionIndex + 1) von \(questions.count)"
    }

    func startQuiz(){
        hasStarted = true
    }
    
    func selectAnswer(_ index: Int) {
        guard selectedAnswerIndex == nil else { return }

        selectedAnswerIndex = index
        showAnswerFeedback = true

        if index == currentQuestion.correctAnswerIndex {
            score += 1
        }
    }

    func nextQuestion() {
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
            selectedAnswerIndex = nil
            showAnswerFeedback = false
        } else {
            quizFinished = true
        }
    }

    func restartQuiz() {
        currentQuestionIndex = 0
        score = 0
        selectedAnswerIndex = nil
        showAnswerFeedback = false
        quizFinished = false
        questions.shuffle()
    }

    func answerState(for index: Int) -> AnswerState {
        guard let selectedAnswerIndex else { return .normal }

        if index == currentQuestion.correctAnswerIndex {
            return .correct
        }

        if index == selectedAnswerIndex {
            return .wrong
        }

        return .normal
    }
}
