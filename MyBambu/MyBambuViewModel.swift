//
//  MyBambuViewModel.swift
//  MyBambu
//
//  Created by Armando Isais Olguin Cabrera  on 12/06/24.
//

import Foundation

class MyBambuViewModel{
    
    var objects: [BambuObjects] = []
    
    func fetchObjects(completion: @escaping () -> Void){
        
        let urlString = "https://mocki.io/v1/5297f27b-ed4d-4b62-86e7-44443f6d1e05"
        
        guard let url = URL(string: urlString) else {fatalError("Invalid URL")}
        
        URLSession.shared.dataTask(with: url){ (data,response,error) in
            if let error = error {
               print("Error to get data")
                return
            }
            
            guard let data = data else {
                print("empty data")
                return
            }
            do{
                let dataDecoded = try JSONDecoder().decode([BambuObjects].self,from: data)
                self.objects = dataDecoded
                DispatchQueue.main.async{
                    completion()
                }
            } catch let decodedError {
                print("Decoding Error")
            }
        }.resume()
    }
}
