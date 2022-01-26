//
//  ContentView.swift
//  MajorTom
//
//  Created by Uladzislau Volchyk on 26.01.22.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var viewModel = ContentViewModel()

    var body: some View {
        ZStack {
            Color(red: 40 / 255, green: 40 / 255, blue: 40 / 255)
                .ignoresSafeArea()
            Text(viewModel.title)
                .id(viewModel.title.hashValue)
                .foregroundColor(.white)
                .font(.system(size: 36, weight: .regular, design: .rounded))
                .transition(.opacity.animation(.easeInOut))
        }
        .onAppear(perform: viewModel.loadContent)
    }
}

extension ContentView {

    final class ContentViewModel: ObservableObject {
        @Published private(set) var title: String = ""

        func loadContent() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.title = "Hello, World! 🌍"
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
