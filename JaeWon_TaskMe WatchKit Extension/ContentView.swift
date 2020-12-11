//
//  ContentView.swift
//  JaeWon_TaskMe WatchKit Extension
//
//  Created by Raphael Park on 2020-12-11.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var boredObjectViewModel = BoredObjectViewModel()
    
    @State private var activity : String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text(activity).foregroundColor(.yellow).font(.system(size: 20)).padding(15)
                Button(action: {getActivity()}, label: {
                    Text("Suggest me an activity")
                }).foregroundColor(.green).buttonStyle(PlainButtonStyle())
            }.onAppear{
                getActivity()
            }.navigationBarTitle("Jae Won")
        }
    }
    
    func getActivity() {
        boredObjectViewModel.fetchDataFromAPI()
        activity = boredObjectViewModel.boredObject.activity
        print(activity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
