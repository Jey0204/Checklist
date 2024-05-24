import SwiftUI

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
    @State private var ilosc = 5
    @State private var toggleStates = [Bool](repeating: false, count: 5)
    @State private var tablica = []
    
    func do_zrobienia(_ text: inout String) {
            
            
        }
    func zdorbione(_ text: inout String) {
            
            
        }

    var body: some View {
        
        
        VStack {
            Text("Witaj!")
                .font(.system(size: 50))
            
            HStack(spacing: 10) {
                Button("Do zrobienia") {
                    
                }
                .frame(maxWidth: 130, maxHeight: 70)
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(100)
                .font(.system(size: 20))
                
                Button("Zrobione") {
                    
                }
                .frame(maxWidth: 130, maxHeight: 70)
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(100)
                .font(.system(size: 20))
            }
            
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(0..<ilosc, id: \.self) { index in
                        Toggle("Row \(index)", isOn: $toggleStates[index])
                            .toggleStyle(CheckboxToggleStyle())
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .font(.system(size: 30))
            .padding()

            VStack {
                HStack(spacing: 0) {
                    Button("+") {
                        if ilosc < 10 { // limit to avoid index out of range
                            ilosc += 1
                            toggleStates.append(false)
                        }
                    }
                    .frame(maxWidth: 130, maxHeight: 70)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(100)
                    .font(.system(size: 70))
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
