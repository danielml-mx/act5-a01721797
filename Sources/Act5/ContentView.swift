import SwiftUI

struct ContentView: View {

    @State var claseVM = ClaseViewModel()

    var body: some View {
        NavigationStack {

            if claseVM.isLoading {
                ProgressView("Cargando...")
            }

            else if let error = claseVM.errorMessage {
                VStack(spacing: 16) {
                    Image(systemName: "wifi.slash")
                        .font(.largeTitle)

                    Text(error)
                        .multilineTextAlignment(.center)
                        .padding()

                    Button("Reintentar") {
                        Task {
                            await claseVM.getClase()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
            }

            else {
                List(claseVM.arrClases) { clase in
                    NavigationLink {
                        ClaseDetailedView(clase: clase)
                    } label: {
                        ClaseRowView(clase: clase)
                    }
                }
                .navigationTitle("Mis clases")
            }
        }
        .task {
            await claseVM.getClase()
        }
    }
}
