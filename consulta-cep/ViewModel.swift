//
//  ViewModel.swift
//  consulta-cep
//
//  Created by Gabriel Miranda on 23/07/22.
//

import SwiftUI

class ViewModel: ObservableObject {
    
    @Published var cep: CEP? = nil
    
    func fetch(_ cep: String) {
        guard let url = URL(string: "https://viacep.com.br/ws/\(cep)/json/") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return 
            }
            
            do {
                let cep = try JSONDecoder().decode(CEP.self, from: data)
                
                DispatchQueue.main.async {
                    self?.cep = cep
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
    
}
