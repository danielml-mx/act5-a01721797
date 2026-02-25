import Foundation

@MainActor
@Observable
class ClaseViewModel {

    var arrClases = [Clase]()
    var errorMessage: String?
    var isLoading = false

    func getClase() async {

        isLoading = true
        errorMessage = nil

        guard let url = URL(string: "https://danielml.mx/clases.json") else {
            errorMessage = "Invalid server URL."
            isLoading = false
            return
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse else {
                errorMessage = "Invalid server response."
                isLoading = false
                return
            }

            guard httpResponse.statusCode == 200 else {
                errorMessage = "Server error (\(httpResponse.statusCode)). Please try again."
                isLoading = false
                return
            }

            let results = try JSONDecoder().decode([Clase].self, from: data)
            self.arrClases = results

        } catch {
            errorMessage = "No connection. Please try again."
        }

        isLoading = false
    }
}
