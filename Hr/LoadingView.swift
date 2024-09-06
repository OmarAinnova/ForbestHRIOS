//
//  LoadingView.swift
//  Hr
//
//  Created by Omar Yousef on 06/09/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
              .progressViewStyle(CircularProgressViewStyle())
              .scaleEffect(2.0, anchor: .center) // Makes the spinner larger
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.opacity(0.5)) // Semi-transparent background
        .edgesIgnoringSafeArea(.all)
    
    }
}

#Preview {
    LoadingView()
}

