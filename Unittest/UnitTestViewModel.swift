//
//  UnitTestViewModel.swift
//  Unittest
//
//  Created by shehan karunarathna on 2022-02-18.
//

import Foundation


class UnitTestViewModel:ObservableObject{
    @Published var isPremium:Bool
    @Published var dataArray:[String] = []
    @Published var selectedItem: String? = nil
    init(ispremium:Bool){
        self.isPremium = ispremium
    }
    
    func addItem(item:String) {
        guard !item.isEmpty else {return}
        self.dataArray.append(item)
    }
    
    func selectItem(item:String) {
        if let x = dataArray.first(where: { string in
            string == item
        }){
            selectedItem = x
        }
            
    }
    
    func saveItem(item:String) throws{
        guard !item.isEmpty else {
            throw DataError.noData
        }
        if let x = dataArray.first(where: { string in
            string == item
        }){
            print("item saved here \(x)")
        } else {
            throw DataError.itemNotFound
        }
            
    }
    
    enum DataError:LocalizedError{
        case noData
        case itemNotFound
    }
}
