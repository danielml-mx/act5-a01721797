import SwiftUI

struct ClaseRowView: View {

    let clase: Clase

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: clase.image)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 80, height: 80)
            .clipped()
            .cornerRadius(8)

            VStack(alignment: .leading) {
                Text(clase.name)
                    .font(.headline)
            }
        }
        .padding(.vertical, 4)
    }
}
