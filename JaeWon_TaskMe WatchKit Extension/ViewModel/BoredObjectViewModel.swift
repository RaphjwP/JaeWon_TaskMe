//
//  BoredObjectViewModel.swift
//  JaeWon_TaskMe WatchKit Extension
//
//  Created by Raphael Park on 2020-12-11.
//

import Foundation

class BoredObjectViewModel : ObservableObject {
    @Published var boredObject = BoredObject()
    
    
    var apiURLString = "https://www.boredapi.com/api/activity"
    
    func fetchDataFromAPI(){
        guard let apiURL = URL(string: apiURLString) else{
            return
        }
        
        URLSession.shared.dataTask(with: apiURL){
            (data: Data?, response: URLResponse?, error: Error?) in
            
            if let er = error{
                print(#function, "Error \(er.localizedDescription)")
            }else{
                //received data or response
                DispatchQueue.global().async {
                    do{
                        if let jsonData = data{
                            //we received data in JSON
                            
                            //start decoding
                            let decoder = JSONDecoder()
                            
                            let decodedList = try decoder.decode(BoredObject.self, from: jsonData)
                            
                            //you cannot publish any changes from the background thread
                            DispatchQueue.main.async {
                                self.boredObject = decodedList
                                print(#function, self.boredObject)
                            }
                            
                            
                        }else{
                            print(#function, "JSON data is empty")
                        }
                    }catch let error{
                        print(#function, "Error decoding the data \(error.localizedDescription)")
                    }
                }
            }
            
        }.resume()
    }
}
