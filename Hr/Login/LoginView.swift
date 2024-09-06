//
//  SplashView.swift
//  Hr
//
//  Created by Omar Yousef on 06/09/2024.
//

import SwiftUI
import HrDataSource


struct LoginView: View {
    
    @State private var name  = ""
    @State private var password = ""
    @StateObject var viewModel = LoginViewModel()
    @State var path = NavigationPath()
    @FocusState private var foucs: FormFieldFocus?
    
    var body: some View {
        NavigationStack(path: $path){
            ZStack {
                Color.gray.opacity(0.3)
                              .edgesIgnoringSafeArea(.all)
                VStack {
                    VStack(alignment: .center, spacing: 16) {
                        
                        Text("Welcome Back!")
                                            .font(.title)
                        
                        
                        HStack {
                            Image(systemName: "person.fill")
                                       .foregroundColor(.gray)
                                   
                            TextField("Name", text: $name)
                                
                                .focused($foucs, equals: .name)
                                .onSubmit {
                                    foucs = .password
                                }
                                       
                               }
                               .padding()
                               .overlay(RoundedRectangle(cornerRadius: 50)  // Rounded corner with a stroke
                               .stroke(Color.gray, lineWidth: 1))
                               .padding(8)  // Padding for the HStack
                               .background(Color.white)
                        
                        
                       
                        HStack {
                            Image(systemName: "lock.fill")
                                       .foregroundColor(.gray)
                                   
                            SecureField("Password", text: $password)
                                .focused($foucs, equals: .password)
                            
                               }
                               .padding()
                               .overlay(RoundedRectangle(cornerRadius: 50)  // Rounded corner with a stroke
                               .stroke(Color.gray, lineWidth: 1))
                               .padding(8)  // Padding for the HStack
                               .background(Color.white)
                    
                               
                        Button(action: {
                            viewModel.login(data: LoginRequest(lang: 1, userId: name, password: password)){
                                    path.append(NavigationModel(destination: .homeScreen, data: nil))
                            }
                        }, label: {
                            Text("Login")
                                .frame(maxWidth: .infinity)
                                .padding(4)
                        }) .buttonStyle(.borderedProminent)
                            .cornerRadius(50)
                            .disabled(name.isEmpty || password.isEmpty)
                            .padding()
                        
                    }
                    .padding(16)
                    .background(Color.white)
                    .cornerRadius(16)
                    .padding(32)
             
                }
       
            // Loading indicator
            if viewModel.isLoading {
                LoadingView()
            }

            }.onAppear(perform: {
                foucs = .name
            })
            
            .navigationDestination(for: NavigationModel.self){ model in
                switch model.destination {
                    
                case .homeScreen :
                    HomeView()
                }
            }
        }
    }
}
    
enum  FormFieldFocus : Hashable {
        case name, password
}

#Preview {
        LoginView()
}
