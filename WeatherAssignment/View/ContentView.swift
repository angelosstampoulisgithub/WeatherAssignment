//
//  ContentView.swift
//  WeatherAssignment
//
//  Created by Angelos Staboulis on 17/12/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel:ViewModel
    @FocusState private var isFocused: Bool
    @State private var showSplashScreen = true
    var body: some View {
        VStack {
            if showSplashScreen{
                LaunchScreenView()
                                 .transition(.opacity)
            }else{
                SearchBar(viewModel: viewModel)
                ZStack {
                    Searching(viewModel: _viewModel)
                }
            }
        }
        .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation(.easeInOut(duration: 1)) {
                        showSplashScreen = false
                    }
                }
        })
        .padding(.horizontal, 20)
        .padding(.top, 20)
        .onChange(of: isFocused, { oldValue, newValue in
            if newValue {
                viewModel.isSearching = true
            }
        })
        .task {
                await viewModel.loadCurrentWeather()
        }
        Spacer()
    }
}

