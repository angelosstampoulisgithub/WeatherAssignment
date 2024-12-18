//
//  SearchBar.swift
//  WeatherAssignment
//
//  Created by Angelos Staboulis on 18/12/24.
//

import SwiftUI

struct SearchBar: View {
    @State var viewModel:ViewModel
    @FocusState private var isFocused: Bool

    var body: some View {
        HStack {
            TextField("Search for a city", text: $viewModel.searchQuery)
                .submitLabel(.search)
                .padding(10)
                .background(Color.gray)
                .cornerRadius(10)
                .focused($isFocused)
                .onSubmit {
                    viewModel.isSearching = true
                    Task {
                        await viewModel.fetchCity()
                    }
                   
                }

            if viewModel.isSearching {
                Button("Cancel") {
                    viewModel.searchQuery = ""
                    viewModel.isSearching = false
                }
            }

            if !viewModel.isSearching {
                Spacer()
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
            }
        }
        .frame(height: 40)
    }
}

#Preview {
    SearchBar(viewModel: .init())
}
