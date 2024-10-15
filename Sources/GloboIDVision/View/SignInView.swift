import SwiftUI

struct SignInView: View {

    @State private var respponse: String = "Clique aqui!"

    var body: some View {
        VStack {
            Text(respponse)
                .onTapGesture {
                    Task {
                        let result = try? await APIClient.shared.signIn(username: "glbteste.luizx@mailinator.com", password: "1234qwer")

                        await MainActor.run {
                            respponse = result?.accessToken ?? "asddsa"
                        }
                    }
                }
        }
    }
}

#Preview {
    SignInView()
}
