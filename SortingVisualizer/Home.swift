//
//  ContentView.swift
//  SortingVisualizer
//
//  Created by Eli Hartnett on 9/18/22.
//

import SwiftUI
import Charts

struct Home: View {
    
    @StateObject var sortModel = SortModel()
    
    var body: some View {
        
        VStack {
            
            Chart {
                ForEach(sortModel.chartData) { series in
                    LineMark(x: .value("Input Size", series.data.inputSize), y: .value("Time", series.data.time), series: .value(series.sortMethod, series.sortMethod))
                        .foregroundStyle(by: .value("Method", series.sortMethod))
                }
            }
            
            Button {
                sortModel.chartData.removeAll()
                for size in stride(from: 0, to: 50, by: 1) {
                    var array = sortModel.createRandomArrayOfInts(size: size)
                    var array2 = array
                    
                    sortModel.runSelectionSort(array: &array, size: size)
                    sortModel.runQuickSort(array: &array2, size: size)
                }
            } label: {
                Text("Sort")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
