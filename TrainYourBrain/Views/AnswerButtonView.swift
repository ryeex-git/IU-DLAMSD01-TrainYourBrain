import SwiftUI

struct AnswerButtonView: View {
    let title: String
    let state: AnswerState
    let isDisabled: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .foregroundStyle(.primary)
                Spacer()
            }
            .padding()
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .disabled(isDisabled)
    }

    private var backgroundColor: Color {
        switch state {
        case .normal:
            return Color(.systemGray6)
        case .correct:
            return Color.green.opacity(0.25)
        case .wrong:
            return Color.red.opacity(0.25)
        }
    }
}
