//
//  ContentView.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 29/05/26.
//

import SwiftUI

struct UnitView: View {
    
    @StateObject private var viewModel : UnitViewModel
    private let dashboardSession: DashboardSession
    
    init(viewModel: UnitViewModel, dashboardSession: DashboardSession) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.dashboardSession = dashboardSession
    }
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                
                AppTextField(title: "Buscar unidad", text: $viewModel.searchQuery, type: .text, validations:[])
                
                Button {
                    dashboardSession.profile()
                } label: {
                    Image(systemName: "gearshape")
                        .imageScale(.large)
                        .foregroundStyle(.white)
                }
                    
            }.frame(maxWidth: .infinity, alignment: .center)
            
            Spacer().frame(height: 30)
            
            ScrollView {
                LazyVGrid(columns: columns,spacing: 6) {
                    ForEach(viewModel.units) { unit in
                        UnitViewItem(unit: unit).padding(4)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding()
        .background(.black)
        .task {
            await viewModel.loadUnits()
        }
    }
}

#Preview {
    
}
