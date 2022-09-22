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
    @State var numberOfElements = 50.0
    
    var body: some View {
        
        VStack {
            
            if sortModel.chartData.isEmpty {
                Rectangle()
                    .fill(.gray)
            }
            else {
                Chart {
                    ForEach(sortModel.chartData) { series in
                        LineMark(x: .value("Input Size", series.data.inputSize), y: .value("Time", series.data.time), series: .value(series.sortMethod, series.sortMethod))
                            .foregroundStyle(by: .value("Method", series.sortMethod))
                    }
                }
            }
            
            HStack {
                Button {
                    DispatchQueue.main.async {
                        sortModel.chartData.removeAll()
                        for size in stride(from: 1, to: numberOfElements, by: 1) {
                            var array = sortModel.createRandomArrayOfInts(size: Int(size))
                            var array2 = array
                            var array3 = array
                            var array4 = array
                            
                            
                            sortModel.runSelectionSort(array: &array, size: Int(size))
                            sortModel.runInsertionSort(array: &array2, size: Int(size))
                            sortModel.runHybridSort(array: &array3, size: Int(size))
                            sortModel.runQuickSort(array: &array4, size: Int(size))

                        }
                    }
                } label: {
                    Text("Sort")
                }
                
                Text(numberOfElements.description)
                
                Slider(value: $numberOfElements, in: 10...100, step: 1)
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
