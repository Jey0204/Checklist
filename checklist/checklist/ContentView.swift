import SwiftUI
import SwiftData

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .foregroundColor(configuration.isOn ? .blue : .gray)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            configuration.label
        }
    }
}

struct ContentView: View {
        @State private var toggleStates = [Bool](repeating: false, count: 5)
        @State private var tablica = []
    @Environment(\.modelContext) private var context
    @Query private var items: [Baza]
    @State private var ilosc = 5
    
    
    func do_zrobienia(_ text: inout String) {}
    func zdorbione(_ text: inout String) {}
    
    func addItem() {
        let item = Baza(name: "noteText")
        context.insert(item)
        try? context.save()
    }
    
    func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            let item = items[index]
            context.delete(item)
        }
        try? context.save()
    }
   
    
    var body: some View {
        VStack(spacing: 20)  {
            
            Text("Your check list:")
                .foregroundColor(.blue)
                .font(.system(size: 25))
            
            HStack(spacing: 50) {
                Button("To do") {}
                    .foregroundColor(.blue)
                    .font(.system(size: 15))

                
                Button("Done") {}
                    .foregroundColor(.blue)
                    .font(.system(size: 15))

            }
            
            List {
                ForEach(items) { item in
                    ScrollView {
                        HStack {
                            Image(systemName: item.checked ? "checkmark.square.fill" : "square")
                                .onTapGesture {
                                    // Toggle checkbox state
                                    toggleChecked(item)
                                }
                                .foregroundColor(item.checked ? .blue : .secondary)
                                .font(.system(size: 25))
                                .padding(.trailing, 10)
                            
                            Text(item.name)
                                .font(.system(size: 25))
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }

            

            
            VStack {
                HStack(spacing: 0) {
                    NavigationStack {
                        VStack {
                            NavigationLink {
                                ContentViewB(context: context)
                            } label: {
                                Text("Add")
                            }
                            .frame(maxWidth: 130, maxHeight: 70)
                        }
                    }
                }
                .frame(maxWidth: 300, maxHeight: 150)
            }
            .padding()
        }
    }
    func toggleChecked(_ item: Baza) {
           guard let index = items.firstIndex(where: { $0.id == item.id }) else {
               return
           }
           items[index].checked.toggle()
           try? context.save()
       }
}

struct ContentViewB: View {
    @State private var noteText: String = ""
    @Environment(\.presentationMode) var presentationMode
    var context: ModelContext
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0)  {
                
                
                TextField("Note", text: $noteText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: addItem) {
                    Text("Save")
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
    
    func addItem() {
        let item = Baza(name: noteText)
        if(noteText==""){
            
        }else{
            context.insert(item)
            try? context.save()
            presentationMode.wrappedValue.dismiss()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
