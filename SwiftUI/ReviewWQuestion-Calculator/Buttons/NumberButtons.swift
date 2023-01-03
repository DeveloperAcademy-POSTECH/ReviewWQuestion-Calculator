
import SwiftUI

struct NumberButton: View {
    @EnvironmentObject var buttonInput: CalculationData
    var number: Int
    
    var body: some View {
        Button(action: {
            if buttonInput.isReceived == true || buttonInput.displayData == buttonInput.error.toString()  {
                buttonInput.displayData = ""
                buttonInput.isReceived.toggle()
            }
            buttonInput.displayData.append(String(number))
        }){
            Text("\(number)")
                .font(.system(size: 30).bold())
                .foregroundColor(.white)
                .frame(width: 80, height: 80, alignment: .center)
                .background(Circle().fill(Color.numberButtonColor))
        }
    }
}

struct ZeroButton: View {
    @EnvironmentObject var buttonInput : CalculationData
    
    var body: some View {
        Button(action: {
            if buttonInput.isReceived == true {
                buttonInput.displayData = ""
                buttonInput.isReceived.toggle()
            }
            if buttonInput.displayData.count != 0 {
                buttonInput.displayData.append("0")
            }
        }){
            Text("0")
                .padding(.leading, 30)
                .font(.system(size: 30).bold())
                .foregroundColor(.white)
                .frame(width: 174, height: 80, alignment: .leading)
                .background(Color.numberButtonColor)
                .cornerRadius(40)
        }
    }
}
