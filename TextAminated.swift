import SwiftUI 

struct ContentView: View {
    @State private var name = ""
    @State private var isEditingName = false
    var body: some View {
        VStack (alignment: .leading){
            Text("Name")
                .scaleEffect((self.name == "" && self.isEditingName == false) ? 1 : 0.75)
                .offset(y: (self.name == "" && self.isEditingName == false ) ? 35 : 0)
                .animation(.spring())
            TextField("", text: $name )
            Divider()
        }.padding()
            .onTapGesture {
                self.isEditingName.toggle()
                if(self.isEditingName == false){
                    UIApplication.shared.endEditing()
                }
        }
    }
}
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
