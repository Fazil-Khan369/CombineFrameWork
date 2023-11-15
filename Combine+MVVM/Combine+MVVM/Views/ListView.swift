//
//  ListView.swift
//  Combine+MVVM
//
//  Created by Fazil P on 13/11/2023.
//

import SwiftUI

struct ListView: View {
    let user: UserModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Name: \(user.name ?? "nil")")
            Text("Email: \(user.email ?? "nil")")
            Divider()
            if let company = user.company {
                Text("Company: \(company.name ?? "nil")")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
        .padding(.horizontal, 4)
    }
}

#Preview {
    ListView(user:
                UserModel(id: 1, name: "FAZIL", username: "FazilTest", email: "fazil@example.com", address: nil, phone: "123-456-7890", website: "www.example.com", company: Company (name: "test Inc"))
        // Add more users as needed for preview
    )
}
