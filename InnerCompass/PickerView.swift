//
//  PickerView.swift
//  InnerCompass
//
//  Created by Raffaele Martone on 22/05/23.
//

import Foundation
import SwiftUI

struct PickerView: View {
    @State var selectedTime = 1
    var body: some View {
        Text("Combinazione")
            .font(.title)
        let minutes = Array(stride(from: 1, through: 100, by: 1))
        Picker("Minuti", selection: $selectedTime) {
            ForEach(minutes, id: \.self) { minute in
                Text("\(minute) m")
            }
        }.pickerStyle(.wheel)
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
