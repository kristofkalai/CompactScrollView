//
//  ContentView.swift
//  Example
//
//  Created by Kristof Kalai on 2022. 12. 01..
//

import CompactScrollView
import SwiftUI

struct ContentView: View {
    @State private var toggle = false

    var body: some View {
        HStack(alignment: .top) {
            if toggle {
                VStack {
                    CompactScrollView {
                        Rectangle()
                            .fill(.green)
                            .frame(height: 100)
                    }

                    Spacer()
                }
            } else {
                CompactScrollView {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(height: 1000)
                }
            }

            Toggle(isOn: $toggle) {
                HStack {
                    Spacer()

                    Text("Toggle")
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
