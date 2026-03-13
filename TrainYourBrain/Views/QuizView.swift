import SwiftUI

struct QuizView: View {
    @ObservedObject var viewModel: QuizViewModel

    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 8) {
                Text(viewModel.progressText)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                ProgressView(
                    value: Double(viewModel.currentQuestionIndex + 1),
                    total: Double(viewModel.questions.count)
                )
            }

            VStack(alignment: .leading, spacing: 16) {
                Text(viewModel.currentQuestion.question)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)

                ForEach(Array(viewModel.currentQuestion.answers.enumerated()), id: \.offset) { index, answer in
                    AnswerButtonView(
                        title: answer,
                        state: viewModel.answerState(for: index),
                        isDisabled: viewModel.selectedAnswerIndex != nil
                    ) {
                        viewModel.selectAnswer(index)
                    }
                }
            }

            if viewModel.showAnswerFeedback {
                Text(feedbackText)
                    .font(.headline)
                    .foregroundStyle(feedbackColor)

                Button("Nächste Frage") {
                    viewModel.nextQuestion()
                }
                .buttonStyle(.borderedProminent)
            }

            Spacer()

            Text("Punktestand: \(viewModel.score)")
                .font(.headline)
        }
        .padding()
    }

    private var feedbackText: String {
        guard let selected = viewModel.selectedAnswerIndex else { return "" }
        return selected == viewModel.currentQuestion.correctAnswerIndex ? "Richtig!" : "Leider falsch!"
    }

    private var feedbackColor: Color {
        guard let selected = viewModel.selectedAnswerIndex else { return .primary }
        return selected == viewModel.currentQuestion.correctAnswerIndex ? .green : .red
    }
}
