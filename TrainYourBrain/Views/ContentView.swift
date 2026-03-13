import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = QuizViewModel()

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.questions.isEmpty {
                    ProgressView("Fragen werden geladen...")
                } else if !viewModel.hasStarted {
                    StartView {
                        viewModel.startQuiz()
                    }
                } else if viewModel.quizFinished {
                    ResultView(viewModel: viewModel)
                } else {
                    QuizView(viewModel: viewModel)
                }
            }
            .navigationTitle("Train your Brain")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
