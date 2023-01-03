
import SwiftUI

struct SubCalculationButton: View {
    @EnvironmentObject var result: CalculationData
    var calculationSign: String
    
    var body: some View {
        Button(action: {
            if calculationSign == "C" || calculationSign == "AC" {
                result.displayData = ""
                result.buttonIndex = ""
                
            } else if calculationSign == "+/-" {
                if Double(result.displayData) ?? 0 < 0 {
                    result.displayData = String(abs(Double(result.displayData) ?? 0))
                } else {
                    result.isMinus.toggle()
                }
            } else {
                result.displayData = String(division(Double(result.displayData) ?? 0, 100))
            }
        }){
            Text(calculationSign)
                .font(.system(size: 30).bold())
                .foregroundColor(.black)
                .frame(width: 80, height: 80, alignment: .center)
                .background(Circle().fill(Color.subCalButtonColor))
        }
    }
}

struct DotButton: View {
    @EnvironmentObject var result: CalculationData
    
    var body: some View {
        Button(action: {
            if result.displayData.contains(".") == false {
                result.displayData.append(".")
            }
        }){
            Text(".")
                .font(.system(size: 30).bold())
                .foregroundColor(.white)
                .frame(width: 80, height: 80, alignment: .center)
                .background(Circle().fill(Color.numberButtonColor))
        }
    }
}


struct DetailFunctionButton_Previews: PreviewProvider {
    static var previews: some View {
        SubCalculationButton(calculationSign: "T")
    }
}
