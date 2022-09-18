//
//  Series.swift
//  SortingVisualizer
//
//  Created by Eli Hartnett on 9/18/22.
//

import Foundation

struct Series: Identifiable {
    let id = UUID()
    
    let sortMethod: String
    
    let data: (inputSize: Int, time: Int)
}
