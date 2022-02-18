//
//  ContentView.swift
//  Unittest
//
//  Created by shehan karunarathna on 2022-02-18.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm:UnitTestViewModel
    init(isPremium:Bool){
        _vm = StateObject(wrappedValue: UnitTestViewModel(ispremium: isPremium))
    }
    var body: some View {
        Text(vm.isPremium.description)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(isPremium: true)
    }
}
