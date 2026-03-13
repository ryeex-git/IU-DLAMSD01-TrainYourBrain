import SwiftUI

struct ResultView: View {
    @ObservedObject var viewModel: QuizViewModel

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            Text("Quiz beendet")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Du hast \(viewModel.score) von \(viewModel.questions.count) Punkten erreicht.")
                .font(.title3)
                .multilineTextAlignment(.center)

            Text(resultMessage)
                .font(.headline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)

            Button("Nochmal spielen") {
                viewModel.restartQuiz()
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .padding()
    }

    private var resultMessage: String {
        let ratio = Double(viewModel.score) / Double(viewModel.questions.count)

        switch ratio {
        case 0.8...:
            return "Starke Leistung – dein Allgemeinwissen ist top."
        case 0.5..<0.8:
            return "Gutes Ergebnis – mit etwas Übung geht noch mehr."
        default:
            return "Guter Start – versuch es nochmal und verbessere dich."
        }
    }
}
