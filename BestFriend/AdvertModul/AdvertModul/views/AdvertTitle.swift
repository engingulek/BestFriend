//
//  AdvertTitle.swift
//  AdvertModul
//
//  Created by Engin Gülek on 2.03.2024.
//

import SwiftUI

struct AdvertHeader: View {
    var body: some View {
        HStack{
            VStack(alignment:.leading){
                Text("Pick Your Dog Walker")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("24 Dow Walkers want to help you")
            }
            Spacer()
            Image(systemName: "slider.horizontal.3")
                .font(.title2)
        }.padding()
    }
}

#Preview {
    AdvertHeader()
       
}
