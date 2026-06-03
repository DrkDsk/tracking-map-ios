//
//  ContentView.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 29/05/26.
//

import SwiftUI

struct UnitView: View {
    
    @StateObject private var viewModel : UnitViewModel
    
    init(viewModel: UnitViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            await viewModel.loadUnits()
        }
    }
}

#Preview {
    //UnitView()
}
