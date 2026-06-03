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
    
    private let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                
                TextField("Buscar unidad", text: $viewModel.searchQuery)
                
                Image(systemName: "gearshape")
                    .imageScale(.large)
                    .foregroundStyle(.white)
                    
            }.frame(maxWidth: .infinity, alignment: .center)
            
            Spacer()
                .frame(height: 10)
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(viewModel.units) { unit in
                        UnitViewItem(unit: unit)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding()
        .background(Color.blue)
        .task {
            await viewModel.loadUnits()
        }
    }
}

#Preview {
    UnitView(viewModel: UnitViewModel(
        unitRepository: MockingUnitRepository()
    ))
}
