//
//  ContentView.swift
//  consulta-cep
//
//  Created by Gabriel Miranda on 11/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: ViewModel = ViewModel()
    @State var cep: String = ""
    
    var body: some View {
        VStack {
            Text("Consulta CEP")
                .font(Font.title.bold())
            Form {
                TextField("Digite o CEP", text: $cep)
                Button("Buscar CEP") {
                    withAnimation {
                        viewModel.fetch(cep)
                    }
                }
                .font(Font.body.bold())
            }
            HStack() {
                Text(showAddress(from: viewModel.cep))
                    .padding()
                Spacer()
            }
        }
    }
    
    private func showAddress(from cep: CEP?) -> String {
        if let cep = cep {
            return "Rua: \(cep.logradouro)\nBairro: \(cep.bairro)\nCidade: \(cep.localidade)\nEstado: \(cep.uf)"
        }
        return ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
