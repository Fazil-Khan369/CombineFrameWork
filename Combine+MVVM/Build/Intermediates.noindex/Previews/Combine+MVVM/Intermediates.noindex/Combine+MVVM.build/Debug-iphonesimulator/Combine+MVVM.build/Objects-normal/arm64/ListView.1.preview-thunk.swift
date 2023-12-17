@_private(sourceFile: "ListView.swift") import Combine_MVVM
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension ListView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/fazilp/SwiftUI-Project/Furniture-Shop/CombineFrameWork/Combine-Framework/Untitled/Combine+MVVM/Combine+MVVM/Views/ListView.swift", line: 14)
        VStack(alignment: .leading) {
            Text("Name: \(user.name ?? __designTimeString("#2991.[1].[1].property.[0].[0].arg[1].value.[0].arg[0].value.[1].value.arg[0].value.[0]", fallback: "nil"))")
            Text("Email: \(user.email ?? __designTimeString("#2991.[1].[1].property.[0].[0].arg[1].value.[1].arg[0].value.[1].value.arg[0].value.[0]", fallback: "nil"))")
            Divider()
            if let company = user.company {
                Text("Company: \(company.name ?? __designTimeString("#2991.[1].[1].property.[0].[0].arg[1].value.[3].[0].[0].arg[0].value.[1].value.arg[0].value.[0]", fallback: "nil"))")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.orange.opacity(__designTimeFloat("#2991.[1].[1].property.[0].[0].modifier[2].arg[0].value.modifier[0].arg[0].value", fallback: 0.6)), in: RoundedRectangle(cornerRadius: __designTimeInteger("#2991.[1].[1].property.[0].[0].modifier[2].arg[1].value.arg[0].value", fallback: 10), style: .continuous))
        .padding(.horizontal, __designTimeInteger("#2991.[1].[1].property.[0].[0].modifier[3].arg[1].value", fallback: 4))
    
#sourceLocation()
    }
}

import struct Combine_MVVM.ListView
#Preview {
    ListView(user:
                UserModel(id: 1, name: "FAZIL", username: "FazilTest", email: "fazil@example.com", address: nil, phone: "123-456-7890", website: "www.example.com", company: Company (name: "test Inc"))
        // Add more users as needed for preview
    )
}



