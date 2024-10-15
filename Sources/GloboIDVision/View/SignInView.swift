import SwiftUI

struct SignInView: View {

    @State private var respponse: String = "Clique aqui!"

    var body: some View {
        VStack {
            Text(respponse)
        }
    }
}

#Preview {
    SignInView()
}
