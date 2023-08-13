//
//  ContentView.swift
//  SwifUiBeta2
//
//  Created by Jennifer Diaz on 13-08-23.
//

import SwiftUI

struct ContentView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var text: String = "Escribe algo"
    @State var counter = 0
    @State var currentDate : Date = Date()
    @State var color:Color = .blue
    @State var isLoading:Bool = false
    @State var progress: Float = 0.0
    
    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .keyboardType(.emailAddress)
                .disableAutocorrection(true)
                .padding(8)
                .font(.headline)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(6)
                .padding(.horizontal,60)
            .padding(.top,40)
            .onChange(of: username, perform: { value in print("new value \(value)")
                
            })
            SecureField("password", text: $password)
                .keyboardType(.default)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding(8)
                .font(.headline)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(6)
                .padding(.horizontal,60)
                .onChange(of: password, perform: {value in print("password value \(value)")
                    
                })
                TextEditor(text: $text)
                .font(.title)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .foregroundColor(.blue)
                .padding()
                .onChange(of: text, perform: {value in counter = value.count})
            Text("\(counter)")
                .foregroundColor(counter <= 280 ? .green : .red)
                .font(.largeTitle)
            
            Form{
                DatePicker("seleccione fecha", selection: $currentDate, in: Date()...,
                            displayedComponents: .date)
                Text(currentDate, style: .date)
                    .bold()
            }
            HStack{
                Rectangle()
                    .foregroundColor(color)
                    .frame(width: 100, height: 60)
                    .padding()
                ColorPicker("Selecciona un color", selection: $color)
            }
            HStack{
                if isLoading{
                    ProgressView("Cargando...")
                        .scaleEffect(2)
                    
                }
                Button("Cargando"){
                    isLoading = !isLoading
                    
                }.padding(.top, 40)
                
            }
            HStack{
            
                    ProgressView(value: progress)
                
                Button("Cargando"){
                    progress += 0.1
                    
                }.padding(.top, 40)
                
            }
            HStack{
                Link("View Our Terms of Service",
                     destination: URL(string: "https://www.example.com/TOS.html")!)
                Link(destination: URL(string: UIApplication.openNotificationSettingsURLString)!, label: {
                    Label("Setting", systemImage: "gear")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                })
            }
            
            Spacer()
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
