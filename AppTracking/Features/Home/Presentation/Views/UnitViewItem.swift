//
//  UnitViewItem.swift
//  AppTracking
//
//  Created by Alfredo Palacios on 03/06/26.
//

import SwiftUI

struct UnitViewItem: View {
    
    private let unit: Unit
    
    init(unit: Unit) {
        self.unit = unit
    }
    
    var body: some View {
        VStack (alignment: .leading){
            Text(unit.brand)
            Text(unit.unitNumber)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
    }
}

#Preview {
    UnitViewItem(unit: Unit(id: "1", brand: "Nissan", unitNumber: "Test-100"))
}
