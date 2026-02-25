import SwiftUI

struct ClaseDetailedView: View {

    let clase : Clase

    var body: some View {
        ZStack(alignment: .top) {
            
            // Background color behind everything
            Color.black
                .ignoresSafeArea()
            
            ScrollView {

                VStack {

                    GeometryReader { geo in
                        let offset = geo.frame(in: .global).minY
                        
                            AsyncImage(url: URL(string: clase.image)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .clipped()
                                    .frame(
                                        width: geo.size.width,
                                        height: offset > 0 ? 420 + offset : 420,
                                        alignment: .top   // 🔥 KEY FIX
                                    )
                                    .clipped()
                                    .offset(y: offset > 0 ? -offset : 0)
                            } placeholder: {
                                ProgressView()
                            }
                    }
                    .frame(height: 420)

                    Text(clase.name)
                        .font(.title)
                        .bold()

                    Spacer()
                    Text(clase.clave)
                        .font(.headline)
                        .bold()

                    VStack {
                        Text(clase.description)
                        .padding(.top, 10)
                        .padding(.horizontal, 15)
                        .padding(.bottom, 20)
                    }
                }
            }
            .toolbarBackground(.ultraThinMaterial, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}
