import SwiftUI

struct StartView: View {
    let onStart: () -> Void

    var body: some View {
        VStack(spacing: 32) {
            Spacer()

            VStack(spacing: 16) {
                Image(systemName: "graduationcap.circle.fill")
                    .font(.system(size: 72))
                    .foregroundStyle(.blue)

                Text("Train your Brain")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Teste dein Allgemeinwissen mit einem kurzen Quiz und überprüfe, wie viele Fragen du richtig beantworten kannst.")
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }

            Button(action: onStart) {
                Text("Quiz starten")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .buttonStyle(.borderedProminent)
            .padding(.horizontal)

            Spacer()

            Text("Allgemeinwissen-Quiz")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}
